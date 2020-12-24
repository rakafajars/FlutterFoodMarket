class Food {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
  });
}

Food mockFood = Food(
  id: 1,
  picturePath:
      'https://i.pinimg.com/564x/5d/22/dd/5d22dd53c9ae94f9a263f5c7447ff611.jpg',
  name: 'Sate Sayur Sultan',
  description:
      'Sate Sayur Sultan adalah makanan terenak yang selau bisa membahagiakan pencipta makanan',
  ingredients: 'Bawang Merah, Paprika, Bawang Bombay, Timun',
  price: 150000,
  rate: 4.2,
);
