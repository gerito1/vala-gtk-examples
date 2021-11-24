/*
 * A Notebook can be used to provide tabulated pages on which different content
 * can be added.
 *
 * Compile using:
 * valac notebook.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    private Notebook notebook;

    public Example()
    {
        this.title = "Notebook";
        this.set_default_size(200, 200);
        this.destroy.connect(Gtk.main_quit);

        notebook = new Notebook();
        this.add(notebook);

        int count;

        for (count = 1; count <= 3; count++)
        {
            var text1 = "Tab %i".printf(count);

            var label = new Label(null);
            label.set_label(text1);

            var text2 = "Button %i in Tab %i".printf(count, count);

            var button = new Button.with_label(text2);
            notebook.append_page(button, label);
        }
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
