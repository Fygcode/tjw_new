class ProductAll {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;
  String? mrp; // Added field for MRP
  String? discount; // Added field for discount
  bool isAddedToCart; // New field to track if added to cart

  ProductAll({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
    this.mrp,
    this.discount,
    this.isAddedToCart = false, // Default to not added
  });

  factory ProductAll.fromJson(Map<String, dynamic> json) {
    return ProductAll(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']),
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      category: json['category'] != null
          ? Category.fromJson(json['category'])
          : null,
      mrp: json['mrp'],  // Parsing MRP
      discount: json['discount'],  // Parsing Discount
      isAddedToCart: json['isAddedToCart'] ?? false, // Default to false
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['images'] = this.images;
    data['creationAt'] = this.creationAt;
    data['updatedAt'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['mrp'] = this.mrp;  // Adding MRP to JSON output
    data['discount'] = this.discount;  // Adding Discount to JSON output
    data['isAddedToCart'] = this.isAddedToCart; // Adding isAddedToCart to JSON
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['creationAt'] = this.creationAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
