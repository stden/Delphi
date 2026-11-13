unit L8Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TL8Form = class(TForm)
    SrcArrayLabel: TLabel;
    SortButton: TButton;
    DstArray: TListBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Result1: TLabel;
    Result2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Calc: TBitBtn;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    procedure SortButtonClick(Sender: TObject);
    procedure CalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  L8Form: TL8Form;

implementation

{$R *.dfm}

procedure TL8Form.CalcClick(Sender: TObject);
var
  A: array of Integer;
  nx, i, Cod: Integer;
  MinEl, MinIndex: Integer;
  SumPos, SumNeg, Sum: Integer;
  SumOdd, Count: Integer;
  Memo: TMemo;
  Result: TLabel;
begin
  Memo := Memo1;
  Result := Result1;
  // -- Извлекаем данные из интерфейса --
  // Создаём динамический массив того размера, что у нас TMemo
  nx := Memo.Lines.Count; // Количество элементов
  if nx = 0 then
  begin
    ShowMessage('Массив не должен быть пустым');
    exit;
  end;
  SetLength(A, nx);
  // Переносим числа из Memo в массив A
  for i := 0 to nx - 1 do
  begin
    Val(Memo.Lines[i], A[i], Cod);
    if Cod <> 0 then
    begin
      ShowMessage('Ошибка в синтаксисе элемента массива: ' + IntToStr(i + 1));
      Memo.SetFocus;
      exit;
    end;
  end;
  // -- Выбираем и применяем нужный алгоритм --
  if RadioButton1.Checked then
  begin
    // Найти наименьший элемент и указать его положение
    MinEl := A[0];
    MinIndex := 0; // Считаем первый элемент минимальным
    for i := 1 to High(A) do
      if A[i] < MinEl then
      begin
        // Нашли новый минимальный элемент
        MinEl := A[i];
        MinIndex := i;
      end;
    // Вывод результатов
    Result.Caption := 'Минимальный элемент: ' + IntToStr(MinEl) + #13 +
      'Индекс: ' + IntToStr(MinIndex + 1);
  end;
  if RadioButton2.Checked then
  begin
    // Найти суммы отрицательных и положительных элементов
    SumPos := 0; // Сумма положительных
    SumNeg := 0; // Сумма отрицательных
    for i := 0 to High(A) do
      if A[i] > 0 then
        SumPos := SumPos + A[i]
      else
        SumNeg := SumNeg + A[i];
    // Выводим результат
    Result.Caption := 'Сумма положительных: ' + IntToStr(SumPos) + #13 +
      'Сумма отрицательных: ' + IntToStr(SumNeg);
  end;
  if RadioButton3.Checked then
  begin
    // Найти сумму и число чётных элементов целочисленного массива
    SumOdd := 0; // Сумма чётных
    Count := 0; // Количество чётных
    for i := 0 to High(A) do
      if A[i] mod 2 = 0 then
      begin
        SumOdd := SumPos + A[i];
        Count := Count + 1;
      end;
    // Выводим результат
    Result.Caption := 'Сумма чётных: ' + IntToStr(SumPos) + #13 +
      'Число чётных: ' + IntToStr(Count);
  end;
  if RadioButton4.Checked then
  begin
    // Удвоить нечётные элементы целочисленного массива, сосчитать их
    Result.Caption := 'Массив:'#13;
    Count := 0; // Количество нечётных
    for i := 0 to High(A) do
    begin
      // Если элемент нечётный
      if A[i] mod 2 <> 0 then
      begin
        A[i] := A[i] * 2; // Удваиваем его
        Count := Count + 1; // Считаем его
      end;
      // И чётные и нечётные выводим в Caption
      Result.Caption := Result.Caption + 'A[' + IntToStr(i + 1) + ']=' +
        IntToStr(A[i]) + #13;
    end;
    // Выводим результат
    Result.Caption := Result.Caption + 'Количество нечётных: ' +
      IntToStr(Count);
  end;
  if RadioButton5.Checked then
  begin
    // Найти среднее арифметическое элементов
    Sum := 0;
    for i := 0 to High(A) do
      Sum := Sum + A[i];
    // Выводим результат
    Result.Caption := 'Сумма: ' + IntToStr(Sum) + #13' Количество ' +
      IntToStr(nx) + #13'Среднее арифметическое: ' + FloatToStr(Sum / nx);
  end;
  if RadioButton6.Checked then
  begin
    Result.Caption := '';
    for i := 0 to High(A) do
    begin
      // Если элемент чётный
      if A[i] mod 2 = 0 then
      begin
        A[i] := A[i] * 5; // Умножаем элемент не число
        Count := Count + 1; // Считаем его
        // И чётные выводим в Caption
        Result.Caption := Result.Caption + 'A[' + IntToStr(i + 1) + ']=' +
          IntToStr(A[i]) + #13;
      end;
    end;
  end;
  SetLength(A, 0); // Освобождаем память
end;

procedure TL8Form.SortButtonClick(Sender: TObject);
var
  A: array of Double;
  i, j: Integer;
  temp: Double;
begin
  // Извлекаем исходные данные из интерфейса
  SetLength(A, Memo1.Lines.Count);
  for i := 0 to Memo1.Lines.Count - 1 do
    A[i] := StrToFloat(Memo1.Lines[i]);
  // Сортировка
  for i := 0 to High(A) do
    for j := i + 1 to High(A) do
      if A[i] > A[j] then
      begin
        temp := A[i];
        A[i] := A[j];
        A[j] := temp;
      end;
  // Результаты в интерфейс
  DstArray.Clear;
  for i := 0 to High(A) do
    DstArray.AddItem(FloatToStr(A[i]), nil);
  // Очищаем память
  SetLength(A, 0);
end;

end.
