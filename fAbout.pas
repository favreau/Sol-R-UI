unit fAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmAbout = class(TForm)
    imgSolR: TImage;
    btnOk: TButton;
    miWebLink: TLabel;
    imgFaceBook: TImage;
    Label1: TLabel;
    procedure miWebLinkClick(Sender: TObject);
    procedure imgSolRClick(Sender: TObject);
    procedure imgFaceBookClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

uses
  Winapi.ShellAPI;

procedure TfrmAbout.imgFaceBookClick(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', PChar('https://www.facebook.com/SoLR.Renderer'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmAbout.imgSolRClick(Sender: TObject);
begin
  miWebLinkClick(sender);
end;

procedure TfrmAbout.miWebLinkClick(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', PChar('http://www.sol-r.eu'), '', '', SW_SHOWNORMAL);
end;

end.
