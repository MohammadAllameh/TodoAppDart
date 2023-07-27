// import 'package:todoapp/todoapp.dart' as todoapp;

import 'dart:io';

import 'dart:core';

void main(List<String> arguments) {
  File fileManger = File('./bin/todos.txt');
  if (!fileManger.existsSync()) {
    fileManger.createSync();
  }
  // fileManger.writeAsStringSync("I am mohammad Allameh");

  // fileManger.
  String command = arguments.isNotEmpty ? arguments[0] : "";
  String getHelp() {
    return """
Todo App command : 
  --add    , -a  [title] : string                 "Add a text to todo list"
  --delete , -d  [id] : int                       "Delete a todo"
  --update , -u  [id] : int , [title] : string   "Update a todo"
  --find   , -f  [id] : int                       "Find a todo and the return text"
  --list   , -l                                   "Show todo list"
  --help   , -h                                   "Show command list"
""";
  }

  switch (command) {
    case '-h' || '--help' || '':
      print(getHelp());
      break;
    case '-a' || '--add':
      if (arguments.length < 2) {
        print("please enter an title");
        print(getHelp());
        return;
      }
      fileManger.writeAsStringSync('${arguments[1]}\n', mode: FileMode.append);
      print(arguments[1]);
      print('the todo add successfully');
      break;
    case '-l' || '--list':
      var todos = fileManger.readAsLinesSync().asMap();
      // todos.map((key, value) =>  print("${key}.  ${value}"));
      todos.forEach((key, value) => print("${key}.${value}"));

      break;
    case '-d' || '--delete':
      if (arguments.length < 2) {
        print("please enter an id");
        print(getHelp());
        return;
      }
      var todos = {...fileManger.readAsLinesSync().asMap()};
      int id = int.parse(arguments[1]);
      todos.remove(id);
      fileManger.writeAsStringSync('');
      todos.forEach((key, value) {
          fileManger.writeAsStringSync(value + "\n" , mode: FileMode.append);
      });
      print('the todo deleted successfully');
      break;
    case '-u' || '--update':
      if (arguments.length < 2) {
        print("please enter an id");
        print(getHelp());
        return;
      }
      if (arguments.length < 3) {
        print("please enter an title new");
        print(getHelp());
        return;
      }
      var todos = {...fileManger.readAsLinesSync().asMap()};
      int id = int.parse(arguments[1]);
      var newTitle = arguments[2];
      todos = todos.map((key, value) {
        if(key == id){
          return MapEntry(key, newTitle);
        }
        return MapEntry(key, value);
      });
      fileManger.writeAsStringSync('');
      todos.forEach((key, value) {
          fileManger.writeAsStringSync(value + "\n" , mode: FileMode.append);
      });
      
      print('the todo update successfully');
      break;
    case '-f' || '--find':
      if (arguments.length < 2) {
        print("please enter an id");
        print(getHelp());
        return;
      }

      var todos = {...fileManger.readAsLinesSync().asMap()};
      int id = int.parse(arguments[1]);
      print(todos[id]);

      break;
    default:
      print(getHelp());
  }
}
