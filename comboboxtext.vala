/*
 * The ComboBoxText provides a simple dropdown menu to select values from a
 * list. Text is also permitted to be entered if the option is set.
 *
 * Compile using:
 * valac comboboxtext.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    private ComboBoxText comboboxtext;

    public Example()
    {
        this.title = "ComboBoxText";
        this.destroy.connect(Gtk.main_quit);

        comboboxtext = new ComboBoxText();
        comboboxtext.append_text("Madrid");
        comboboxtext.append_text("Valencia");
        comboboxtext.append_text("Seville");
        comboboxtext.append_text("Bilbao");
        comboboxtext.set_active(0);
        comboboxtext.changed.connect(on_comboboxtext_changed);
        this.add(comboboxtext);
    }

    private void on_comboboxtext_changed()
    {
        var selection = comboboxtext.get_active_text();
        stdout.printf("Selection is '%s'\n", selection);
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
