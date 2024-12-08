public sealed class Task : Object {
  public uint id;
  public string text;
  public bool done;

  public Task(uint id, string text, bool done) {
    this.id = id;
    this.text = text;
    this.done = done;
  }
}