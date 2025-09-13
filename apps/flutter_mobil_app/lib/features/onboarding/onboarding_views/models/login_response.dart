class LoginResponse {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  String? postCode;
  bool? emailVerified;
  bool? isActive;
  String? encryptedId;
  String? refreshToken;
  String? profilePic;
  bool? isTermAndConditionAccepted;
  int? unseenMessageCount;

  LoginResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.token,
    this.postCode,
    this.emailVerified,
    this.isActive,
    this.encryptedId,
    this.refreshToken,
    this.profilePic,
    this.isTermAndConditionAccepted,
    this.unseenMessageCount,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    token = json['token'];
    postCode = json['postCode'];
    emailVerified = json['emailVerified'];
    isActive = json['isActive'];
    encryptedId = json['encryptedId'];
    refreshToken = json['refreshToken'];
    profilePic = json['profilePic'];
    isTermAndConditionAccepted = json['isTermAndConditionAccepted'];
    unseenMessageCount = json['unseenMessageCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['token'] = this.token;
    data['postCode'] = this.postCode;
    data['emailVerified'] = this.emailVerified;
    data['isActive'] = this.isActive;
    data['encryptedId'] = this.encryptedId;
    data['refreshToken'] = this.refreshToken;
    data['profilePic'] = this.profilePic;
    data['isTermAndConditionAccepted'] = this.isTermAndConditionAccepted;
    data['unseenMessageCount'] = this.unseenMessageCount;
    return data;
  }
}
