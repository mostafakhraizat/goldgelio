class TalentUser {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? gender;
  List<String>? talents;

  TalentUser(
      {this.fullName,
        this.email,
        this.phone,
        this.password,
        this.gender,
        this.talents});

  TalentUser.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    gender = json['gender'];
    talents = json['talents'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['gender'] = gender;
    data['talents'] = talents;
    return data;
  }
}