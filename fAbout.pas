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
    Label1: TLabel;
    Label2: TLabel;
    procedure miWebLinkClick(Sender: TObject);
    procedure imgSolRClick(Sender: TObject);
    procedure imgFaceBookClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
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

procedure TfrmAbout.Label2Click(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', PChar('https://www.linkedin.com/in/cyrillefavreau'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmAbout.miWebLinkClick(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', PChar('http://www.molecular-visualization.com'), '', '', SW_SHOWNORMAL);
end;

end.
