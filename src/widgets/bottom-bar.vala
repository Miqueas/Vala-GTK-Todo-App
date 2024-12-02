public sealed class BottomBar : Gtk.Box {
  private Gtk.CheckButton doneCheckBox;
  private Gtk.Entry inputEntry;
  private unowned TasksProvider provider = TasksProvider.instance;

  public BottomBar() {
    Object(
      orientation: Gtk.Orientation.HORIZONTAL,
      spacing: 10,
      margin_top: 10,
      margin_bottom: 10,
      margin_start: 10,
      margin_end: 10
    );
  }

  protected override void constructed() {
    base.constructed();

    doneCheckBox = new Gtk.CheckButton.with_label("Set as done") { 
      css_classes = { "selection-mode" }
    };

    inputEntry = new Gtk.Entry() { hexpand = true };
    inputEntry.activate.connect(add_task);

    var addButton = new Gtk.Button.with_label("Add task");
    addButton.clicked.connect(add_task);

    append(doneCheckBox);
    append(inputEntry);
    append(addButton);
  }

  private void add_task() {
    var text = inputEntry.text;
    if (text.length == 0) return;
    provider.add_task(text, doneCheckBox.active);
    inputEntry.text = "";
  }
}