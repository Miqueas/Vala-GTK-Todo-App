public sealed class App : Adw.Application {
  public App() {
    Object(application_id: appId, flags: ApplicationFlags.DEFAULT_FLAGS);
  }

  protected override void activate() {
    this.active_window?.present();
  }

  protected override void startup() {
    base.startup();
    new AppWindow(this);
  }
}