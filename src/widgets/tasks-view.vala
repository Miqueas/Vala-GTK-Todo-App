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

    list.bind_model(
      provider.tasks,
      (item) => new TaskRow((Task) item)
    );

    var scroll = new Gtk.ScrolledWindow() {
      propagate_natural_width = true,
      propagate_natural_height = true,
      child = list,
    };

    css_classes = { "background" };
    child = scroll;
  }
}