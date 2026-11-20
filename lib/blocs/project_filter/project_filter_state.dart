part of 'project_filter_bloc.dart';

enum ProjectCategory { all, development, machineLearning }

final class ProjectFilterState extends Equatable {
  const ProjectFilterState({this.category = ProjectCategory.all, this.isTransitioning = false});

  final ProjectCategory category;

  /// True while the browser is fading out before showing a new category.
  final bool isTransitioning;

  @override
  List<Object?> get props => [category, isTransitioning];
}
