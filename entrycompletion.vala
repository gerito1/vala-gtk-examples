/*
 * Coupled with an Entry, the EntryCompletion object provides matching of text
 * to a list of entries, allowing the user to select a value.
*/

using Gtk;

public class EntryExample : Window
{
    private Gtk.ListStore liststore;
    private Entry entry;
    private EntryCompletion entrycompletion;

    public EntryExample()
    {
        this.title = "Entry";
        this.destroy.connect(Gtk.main_quit);

        entry = new Entry();
        this.add(entry);

        liststore = new Gtk.ListStore(1, typeof(string));

        Gtk.TreeIter iter;
        liststore.append(out iter);
        liststore.set(iter, 0, "Oklahoma");
        liststore.append(out iter);
        liststore.set(iter, 0, "California");
        liststore.append(out iter);
        liststore.set(iter, 0, "Texas");
        liststore.append(out iter);
        liststore.set(iter, 0, "Connecticut");
        liststore.append(out iter);
        liststore.set(iter, 0, "Arizona");

        entrycompletion = new EntryCompletion();
        entrycompletion.set_model(liststore);
        entrycompletion.set_text_column(0);
        entrycompletion.set_popup_completion(true);
        entry.set_completion(entrycompletion);
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new EntryExample();
        window.show_all();

        Gtk.main();

        return 0;
    }
}
