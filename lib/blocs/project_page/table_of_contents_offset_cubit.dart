import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

/// Vertical offset that keeps the project page's table of contents pinned
/// in view once the user scrolls past the banner.
class TableOfContentsOffsetCubit extends Cubit<double> {
  TableOfContentsOffsetCubit() : super(0);

  static const double _topGap = 50;

  void onScrolled({required double offset, required double bannerHeight}) {
    final double next = offset > bannerHeight ? max(0, offset - bannerHeight - _topGap) : 0;
    if (next != state) emit(next);
  }
}
