unit MainDesktop;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, UniqueInstance, XWindowUtils, qt5, qtwidgets,
  xlib, x, IniFiles;

type

  { TfrDesktop }

  TfrDesktop = class(TForm)
    Image1: TImage;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    miKillDesktop: TMenuItem;
    Separator2: TMenuItem;
    Separator1: TMenuItem;
    PopupMenu1: TPopupMenu;
    UniqueInstance1: TUniqueInstance;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miKillDesktopClick(Sender: TObject);
    procedure UniqueInstance1OtherInstance(Sender: TObject;
      ParamCount: Integer; const Parameters: array of String);
  private

  public
    SelfWindow: TWindow;
    util: TXWindowManager;
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
  Cfg: TIniFile;
begin
  SelfWindow := QWidget_winId(TQtMainWindow(Self.Handle).Widget);
  Top := 0;
  Left := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  Image1.Width := Width;
  Image1.Height := Height;

  util.SetDesktopMode(SelfWindow);

  Cfg := TIniFile.Create(ExtractFilePath(Application.ExeName)+'desktop.cfg');
  if FileExists(Cfg.ReadString('Desktop', 'wallpaper', '')) then
    Image1.Picture.LoadFromFile(Cfg.ReadString('Desktop', 'wallpaper', ''));
  FreeAndNil(Cfg);
end;

procedure TfrDesktop.miKillDesktopClick(Sender: TObject);
begin
  if MessageDlg('Confirmation',
    'This action will destroy Samarinda Desktop process.'
    +#10'Are you sure still want to proceed?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes
  then Application.Terminate;
end;

procedure TfrDesktop.UniqueInstance1OtherInstance(Sender: TObject;
  ParamCount: Integer; const Parameters: array of String);
begin

end;

end.

