import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LaunchPageProvider extends ChangeNotifier {
  double percent = 0.33;


  Future<void> incrementVisitorCount() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentReference docRef = firestore.collection('visitor_counts').doc('home_page_visitors');

    try {
      DocumentSnapshot docSnapshot = await docRef.get();

      // If the document doesn't exist, create it with an initial count of 0
      if (!docSnapshot.exists) {
        await docRef.set({'count': 0});
      }

      // Increment the count
      await docRef.update({'count': FieldValue.increment(1)});
    } catch (e) {
      Logger().w('Error incrementing visitor count: $e');
    }
  }

  void startAnimation() {
    Timer.periodic(
      const Duration(milliseconds: 3000),
      (Timer timer) {
        if (percent < 0.666) {
          percent = 0.666;
        } else {
          percent = 1.0;
          timer.cancel();
        }
        notifyListeners();
      }
    );
  }
}