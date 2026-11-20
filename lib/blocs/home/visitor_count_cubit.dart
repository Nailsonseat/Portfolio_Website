import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../data/visitor_repository.dart';

/// Loads the visitor count shown in the home page's app bar.
class VisitorCountCubit extends Cubit<VisitorCountState> {
  VisitorCountCubit({required VisitorRepository visitorRepository})
      : _visitorRepository = visitorRepository,
        super(const VisitorCountState());

  final VisitorRepository _visitorRepository;

  Future<void> load() async {
    try {
      emit(VisitorCountState(count: await _visitorRepository.fetchVisitorCount()));
    } catch (error) {
      Logger().w('Error loading visitor count: $error');
      emit(const VisitorCountState(failed: true));
    }
  }
}

final class VisitorCountState extends Equatable {
  const VisitorCountState({this.count, this.failed = false});

  /// Null while loading or after a failure.
  final int? count;
  final bool failed;

  @override
  List<Object?> get props => [count, failed];
}
