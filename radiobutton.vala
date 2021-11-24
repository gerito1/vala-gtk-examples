/*
 * A RadioButton is often combined with others to indicate the status from a
 * number of items. Each provides a label and display to indicate which of the
 * group is selected.
 *
 * Compile using:
 * valac radiobutton.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "RadioButton";
        this.destroy.connect(Gtk.main_quit);

        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.add(box);

        var radiobutton1 = new RadioButton(null);
        radiobutton1.set_label("RadioButton 1");
        radiobutton1.toggled.connect(on_radiobutton_toggle);
        box.add(radiobutton1);

        var radiobutton2 = new RadioButton(radiobutton1.get_group());
        radiobutton2.set_label("RadioButton 2");
        radiobutton2.toggled.connect(on_radiobutton_toggle);
        box.add(radiobutton2);

        var radiobutton3 = new RadioButton(radiobutton1.get_group());
        radiobutton3.set_label("RadioButton 3");
        radiobutton3.toggled.connect(on_radiobutton_toggle);
        box.add(radiobutton3);
    }

    private void on_radiobutton_toggle(Gtk.ToggleButton radiobutton)
    {
        if (radiobutton.get_active())
        {
            var label = radiobutton.get_label();
            print("%s toggled\n", label);
        }
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
