/*
 * The FlowBox positions child widgets either horizontally or vertically
 * depending on how much size the container is allocated. Widgets are moved
 * dynamically as the container changes size and shape.
 *
 * Compile using:
 * valac flowbox.vala --pkg gtk+-3.0
 *
 * Author: Andrew Steele
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "FlowBox";
        this.destroy.connect(Gtk.main_quit);

        var flowbox = new FlowBox();
        this.add(flowbox);

        var button = new Button.with_label("Button in FlowBox");
        flowbox.insert(button, 0);

        var togglebutton = new ToggleButton.with_label("ToggleButton in FlowBox");
        flowbox.insert(togglebutton, 1);

        var checkbutton = new CheckButton.with_label("CheckButton in FlowBox");
        flowbox.insert(checkbutton, -1);
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
