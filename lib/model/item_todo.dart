class ItemToDo {
  final int? id;
  final String? title;
  final String? description;
  final int? state;

  ItemToDo({
    this.id,
    this.title,
    this.description,
    this.state
  });

  ItemToDo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["description"],
        state = res["state"];

  Map<String, Object?> toMap() {
    return {
      'id':id,
      'title': title,
      'description': description,
      'state': state};
  }
}