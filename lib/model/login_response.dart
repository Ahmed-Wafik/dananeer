class LoginResponse {
  final int Client_ID;
  final String password;
  final String email;
  final String phone;
  final String Name_Arabic;
  final String Name_English;
  final String firstNameAr;
  final String secondNameAr;
  final String thirdNameAr;
  final String firstNameEn;
  final String secondNameEn;
  final String thirdNameEn;
  final String motherNameAr;
  final String motherNameEn;
  final String birthDay;
  bool gender;
  int maritalStatusID;
  final String maritalStatusTitle;
  final String address;
  final String street;
  int avarageSalary;
  int workAddressID;
  final String workAddressTitle;
  final int nationalityID;
  final String nationalityTitle;
  final int faithID;
  final String faithTitle;
  final int Religion_ID;
  final String religionTitle;
  final int studyLevelID;
  final String studyLevelTitle;
  final String studyLevelInfo;
  final String imgPath;
  final bool isActive;
  final int shopID;
  final String shopTitle;

  LoginResponse(
      {this.Client_ID,
      this.password,
      this.email,
      this.phone,
      this.Name_Arabic,
      this.Name_English,
      this.firstNameAr,
      this.secondNameAr,
      this.thirdNameAr,
      this.firstNameEn,
      this.secondNameEn,
      this.thirdNameEn,
      this.motherNameAr,
      this.motherNameEn,
      this.birthDay,
      this.maritalStatusTitle,
      this.address,
      this.street,
      this.workAddressTitle,
      this.nationalityID,
      this.nationalityTitle,
      this.faithID,
      this.faithTitle,
      this.Religion_ID,
      this.religionTitle,
      this.studyLevelID,
      this.studyLevelTitle,
      this.studyLevelInfo,
      this.imgPath,
      this.isActive,
      this.shopID,
      this.shopTitle});

   factory LoginResponse.formJson(Map<String, dynamic> json) => LoginResponse(
     address: json['address'] as String,
     email: json['email']as String,
     Client_ID: json['Client_ID']as int,
     birthDay: json['birthDay']as String,
     faithID: json['faithID']as int,
     isActive: json['isActive']as bool,
     password: json['password']as String,
     phone: json['phone']as String,
     Religion_ID: json['Religion_ID']as int,
     faithTitle: json['faithTitle']as String,
     imgPath:json['imgPath']as String,
     shopTitle: json['shopTitle']as String,
     street: json['street'] as String

   );
   @override
     String toString() =>'$email $password $phone $Client_ID';
}
