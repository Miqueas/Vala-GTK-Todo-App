public sealed class TasksView : Adw.Bin {
  private unowned TasksProvider provider = TasksProvider.instance;
  private Gtk.ListBox list;

  protected override void constructed() {
    base.constructed();

    list = new Gtk.ListBox() {
      vexpand = true,
      css_classes = { "background" },
      selection_mode = Gtk.SelectionMode.NONE,
    };

    build();
    provider.changed.connect(rebuild);

    var scroll = new Gtk.ScrolledWindow() {
      propagate_natural_width = true,
      propagate_natural_height = true,
      margin_start = 10,
      margin_end = 10,
      child = list,
    };

    css_classes = { "background" };
    child = scroll;
  }

  private void build() {
    foreach (var task in provider.tasks) {
      var row = new Gtk.ListBoxRow() {
        activatable = false,
        focusable = false,
        child = new TaskRow(task)
      };

      list.append(row);
    }
  }

  private void rebuild() {
    list.remove_all();
    build();
  }
}