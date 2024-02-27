import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/views/add_task/add_task_controller.dart';
import 'package:lista_de_tarefas/views/add_task/add_task_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddTaskController>(context);

    return Scaffold(
      backgroundColor: Color(0xffC3C5CA),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Text("Lista de Tarefas (${controller.list.length})"),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.list[index];
                    return Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: item.valor == true
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 40),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                item.titulo,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
