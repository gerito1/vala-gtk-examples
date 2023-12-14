public class MyWindow : Gtk.ApplicationWindow {

    /* Callback functions for the window actions. */
    void copy_cb (SimpleAction action, Variant? parameter) {
        print ("\"Copy\" activated\n");
    }

    void paste_cb (SimpleAction action, Variant? parameter) {
        print ("\"Paste\" activated\n");
    }

    void shape_cb (SimpleAction action, Variant? parameter) {
        print ("shape is set to %s\n", parameter.get_string(null));
        action.set_state (parameter);
    }

    /* Create the window actions. */
    const ActionEntry[] actions = {
        /*{ "action name", cb to connect to "activate" signal, parameter type,
             initial state, cb to connect to "change-state" signal } */
        { "copy", copy_cb },
        { "paste", paste_cb },
        { "shape", shape_cb, "s", "'line'"}
    };

    internal MyWindow (MyApplication app) {
        Object (application: app, title: "MenuBar Example");
        this.set_default_size (200, 200);

        /* Setup window actions. */
        this.add_action_entries (actions, this);
    }
}

class MyApplication: Gtk.Application {
    protected override void activate () {
        new MyWindow (this).show ();
    }

    /* Callback functions for the application actions. */
    void new_cb (SimpleAction action, Variant? parameter) {
        //new MyWindow (this).show ();
        print ("You clicked \"New\"\n");
    }

    void quit_cb (SimpleAction action, Variant? parameter) {
        print ("You clicked \"Quit\"\n");
        //this.quit ();  **Bug #674090**
    }

    void awesome_cb (SimpleAction action, Variant? parameter) {
        var active = action.get_state ().get_boolean ();
        action.set_state (new Variant.boolean (!active));
        if (active)
            print ("You unchecked \"Awesome\"\n");
        else
            print ("You checked \"Awesome\"\n");
    }

    void state_cb (SimpleAction action, Variant? parameter) {
        print ("state is set to %s\n", parameter.get_string(null));
        action.set_state (parameter);
    }

    /* Create the application actions. */
    const ActionEntry[] actions = {
        { "new", new_cb },
        { "quit", quit_cb },
        { "awesome", awesome_cb, null, "false" },
        { "state", state_cb, "s", "'off'" }
    };

    protected override void startup () {
        base.startup ();

        /* Setup application actions. */
        this.add_action_entries (actions, this);

        /* Setup menubar and app_menu. */
        /* Get the UI file. */
        var builder = new Gtk.Builder ();
        try {
            builder.add_from_resource ("/menus/menubar.ui");
        } catch (Error e) {
            error ("Unable to load file: %s", e.message);
        }

        /* Get the menubar from the builder. */
        this.menubar = builder.get_object ("menubar") as MenuModel;

        /* Get the app_menu from the builder. */
        this.app_menu = builder.get_object ("appmenu") as MenuModel;
    }
}

/* main creates and runs the application. */
public int main (string[] args) {
    return new MyApplication ().run (args);
}
