import 'package:cloud_firestore/cloud_firestore.dart';

/// Reads and updates the home page visitor counter stored in Firestore.
class VisitorRepository {
  VisitorRepository({FirebaseFirestore? firestore}) : _firestore = firestore;

  final FirebaseFirestore? _firestore;

  DocumentReference<Map<String, dynamic>> get _counterDoc =>
      (_firestore ?? FirebaseFirestore.instance).collection('visitor_counts').doc('home_page_visitors');

  /// Atomically increments the counter, creating the document if it is missing.
  Future<void> incrementVisitorCount() => _counterDoc.set({'count': FieldValue.increment(1)}, SetOptions(merge: true));

  /// Emits the current visitor count whenever it changes.
  Stream<int> watchVisitorCount() =>
      _counterDoc.snapshots().map((snapshot) => (snapshot.data()?['count'] as num?)?.toInt() ?? 0);
}
