import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class Geo {
  String lat;
  String lng;

  Geo(this.lat, this.lng);

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  factory Geo.fromJson(Map<String, dynamic> jsonObject) =>
      _$GeoFromJson(jsonObject);
}

@JsonSerializable(explicitToJson: true)
class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  factory Address.fromJson(Map<String, dynamic> jsonObject) =>
      _$AddressFromJson(jsonObject);

}

@JsonSerializable(explicitToJson: true)
class Company {
  String name;
  String catchPhrase;
  String bs;

  Company(this.name, this.catchPhrase, this.bs);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  factory Company.fromJson(Map<String, dynamic> jsonObject) =>
      _$CompanyFromJson(jsonObject);
}

@JsonSerializable(explicitToJson: true)
class User {

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(
      this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company
      );

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> jsonObject) =>
      _$UserFromJson(jsonObject);

}