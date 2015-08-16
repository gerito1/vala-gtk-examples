/*
 * A SpinButton provides a way to enter numbers either by textual entry from the
 * user, or by changing the value with up/down buttons. Ranges to limit the
 * value entered are able to be set.
*/

using Gtk;

public class Example : Window
{
    private SpinButton spinbutton;

    public Example()
    {
        this.title = "SpinButton";
        this.destroy.connect(Gtk.main_quit);

        spinbutton = new SpinButton.with_range(0, 10, 1);
        spinbutton.set_value(2);
        spinbutton.value_changed.connect(on_spinbutton_changed);
        this.add(spinbutton);
    }

    private void on_spinbutton_changed(SpinButton spinbutton)
    {
        var value = spinbutton.get_value();
        stdout.printf("%.2f\n", value);
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
