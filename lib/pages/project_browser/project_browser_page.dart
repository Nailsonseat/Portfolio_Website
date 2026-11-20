import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio_website/blocs/project_filter/project_filter_bloc.dart';
import 'browser_pages/all_projects_page.dart';
import 'browser_pages/developments_projects_page.dart';
import 'browser_pages/ml_projects_page.dart';

class ProjectPageBrowser extends StatelessWidget {
  const ProjectPageBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectFilterBloc, ProjectFilterState>(
      builder: (_, state) {
        return Opacity(
          opacity: state.isTransitioning ? 0.5 : 1,
          child: switch (state.category) {
            ProjectCategory.all => const AllProjectsPage(),
            ProjectCategory.development => const DevelopmentProjectsPage(),
            ProjectCategory.machineLearning => const MLProjectsPage(),
          },
        );
      },
    );
  }
}
