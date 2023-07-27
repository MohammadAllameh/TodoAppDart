class CommandManger {
  Map<int,String> command;
  CommandManger({required this.command});
  String getCommand(int key) {
    return command[key] ?? "";
  }
  void printHelper() {
    print( """
Todo App command : 
  --add    , -a  [title] : string                 "Add a text to todo list"
  --delete , -d  [id] : int                       "Delete a todo"
  --update , -u  [id] : int , [title] : string    "Update a todo"
  --find   , -f  [id] : int                       "Find a todo and the return text"
  --list   , -l                                   "Show todo list"
  --help   , -h                                   "Show command list"
""");
  }
  void lenghtAr({required List<String> arguments,required int item, required String title}){
    if (arguments.length < item) {
      print(title);
      printHelper();
      return;
    }
  }
  bool checkCommandExists(int key, { required String Function() message }) {
    if(command[key] != null)  {
      return true;
    }

    print(message());
    printHelper();
    return false;
  }
}
