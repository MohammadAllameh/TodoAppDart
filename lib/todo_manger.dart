
import 'dart:io';

class TodoManger {
  File storge;
  Map todos = {};
  TodoManger({required this.storge}) {
    cheakexeiteFile();
    todos = getTodosFromStroge();
  }

  void cheakexeiteFile() {
    if (!storge.existsSync()) {
      storge.createSync();
    }
  }
  
  Map getTodosFromStroge() {
    return {...storge.readAsLinesSync().asMap()};
  }
  
  void addTodo({required String text}) {
    storge.writeAsStringSync('$text\n', mode: FileMode.append);
  }
  void deleteTodo({required int id}) {
    todos.remove(id);
    refreshTodoInStorge();
  }
  void editeTodo({required int id,required String newTitle}){
    todos = todos.map((key, value) => key == id ?  MapEntry(key, newTitle) : MapEntry(key, value));
    refreshTodoInStorge();
  }
  String findTodo({required int id}){
    return todos[id];
  }
  void refreshTodoInStorge() {
    storge.writeAsStringSync('');
    todos.forEach((key, value)=> storge.writeAsStringSync(value + "\n", mode: FileMode.append));
  }
  
}

