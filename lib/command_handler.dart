import 'package:todoapp/command_manger.dart';
import 'package:todoapp/todo/delete.dart';
import 'package:todoapp/todo/edite.dart';
import 'package:todoapp/todo/find.dart';
import 'package:todoapp/todo/list.dart';
import 'package:todoapp/todo_manger.dart';
import 'package:todoapp/todo/add.dart';

class CommandHandler {
  TodoManger todoManger;
  CommandManger commandManger;
  CommandHandler({required this.commandManger, required this.todoManger});
  void handler() {
    switch (commandManger.getCommand(0)) {
      case '-a' || '--add':
          AddTodo addTodo = AddTodo(commandManger: commandManger, todoManger: todoManger);
          addTodo.addTodo();
        break;
      case '-l' || '--list':
        ListTodo listTodo = ListTodo(todoManger: todoManger);
        listTodo.listTodo();
        break;
      case '-d' || '--delete':
        DeleteTodo deleteTodo = DeleteTodo(commandManger: commandManger,todoManger: todoManger);
        deleteTodo.deleteTodo();
        break;
      case '-u' || '--update':
        EditeTodo editeTodo = EditeTodo(commandManger: commandManger,todoManger: todoManger);
        editeTodo.editeTodo();
        break;
      case '-f' || '--find':
        FindTodo findTodo = FindTodo(commandManger: commandManger,todoManger: todoManger);
        findTodo.findTodo();
        break;
      case '-h' || '--help' || '':
        commandManger.printHelper();
        break;
      default:
        commandManger.printHelper();
    }
  }
}
