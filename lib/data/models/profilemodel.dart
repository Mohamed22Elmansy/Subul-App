class ProfileData {
  User? user;
  String? message;

  ProfileData.fromjson(Map<String, dynamic> jsonData) {
    user = User(
      emailVerification: Verification(
          isVerified: jsonData['user']['emailVerification']['isVerified'],
          verificationDate: jsonData['user']['emailVerification']
              ['verificationDate']),
      phoneVerification: Verification(
          isVerified: jsonData['user']['phoneVerification']['isVerified'],
          verificationDate: jsonData['user']['phoneVerification']
              ['verificationDate']),
      id: jsonData['user']['_id'],
      name: Name(
          firstName: jsonData['user']['name']['firstName'],
          lastName: jsonData['user']['name']['lastName'],
          id: jsonData['user']['name']['_id']),
      contributions: jsonData['user']['contributions'],
      email: jsonData['user']['email'],
      isAdmin: jsonData['user']['isAdmin'],
      pointsOnDonations: jsonData['user']['pointsOnDonations'],
      totalDonationsAmount: jsonData['user']['totalDonationsAmount'],
      // userLocation: UserLocation(governorate: jsonData['user']['userLocation']['governorate']),
      gender: jsonData['user']['gender'],
      phone: jsonData['user']['phone'],
      verificationCode: jsonData['user']['verificationCode'],
      isEnabled: jsonData['user']['isEnabled'],
      transactions: jsonData['user']['transactions'],
      createdAt: jsonData['user']['createdAt'],
      updatedAt: jsonData['user']['updatedAt'],
      v: jsonData['user']['__v'],
    );
    /* user!.emailVerification.isVerified =
      jsonData['user']['emailVerification']['isVerified'];
    user!.emailVerification.verificationDate =
        jsonData['user']['emailVerification']['verificationDate'];
    user!.phoneVerification.isVerified =
        jsonData['user']['phoneVerification']['isVerified'];
    user!.phoneVerification.isVerified =
        jsonData['user']['phoneVerification']['verificationDate'];
    user!.id = jsonData['user']['_id'];
    user!.name.firstName = jsonData['user']['name']['firstName'];
    user!.name.lastName = jsonData['user']['name']['lastName'];
    user!.name.id = jsonData['user']['name']['_id'];
    user!.contributions = jsonData['user']['contributions'];
    user!.email = jsonData['user']['email'];
    user!.isAdmin = jsonData['user']['isAdmin'];
    user!.pointsOnDonations = jsonData['user']['pointsOnDonations'];
    user!.totalDonationsAmount = jsonData['user']['totalDonationsAmount'];
    user!.userLocation.governorate =
        jsonData['user']['userLocation']['governorate'];
    user!.gender = jsonData['user']['gender'];
    user!.phone = jsonData['user']['phone'];
    user!.verificationCode = jsonData['user']['verificationCode'];
    user!.isEnabled = jsonData['user']['isEnabled'];
    user!.transactions = jsonData['user']['transactions'];
    user!.createdAt = jsonData['user']['createdAt'];
    user!.updatedAt = jsonData['user']['updatedAt'];
    user!.v = jsonData['user']['__v'];*/
    message = jsonData['msg'];
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
  //UserLocation userLocation;
  String gender;
  String phone;
  String verificationCode;
  bool isEnabled;
  List<dynamic> transactions;
  String createdAt;
  String updatedAt;
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
    // required this.userLocation,
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
  dynamic verificationDate;

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
/*
class UserLocation {
  String governorate;

  UserLocation({
    required this.governorate,
  });
}*/
