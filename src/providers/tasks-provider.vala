
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

  public ListStore tasks { get; private set; }

  public TasksProvider() {
    tasks = new ListStore(typeof(Task));
  }

  public void add_task(string text, bool done) {
    tasks.append(new Task(tasks.n_items, text, done));
  }

  public void remove_task(uint id) {
    var index = get_task_index_by_id(id);
    if (index == null) return;
    tasks.remove(index);
  }

  public void set_done(uint id, bool done) {
    var index = get_task_index_by_id(id);
    var task = get_task_by_id(id);
    if (index == null || task == null) return;
    task.done = done;
  }

  private Task? get_task_by_id(uint id) {
    for (var index = 0; index < tasks.n_items; index++) {
      Task task = (Task) tasks.get_item(index);
      if (task.id == id) return task;
    }

    return null;
  }

  private uint? get_task_index_by_id(uint id) {
    for (var index = 0; index < tasks.n_items; index++) {
      Task task = (Task) tasks.get_item(index);
      if (task.id == id) return index;
    }

    return null;
  }
}