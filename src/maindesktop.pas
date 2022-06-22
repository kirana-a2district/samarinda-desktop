unit MainDesktop;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  XWindowUtils, qt5, qtwidgets, xlib, x;

type

  { TfrDesktop }

  TfrDesktop = class(TForm)
    Button1: TButton;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Separator2: TMenuItem;
    Separator1: TMenuItem;
    PopupMenu1: TPopupMenu;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    util: TXWindowManager;
  public

  end;

var
  frDesktop: TfrDesktop;

implementation

{$R *.lfm}

{ TfrDesktop }

procedure TfrDesktop.FormCreate(Sender: TObject);
begin
  util := TXWindowManager.Create;
  FormStyle := fsNormal;
end;

procedure TfrDesktop.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrDesktop.FormDestroy(Sender: TObject);
begin
  FreeAndNil(util);
end;

procedure TfrDesktop.FormShow(Sender: TObject);
var
  SelfWindow: TWindow;
begin
  SelfWindow := QWidget_winId(TQtMainWindow(Self.Handle).Widget);
  Top := 0;
  Left := 0;


  //WindowState := wsMaximized;
  //util.OverrideRedirect(SelfWindow);
  //util.SetDockedMode(SelfWindow);


  util.SetDesktopMode(SelfWindow);
  Width := Screen.Width;
  Height := Screen.Height;
  //util.ActivateWindow(SelfWindow);
  //util.SetStrut(SelfWindow, Width, Height);
end;

end.

