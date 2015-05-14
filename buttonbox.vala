using Gtk;

public class Example : Window
{
    private ButtonBox buttonbox;
    private Button button1;
    private Button button2;
    private Button button3;

    public Example()
    {
        this.title = "ButtonBox";
        this.destroy.connect(Gtk.main_quit);

        buttonbox = new ButtonBox(Gtk.Orientation.HORIZONTAL);
        buttonbox.set_spacing(5);
        this.add(buttonbox);

        button1 = new Button.with_label("Button with extra text");
        buttonbox.add(button1);
        button2 = new Button.with_label("Button");
        buttonbox.add(button2);
        button3 = new ToggleButton.with_label("ToggleButton");
        buttonbox.add(button3);
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
