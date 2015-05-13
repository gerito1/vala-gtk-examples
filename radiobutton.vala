using Gtk;

public class Example : Window
{
    private Box box;
    private RadioButton radiobutton1;
    private RadioButton radiobutton2;

    public Example()
    {
        this.title = "RadioButton";
        this.destroy.connect(Gtk.main_quit);

        box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        this.add(box);

        radiobutton1 = new RadioButton(null);
        radiobutton1.set_label("RadioButton 1");
        radiobutton1.toggled.connect(on_radiobutton_toggle);
        box.add(radiobutton1);

        radiobutton2 = new RadioButton(radiobutton1.get_group());
        radiobutton2.set_label("RadioButton 2");
        radiobutton2.toggled.connect(on_radiobutton_toggle);
        box.add(radiobutton2);
    }

    private void on_radiobutton_toggle(Gtk.ToggleButton button)
    {
        if (button.get_active())
        {
            var label = button.get_label();
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
