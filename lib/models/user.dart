class User {
  String? cpf;
  String? name;
  String? birthDate;
  String? sex;
  String? email;
  String? ddi;
  String? ddd;
  String? phoneNumber;

  User(
      {this.cpf,
        this.name,
        this.birthDate,
        this.sex,
        this.email,
        this.ddi,
        this.ddd,
        this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    cpf = json['cpf'];
    name = json['name'];
    birthDate = json['birthDate'];
    sex = json['sex'];
    email = json['email'];
    ddi = json['ddi'];
    ddd = json['ddd'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['birthDate'] = this.birthDate;
    data['sex'] = this.sex;
    data['email'] = this.email;
    data['ddi'] = this.ddi;
    data['ddd'] = this.ddd;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
