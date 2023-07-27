import 'package:todoapp/todo_manger.dart';

class ListTodo {
  TodoManger todoManger;
  ListTodo({required this.todoManger});
  void listTodo(){
    todoManger
      .getTodosFromStroge()
      .forEach((key, value) => print("${key}.${value}"));
    return;

  }
  
}




