unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  ZeroMemory(@SI, SizeOf(SI));
  SI.cb := SizeOf(SI);

  ZeroMemory(@PI, SizeOf(PI));

  if CreateProcess(
    nil,
    PChar('.\installer.exe'),
    nil,
    nil,
    False,
    0,
    nil,
    nil,
    SI,
    PI
  ) then
  begin
    WaitForSingleObject(PI.hProcess, INFINITE);

    CloseHandle(PI.hProcess);
    CloseHandle(PI.hThread);

    MessageBox(
      0,
      'Installed!',
      'Done!',
      MB_OK or MB_ICONINFORMATION
    );
  end
  else
    MessageBox(0, 'enviornment error', 'error', MB_OK or MB_ICONERROR);
end;

end.

