import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'project_filter_event.dart';
part 'project_filter_state.dart';

/// Controls which project category the project browser shows, including the
/// fade-out transition while switching.
///
/// A Bloc with the [restartable] transformer: if the user picks another
/// category mid-transition, the pending switch is cancelled and only the
/// latest choice is applied.
class ProjectFilterBloc extends Bloc<ProjectFilterEvent, ProjectFilterState> {
  ProjectFilterBloc({this.transitionDuration = const Duration(milliseconds: 1400)})
      : super(const ProjectFilterState()) {
    on<ProjectCategorySelected>(_onCategorySelected, transformer: restartable());
  }

  final Duration transitionDuration;

  Future<void> _onCategorySelected(ProjectCategorySelected event, Emitter<ProjectFilterState> emit) async {
    if (event.category == state.category && !state.isTransitioning) return;

    emit(ProjectFilterState(category: state.category, isTransitioning: true));
    await Future<void>.delayed(transitionDuration);
    emit(ProjectFilterState(category: event.category));
  }
}
