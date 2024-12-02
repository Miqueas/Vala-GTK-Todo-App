public sealed class AppWindow : Adw.ApplicationWindow {
  public AppWindow(App app) {
    Object(application: app, title: appTitle);
  }

  protected override void constructed() {
    base.constructed();

    var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
    box.append(new Header());
    box.append(new TasksView());
    box.append(new BottomBar());

    set_default_size(400, 600);
    resizable = false;
    content = box;
  }
}