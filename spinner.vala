/*
 * The Spinner widget provides an animated indicator of activity in the program,
 * and is useful to indicate a long-running task.
*/

using Gtk;

public class Example : Window
{
    private Spinner spinner;

    public Example()
    {
        this.title = "Spinner";
        this.set_default_size(200, 200);
        this.destroy.connect(Gtk.main_quit);

        var grid = new Gtk.Grid();
        this.add(grid);

        var buttonStart = new Gtk.Button.with_label("Start");
        buttonStart.clicked.connect(on_start_button_clicked);
        grid.attach(buttonStart, 0, 1, 1, 1);
        var buttonStop = new Gtk.Button.with_label("Stop");
        buttonStop.clicked.connect(on_stop_button_clicked);
        grid.attach(buttonStop, 1, 1, 1, 1);

        spinner = new Spinner();
        spinner.set_vexpand(true);
        spinner.set_hexpand(true);
        grid.attach(spinner, 0, 0, 2, 1);
    }

    private void on_start_button_clicked(Button button)
    {
        spinner.start();
    }

    private void on_stop_button_clicked(Button button)
    {
        spinner.stop();
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
