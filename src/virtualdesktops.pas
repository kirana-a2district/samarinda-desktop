unit VirtualDesktops;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrVirtualDesktops }

  TfrVirtualDesktops = class(TForm)
    Label1: TLabel;
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

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

procedure TfrVirtualDesktops.FormShow(Sender: TObject);
begin
  Top := 0;
  Left := 0;
  Width := Screen.Width;
  Label1.Caption := frDesktop.util.GetDesktopCount.ToString;
end;

end.

