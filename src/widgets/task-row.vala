public sealed class TaskRow : Gtk.Box {
  private unowned TasksProvider provider = TasksProvider.instance;
  public Task task { get; construct set; }

  public TaskRow(Task task) {
    Object(
      task: task,
      spacing: 10,
      margin_top: 10,
      margin_bottom: 10,
      margin_start: 10,
      margin_end: 10,
      orientation: Gtk.Orientation.HORIZONTAL
    );
  }

  protected override void constructed() {
    base.constructed();

    var checkBox = new Gtk.CheckButton() {
      active = task.done,
      css_classes = { "selection-mode" }
    };

    checkBox.toggled.connect(() => provider.set_done(
      task.id, checkBox.active
    ));

    var textMakrup = @"<span strikethrough='$(task.done)'>$(task.text)</span>";
    var textLabel = new Gtk.Label(textMakrup) {
      halign = Gtk.Align.START,
      hexpand = true,
      use_markup = true,
    };

    var deleteButton = new Gtk.Button.from_icon_name("user-trash-symbolic") {
      css_classes = { "destructive-action" }
    };

    deleteButton.clicked.connect(() => provider.remove_task(task.id));

    append(checkBox);
    append(textLabel);
    append(deleteButton);
  }
}