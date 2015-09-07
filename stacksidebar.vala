/*
 * The StackSidebar works in a similar way to the StackSwitcher, however it
 * offers the choice of visible child in the Stack via a sidebar, with each item
 * listed vertically.
*/

using Gtk;

public class Example : Window
{
    public Example()
    {
        this.title = "StackSidebar";
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        this.add(grid);

        var stacksidebar = new StackSidebar();
        grid.attach(stacksidebar, 0, 0, 1, 1);

        var stack = new Stack();
        stack.set_vexpand(true);
        stack.set_hexpand(true);
        stacksidebar.set_stack(stack);
        grid.attach(stack, 1, 0, 1, 1);

        var label1 = new Label("Page 1 of Stack");
        stack.add_titled(label1, "Page1", "Page 1");

        var label2 = new Label("Page 2 of Stack");
        stack.add_titled(label2, "Page2", "Page 2");
    }

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        window.set_default_size(200, 200);
        window.show_all();

        Gtk.main();

        return 0;
    }
}
