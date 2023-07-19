
import 'package:hive/hive.dart';
part 'dummy_product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

}

// factory Product.fromJson(Map<String, dynamic> json) {
//   return Product(
//     id: json['id'],
//     name: json['name'],
//     price: json['price'].toDouble(),
//   );
// }