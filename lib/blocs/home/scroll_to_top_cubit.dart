import 'package:flutter_bloc/flutter_bloc.dart';

/// Whether the home page's "scroll to top" button should be visible.
///
/// Only emits when visibility actually flips, so scrolling doesn't rebuild
/// the button on every pixel.
class ScrollToTopCubit extends Cubit<bool> {
  ScrollToTopCubit({this.threshold = 100}) : super(false);

  final double threshold;

  void onScrolled(double offset) {
    final visible = offset >= threshold;
    if (visible != state) emit(visible);
  }
}
