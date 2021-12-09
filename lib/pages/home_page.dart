import 'package:flutter/material.dart';
import 'package:todo_apps/models/todo_model.dart';
import 'package:todo_apps/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todos = [];
  TextEditingController todoController = TextEditingController(text: "");

  void deleteAllItems() {
    setState(() {
      todos.removeWhere((todos) => todos != null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.delete_outline_rounded,
            color: Colors.white,
          ),
          onPressed: deleteAllItems,
        ),
        centerTitle: true,
        title: Text(
          'Задачи на сегодня',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 115, right: 20, left: 20),
              child: ListView(
                children: todos
                    .map((item) => TodoItem(
                          title: item.title,
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 113,
              child: ColoredBox(
                color: Theme.of(context).canvasColor,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: todoController,
                                  onChanged: (value) {
                                    // Call setState to update the UI
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Добавить задачу...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: todoController.text.length == 0
                                        ? IconButton(
                                            icon: Icon(Icons.add),
                                            color: Colors.grey[500],
                                            onPressed: () {},
                                          )
                                        : IconButton(
                                            icon: Icon(Icons.add),
                                            color: Colors.red,
                                            onPressed: () {
                                              print(todoController.text);
                                              setState(() {
                                                todos.add(TodoModel(
                                                    title: todoController.text,
                                                    isDone: false));
                                                todoController.text = "";
                                              });
                                            },
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Divider(
                        color: Colors.red,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
