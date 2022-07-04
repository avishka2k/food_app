// ignore_for_file: file_names

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? pictureUrl;
  String? location;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.pictureUrl,
      this.location});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      pictureUrl: map['pictureUrl'],
      location: map['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'pictureUrl': pictureUrl,
      'location': location,
    };
  }
}
