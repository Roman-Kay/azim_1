import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;
  TodoItem({required this.title});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDone = !isDone;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: isDone ? Colors.grey.shade600 : Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                decoration: isDone ? TextDecoration.lineThrough : null,
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing: isDone
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
