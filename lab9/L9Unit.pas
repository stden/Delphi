unit L9Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.Samples.Spin;

type
  TL9Form = class(TForm)
    Result1: TLabel;
    Calc1: TBitBtn;
    RowEdit: TSpinEdit;
    ColEdit: TSpinEdit;
    StringGrid1: TStringGrid;
    Variant: TRadioGroup;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    CoefEdit: TLabeledEdit;
    procedure Calc1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  L9Form: TL9Form;

implementation

{$R *.dfm}

function f2s(x: double): string;
begin
  Str(x: 0: 1, Result);
end;

procedure TL9Form.BitBtn1Click(Sender: TObject);
var
  I, J: Integer;
  S: String;
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
      begin
        // 0..70,71..99 -> 0..7..7,1..9,9
        Str(random(10), S); // Str
        Cells[J, I] := S;
      end;
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
        ShowMessage(Format('Нарушение синтаксиса: %d %d', [I + 1, J + 1]));
        exit;
      end;
    end;
  Val(CoefEdit.Text, Coef, Cod);
  if Cod <> 0 then
  begin
    ShowMessage('Нарушение синтаксиса коэффициента');
    CoefEdit.SetFocus;
    exit;
  end;
  // Очищаем результаты
  Result1.Caption := '';
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
            Result1.Caption := Result1.Caption + f2s(A[I, J]) + #9;
          Result1.Caption := Result1.Caption + #13;
        end;
      end;
    2: // 3. Найти суммы элементов каждого столбца и всех элементов
      begin
        SumAll := 0; // Сумма всех равна 0
        for J := 0 to M - 1 do // номер стобца
        begin
          Sum := 0; // Сумма элементов текущего столбца
          for I := 0 to N - 1 do // Пробегаем по всем сточкам
            Sum := Sum + A[I, J];
          Result1.Caption := Result1.Caption + 'Стобец ' + IntToStr(J + 1) +
            ' сумма ' + f2s(Sum) + #13;
          SumAll := SumAll + Sum;
        end;
        Result1.Caption := Result1.Caption + 'Сумма всех: ' + f2s(SumAll);
      end;
  end;
  SetLength(A, 0, 0); // Очищаем память
end;

end.
