//
//  Copyright Abduraimov Mo'minjon 2017
//    Image Effects program for Windows OS
//
//    @MrDlephiGuru
//                  https://delphi.uz


unit UnitAbout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Ani, FMX.Objects, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation,
  {$IFDEF MSWINDOWS}
  Winapi.ShellAPI, Winapi.Windows
  {$ENDIF MSWINDOWS};


type
  TFormAbout = class(TForm)
    Panel1: TPanel;
    Layout1: TLayout;
    Ellipse3: TEllipse;
    Ellipse4: TEllipse;
    Circle3: TCircle;
    Circle4: TCircle;
    Pie2: TPie;
    FloatAnimation2: TFloatAnimation;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    FloatAnimation3: TFloatAnimation;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.fmx}

procedure TFormAbout.Panel1Click(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', 'https://muminjon.com', Nil, Nil, SW_SHOWMAXIMIZED);
end;

end.
