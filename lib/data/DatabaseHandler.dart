import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/item_todo.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, '.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE itemToDo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, state INTEGER NOT NULL, timeEnd DATETIME)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertItemToDo(List<ItemToDo> itemToDo) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var itemToDo in itemToDo){
      result = await db.insert('ItemToDo', itemToDo.toMap());
    }
    return result;
  }

  Future<List<ItemToDo>> retrieveItemTodo() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('ItemToDo');
    return queryResult.map((e) => ItemToDo.fromMap(e)).toList();
  }

  Future<void> deleteItemTodo(int id) async {
    final db = await initializeDB();
    await db.delete(
      'ItemToDo',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}