/*
 * The ListBox widget provides a vertical container holding ListBoxRow children.
 * The children are created automatically when another widget is added.. The
 * container also provides sorting and filtering, allowing more complex layouts
 * than can be achieved via a CellRenderer.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "ListBox";
        this.set_default_size(200, 200);
        this.destroy.connect(Gtk.main_quit);

        var listbox = new ListBox();
        this.add(listbox);

        var label1 = new Label("Label 1");
        listbox.insert(label1, -1);

        var label2 = new Label("Label 2");
        listbox.insert(label2, -1);

        var label3 = new Label("Label 3");
        listbox.insert(label3, -1);
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
