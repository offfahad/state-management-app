import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';

final todoProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(String content) {
    state = [
      ...state,
      Todo(
          todoId: state.isEmpty ? 0 : state.length - 1,
          content: content,
          complete: false)
    ];
  }

  void completeTodo(int id) {
    state = [
      for (final todo in state)
        if (todo.todoId == id)
          Todo(todoId: todo.todoId, content: todo.content, complete: true)
        else
          todo,
    ];
  }

  void deleteTodo(int id){
    state = state.where((todo) => todo.todoId != id).toList();
  }
}
