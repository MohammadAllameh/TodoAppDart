import 'package:todoapp/command_manger.dart';
import 'package:todoapp/todo_manger.dart';

class DeleteTodo {
  TodoManger todoManger;
  CommandManger commandManger;
  DeleteTodo({required this.commandManger, required this.todoManger});
  void deleteTodo(){
  // commandManger.lenghtAr(arguments: arguments, item: 2, title: "please enter an id");
            // commandManger.lenghtAr(arguments: arguments, item: 2, title: "please enter an id");
        if (!commandManger.checkCommandExists(1,message: () => "please enter an id")) {
          return;
        }
        todoManger.deleteTodo(id: int.parse(commandManger.getCommand(1)));
        print('the todo deleted successfully');
    return;
}
}


