part of 'project_filter_bloc.dart';

sealed class ProjectFilterEvent extends Equatable {
  const ProjectFilterEvent();

  @override
  List<Object?> get props => [];
}

final class ProjectCategorySelected extends ProjectFilterEvent {
  const ProjectCategorySelected(this.category);

  final ProjectCategory category;

  @override
  List<Object?> get props => [category];
}
