class BookingModel {
  final String id;
  final String residentId;
  final String facilityName;
  final String date;
  final String timeSlot;
  final String status; // confirmed, pending, cancelled

  BookingModel({
    required this.id,
    required this.residentId,
    required this.facilityName,
    required this.date,
    required this.timeSlot,
    required this.status,
  });

  factory BookingModel.fromMap(Map<String, dynamic> data, String documentId) {
    return BookingModel(
      id: documentId,
      residentId: data['residentId'] ?? '',
      facilityName: data['facilityName'] ?? '',
      date: data['date'] ?? '',
      timeSlot: data['timeSlot'] ?? '',
      status: data['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'residentId': residentId,
      'facilityName': facilityName,
      'date': date,
      'timeSlot': timeSlot,
      'status': status,
    };
  }
}
