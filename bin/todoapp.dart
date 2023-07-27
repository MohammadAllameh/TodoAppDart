// import 'package:todoapp/todoapp.dart' as todoapp;

import 'dart:io';
// ignore: unused_import
import 'package:todoapp/todo_manger.dart';
import 'package:todoapp/command_manger.dart';
import 'package:todoapp/command_handler.dart';

void main(List<String> arguments) {
  TodoManger todoManger = TodoManger(storge: File('./todos.txt'));
  CommandManger commondManger = CommandManger(command: arguments.asMap());
  CommandHandler commandHandler = CommandHandler(commandManger: commondManger, todoManger: todoManger);
  commandHandler.handler();
}