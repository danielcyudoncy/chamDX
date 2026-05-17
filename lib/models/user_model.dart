class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role; // resident, admin, security
  final String estateId;
  final String unitNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.estateId,
    required this.unitNumber,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      role: data['role'] ?? 'resident',
      estateId: data['estateId'] ?? '',
      unitNumber: data['unitNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'estateId': estateId,
      'unitNumber': unitNumber,
    };
  }
}
