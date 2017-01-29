/*
 * Webkit2gtk is a port of the webkit2 widget to Gtk. With it you can embed a
 * browser into your project.
 * Compile using:
 * valac webkit2.vala --pkg gtk+-3.0 --pkg webkit2gtk-4.0
 *
 * Based on https://wiki.gnome.org/Projects/Vala/WebKitSample
 * WebKit documentation https://valadoc.org/webkit2gtk-4.0/index.htm
 *
 * Make sure you have installed the package libwebkit2gtk-4.0-dev in debian or
 * derivative systems
 * $ apt-get install libwebkit2gtk-4.0-dev
 *
 * Author: Geronimo Bareiro https://github.com/gerito1
*/


public class MyWebkitWindow : Gtk.Window {

    private const string BROWSER_TITLE = "My WebKit Browser";
    private const string DEFAULT_PROTOCOL = "http";
    private GLib.Regex protocol_regex;

    private WebKit.WebView web_view; //This is the widget that shows the page
    private Gtk.Label status_bar;
    private Gtk.Entry url_bar;
    private Gtk.ToolButton back_button;
    private Gtk.ToolButton forward_button;
    private Gtk.ToolButton reload_button;
    private Gtk.ToolButton stop_button;

    public MyWebkitWindow () {}

    /* Using GObject-Style construction
     * See https://chebizarro.gitbooks.io/the-vala-tutorial/content/gobject-style-construction.html
     */
    construct {
        title = MyWebkitWindow.BROWSER_TITLE;
        set_default_size (800, 600);
        try {
            protocol_regex = new Regex (".*://.*");
        } catch (RegexError e) {
            critical ("%s", e.message);
        }

        var toolbar = new Gtk.Toolbar ();
        var back_image = new Gtk.Image.from_icon_name ("go-previous", Gtk.IconSize.SMALL_TOOLBAR);
        back_button = new Gtk.ToolButton (back_image, null);
        var forward_image = new Gtk.Image.from_icon_name ("go-next", Gtk.IconSize.SMALL_TOOLBAR);
        forward_button = new Gtk.ToolButton (forward_image, null);
        var reload_image = new Gtk.Image.from_icon_name ("view-refresh", Gtk.IconSize.SMALL_TOOLBAR);
        reload_button = new Gtk.ToolButton (reload_image, null);
        var stop_image = new Gtk.Image.from_icon_name ("process-stop", Gtk.IconSize.SMALL_TOOLBAR);
        stop_button = new Gtk.ToolButton (stop_image, null);
        toolbar.add (back_button);
        toolbar.add (forward_button);
        toolbar.add (reload_button);
        toolbar.add (stop_button);

        url_bar = new Gtk.Entry ();
        web_view = new WebKit.WebView ();
        var scrolled_window = new Gtk.ScrolledWindow (null, null); //The WebView doesn't contain scroll bars by its own.
        scrolled_window.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled_window.add (web_view);
        scrolled_window.hexpand = true;
        scrolled_window.vexpand = true;
        status_bar = new Gtk.Label ("Welcome to %s".printf(BROWSER_TITLE));
        status_bar.xalign = 0;

        var grid = new Gtk.Grid ();
        grid.attach (toolbar, 0, 0, 1, 1);
        grid.attach (url_bar, 0, 1, 1, 1);
        grid.attach (scrolled_window, 0, 2, 1, 1);
        grid.attach (status_bar, 0, 3, 1, 1);
        add (grid as Gtk.Widget);
        show_all ();

        connect_signals ();
    }

    private void connect_signals () {
        destroy.connect (Gtk.main_quit);

        url_bar.activate.connect (() => {
            open_url (url_bar.text);
        });

        web_view.load_changed.connect ((load_event) => {
            url_bar.text = web_view.get_uri ();
            if (web_view.title == null) {
                title = MyWebkitWindow.BROWSER_TITLE;
            } else {
                title = "%s - %s".printf (web_view.title, MyWebkitWindow.BROWSER_TITLE);
            }

            back_button.sensitive = web_view.can_go_back ();
            forward_button.sensitive = web_view.can_go_forward ();
            if (load_event == WebKit.LoadEvent.FINISHED) {
                stop_button.sensitive = false;
            } else {
                stop_button.sensitive = true;
            }
        });

        back_button.clicked.connect (web_view.go_back);
        forward_button.clicked.connect (web_view.go_forward);
        reload_button.clicked.connect (web_view.reload);
        stop_button.clicked.connect (web_view.stop_loading);
    }

    void open_url (string page_url) {
        var url = page_url;
        if (!protocol_regex.match (page_url)) {
            url = "%s://%s".printf (MyWebkitWindow.DEFAULT_PROTOCOL, page_url);
        }
        web_view.load_uri (url);
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var my_webkit_window = new MyWebkitWindow ();
        my_webkit_window.open_url ("https://valadoc.org/webkit2gtk-4.0/WebKit.html");

        Gtk.main ();

        return 0;
    }

}
