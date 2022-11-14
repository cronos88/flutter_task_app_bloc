import 'package:equatable/equatable.dart';

import '../../models/task.dart';
import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      completedTasks: state.completedTasks, // AÑADIR LINEA
      favoriteTasks: state.favoriteTasks, // AÑADIR LINEA
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    // final int index = state.pendingTasks.indexOf(task); BORRAR LINEA

    List<Task> pendingTasks = state.pendingTasks; //CAMBIAMOS ESTA LINEA
    List<Task> completedTasks = state.completedTasks; //AÑADIMOS ESTA LINEA
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          } //CAMBIAMOS ESTA LINEA
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          }; // CAMBIAMOS ESTA LINEA

    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks, //AÑADIR LINEA
      favoriteTasks: state.favoriteTasks, //AÑADIR LINEA
      removedTasks: state.removedTasks,
    ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      completedTasks: List.from(state.completedTasks)
        ..remove(event.task), // AÑADIR LINEA
      favoriteTasks: List.from(state.favoriteTasks)
        ..remove(event.task), // AÑADIR LINEA
      removedTasks: List.from(state.removedTasks)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks, // AÑADIR LINEA
      favoriteTasks: state.favoriteTasks, // AÑADIR LINEA
      removedTasks: List.from(state.removedTasks)..remove(event.task),
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
