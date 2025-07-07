class UserModel {
  final String name;
  final String hostel;
  final String room;
  final String roll;

  UserModel({
    required this.name,
    required this.hostel,
    required this.room,
    required this.roll,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hostel': hostel,
      'room': room,
      'roll': roll,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      hostel: map['hostel'] ?? '',
      room: map['room'] ?? '',
      roll: map['roll'] ?? '',
    );
  }
}
