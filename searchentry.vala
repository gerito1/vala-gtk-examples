/*
 * A SearchEntry has an appearance similar to a standard Entry, but is tailored
 * for use when being used to provide search functionality.
 *
 * Compile using:
 * valac searchentry.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "SearchEntry";
        this.destroy.connect(Gtk.main_quit);

        var searchentry = new SearchEntry();
        searchentry.set_placeholder_text("Enter search text...");
        searchentry.activate.connect(on_searchentry_activated);
        this.add(searchentry);
    }

    public void on_searchentry_activated(Entry searchentry)
    {
        var text = searchentry.get_text();
        stdout.printf("%s\n", text);
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
