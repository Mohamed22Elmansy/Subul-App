class AllCases {
  List<dynamic>? cases;
  String? message;

  AllCases.fromJson(Map<String, dynamic> jsonData) {
    cases = jsonData["cases"];
    message = jsonData["message"];
    
  }
}

class Case {
  String id;
  String charity;
  String user;
  String title;
  String description;
  String mainType;
  String coverImage;
  List<CaseLocation> caseLocation;
  String subType;
  String nestedSubType;
  bool finished;
  bool freezed;
  int targetDonationAmount;
  int currentDonationAmount;
  String charityName;
  String charityImage;

  Case({
    required this.id,
    required this.charity,
    required this.user,
    required this.title,
    required this.description,
    required this.mainType,
    required this.coverImage,
    required this.caseLocation,
    required this.subType,
    required this.nestedSubType,
    required this.finished,
    required this.freezed,
    required this.targetDonationAmount,
    required this.currentDonationAmount,
    required this.charityName,
    required this.charityImage,
  });
}

class CaseLocation {
  String governorate;

  CaseLocation({
    required this.governorate,
  });
}
