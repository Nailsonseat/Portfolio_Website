import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../data/visitor_repository.dart';

/// Progress of the launch screen's circular indicator (0.0 – 1.0), plus
/// recording the visit once the intro animation completes.
class LaunchCubit extends Cubit<double> {
  LaunchCubit({required VisitorRepository visitorRepository, this.stepInterval = const Duration(milliseconds: 3000)})
      : _visitorRepository = visitorRepository,
        super(initialProgress);

  static const double initialProgress = 0.33;
  static const double midProgress = 0.666;
  static const double completeProgress = 1.0;

  final VisitorRepository _visitorRepository;
  final Duration stepInterval;
  Timer? _timer;

  void startProgress() {
    _timer?.cancel();
    _timer = Timer.periodic(stepInterval, (timer) {
      if (state < midProgress) {
        emit(midProgress);
      } else {
        emit(completeProgress);
        timer.cancel();
      }
    });
  }

  Future<void> recordVisit() async {
    try {
      await _visitorRepository.recordVisitIfNew();
    } catch (error) {
      Logger().w('Error incrementing visitor count: $error');
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
