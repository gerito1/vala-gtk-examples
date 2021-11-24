/*
 * The ActionBar container is often placed below the content of the window, and
 * is used to show contextual actions.
 *
 * Compile using:
 * valac actionbar.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "ActionBar";
        this.set_default_size(200, 200);
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        grid.set_row_spacing(5);
        grid.set_column_spacing(5);
        this.add(grid);

        var label = new Label("");
        label.set_vexpand(true);
        grid.attach(label, 0, 0, 1, 1);

        var actionbar = new ActionBar();
        actionbar.set_hexpand(true);
        grid.attach(actionbar, 0, 1, 1, 1);

        var button1 = new Button.with_label("Cut");
        actionbar.pack_start(button1);
        var button2 = new Button.with_label("Copy");
        actionbar.pack_start(button2);
        var button3 = new Button.with_label("Paste");
        actionbar.pack_end(button3);
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
