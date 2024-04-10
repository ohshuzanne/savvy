import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Transaction {
  String title;
  String category;
  double amount;
  int day;
  int month;
  int year;


  Transaction({
    required this.title,
    required this.category,
    required this.amount,
    required this.day,
    required this.month,
    required this.year
  });

  static Transaction transactionFromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Transaction(
      title:snapshot['title'],
      category:snapshot['category'] ,
      amount:snapshot['amount'] ,
      day:snapshot['day'] ,
      month:snapshot['month'] ,
      year:snapshot['year']
    );
  }

}

class BookingController {
  final CollectionReference transactionsCollection =
  FirebaseFirestore.instance.collection('user');

  Future<void> createBooking(Booking booking) async {
    var uuid = const Uuid();
    String newUuid = uuid.v4();
    await bookingsCollection.doc(newUuid).set({
      "confirmationNumber": newUuid,
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "checkIn": booking.checkIn,
      "checkOut": booking.checkOut,
      "listingId": booking.listingId,
      "night": booking.night,
      "totalAmount": booking.totalAmount,
      "timestamp": Timestamp.now(),
      "listingType": "accommodation",
    });

    List<DateTime> days = [];
    for (int i = 0;
    i <
        DateTime.parse(booking.checkOut)
            .difference(DateTime.parse(booking.checkIn))
            .inDays;
    i++) {
      days.add(DateTime.parse(booking.checkIn).add(Duration(days: i)));
    }

    await FirebaseFirestore.instance
        .collection('accommodation')
        .doc(booking.listingId)
        .update({"unavailableDate": FieldValue.arrayUnion(days)});
  }

  Future<void> createTicket(Booking booking) async {
    var uuid = const Uuid();
    String newUuid = uuid.v4();
    await bookingsCollection.doc(newUuid).set({
      "confirmationNumber": newUuid,
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "listingId": booking.listingId,
      "totalAmount": booking.totalAmount,
      "timestamp": Timestamp.now(),
      "listingType": "activity",
      "ticketType": booking.ticketType,
    });
  }

  Stream<QuerySnapshot> getBookings() {
    return bookingsCollection.snapshots();
  }
}

