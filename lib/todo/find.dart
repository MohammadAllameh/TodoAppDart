import 'package:todoapp/command_manger.dart';
import 'package:todoapp/todo_manger.dart';

class FindTodo {
  TodoManger todoManger;
  CommandManger commandManger;
  FindTodo({required this.commandManger, required this.todoManger});
  void findTodo(){
  // commandManger.lenghtAr(arguments: arguments, item: 2, title: "please enter an id");
    if (!commandManger.checkCommandExists(1,
        message: () => "please enter an title new")) {
      return;
    }
    print(todoManger.findTodo(id: int.parse(commandManger.getCommand(1))));
    return;
}
}


