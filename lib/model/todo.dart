class TODoItems {
  String? id;
  String? text;
  var isDone = false;

  TODoItems({required this.text, this.isDone = false});

  onChanged() {
    isDone = !isDone;
  }
}