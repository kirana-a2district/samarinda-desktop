unit PanelDesktop;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, BCPanel,
  BCButton, DateUtils, x, xlib, qt5, qtwidgets, VirtualDesktops;

type

  { TfrPanel }

  TfrPanel = class(TForm)
    btDesktops: TBCButton;
    BCButton2: TBCButton;
    pnDesktop: TBCPanel;
    Timer1: TTimer;
    procedure btDesktopsClick(Sender: TObject);
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
  if (not frVirtualDesktops.Visible) and btDesktops.Down then
    btDesktops.Down := False;
end;

procedure TfrPanel.FormShow(Sender: TObject);
var
  SelfWindow: TWindow;
begin
  SelfWindow := QWidget_winId(TQtMainWindow(Self.Handle).Widget);
  Top := 0;
  Left := 0;
  Width := Screen.Width;
  Height := 35;

  frDesktop.util.SetDockedMode(SelfWindow);
  frDesktop.util.SetStrut(SelfWindow, Width, Height, 0);
  frDesktop.util.ActivateWindow(SelfWindow);
end;

procedure TfrPanel.FormCreate(Sender: TObject);
begin
  QWidget_setAttribute(TQtMainWindow(Self.Handle).Widget, QtWA_TranslucentBackground);
  QWidget_setAttribute(TQtMainWindow(Self.Handle).GetContainerWidget, QtWA_TranslucentBackground);
end;

procedure TfrPanel.btDesktopsClick(Sender: TObject);
begin
  if not btDesktops.Down then
  begin
    frVirtualDesktops.Show;
    btDesktops.Down := True;
  end
  else
    btDesktops.Down := False;
end;

end.

