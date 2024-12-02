
public sealed class TasksProvider : Object {
  private static TasksProvider _instance = new TasksProvider();
  public static TasksProvider instance {
    get {
      if (_instance == null) {
        _instance = new TasksProvider();
      }

      return _instance;
    }
  }

  public Gee.ArrayList<Task> tasks { get; private set; }
  public signal void changed();

  public TasksProvider() {
    tasks = new Gee.ArrayList<Task>();
  }

  public void add_task(string text, bool done) {
    tasks.add( new Task(tasks.size, text, done));
    changed();
  }

  public void remove_task(uint id) {
    var task = tasks.first_match((item) => item.id == id);
    if (task == null) return;
    tasks.remove(task);
    changed();
  }

  public void set_done(uint id, bool done) {
    var task = tasks.first_match((item) => item.id == id);
    changed();
    if (task == null) return;
    var index = tasks.index_of(task);
    tasks.remove_at(index);
    tasks.insert(index, new Task(task.id, task.text, done));
    changed();
  }
}