/*
 * SourceView is a Gtk widget used to display text similarly to TextView widget
 * but also is support syntax highlights as many code editors.
 *
 * Compile using:
 * valac sourceview.vala --pkg gtk+-3.0 --pkg gtksourceview-3.0
 * SourceView Documentation https://valadoc.org/gtksourceview-3.0/Gtk.SourceView.html
 *
 * Author: Geronimo Bareiro https://github.com/gerito1
 */

public class SourceEditor : Gtk.Window {
    private const string TITLE = "My Source Code Editor";

    private Gtk.SourceView source_view;
    private Gtk.SourceLanguageManager language_manager;
    private Gtk.MenuBar menu_bar;
    private Gtk.MenuItem item_open;
    private Gtk.MenuItem item_save;
    private Gtk.MenuItem item_quit;
    private Gtk.SourceFile file;

    public SourceEditor () {}

    /* Using GObject-Style construction
     * See https://chebizarro.gitbooks.io/the-vala-tutorial/content/gobject-style-construction.html
     */
    construct {
        title = SourceEditor.TITLE;
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

        source_view = new Gtk.SourceView ();
        source_view.set_wrap_mode (Gtk.WrapMode.WORD);
        source_view.buffer.text = "";
        language_manager = Gtk.SourceLanguageManager.get_default ();

        var scrolled_window = new Gtk.ScrolledWindow (null, null);
        scrolled_window.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled_window.add (source_view);
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

        /*
         * Set the callbacks for the items in the File Menu
         */
        item_open.activate.connect (on_open);
        item_save.activate.connect (on_save);
        item_quit.activate.connect (Gtk.main_quit);

        /*
         *Populate the contextual menu after the right click. We need to select
         *a language for our sourceview.
         */
        source_view.populate_popup.connect (on_populate_menu);

    }

    /*
     * We will select a file using FileChooser and load it to the editor.
     */
    void on_open () {
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
            file = new Gtk.SourceFile ();
            file.location = chooser.get_file ();
            var file_loader = new Gtk.SourceFileLoader (source_view.buffer as Gtk.SourceBuffer, file);
            try {
                file_loader.load_async.begin (Priority.DEFAULT, null, null);
            } catch (Error e) {
                stdout.printf ("Error: %s\n", e.message);
            }
        }
    }

    /*
     *This will save the file to the location we had defined before.
     *It doesn't consider the case where you didn't "select" a file before.
     */
    void on_save () {
        if (file != null && !file.is_readonly () ) {
            var file_saver = new Gtk.SourceFileSaver (source_view.buffer as Gtk.SourceBuffer, file);
            try {
                file_saver.save_async.begin (Priority.DEFAULT, null, null);
            } catch (Error e) {
                stdout.printf ("Error: %s\n", e.message);
            }
        }
    }

    /*
    * Create the submenu to select language for our source view, using the right-click
    * contextual menu
    */
    void on_populate_menu (Gtk.Menu menu) {
        var language_menu = new Gtk.MenuItem ();
        language_menu.set_label ("Language");

        var submenu = new Gtk.Menu ();
        language_menu.set_submenu (submenu);

        // Create the list of items
        unowned SList<Gtk.RadioMenuItem> group = null;
        Gtk.RadioMenuItem? item = null;

        //Add an entry with No Language, or normal.
        item = new Gtk.RadioMenuItem (group);
        item.set_label ("Normal Text");
        item.toggled.connect (() => {

           //No language, aka normal text edit.
           (source_view.buffer as Gtk.SourceBuffer).set_language (null);
        });

        submenu.add (item);

        // Set the Language entries
        var ids = language_manager.get_language_ids ();
        foreach (var id in ids) {
            var lang = language_manager.get_language (id);
            group = item.get_group ();
            item = new Gtk.RadioMenuItem (group);
            item.set_label (lang.name);

            submenu.add (item);
            item.toggled.connect (() => {
                (source_view.buffer as Gtk.SourceBuffer).set_language (lang);
            });

            // Active item
            if ((source_view.buffer as Gtk.SourceBuffer).language != null && id == (source_view.buffer as Gtk.SourceBuffer).language.id) {
                item.active = true;
            }
        }

        // Add our Language selection menu to the menu provided in the callback
        menu.add (language_menu);
        menu.show_all ();
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var my_editor = new SourceEditor ();
        my_editor.show_all ();

        Gtk.main ();

        return 0;
    }
}

