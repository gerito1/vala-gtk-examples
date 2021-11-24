/*
 * The Paned widget provides two panels oriented vertically or horizontally.
 * Widgets can be added to the Paned container, with the separator between the
 * two panes being adjustable.
 *
 * Compile using:
 * valac paned.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Paned";
        this.destroy.connect(Gtk.main_quit);

        var paned = new Paned(Gtk.Orientation.VERTICAL);
        this.add(paned);

        var label1 = new Label("Paned area 1");
        paned.add1(label1);

        var label2 = new Label("Paned area 2");
        paned.add2(label2);
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.set_default_size(200, 200);
        window.show_all();

        Gtk.main();

        return 0;
    }
}
