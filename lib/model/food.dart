import 'package:equatable/equatable.dart';

enum FoodType { new_food, popular, recommended}

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  @override
  List<Object> get props => [
        id,
        picturePath,
        name,
        description,
        ingredients,
        price,
        rate,
      ];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath:
        'https://i.pinimg.com/564x/5d/22/dd/5d22dd53c9ae94f9a263f5c7447ff611.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah makanan terenak yang selau bisa membahagiakan pencipta makanan',
    ingredients: 'Bawang Merah, Paprika, Bawang Bombay, Timun',
    price: 150000,
    rate: 4.2,
    types: [FoodType.new_food, FoodType.popular, FoodType.recommended],
  ),
  Food(
    id: 2,
    picturePath:
        'https://i.pinimg.com/564x/5d/22/dd/5d22dd53c9ae94f9a263f5c7447ff611.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah makanan terenak yang selau bisa membahagiakan pencipta makanan',
    ingredients: 'Bawang Merah, Paprika, Bawang Bombay, Timun',
    price: 150000,
    rate: 4.2,
    types: [FoodType.new_food, FoodType.popular],
  ),
  Food(
    id: 3,
    picturePath:
        'https://i.pinimg.com/564x/5d/22/dd/5d22dd53c9ae94f9a263f5c7447ff611.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah makanan terenak yang selau bisa membahagiakan pencipta makanan',
    ingredients: 'Bawang Merah, Paprika, Bawang Bombay, Timun',
    price: 150000,
    rate: 4.2,
    types: [FoodType.new_food],

  ),
  Food(
    id: 4,
    picturePath:
        'https://i.pinimg.com/564x/5d/22/dd/5d22dd53c9ae94f9a263f5c7447ff611.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah makanan terenak yang selau bisa membahagiakan pencipta makanan',
    ingredients: 'Bawang Merah, Paprika, Bawang Bombay, Timun',
    price: 150000,
    rate: 4.2,
    types: [FoodType.new_food, FoodType.popular],
  ),
  Food(
    id: 5,
    picturePath:
        'https://i.pinimg.com/564x/5d/22/dd/5d22dd53c9ae94f9a263f5c7447ff611.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah makanan terenak yang selau bisa membahagiakan pencipta makanan',
    ingredients: 'Bawang Merah, Paprika, Bawang Bombay, Timun',
    price: 150000,
    rate: 4.2,
  ),
];
