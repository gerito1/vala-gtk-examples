/*
 * The Grid allows widgets to be placed horizontally and vertically across one
 * or more cells with options provided for spacing and sizing.
 *
 * Compile using:
 * valac grid.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "Grid";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        grid.set_row_spacing(5);
        grid.set_column_spacing(5);
        this.add(grid);

        var button1 = new Button.with_label("Button 1");
        grid.attach(button1, 0, 0, 1, 1);
        var button2 = new Button.with_label("Button 2");
        grid.attach(button2, 1, 0, 1, 2);
        var button3 = new Button.with_label("Button 3");
        grid.attach(button3, 0, 1, 1, 1);
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
