unit PanelDesktop;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, BCPanel,
  BCButton, DateUtils, x, xlib, qt5, qtwidgets;

type

  { TfrPanel }

  TfrPanel = class(TForm)
    BCButton1: TBCButton;
    BCButton2: TBCButton;
    pnDesktop: TBCPanel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  frPanel: TfrPanel;

implementation
uses
  MainDesktop;

{$R *.lfm}

{ TfrPanel }

procedure TfrPanel.Timer1Timer(Sender: TObject);
begin
  pnDesktop.Caption := DateTimeToStr(Now);
end;

procedure TfrPanel.FormShow(Sender: TObject);
var
  SelfWindow: TWindow;
begin
  SelfWindow := QWidget_winId(TQtMainWindow(Self.Handle).Widget);
  Top := 0;
  Left := 0;

  frDesktop.util.SetDockedMode(SelfWindow);
  Width := Screen.Width;
  Height := 35;


  //frDesktop.util.SetStrut(SelfWindow, Width, Height);
  frDesktop.util.SetStrut(SelfWindow, Width, Height, 0);
  frDesktop.util.ActivateWindow(SelfWindow);
end;

procedure TfrPanel.FormCreate(Sender: TObject);
begin
  QWidget_setAttribute(TQtMainWindow(Self.Handle).Widget, QtWA_TranslucentBackground);
  QWidget_setAttribute(TQtMainWindow(Self.Handle).GetContainerWidget, QtWA_TranslucentBackground);
end;

end.

