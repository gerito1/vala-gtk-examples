/*
 * ToggleButton widgets is used to indicate whether something is active or not,
 * with the appearance of a standard Button widget.
 *
 * Compile using:
 * valac togglebutton.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    private ToggleButton togglebutton;

    public Example()
    {
        this.title = "ToggleButton";
        this.destroy.connect(Gtk.main_quit);

        var box = new Box(Gtk.Orientation.VERTICAL, 5);
        this.add(box);

        togglebutton = new ToggleButton();
        togglebutton.set_label("ToggleButton 1");
        togglebutton.toggled.connect(on_checkbutton_toggle);
        box.add(togglebutton);
        togglebutton = new ToggleButton();
        togglebutton.set_label("ToggleButton 2");
        togglebutton.toggled.connect(on_checkbutton_toggle);
        box.add(togglebutton);
    }

    private void on_checkbutton_toggle(ToggleButton togglebutton)
    {
        var active = togglebutton.get_active();
        var label = togglebutton.get_label();

        if (active == true)
            stdout.printf("%s toggled on\n", label);
        else
            stdout.printf("%s toggled off\n", label);
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
