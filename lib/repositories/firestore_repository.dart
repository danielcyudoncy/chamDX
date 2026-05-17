import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/visitor_pass_model.dart';
import '../models/booking_model.dart';

class FirestoreRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Users
  Future<void> createUser(UserModel user) async {
    await _db.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  // Visitor Passes
  Future<void> createVisitorPass(VisitorPassModel pass) async {
    await _db.collection('visitor_passes').doc(pass.id).set(pass.toMap());
  }

  Stream<List<VisitorPassModel>> streamVisitorPasses(String residentId) {
    return _db
        .collection('visitor_passes')
        .where('residentId', isEqualTo: residentId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => VisitorPassModel.fromMap(doc.data(), doc.id)).toList());
  }

  // Bookings
  Future<void> createBooking(BookingModel booking) async {
    await _db.collection('bookings').doc(booking.id).set(booking.toMap());
  }

  Stream<List<BookingModel>> streamBookings(String residentId) {
    return _db
        .collection('bookings')
        .where('residentId', isEqualTo: residentId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data(), doc.id)).toList());
  }
}
