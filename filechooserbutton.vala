/*
 * The FileChooserButton provides a Button-like widget used for the selection
 * of files and/or folders from the file system.
 *
 * Compile using:
 * valac filechooserbutton.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "FileChooserButton";
        this.set_default_size(200, -1);
        this.destroy.connect(Gtk.main_quit);

        var filechooserbutton = new Gtk.FileChooserButton("Select File", Gtk.FileChooserAction.OPEN);
        filechooserbutton.file_set.connect(on_file_set);
        this.add(filechooserbutton);
    }

    private void on_file_set(FileChooserButton filechooserbutton)
    {
        var filename = filechooserbutton.get_filename();
        stdout.printf("Selected filename: %s\n", filename);
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
