class ProductModel {

  // this product model will represent a single product in the home page
  final int id;
  final String shoename;
  final String description;
  final double price;
  final String color;
  final String imagePath;
  final List<String> features;

  //constructor for the same
  ProductModel(
      {required this.id,
      required this.features, 
      required this.shoename,
      required this.description,
      required this.price,
      required this.color,
      required this.imagePath,});
}
