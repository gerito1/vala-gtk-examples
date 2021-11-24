/*
 * The EntryBuffer object provides a way to store text held in an Entry, with
 * functionality for handling the text and sharing to other Entry widgets.
 *
 * Compile using:
 * valac entrybuffer.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class EntryExample : Window
{
    private Entry entry;
    private EntryBuffer entrybuffer;

    public EntryExample()
    {
        this.title = "EntryBuffer";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        unowned uint8[] text = (uint8[]) "Entry with EntryBuffer";
        entrybuffer = new EntryBuffer(text);

        entry = new Entry();
        entry.set_buffer(entrybuffer);
        grid.add(entry);

        entry = new Entry();
        entry.set_buffer(entrybuffer);
        grid.add(entry);

        entry = new Entry();
        entry.set_buffer(entrybuffer);
        grid.add(entry);
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
