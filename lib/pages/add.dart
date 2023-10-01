import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/todo_provider.dart';

class AddTodo extends ConsumerWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              cursorColor: Colors.black,
              controller: todoController,
              decoration: InputDecoration(
                hintText: 'Write your todo',
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(todoProvider.notifier).addTodo(todoController.text);
              Navigator.pop(context);
            },
            child: const Text(
              "Add Todo",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
