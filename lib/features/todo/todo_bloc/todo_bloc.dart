import 'package:ecommerce_desi/features/todo/todo_bloc/todo_event.dart';
import 'package:ecommerce_desi/features/todo/todo_bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{

  final List<String> todosList =[];

  TodoBloc() : super(TodoState()){
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit){
    todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoState> emit){
    todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}