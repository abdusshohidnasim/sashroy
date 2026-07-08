import 'dart:convert';

class RecentProductsModel {
    final String message;
    final List<Product> products;

    RecentProductsModel({
        required this.message,
        required this.products,
    });

    RecentProductsModel copyWith({
        String? message,
        List<Product>? products,
    }) => 
        RecentProductsModel(
            message: message ?? this.message,
            products: products ?? this.products,
        );

    factory RecentProductsModel.fromRawJson(String str) => RecentProductsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RecentProductsModel.fromJson(Map<String, dynamic> json) => RecentProductsModel(
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
    final String price;
    final String oldPrice;
    final String discount;
    final List<String> images;
    final List<String> features;
    final Category? category;
    final List<dynamic>? variants;
    final bool? isActive;
    final DateTime createdAt;
    final DateTime? updatedAt;
    final int v;
    final bool? stock;

    Product({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.oldPrice,
        required this.discount,
        required this.images,
        required this.features,
        required this.category,
        this.variants,
        this.isActive,
        required this.createdAt,
        this.updatedAt,
        required this.v,
        this.stock,
    });

    Product copyWith({
        String? id,
        String? name,
        String? description,
        String? price,
        String? oldPrice,
        String? discount,
        List<String>? images,
        List<String>? features,
        Category? category,
        List<dynamic>? variants,
        bool? isActive,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
        bool? stock,
    }) => 
        Product(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            price: price ?? this.price,
            oldPrice: oldPrice ?? this.oldPrice,
            discount: discount ?? this.discount,
            images: images ?? this.images,
            features: features ?? this.features,
            category: category ?? this.category,
            variants: variants ?? this.variants,
            isActive: isActive ?? this.isActive,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
            stock: stock ?? this.stock,
        );

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        oldPrice: json["oldPrice"],
        discount: json["discount"],
        images: List<String>.from(json["images"].map((x) => x)),
        features: List<String>.from(json["features"].map((x) => x)),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        variants: json["variants"] == null ? [] : List<dynamic>.from(json["variants"]!.map((x) => x)),
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "oldPrice": oldPrice,
        "discount": discount,
        "images": List<dynamic>.from(images.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x)),
        "category": category?.toJson(),
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "stock": stock,
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

class VariantClass {
    final Attributes attributes;
    final double price;
    final double? oldPrice;
    final int stock;
    final List<dynamic> images;

    VariantClass({
        required this.attributes,
        required this.price,
        this.oldPrice,
        required this.stock,
        required this.images,
    });

    VariantClass copyWith({
        Attributes? attributes,
        double? price,
        double? oldPrice,
        int? stock,
        List<dynamic>? images,
    }) => 
        VariantClass(
            attributes: attributes ?? this.attributes,
            price: price ?? this.price,
            oldPrice: oldPrice ?? this.oldPrice,
            stock: stock ?? this.stock,
            images: images ?? this.images,
        );

    factory VariantClass.fromRawJson(String str) => VariantClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VariantClass.fromJson(Map<String, dynamic> json) => VariantClass(
        attributes: Attributes.fromJson(json["attributes"]),
        price: json["price"]?.toDouble(),
        oldPrice: json["oldPrice"]?.toDouble(),
        stock: json["stock"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
        "price": price,
        "oldPrice": oldPrice,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class Attributes {
    final String color;
    final String size;

    Attributes({
        required this.color,
        required this.size,
    });

    Attributes copyWith({
        String? color,
        String? size,
    }) => 
        Attributes(
            color: color ?? this.color,
            size: size ?? this.size,
        );

    factory Attributes.fromRawJson(String str) => Attributes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        color: json["color"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "size": size,
    };
}
