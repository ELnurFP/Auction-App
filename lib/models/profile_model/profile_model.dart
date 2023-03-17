class ProfileModel {
  final String id;
  final String? role;
  final String? userName;
  final String phoneNumber;
  final String fullName;
  final String? email;
  final String? userPhotoBase64;

  ProfileModel({
    required this.id,
    required this.role,
    required this.userName,
    required this.phoneNumber,
    required this.fullName,
    required this.email,
    required this.userPhotoBase64,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      role: json['role'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      fullName: json['fullName'],
      email: json['email'],
      userPhotoBase64: json['userPhotoBase64'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'role': role,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'fullName': fullName,
        'email': email,
        'userPhotoBase64': userPhotoBase64,
      };
}
