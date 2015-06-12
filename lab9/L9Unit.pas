unit L9Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.Samples.Spin, Vcl.ExtDlgs;

type
  TL9Form = class(TForm)
    Res: TLabel;
    Calc1: TBitBtn;
    RowEdit: TSpinEdit;
    ColEdit: TSpinEdit;
    StringGrid1: TStringGrid;
    Variant: TRadioGroup;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    CoefEdit: TLabeledEdit;
    OpenDialog: TOpenTextFileDialog;
    SaveDialog: TSaveTextFileDialog;
    SaveBtn: TBitBtn;
    LoadBtn: TBitBtn;
    procedure Calc1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  L9Form: TL9Form;

implementation

{$R *.dfm}

// Перевод действительного числа в строку
function f2s(x: double): string;
begin
  Str(x: 0: 1, Result);
end;

// Сообщение об ошибке
procedure Error(s: string);
begin
  MessageDlg(s, mtError, [mbOK], 0);
end;

procedure TL9Form.BitBtn1Click(Sender: TObject);
var
  I, J: Integer;
  s: String;
begin
  Randomize;
  with StringGrid1 do // оператор присоединения -
  begin // вып-е неск. действий с одним компонентом
    // StringGrid1.RowCount := RowEdit.Value;
    RowCount := RowEdit.Value; // установление числа строк
    ColCount := ColEdit.Value; // установление числа столбцов
    Visible := True; // сделать StringGrid1 видимым
    FixedCols := 0;
    FixedRows := 0;
    // Заполняем случайными числами
    for J := 0 to ColCount - 1 do // Столбец
      for I := 0 to RowCount - 1 do // Строка
        Cells[J, I] := f2s(random(10));
  end; // конец действий, выполняемых с компонентом
  // Теперь можно выполнять действия с матрицей
  Calc1.Enabled := True;
end;

procedure TL9Form.Calc1Click(Sender: TObject);
var
  A: array of array of double;
  N, M, Cod: Integer; // N - количество строк, M - кол-во столбцов
  I, J: Integer; // Переменные циклов
  Coef: double; // Коэффициент
  Sum: double; // Сумма по строке/столбцу
  SumAll: double; // Сумма всех элементов
begin
  // -- Извлекаем данные из интерфейса --
  N := StringGrid1.RowCount;
  M := StringGrid1.ColCount;
  SetLength(A, N, M);
  for I := 0 to N - 1 do
    for J := 0 to M - 1 do
    begin
      Val(StringGrid1.Cells[J, I], A[I, J], Cod);
      if Cod <> 0 then
      begin
        Error(Format('Нарушение синтаксиса: %d %d', [I + 1, J + 1]));
        exit;
      end;
    end;
  Val(CoefEdit.Text, Coef, Cod);
  if Cod <> 0 then
  begin
    Error('Нарушение синтаксиса коэффициента');
    CoefEdit.SetFocus;
    exit;
  end;
  // Очищаем результаты
  Res.Caption := '';
  // -- Выполняем функцию --
  case Variant.ItemIndex of
    0: // Умножить элементы 1-ой строки и 1-го столбца на коэффициент
      begin
        // Первая строка
        for J := 0 to M - 1 do
          A[0, J] := A[0, J] * Coef;
        // Первый столбец без первого элемента (чтобы два раза не умножать)
        for I := 1 to N - 1 do
          A[I, 0] := A[I, 0] * Coef;
        // Результаты в интерфейс
        for I := 0 to N - 1 do
        begin
          for J := 0 to M - 1 do
            Res.Caption := Res.Caption + f2s(A[I, J]) + #9;
          Res.Caption := Res.Caption + #13;
        end;
      end;
    2: // 3. Найти суммы элементов каждого столбца и всех элементов
      begin
        SumAll := 0; // Сначала сумма всех равна 0
        for J := 0 to M - 1 do // номер столбца
        begin
          Sum := 0; // Сумма элементов текущего столбца
          for I := 0 to N - 1 do // Пробегаем по всем сточкам
            Sum := Sum + A[I, J];
          Res.Caption := Res.Caption + 'Столбец ' + IntToStr(J + 1) + ' сумма '
            + f2s(Sum) + #13;
          SumAll := SumAll + Sum;
        end;
        Res.Caption := Res.Caption + 'Сумма всех: ' + f2s(SumAll);
      end;
  end;
  SetLength(A, 0, 0); // Очищаем память
