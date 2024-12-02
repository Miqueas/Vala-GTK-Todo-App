public sealed class Task {
  private uint _id;
  private string _text;
  private bool _done;

  public uint id {
    get { return _id; }
  }

  public string text {
    get { return _text; }
  }

  public bool done {
    get { return _done; }
  }

  public Task(uint id, string text, bool done) {
    _id = id;
    _text = text;
    _done = done;
  }
}