class Cart {

  late final int? id;
  final String? productName;
  final double? initialPrice;
  final double? productPrice;
  final int? quantity;
  final String? unitTag;
  final String? image;

  Cart({
    required this.id ,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.unitTag,
    required this.image
  });

  Cart.fromMap(Map<dynamic , dynamic>  res)
      : id = res['id'],
        productName = res["productName"],
        initialPrice = res["initialPrice"],
        productPrice = res["productPrice"],
        quantity = res["quantity"],
        unitTag = res["unitTag"],
        image = res["image"];

  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'productName' :productName,
      'initialPrice' : initialPrice,
      'productPrice' : productPrice,
      'quantity' : quantity,
      'unitTag' : unitTag,
      'image' : image,
    };
  }
}