//
//  Copyright Abduraimov Mo'minjon 2017
//    Image Effects program for Windows OS
//
//    @MrDlephiGuru
//                  https://delphi.uz

unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Effects, FMX.Filter.Effects, FMX.Controls.Presentation,
  FMX.Edit, FMX.EditBox, FMX.SpinBox, System.Math.Vectors, UnitAbout,
  FMX.Menus;

type
  TFormMain = class(TForm)
    Image1: TImage;
    PanelBottom: TPanel;
    BtnOpen: TButton;
    OpenDialog1: TOpenDialog;
    RippleEffect1: TRippleEffect;
    SBRipple: TSpinBox;
    GroupBox1: TGroupBox;
    RBRipple: TRadioButton;
    BlurEffect1: TBlurEffect;
    RBBlur: TRadioButton;
    RBInvert: TRadioButton;
    InvertEffect1: TInvertEffect;
    MonochromeEffect1: TMonochromeEffect;
    RBMonochrome: TRadioButton;
    PanelTop: TPanel;
    GloomEffect1: TGloomEffect;
    RBGloom: TRadioButton;
    SBBlur: TSpinBox;
    EmbossEffect1: TEmbossEffect;
    RBEmboss: TRadioButton;
    BtnAbout: TButton;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    CheckBox1: TCheckBox;
    PencilStrokeEffect1: TPencilStrokeEffect;
    SepiaEffect1: TSepiaEffect;
    RBPencil: TRadioButton;
    RBSepial: TRadioButton;
    PopupMenu1: TPopupMenu;
    MenuItemSavePicture: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure BtnOpenClick(Sender: TObject);
    procedure SBRippleChange(Sender: TObject);
    procedure RBRippleChange(Sender: TObject);
    procedure RBBlurChange(Sender: TObject);
    procedure RBInvertChange(Sender: TObject);
    procedure RBMonochromeChange(Sender: TObject);
    procedure RBGloomChange(Sender: TObject);
    procedure SBBlurChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RBEmbossChange(Sender: TObject);
    procedure BtnAboutClick(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure RBSepialChange(Sender: TObject);
    procedure RBPencilChange(Sender: TObject);
    procedure MenuItemSavePictureClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

procedure TFormMain.BtnAboutClick(Sender: TObject);
begin
  if Not Assigned(FormAbout) then
    FormAbout := TFormAbout.Create(Application);
  FormAbout.Show;
end;

procedure TFormMain.BtnOpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Image1.Bitmap.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFormMain.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.IsChecked then
  begin
    Image1.WrapMode := TImageWrapMode.Stretch;
  end
  else
  begin
    Image1.WrapMode := TImageWrapMode.Fit;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  SBBlur.Visible := False;
end;

procedure TFormMain.MenuItemSavePictureClick(Sender: TObject);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  Try
    if SaveDialog1.Execute then
      B := Image1.MakeScreenshot;
    Image1.Bitmap.Assign(B);
    Image1.Bitmap.SaveToFile(SaveDialog1.FileName + '.bmp');
  Finally
    B.Free;
  End;
end;

// Controlling Effect Components

procedure TFormMain.RBBlurChange(Sender: TObject);
begin
  BlurEffect1.Enabled := RBBlur.IsChecked;
  SBBlur.Visible := True;

  SBRipple.Visible := False;
  RippleEffect1.Enabled := False;
  MonochromeEffect1.Enabled := False;
  InvertEffect1.Enabled := False;
  GloomEffect1.Enabled := False;
  EmbossEffect1.Enabled := False;
  SepiaEffect1.Enabled := False;
  PencilStrokeEffect1.Enabled := False;
end;

procedure TFormMain.RBEmbossChange(Sender: TObject);
begin
  EmbossEffect1.Enabled := RBEmboss.IsChecked;

  BlurEffect1.Enabled := False;
  RippleEffect1.Enabled := False;
  InvertEffect1.Enabled := False;
  MonochromeEffect1.Enabled := False;
  GloomEffect1.Enabled := False;
  SBRipple.Visible := False;
  SBBlur.Visible := False;
  SepiaEffect1.Enabled := False;
  PencilStrokeEffect1.Enabled := False;
end;

procedure TFormMain.RBGloomChange(Sender: TObject);
begin
  GloomEffect1.Enabled := RBGloom.IsChecked;

  BlurEffect1.Enabled := False;
  RippleEffect1.Enabled := False;
  InvertEffect1.Enabled := False;
  MonochromeEffect1.Enabled := False;
  EmbossEffect1.Enabled := False;
  SBRipple.Visible := False;
  SBBlur.Visible := False;
  SepiaEffect1.Enabled := False;
  PencilStrokeEffect1.Enabled := False;
end;

procedure TFormMain.RBInvertChange(Sender: TObject);
begin
  InvertEffect1.Enabled := RBInvert.IsChecked;

  BlurEffect1.Enabled := False;
  MonochromeEffect1.Enabled := False;
  RippleEffect1.Enabled := False;
  GloomEffect1.Enabled := False;
  EmbossEffect1.Enabled := False;
  SBRipple.Visible := False;
  SBBlur.Visible := False;
  SepiaEffect1.Enabled := False;
  PencilStrokeEffect1.Enabled := False;
end;

procedure TFormMain.RBMonochromeChange(Sender: TObject);
begin
  MonochromeEffect1.Enabled := RBMonochrome.IsChecked;

  BlurEffect1.Enabled := False;
  RippleEffect1.Enabled := False;
  InvertEffect1.Enabled := False;
  GloomEffect1.Enabled := False;
  EmbossEffect1.Enabled := False;
  SBRipple.Visible := False;
  SBBlur.Visible := False;
  SepiaEffect1.Enabled := False;
  PencilStrokeEffect1.Enabled := False;
end;

procedure TFormMain.RBPencilChange(Sender: TObject);
begin
  PencilStrokeEffect1.Enabled := RBPencil.IsChecked;

  SepiaEffect1.Enabled := False;
  BlurEffect1.Enabled := False;
  SBBlur.Visible := False;
  SBRipple.Visible := False;
  MonochromeEffect1.Enabled := False;
  InvertEffect1.Enabled := False;
  GloomEffect1.Enabled := False;
  EmbossEffect1.Enabled := False;
end;

procedure TFormMain.RBRippleChange(Sender: TObject);
begin
  RippleEffect1.Enabled := RBRipple.IsChecked;
  SBRipple.Visible := True;

  BlurEffect1.Enabled := False;
  SBBlur.Visible := False;
  MonochromeEffect1.Enabled := False;
  InvertEffect1.Enabled := False;
  GloomEffect1.Enabled := False;
  EmbossEffect1.Enabled := False;
  SepiaEffect1.Enabled := False;
  PencilStrokeEffect1.Enabled := False;
end;

procedure TFormMain.RBSepialChange(Sender: TObject);
begin
  SepiaEffect1.Enabled := RBSepial.IsChecked;

  BlurEffect1.Enabled := False;
  SBBlur.Visible := False;
  SBRipple.Visible := False;
  MonochromeEffect1.Enabled := False;
  InvertEffect1.Enabled := False;
  GloomEffect1.Enabled := False;
  EmbossEffect1.Enabled := False;
  PencilStrokeEffect1.Enabled := False;
end;

procedure TFormMain.SBBlurChange(Sender: TObject);
begin
  BlurEffect1.Softness := StrToFloat(SBBlur.Text);
end;

procedure TFormMain.SBRippleChange(Sender: TObject);
begin
  RippleEffect1.Frequency := StrToInt(SBRipple.Text);
end;

end.
