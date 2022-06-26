unit initdock;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, UniqueInstance,
  MainDesktop, PanelDesktop, VirtualDesktops;

type

  { TfrInit }

  TfrInit = class(TForm)
    DockApp: TApplicationProperties;
    UniqueInstance1: TUniqueInstance;
    procedure DockAppDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frInit: TfrInit;

implementation

{$R *.lfm}

{ TfrInit }

procedure TfrInit.FormShow(Sender: TObject);
begin
  Hide;
  Sleep(1000);

  frDesktop.Show;
  frPanel.Show;
end;

procedure TfrInit.DockAppDeactivate(Sender: TObject);
begin
  if frVirtualDesktops.Visible then
    frVirtualDesktops.Close;
end;

end.

