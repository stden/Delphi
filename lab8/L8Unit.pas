unit L8Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TL8Form = class(TForm)
    SrcArray: TListBox;
    SrcArrayLabel: TLabel;
    MinButton: TButton;
    SortButton: TButton;
    DstArray: TListBox;
    procedure SortButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  L8Form: TL8Form;

implementation

{$R *.dfm}

procedure TL8Form.SortButtonClick(Sender: TObject);
var
  A: array of Double;
  i, j: Integer;
  temp: Double;
begin
  // Извлекаем исходные данные из интерфейса
  SetLength(A, SrcArray.Count);
  for i := 0 to SrcArray.Count - 1 do
    A[i] := StrToFloat(SrcArray.Items[i]);
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
