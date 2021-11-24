/*
 * The FontButton provides the user with a button and dialog from which to
 * choose a font type, size, and styling options.
 *
 * Compile using:
 * valac fontbutton.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "FontButton";
        this.destroy.connect(Gtk.main_quit);

        var fontbutton = new FontButton();
        fontbutton.font_set.connect(on_fontbutton_changed);
        this.add(fontbutton);
    }

    public void on_fontbutton_changed(FontButton fontbutton)
    {
        var font = fontbutton.get_font_name();
        stdout.printf("%s\n", (font));
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.show_all();

        Gtk.main();

        return 0;
    }
}
