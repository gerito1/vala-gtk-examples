/*
 * Similar to a ComboBoxText, the ComboBox allows selection of items from a
 * dropdown list. It provides more features, and is capable of displaying
 * options of different types other than text.
*/

using Gtk;

public class Example : Window
{
    private Gtk.ListStore liststore;
    private ComboBox combobox;
    private CellRendererText cellrenderertext;

    public Example()
    {
        this.title = "ComboBox";
        this.destroy.connect(Gtk.main_quit);

        liststore = new Gtk.ListStore(1, typeof (string));
        Gtk.TreeIter iter;

        liststore.append(out iter);
        liststore.set(iter, 0, "Rafael Nadal", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Roger Federer", -1);
        liststore.append(out iter);
        liststore.set(iter, 0, "Novak Djokovic", -1);

        cellrenderertext = new CellRendererText();

        combobox = new ComboBox();
        combobox.set_model(liststore);
        combobox.pack_start(cellrenderertext, true);
        combobox.add_attribute(cellrenderertext, "text", 0);
        combobox.changed.connect(on_combobox_changed);
        this.add(combobox);
    }

    private void on_combobox_changed()
    {
        Gtk.TreeIter iter;
        Value val;

        combobox.get_active_iter(out iter);
        liststore.get_value(iter, 0, out val);

        stdout.printf("Selection is '%s'\n", (string) val);
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
