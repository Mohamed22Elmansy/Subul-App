class CharityProfileData {
  Charity? charity;
  String? message;
  String? token;
  bool? emailAlert;

  CharityProfileData.fromJson(Map<String, dynamic> jsonData) {
    charity = Charity(
        emailVerification: Verification(
            isVerified: jsonData['charity']['emailVerification']['isVerified'],
            verificationDate: jsonData['charity']['emailVerification']
                ['verificationDate']),
        phoneVerification: Verification(
            isVerified: jsonData['charity']['phoneVerification']['isVerified'],
            verificationDate: jsonData['charity']['phoneVerification']
                ['verificationDate']),
        charityInfo: CharityInfo(
            registeredNumber: jsonData['charity']['charityInfo']
                ["registeredNumber"],
            establishedDate: jsonData['charity']['charityInfo']
                ["establishedDate"]),
        charityDocs: CharityDocs(
            docs1: jsonData['charity']['charityDocs']["docs1"],
            docs2: jsonData['charity']['charityDocs']["docs2"],
            docs3: jsonData['charity']['charityDocs']["docs3"],
            docs4: jsonData['charity']['charityDocs']["docs4"]),
        id: jsonData['charity']['_id'],
        cases: jsonData['charity']['cases'],
        numberOfCases: jsonData['charity']['numberOfCases'],
        totalNumberOfDonors: jsonData['charity']['totalNumberOfDonors'],
        image: jsonData['charity']['image'],
        email: jsonData['charity']['email'],
        password: jsonData['charity']['password'],
        name: jsonData['charity']['name'],
        contactInfo: ContactInfo(
            email: jsonData['charity']['contactInfo']["email"],
            phone: jsonData['charity']['contactInfo']["phone"],
            websiteUrl: jsonData['charity']['contactInfo']["websiteUrl"],
            id: jsonData['charity']['contactInfo']["_id"]),
        description: jsonData['charity']['description'],
        totalDonationsIncome: jsonData['charity']['totalDonationsIncome'],
        verificationCode: jsonData['charity']['verificationCode'],
        isEnabled: jsonData['charity']['isEnabled'],
        isConfirmed: jsonData['charity']['isConfirmed'],
        isPending: jsonData['charity']['isPending'],
        rate: jsonData['charity']['rate'],
        currency: jsonData['charity']['currency'],
        /* charityLocation: [CharityLocation(governorate: governorate, id: id)],*/ donorRequests:
            jsonData['charity']['donorRequests'],
        createdAt: jsonData['charity']['createdAt'],
        updatedAt: jsonData['charity']['updatedAt'],
        v: jsonData['charity']['__v']);
    message = jsonData['message'];
    emailAlert = jsonData['emailAlert'];
    token = jsonData['token'];
  }
}

class Charity {
  Verification? emailVerification;
  Verification? phoneVerification;
  CharityInfo? charityInfo;
  CharityDocs? charityDocs;
  String? id;
  List<dynamic>? cases;
  int? numberOfCases;
  int? totalNumberOfDonors;
  String? image;
  String email;
  String? password;
  String name;
  ContactInfo? contactInfo;
  String? description;
  int? totalDonationsIncome;
  String? verificationCode;
  bool? isEnabled;
  bool? isConfirmed;
  bool? isPending;
  int? rate;
  List<dynamic> currency;
  List<CharityLocation>? charityLocation;
  List<dynamic>? donorRequests;
  String? createdAt;
  String? updatedAt;
  int? v;

  Charity({
    required this.emailVerification,
    required this.phoneVerification,
    required this.charityInfo,
    required this.charityDocs,
    required this.id,
    required this.cases,
    required this.numberOfCases,
    required this.totalNumberOfDonors,
    required this.image,
    required this.email,
    required this.password,
    required this.name,
    required this.contactInfo,
    required this.description,
    required this.totalDonationsIncome,
    required this.verificationCode,
    required this.isEnabled,
    required this.isConfirmed,
    required this.isPending,
    required this.rate,
    required this.currency,
    //required this.charityLocation,
    required this.donorRequests,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}

class CharityDocs {
  List<dynamic> docs1;
  List<dynamic> docs2;
  List<dynamic> docs3;
  List<dynamic> docs4;

  CharityDocs({
    required this.docs1,
    required this.docs2,
    required this.docs3,
    required this.docs4,
  });
}

class CharityInfo {
  String registeredNumber;
  String establishedDate;

  CharityInfo({
    required this.registeredNumber,
    required this.establishedDate,
  });
}

class CharityLocation {
  String governorate;
  String id;

  CharityLocation({
    required this.governorate,
    required this.id,
  });
}

class ContactInfo {
  String email;
  String phone;
  String websiteUrl;
  String id;

  ContactInfo({
    required this.email,
    required this.phone,
    required this.websiteUrl,
    required this.id,
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
