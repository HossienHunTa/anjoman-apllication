import 'package:equatable/equatable.dart';

class User extends Equatable {
  late String id;
  late String studentID;
  late String fullName;
  late String email;
  late String password;
  late int major;
  late String city;
  late String phoneNumber;
  late int role;
  late String avatarUrl;

  User({
    this.id = '',
    this.studentID = '',
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.major = 0,
    this.city = '',
    this.phoneNumber = '',
    this.role = 0,
    this.avatarUrl =
        'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg',
  });
  @override
  List<Object?> get props => [
        id,
        studentID,
        fullName,
        email,
        password,
        major,
        city,
        phoneNumber,
        role,
        avatarUrl
      ];
}
