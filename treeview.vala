using Gtk;

public class TreeViewSample : Window {

    private Popover pop;

    public TreeViewSample () {
        this.title = "TreeView Sample";
        set_default_size (250, 100);
        var view = new TreeView ();
        setup_treeview (view);
        add (view);
        this.destroy.connect (Gtk.main_quit);
    }

    private void setup_treeview (TreeView view) {

        /*
         * Use ListStore to hold accountname, accounttype, balance and
         * color attribute. For more info on how TreeView works take a
         * look at the GTK+ API.
         */

        var listmodel = new Gtk.ListStore (4, typeof (string), typeof (string),
                                          typeof (string), typeof (string));
        view.set_model (listmodel);

        var grid = new Gtk.Grid ();
        grid.set_column_spacing (10);
        grid.set_row_spacing (10);
        grid.set_margin_top (10);
        grid.set_margin_end (10);
        grid.set_margin_bottom (10);
        grid.set_margin_start (10);

        view.insert_column_with_attributes (-1, "Account Name", new CellRendererText (), "text", 0);
        var column = view.get_column(0);
        column.set_reorderable(true);
        column.set_resizable(true);

        var label = new Gtk.Label (column.title);
        grid.attach (label, 0, 0);
        var widget = new Gtk.Switch ();
        widget.set_active(true);
        grid.attach (widget, 1, 0);
        {
          var c = column;
          widget.state_set.connect((status) => {
            print("visible");
            c.set_visible(!c.visible);
            return true;
          });
        }

        view.insert_column_with_attributes (-1, "Type", new CellRendererText (), "text", 1);
        column = view.get_column(1);
        column.set_reorderable(true);
        column.set_resizable(true);

        label = new Gtk.Label (column.title);
        grid.attach (label, 0, 1);
        widget = new Gtk.Switch ();
        widget.set_active(true);
        grid.attach (widget, 1, 1);
        {
          var c = column;
          widget.state_set.connect((status) => {
            print("visible");
            c.set_visible(!c.visible);
            return true;
          });
        }

        var cell = new CellRendererText ();
        cell.set ("foreground_set", true);
        view.insert_column_with_attributes (-1, "Balance", cell, "text", 2, "foreground", 3);
        column = view.get_column(2);
        column.set_reorderable(true);
        column.set_resizable(true);

        label = new Gtk.Label (column.title);
        grid.attach (label, 0, 2);
        widget = new Gtk.Switch ();
        widget.set_active(true);
        grid.attach (widget, 1, 2);
        {
          var c = column;
          widget.state_set.connect((status) => {
            print("visible");
            c.set_visible(!c.visible);
            return true;
          });
        }

        grid.show_all ();

        pop = new Gtk.Popover (view);
        pop.add (grid);

        view.button_release_event.connect((w, e) => {
          var rect = Gdk.Rectangle();
          rect.x = (int)e.x;
          rect.y = (int)e.y;
          rect.width = rect.height = 1;
          pop.set_relative_to(view);
          pop.set_pointing_to(rect);
          pop.show_all();
          pop.set_visible (true);
          return true;
        });

        TreeIter iter;
        listmodel.append (out iter);
        listmodel.set (iter, 0, "My Visacard", 1, "card", 2, "102,10", 3, "red");

        listmodel.append (out iter);
        listmodel.set (iter, 0, "My Mastercard", 1, "card", 2, "10,20", 3, "red");
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var sample = new TreeViewSample ();
        sample.show_all ();
        Gtk.main ();

        return 0;
    }
}
