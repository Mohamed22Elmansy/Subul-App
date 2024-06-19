class ProfileData {
  late User user;
  late String message;

  ProfileData.fromjson(Map<String, dynamic> jsonData) {
    user.emailVerification.isVerified =
        jsonData['user']['emailVerification']['isVerified'];
    user.emailVerification.verificationDate =
        jsonData['user']['emailVerification']['verificationDate'];
    user.phoneVerification.isVerified =
        jsonData['user']['phoneVerification']['isVerified'];
    user.phoneVerification.isVerified =
        jsonData['user']['phoneVerification']['verificationDate'];
    user.id = jsonData['user']['_id'];
    user.name.firstName = jsonData['user']['name']['firstName'];
    user.name.lastName = jsonData['user']['name']['lastName'];
    user.name.id = jsonData['user']['name']['_id'];
    user.contributions = jsonData['user']['contributions'];
    user.email = jsonData['user']['email'];
    user.isAdmin = jsonData['user']['isAdmin'];
    user.pointsOnDonations = jsonData['user']['pointsOnDonations'];
    user.totalDonationsAmount = jsonData['user']['totalDonationsAmount'];
    user.userLocation.governorate =
        jsonData['user']['userLocation']['governorate'];
    user.gender = jsonData['user']['gender'];
    user.phone = jsonData['user']['phone'];
    user.verificationCode = jsonData['user']['verificationCode'];
    user.isEnabled = jsonData['user']['isEnabled'];
    user.transactions = jsonData['user']['transactions'];
    user.createdAt = jsonData['user']['createdAt'];
    user.updatedAt = jsonData['user']['updatedAt'];
    user.v = jsonData['user']['__v'];
    message = jsonData['message'];
  }
}

class User {
  Verification emailVerification;
  Verification phoneVerification;
  String id;
  Name name;
  List<dynamic> contributions;
  String email;
  bool isAdmin;
  int pointsOnDonations;
  int totalDonationsAmount;
  UserLocation userLocation;
  String gender;
  String phone;
  String verificationCode;
  bool isEnabled;
  List<dynamic> transactions;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  User({
    required this.emailVerification,
    required this.phoneVerification,
    required this.id,
    required this.name,
    required this.contributions,
    required this.email,
    required this.isAdmin,
    required this.pointsOnDonations,
    required this.totalDonationsAmount,
    required this.userLocation,
    required this.gender,
    required this.phone,
    required this.verificationCode,
    required this.isEnabled,
    required this.transactions,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}

class Verification {
  bool isVerified;
  String verificationDate;

  Verification({
    required this.isVerified,
    required this.verificationDate,
  });
}

class Name {
  String firstName;
  String lastName;
  String id;

  Name({
    required this.firstName,
    required this.lastName,
    required this.id,
  });
}

class UserLocation {
  String governorate;

  UserLocation({
    required this.governorate,
  });
}
