unit VirtualDesktops;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, fgl;

type

  TButtonList = specialize TFPGObjectList<TButton>;

  { TfrVirtualDesktops }

  TfrVirtualDesktops = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ButtonList: TButtonList;
    procedure ButtonSelectDesktopClick(Sender: TObject);
  public

  end;

var
  frVirtualDesktops: TfrVirtualDesktops;

implementation
uses
  PanelDesktop, MainDesktop;

{$R *.lfm}

{ TfrVirtualDesktops }

procedure TfrVirtualDesktops.FormDeactivate(Sender: TObject);
begin
  Close;
end;

procedure TfrVirtualDesktops.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ButtonList);
end;

procedure TfrVirtualDesktops.FormCreate(Sender: TObject);
begin
  ButtonList := TButtonList.Create;
end;

procedure TfrVirtualDesktops.ButtonSelectDesktopClick(Sender: TObject);
var
  SL: TStringList;
begin
  Close;
  SL := TStringList.Create;
  SL.Delimiter := ' ';
  SL.DelimitedText := TButton(Sender).Caption;
  frDesktop.util.SetCurrentDesktop(SL[1].ToInteger-1);
  Show;
  FreeAndNil(SL);
end;

procedure TfrVirtualDesktops.FormShow(Sender: TObject);
var
  i: integer;
  tmpBtn: TButton;
begin
  Top := frPanel.Height;
  Width := Screen.Width;
  ButtonList.Clear;
  for i := 1 to frDesktop.util.GetDesktopCount do
  begin
    tmpBtn := TButton.Create(nil);
    tmpBtn.Parent := Panel1;
    tmpBtn.Width := 300;
    tmpBtn.OnClick := @ButtonSelectDesktopClick;
    tmpBtn.Caption := 'Desktop ' + i.ToString;
    ButtonList.Add(tmpBtn);
  end;
end;

end.

