## Delphi FMX Image Effects program for Windows OS

This program powered by FireMonkey framework. And uses FMX components.
![enter image description here](https://i0.wp.com/delphi.uz/wp-content/uploads/2017/01/firemonkey-delphi-image-effects-components.jpg?w=323&ssl=1)

Here this is the development screenshot (RAD Studio 10.1 Berlin)
![enter image description here](https://i0.wp.com/delphi.uz/wp-content/uploads/2017/01/delphi.uz-image-effects-firemonkey-delphi.jpg?resize=1024,547&ssl=1)

In this Image Effects program, you can change your existing pictures. See that!
![enter image description here](https://i0.wp.com/delphi.uz/wp-content/uploads/2017/01/delphi.uz-image-effects-program.png?w=900&ssl=1)

There are several effects, for example:
-   Ripple
-   Blur
-   Invert
-   Monochrome
-   Gloom
-   Emboss
-   Sepial
-   Pencil

**How to make a screenshot from running application in Delphi FireMonkey?**

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

Learn more on my website! [Delphi.Uz](https://delphi.uz/2017/01/25/delphi-windows-development/delphi-fmx-image-effects-program-windows-os/)
