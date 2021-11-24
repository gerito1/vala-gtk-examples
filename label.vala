/*
 * The Label is commonly used for basic purposes such as displaying short
 * amounts of text. It does however provide a number of extra features allowing
 * the display of complex text layouts.
 *
 * Compile using:
 * valac label.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Label";
        this.destroy.connect(Gtk.main_quit);

        var vbox = new Box(Gtk.Orientation.VERTICAL, 5);
        vbox.set_spacing(5);
        this.add(vbox);

        var label1 = new Label("This is a single-line example.");
        vbox.add(label1);
        var label2 = new Label("This is a multiple\nline\nexample using new line breaks.");
        vbox.add(label2);

        var hbox = new Box(Gtk.Orientation.HORIZONTAL, 5);
        hbox.set_spacing(5);
        vbox.add(hbox);

        var label3 = new Label(null);
        label3.set_justify(Gtk.Justification.RIGHT);
        label3.set_label("This is an\nexample label\nright justified.");
        hbox.add(label3);
        var label4 = new Label(null);
        label4.set_justify(Gtk.Justification.CENTER);
        label4.set_markup("This is a\ncenter aligned\n label with <b>markup</b>.");
        hbox.pack_end(label4, true, true, 0);
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
