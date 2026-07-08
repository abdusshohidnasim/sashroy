import 'dart:convert';

class BestSellingModel {
    final String message;
    final List<Product> products;

    BestSellingModel({
        required this.message,
        required this.products,
    });

    BestSellingModel copyWith({
        String? message,
        List<Product>? products,
    }) => 
        BestSellingModel(
            message: message ?? this.message,
            products: products ?? this.products,
        );

    factory BestSellingModel.fromRawJson(String str) => BestSellingModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BestSellingModel.fromJson(Map<String, dynamic> json) => BestSellingModel(
        message: json["message"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    final String id;
    final String name;
    final String description;
    final String oldPrice;
    final bool stock;
    final String price;
    final String discount;
    final List<String> images;
    final List<dynamic> features;
    final Category category;
    final DateTime createdAt;
    final int v;
    final int soldCount;

    Product({
        required this.id,
        required this.name,
        required this.description,
        required this.oldPrice,
        required this.stock,
        required this.price,
        required this.discount,
        required this.images,
        required this.features,
        required this.category,
        required this.createdAt,
        required this.v,
        required this.soldCount,
    });

    Product copyWith({
        String? id,
        String? name,
        String? description,
        String? oldPrice,
        bool? stock,
        String? price,
        String? discount,
        List<String>? images,
        List<dynamic>? features,
        Category? category,
        DateTime? createdAt,
        int? v,
        int? soldCount,
    }) => 
        Product(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            oldPrice: oldPrice ?? this.oldPrice,
            stock: stock ?? this.stock,
            price: price ?? this.price,
            discount: discount ?? this.discount,
            images: images ?? this.images,
            features: features ?? this.features,
            category: category ?? this.category,
            createdAt: createdAt ?? this.createdAt,
            v: v ?? this.v,
            soldCount: soldCount ?? this.soldCount,
        );

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        oldPrice: json["oldPrice"],
        stock: json["stock"],
        price: json["price"],
        discount: json["discount"],
        images: List<String>.from(json["images"].map((x) => x)),
        features: List<dynamic>.from(json["features"].map((x) => x)),
        category: Category.fromJson(json["category"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        soldCount: json["soldCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "oldPrice": oldPrice,
        "stock": stock,
        "price": price,
        "discount": discount,
        "images": List<dynamic>.from(images.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x)),
        "category": category.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "soldCount": soldCount,
    };
}

class Category {
    final String id;
    final String name;

    Category({
        required this.id,
        required this.name,
    });

    Category copyWith({
        String? id,
        String? name,
    }) => 
        Category(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
