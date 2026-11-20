import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Measured heights of a project page's HTML sections, used to size each
/// section's container once its content has rendered.
class SectionLayoutCubit extends Cubit<SectionLayoutState> {
  SectionLayoutCubit({required int sectionCount})
      : super(SectionLayoutState(heights: List.unmodifiable(List.filled(sectionCount, initialHeight))));

  static const double initialHeight = 0.1;

  /// Applies newly measured heights. A `null` entry (section not rendered
  /// yet) keeps that section's previous height.
  void updateHeights(List<double?> measured) {
    final heights = [
      for (var i = 0; i < state.heights.length; i++) (i < measured.length ? measured[i] : null) ?? state.heights[i],
    ];
    final next = SectionLayoutState(heights: List.unmodifiable(heights));
    if (next != state) emit(next);
  }
}

final class SectionLayoutState extends Equatable {
  const SectionLayoutState({required this.heights});

  final List<double> heights;

  @override
  List<Object?> get props => [heights];
}
