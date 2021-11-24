/*
 * The Button widget is commonly found in programs and used to launch processes
 * and operations.
 *
 * Compile using:
 * valac button.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    private Button button;

    public Example()
    {
        this.title = "Button";
        this.destroy.connect(Gtk.main_quit);

        var box = new Box(Gtk.Orientation.VERTICAL, 5);
        this.add(box);

        button = new Button();
        button.set_label("Button 1");
        button.clicked.connect(on_button_clicked);
        box.add(button);
        button = new Button();
        button.set_label("Button 2");
        button.clicked.connect(on_button_clicked);
        box.add(button);
    }

    private void on_button_clicked(Button button)
    {
        var label = button.get_label();
        stdout.printf("%s clicked\n", label);
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