end;

procedure TL9Form.LoadBtnClick(Sender: TObject);
var
  f: TextFile;
  RN, RC, R, C: Integer;
  Z: double;
  A: array of array of double;
begin
  if not OpenDialog.Execute then
  begin
    Error('Файл не выбран');
    exit;
  end;
  // если файл выбран пользователем в окне
  AssignFile(f, OpenDialog.FileName); // связать его с переменной f
{$I-} Reset(f); {$I+} // открыть файл, связанный с f для чтения
  if IOResult <> 0 then
  begin
    Error('Файл не найден');
    exit;
  end;
  if SeekEof(f) then
  begin
    Error('Файл пустой');
    CloseFile(f);
    exit;
  end;
  RN := 0; // счётчик строк
  RC := 0; // счётчик столбцов
  repeat // цикл подсчёта числа строк
    Readln(f); // перевод указателя чтения в файле f на следующую строку
    Inc(RN); // увеличение значения счётчика строк на единицу
  until SeekEof(f); // выход из цикла, если достигнут конец файла
  Reset(f); // повторн. откр-е файла для возврата указателя чтения в начало файла
  repeat // цикл подсчёта числа элементов первой строки (числа столбцов)
{$I-} Read(f, Z); {$I+}// без z не будет перевода указателя чтения к след-щей
    // позиции, поэтому контролируем, допустимое ли число записывается в z
    if IOResult <> 0 then // если ошибка синтаксиса элемента в 1-ой строке
    begin
      Error('Ошибка в 1-ой строке');
      CloseFile(f);
      exit;
    end;
    Inc(RC); // увеличение значения счётчика столбцов на единицу
  until SeekEoln(f); // выход из цикла, если достигнут конец строки
  Reset(f); // повторн. откр-е файла для возврата указателя чтения в начало файла
  SetLength(A, RN, RC); // выделение памяти под двумерный массив (матрицу)
  for R := 0 to RN - 1 do // внешний цикл (в нём один оператор – вложенный for)
    for C := 0 to RC - 1 do
    begin // начало тела вложенного цикла
{$I-} Read(f, A[R, C]); {$I+} // ввод x[i,j] элемента из файла
      if IOResult <> 0 then // если ошибка синтаксиса эл-нта
      begin
        Error('Ошибка синтаксиса элемента в файле');
        CloseFile(f);
        SetLength(A, 0, 0);
        exit;
      end;
    end; // конец тела вложенного цикла
  // -- Данные в интерфейс --
  RowEdit.Value := RN;
  ColEdit.Value := RC;
  with StringGrid1 do
  begin
    RowCount := RN;
    ColCount := RC;
    for R := 0 to RN - 1 do
      for C := 0 to RC - 1 do
        Cells[C, R] := f2s(A[R, C]);
    Visible := True;
  end;
  CloseFile(f); // закрытие файла чтения
  SetLength(A, 0, 0); // Очищаем память
end;

procedure TL9Form.SaveBtnClick(Sender: TObject);
var
  f: TextFile;
  R, C: Integer;
begin
  if not SaveDialog.Execute then
  begin
    Error('Файл не выбран');
    exit;
  end;
  // Если файл выбран пользователем
  AssignFile(f, SaveDialog.FileName); // связать его с переменной f
{$I-} Rewrite(f); {$I+} // открыть файл, связанный с f для записи
  if IOResult <> 0 then
  begin
    Error('Файл не найден "' + SaveDialog.FileName + '"');
    exit;
  end;
  // Запись в файл
  with StringGrid1 do
    for R := 0 to RowCount do
    begin
      for C := 0 to ColCount do
        write(f, Cells[C, R] + #9);
      writeln(f); // После каждой строчки - перевод строки
    end;
  // Закрываем файл
  CloseFile(f);
end;

end.
