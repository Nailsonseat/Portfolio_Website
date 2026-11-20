import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio_website/blocs/project_filter/project_filter_bloc.dart';
import 'package:portfolio_website/pages/project_browser/project_browser_page.dart';

extension on ProjectCategory {
  String get label => switch (this) {
        ProjectCategory.all => "All projects",
        ProjectCategory.development => "Software development",
        ProjectCategory.machineLearning => "Machine Learning",
      };

  Color get color => switch (this) {
        ProjectCategory.all => Colors.tealAccent,
        ProjectCategory.development => Colors.orange,
        ProjectCategory.machineLearning => Colors.lightBlueAccent,
      };
}

class ProjectPageMain extends StatelessWidget {
  const ProjectPageMain({super.key, required this.sectionKey});

  /// Attached to the "Projects" heading so the home page can scroll to it.
  final GlobalKey sectionKey;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width < 1200 ? 1200 : width;

    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    if (isLengthGreaterThanWidth) {
      width = 455;
    }

    return Container(
      width: width,
      padding: EdgeInsets.only(top: isLengthGreaterThanWidth ? 0 : 50, bottom: 50),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: sectionKey,
              padding: EdgeInsets.only(left: isLengthGreaterThanWidth ? 50 : 150),
              child: const Text(
                "Projects",
                style: TextStyle(fontSize: 60),
              ),
            ),
            SizedBox(
              height: isLengthGreaterThanWidth ? 10 : 50,
            ),
            if (!isLengthGreaterThanWidth)
              Padding(
                padding: EdgeInsets.only(left: isLengthGreaterThanWidth ? 50 : width / 13.16),
                child: BlocBuilder<ProjectFilterBloc, ProjectFilterState>(
                  builder: (context, state) {
                    return AnimatedToggleSwitch<ProjectCategory>.size(
                      height: isLengthGreaterThanWidth ? 50 : 80,
                      current: state.category,
                      values: ProjectCategory.values,
                      loading: state.isTransitioning,
                      iconOpacity: 0.75,
                      loadingIconBuilder: (_, _) => SizedBox(
                        width: width / 65.8,
                        height: width / 65.8,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: width / 493.5,
                        ),
                      ),
                      indicatorSize: Size.fromWidth(isLengthGreaterThanWidth ? 120 : 300),
                      style: ToggleStyle(
                        borderColor: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      styleBuilder: (category) => ToggleStyle(indicatorColor: category.color),
                      iconAnimationType: AnimationType.onHover,
                      indicatorAnimationType: AnimationType.onHover,
                      iconBuilder: (category) => Center(
                        child: Text(
                          category.label,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: isLengthGreaterThanWidth ? 12 : 20),
                        ),
                      ),
                      borderWidth: 0.1,
                      onChanged: (category) =>
                          context.read<ProjectFilterBloc>().add(ProjectCategorySelected(category)),
                    );
                  },
                ),
              ),
            const SizedBox(height: 50),
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(horizontal: isLengthGreaterThanWidth ? 30 : 90),
                padding: EdgeInsets.only(
                  top: isLengthGreaterThanWidth ? 30 : 100,
                  bottom: isLengthGreaterThanWidth ? 0 : 100,
                ),
                child: const ProjectPageBrowser(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
