import 'package:todoapp/command_manger.dart';
import 'package:todoapp/todo_manger.dart';

class AddTodo {
  TodoManger todoManger;
  CommandManger commandManger;
  AddTodo({required this.commandManger, required this.todoManger});
  void addTodo(){
  // commandManger.lenghtAr(arguments: arguments, item: 2, title: "please enter an id");
    if (!commandManger.checkCommandExists(1,
        message: () => "please enter an id")) {
      return;
    }
    // todoManger.addTodo(text: commandManger.getCommand(1));
    todoManger.addTodo(text: commandManger.getCommand(1));
    print('the todo add successfully');
    return;
}
}


