import 'package:flutter/material.dart';

class PostRegister {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String address;
  final String city;
  final String houseNumber;
  final String phoneNumber;

  PostRegister({
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.passwordConfirmation,
    @required this.address,
    @required this.city,
    @required this.houseNumber,
    @required this.phoneNumber,
  });
}
