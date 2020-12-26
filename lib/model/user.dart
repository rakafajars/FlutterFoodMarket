import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        name,
        email,
        address,
        houseNumber,
        phoneNumber,
        city,
        picturePath,
      ];
}

User mockUser = User(
  id: 1,
  name: 'Amelia Andini',
  address: 'Pasir Jati B.131',
  city: 'Bandung',
  houseNumber: '1324',
  phoneNumber: '0888222231231',
  email: 'raka@raka.com',
  picturePath:
      'https://cdn.idntimes.com/content-images/community/2020/11/14-b1fe04b0ceee0bcd7cd47663ff17b2e9.jpg',
);
