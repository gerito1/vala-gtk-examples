/*
 * TextView is a Gtk widget used to display text replicating the same appearance
 * of many text editors.
 * This is not a minimal example, is it a fairly complex example
 * Compile using:
 * valac texteditor.vala --pkg gtk+-3.0 --pkg gio-2.0
 *
 * TextView documentation https://valadoc.org/gtk+-3.0/Gtk.TextView.html
 * Based on the example of the same page.
 * FileChooser documentation https://valadoc.org/gtk+-3.0/Gtk.FileChooser.html
 * GLib.File part of gio-2.0 https://valadoc.org/gtk+-3.0/Gtk.FileChooser.html
 *
 * Author: Geronimo Bareiro https://github.com/gerito1
 */

public class TextEditor : Gtk.Window {
    private const string TITLE = "My Text Editor";


    private Gtk.TextView text_view;
    private Gtk.MenuBar menu_bar;
    private Gtk.MenuItem item_open;
    private Gtk.MenuItem item_save;
    private Gtk.MenuItem item_quit;
    private File file;

    public TextEditor () {}

    /* Using GObject-Style construction
     * See https://chebizarro.gitbooks.io/the-vala-tutorial/content/gobject-style-construction.html
     */
    construct {
        title = TextEditor.TITLE;
        set_default_size (800, 600);
        window_position = Gtk.WindowPosition.CENTER;

        file = null;
        menu_bar = new Gtk.MenuBar ();

        Gtk.MenuItem item_file = new Gtk.MenuItem.with_label ("File");
        menu_bar.add (item_file);

        Gtk.Menu file_menu = new Gtk.Menu ();
        item_file.set_submenu (file_menu);

        item_open = new Gtk.MenuItem.with_label ("Open");
        file_menu.add (item_open);

        item_save = new Gtk.MenuItem.with_label ("Save");
        file_menu.add (item_save);

        item_quit = new Gtk.MenuItem.with_label ("Quit");
        file_menu.add (item_quit);

        text_view = new Gtk.TextView ();
        text_view.set_wrap_mode (Gtk.WrapMode.WORD);
        text_view.buffer.text = "";

        var scrolled_window = new Gtk.ScrolledWindow (null, null);
        scrolled_window.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled_window.add (text_view);
        scrolled_window.hexpand = true;
        scrolled_window.vexpand = true;

        var grid = new Gtk.Grid ();
        grid.attach (menu_bar, 0, 0, 1, 1);
        grid.attach (scrolled_window, 0, 1, 1, 1);
        add (grid as Gtk.Widget);
        show_all ();

        connect_signals ();
    }

    private void connect_signals () {
        destroy.connect (Gtk.main_quit);
        item_open.activate.connect (() => {
            Gtk.FileChooserDialog chooser = new Gtk.FileChooserDialog (
                "Select a file to edit", this, Gtk.FileChooserAction.OPEN,
                "_Cancel",
                Gtk.ResponseType.CANCEL,
                "_Open",
                Gtk.ResponseType.ACCEPT);
            chooser.set_select_multiple (false);
            chooser.run ();
            chooser.close ();
            if (chooser.get_file () != null) {
                file = chooser.get_file ();

                try {
                    uint8[] contents;
                    string etag_out;
                    file.load_contents (null, out contents, out etag_out);
                    text_view.buffer.text = (string) contents;
                } catch (Error e) {
                    stdout.printf ("Error: %s\n", e.message);
                }
            }
        });

        item_save.activate.connect(()=> {
            if (file != null) {
                try {
                    file.replace_contents (text_view.buffer.text.data, null, false, FileCreateFlags.NONE, null);
                } catch (Error e) {
                    stdout.printf ("Error: %s\n", e.message);
                }
            }
        });
        item_quit.activate.connect (Gtk.main_quit);
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var my_editor = new TextEditor ();
        my_editor.show_all ();

        Gtk.main ();

        return 0;
    }
}

