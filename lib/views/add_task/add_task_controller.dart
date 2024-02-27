import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/task_model.dart';

class AddTaskController extends ChangeNotifier {
  final tituloEC = TextEditingController();
  List<TaskModel> list = [];

  void addList() {
    final model = TaskModel(tituloEC.text, false);
    list.add(model);
    tituloEC.clear();
    notifyListeners();
  }
}
