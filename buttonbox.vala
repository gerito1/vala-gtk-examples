/*
 * A ButtonBox is a container often used to house many buttons in vertical or
 * horizontal orientations. It aids in keeping the child widgets a similar size.
 *
 * Compile using:
 * valac buttonbox.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "ButtonBox";
        this.destroy.connect(Gtk.main_quit);

        var buttonbox = new ButtonBox(Gtk.Orientation.HORIZONTAL);
        buttonbox.set_spacing(5);
        this.add(buttonbox);

        var button1 = new Button.with_label("Button with extra text");
        buttonbox.add(button1);
        var button2 = new Button.with_label("Button");
        buttonbox.add(button2);
        var button3 = new ToggleButton.with_label("ToggleButton");
        buttonbox.add(button3);
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
