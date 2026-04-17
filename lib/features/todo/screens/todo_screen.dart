import 'package:ecommerce_desi/core/app/common_widgets/custom_appbar.dart';
import 'package:ecommerce_desi/features/todo/todo_bloc/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo_bloc/todo_bloc.dart';
import '../todo_bloc/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'TODO SCREEN',
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if(state.todosList.isEmpty){
            return Center(child: Text('No TODO found'),);
          } else if
            (state.todosList.isNotEmpty){
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(onPressed: () {
                    print('Data Delete');
                    context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todosList[index]));
                  },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          }else{
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('tap button');
        for(int i = 0; i<10; i++){
          context.read<TodoBloc>().add(AddTodoEvent(task: 'task'+ i.toString()));
        }

      },
        child: Icon(Icons.add),),
    );
  }
}
