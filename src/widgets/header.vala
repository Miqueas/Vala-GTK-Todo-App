public sealed class Header : Adw.Bin {
  protected override void constructed() {
    base.constructed();

    var aboutButton = new Gtk.Button.with_label("About");
    aboutButton.clicked.connect(() => new AboutWindow());

    var titleLabel = new Gtk.Label("Tasks") {
      use_markup = true,
      css_classes = { "title" },
    };

    var subtitleLabel = new Gtk.Label(appTitle) {
      use_markup = true,
      css_classes = { "subtitle" },
    };

    var titleBox = new Gtk.Box(Gtk.Orientation.VERTICAL, 4);
    titleBox.append(titleLabel);
    titleBox.append(subtitleLabel);

    var header = new Adw.HeaderBar() {
      title_widget = titleBox,
      decoration_layout = ":close",
      css_classes = { "flat" },
    };

    header.pack_start(aboutButton);

    child = header;
  }
}