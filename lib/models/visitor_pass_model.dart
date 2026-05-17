class VisitorPassModel {
  final String id;
  final String residentId;
  final String visitorName;
  final String vehiclePlate;
  final String visitDate;
  final String arrivalTime;
  final String purpose;
  final String accessCode;
  final String status; // active, used, expired

  VisitorPassModel({
    required this.id,
    required this.residentId,
    required this.visitorName,
    required this.vehiclePlate,
    required this.visitDate,
    required this.arrivalTime,
    required this.purpose,
    required this.accessCode,
    required this.status,
  });

  factory VisitorPassModel.fromMap(Map<String, dynamic> data, String documentId) {
    return VisitorPassModel(
      id: documentId,
      residentId: data['residentId'] ?? '',
      visitorName: data['visitorName'] ?? '',
      vehiclePlate: data['vehiclePlate'] ?? '',
      visitDate: data['visitDate'] ?? '',
      arrivalTime: data['arrivalTime'] ?? '',
      purpose: data['purpose'] ?? '',
      accessCode: data['accessCode'] ?? '',
      status: data['status'] ?? 'active',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'residentId': residentId,
      'visitorName': visitorName,
      'vehiclePlate': vehiclePlate,
      'visitDate': visitDate,
      'arrivalTime': arrivalTime,
      'purpose': purpose,
      'accessCode': accessCode,
      'status': status,
    };
  }
}
