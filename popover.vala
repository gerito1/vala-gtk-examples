public class Application : Gtk.Window {

  public GLib.Menu menu_model { get; set; }

  public Application () {
    this.set_default_size (700, 600);

    var header_bar = new Gtk.HeaderBar ();
    header_bar.set_title ("teste");
    header_bar.show_close_button = true;

    var button = new Gtk.Button();
    button.set_image (new Gtk.Image.from_icon_name ("open-menu-symbolic", Gtk.IconSize.LARGE_TOOLBAR));

    var menu = new GLib.Menu ();
    var item1 = new GLib.MenuItem ("item 1", null);
    var item2 = new GLib.MenuItem ("item 2", null);
    menu.append_item (item1);
    menu.append_item (item2);

    Gtk.Grid search_grid = new Gtk.Grid ();
    search_grid.set_column_spacing (10);
    search_grid.set_row_spacing (10);
    search_grid.set_margin_top (10);
    search_grid.set_margin_end (10);
    search_grid.set_margin_bottom (10);
    search_grid.set_margin_start (10);
    
    var label = new Gtk.Label ("Option");
    search_grid.attach (label, 0, 0);
    
    var widget = new Gtk.Switch ();
    search_grid.attach (widget, 1, 0);
    
    label = new Gtk.Label ("Option 2");
    search_grid.attach (label, 0, 1);
    
    widget = new Gtk.Switch ();
    search_grid.attach (widget, 1, 1);

    search_grid.show_all ();
    
    Gtk.SearchEntry entry = new Gtk.SearchEntry ();
    entry.set_placeholder_text ("Search...");
    header_bar.set_custom_title (entry);

    Gtk.Popover search_pop = new Gtk.Popover (entry);
    search_pop.add (search_grid);

    entry.enter_notify_event.connect ((e) => {
    	search_pop.set_visible (true);
    	return true;
    });
    
    var menu_popover = new Gtk.Popover(button);
    menu_popover.position = Gtk.PositionType.BOTTOM;
    menu_popover.set_size_request (256, -1);
    menu_popover.modal = false;
    menu_popover.bind_model (menu, null);

    button.clicked.connect (() => {
        menu_popover.set_visible (true);
    });

    header_bar.pack_end (button);

    this.set_titlebar (header_bar);
  }

  public static int main (string[] args) {
    Gtk.init (ref args);

    Application app = new Application ();
    app.show_all ();
    Gtk.main ();
    return 0;
  }
}
