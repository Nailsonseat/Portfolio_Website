import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_website/blocs/project_filter/project_filter_bloc.dart';

void main() {
  const transition = Duration(milliseconds: 20);

  test('starts on all projects, not transitioning', () {
    expect(ProjectFilterBloc().state, const ProjectFilterState());
  });

  blocTest<ProjectFilterBloc, ProjectFilterState>(
    'fades out, then switches category',
    build: () => ProjectFilterBloc(transitionDuration: transition),
    act: (bloc) => bloc.add(const ProjectCategorySelected(ProjectCategory.development)),
    wait: transition * 2,
    expect: () => const [
      ProjectFilterState(category: ProjectCategory.all, isTransitioning: true),
      ProjectFilterState(category: ProjectCategory.development),
    ],
  );

  blocTest<ProjectFilterBloc, ProjectFilterState>(
    'ignores selecting the current category',
    build: () => ProjectFilterBloc(transitionDuration: transition),
    act: (bloc) => bloc.add(const ProjectCategorySelected(ProjectCategory.all)),
    wait: transition * 2,
    expect: () => const <ProjectFilterState>[],
  );

  blocTest<ProjectFilterBloc, ProjectFilterState>(
    'a selection made mid-transition replaces the pending one',
    build: () => ProjectFilterBloc(transitionDuration: transition),
    act: (bloc) async {
      bloc.add(const ProjectCategorySelected(ProjectCategory.development));
      await Future<void>.delayed(transition ~/ 2);
      bloc.add(const ProjectCategorySelected(ProjectCategory.machineLearning));
    },
    wait: transition * 3,
    expect: () => const [
      ProjectFilterState(category: ProjectCategory.all, isTransitioning: true),
      ProjectFilterState(category: ProjectCategory.machineLearning),
    ],
  );
}
