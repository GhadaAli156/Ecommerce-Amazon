// import 'dart:convert';
//
// class AddressModel {
//   String? name;
//   String? mobileNumber;
//   String? houseNumber;
//   String? area;
//   String? landMark;
//   String? pinCode;
//   String? town;
//   String? state;
//   String? isDefault;
//
//   AddressModel({
//     this.name,
//     this.mobileNumber,
//     this.houseNumber,
//     this.area,
//     this.landMark,
//     this.pinCode,
//     this.town,
//     this.state,
//     this.isDefault,
//   });
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'mobileNumber': mobileNumber,
//       'houseNumber': houseNumber,
//       'area': area,
//       'landMark': landMark,
//       'pinCode': pinCode,
//       'town': town,
//       // 'state': state,
//       'isDefault': isDefault,
//     };
//   }
//
//   factory AddressModel.fromMap(Map<String, dynamic> map) {
//     return AddressModel(
//       name: map['name'] != null ? map['name'] as String : null,
//       mobileNumber: map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
//       houseNumber: map['houseNumber'] != null ? map['houseNumber'] as String : null,
//       area: map['area'] != null ? map['area'] as String : null,
//       landMark: map['landMark'] != null ? map['landMark'] as String : null,
//       pinCode: map['pinCode'] != null ? map['pinCode'] as String : null,
//       town: map['town'] != null ? map['town'] as String : null,
//       state: map['state'] != null ? map['state'] as String : null,
//       isDefault: map['isDefault'] != null ? map['isDefault'] as String : null,
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory AddressModel.fromJson(String source) =>
//       AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
