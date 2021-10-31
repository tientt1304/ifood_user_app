
class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final double price;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      'assets/images/restaurant1.png'
    ],
  
    title: 'Product 1',
    price: 64.99,
    description: description,
  ),
  Product(
    id: 2,
    images: [
      'assets/images/restaurant2.png'
    ],
    title: 'Product 2',
    price: 50.5,
    description: description,
  ),
  Product(
    id: 3,
    images: [
      'assets/images/restaurant3.png'
    ],
    title: 'Product 3',
    price: 36.55,
    description: description,
  ),
  Product(
    id: 4,
    images: [
      'assets/images/restaurant4.png'
    ],
    title: 'Product 4',
    price: 20.20,
    description: description,
  ),
];

const String description = '';