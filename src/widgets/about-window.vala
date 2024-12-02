public sealed class AboutWindow : Gtk.Widget {
  private Gtk.AboutDialog dialog;

  protected override void constructed() {
    base.constructed();

    dialog = new Gtk.AboutDialog() {
      authors = { appAuthor },
      program_name = appTitle,
      version = appVersion,
      website = appWebsite,
      comments = appDescription,
    };

    dialog.present();
  }
}