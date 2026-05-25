import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final int id;
  final String name;
  final String image;
  final String size;
  final double price;
  final int quantity;

  const CartItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.size,
    required this.price,
    required this.quantity,
  });

  /// API response থেকে model তৈরি করতে (পরে API call এর জন্য)
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      size: json['size'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }

  /// Model থেকে JSON বানাতে (API তে পাঠানোর জন্য)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'size': size,
      'price': price,
      'quantity': quantity,
    };
  }

  /// quantity change করতে copyWith ব্যবহার
  CartItemModel copyWith({
    int? id,
    String? name,
    String? image,
    String? size,
    double? price,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      size: size ?? this.size,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, name, image, size, price, quantity];
}
