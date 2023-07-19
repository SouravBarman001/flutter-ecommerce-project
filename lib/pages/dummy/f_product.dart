import 'package:hive/hive.dart';
part 'f_product.g.dart';

@HiveType(typeId: 2)
class FProduct extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  String imageUrl;

  FProduct({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

}