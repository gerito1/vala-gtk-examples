/*
 * An Entry is used to receive and display short lines of text, with functions
 * to handle the data.
 *
 * Compile using:
 * valac entry.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class EntryExample : Window
{
    private Entry entry;

    public EntryExample()
    {
        this.title = "Entry";
        this.destroy.connect(Gtk.main_quit);

        entry = new Entry();
        entry.set_placeholder_text("Enter some text...");
        entry.activate.connect(on_entry_activated);
        this.add(entry);
    }

    public void on_entry_activated()
    {
        var text = entry.get_text();
        stdout.printf("%s\n", text);
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
