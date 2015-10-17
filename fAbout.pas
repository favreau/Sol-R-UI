{
Copyright (c) 2011-2015, Cyrille Favreau
All rights reserved. Do not distribute without permission.
Responsible Author: Cyrille Favreau <cyrille_favreau@hotmail.com>

This file is part of Sol-R-UI <https://github.com/cyrillefavreau/Sol-R-UI>

This library is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License version 3.0 as published
by the Free Software Foundation.

This library is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
details.

You should have received a copy of the GNU Lesser General Public License
along with this library; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
}

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
