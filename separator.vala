/*
 * The Separator is a sparsely used widget to visually separate content being
 * displayed. They can be horizontally or vertically oriented.
 *
 * Compile using:
 * valac separator.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Separator";
        this.set_default_size(400, 200);
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        var hseparator = new Separator(Gtk.Orientation.HORIZONTAL);
        hseparator.set_vexpand(true);
        hseparator.set_hexpand(true);
        grid.attach(hseparator, 0, 0, 1, 1);

        var vseparator = new Separator(Gtk.Orientation.VERTICAL);
        vseparator.set_vexpand(true);
        vseparator.set_hexpand(true);
        grid.attach(vseparator, 1, 0, 1, 1);
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
