/*
 * The Scale widget provides a way for adjusting values between a set range,
 * with the user sliding a knob to the preferred value.
 *
 * Compile using:
 * valac scale.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    private Scale scale;

    public Example()
    {
        this.title = "Scale";
        this.set_default_size(50, 400);
        this.destroy.connect(Gtk.main_quit);

        scale = new Scale.with_range(Gtk.Orientation.VERTICAL, 0, 100, 1);
        scale.set_value(50);
        scale.adjustment.value_changed.connect(on_scale_changed);
        this.add(scale);
    }

    private void on_scale_changed(Adjustment adjustment)
    {
        var value = scale.get_value();
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
