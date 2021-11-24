/*
 * The Box container allows child widgets to be added in a horizontal or
 * vertical orientation, with customisations for the sizing on the added widget.
 *
 * Compile using:
 * valac box.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Box";
        this.destroy.connect(Gtk.main_quit);

        var vbox = new Box(Gtk.Orientation.VERTICAL, 5);
        vbox.set_spacing(5);
        this.add(vbox);

        var button1 = new Button.with_label("Button 1");
        vbox.add(button1);
        var button2 = new Button.with_label("Button 2");
        vbox.pack_end(button2, true, false, 25);

        var hbox = new Box(Gtk.Orientation.HORIZONTAL, 5);
        hbox.set_spacing(5);
        vbox.add(hbox);

        var button3 = new Button.with_label("Button 3");
        hbox.pack_start(button3, true, true, 0);
        var button4 = new Button.with_label("Button 4");
        hbox.add(button4);
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
