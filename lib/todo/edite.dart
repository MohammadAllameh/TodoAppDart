import 'package:todoapp/command_manger.dart';
import 'package:todoapp/todo_manger.dart';

class EditeTodo {
  TodoManger todoManger;
  CommandManger commandManger;
  EditeTodo({required this.commandManger, required this.todoManger});
  void editeTodo(){
        // commandManger.lenghtAr(arguments: arguments, item: 2, title: "please enter an id");

        if (!commandManger.checkCommandExists(1,
            message: () => "please enter an id")) {
          return;
        }
        // commandManger.lenghtAr(arguments: arguments, item: 3, title: "please enter an title new");
        if (!commandManger.checkCommandExists(2,
            message: () => "please enter an title new")) {
          return;
        }
        todoManger.editeTodo(
            id: int.parse(commandManger.getCommand(1)),
            newTitle: commandManger.getCommand(2));
        print('the todo update successfully');
        return;
}}


