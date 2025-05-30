
import '../core/model/product_all.dart';

class JsonParsers {
  static T fromJson<T>(Map<String, dynamic> json) {
    if (T == ProductAll) {
      return ProductAll.fromJson(json) as T;
    } else if (T == Category) {
      return Category.fromJson(json) as T;
    } else {
      throw Exception('Unsupported type $T');
    }
  }
}
