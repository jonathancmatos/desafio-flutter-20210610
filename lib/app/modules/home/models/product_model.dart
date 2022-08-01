import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_20210610/app/helpers/variables.dart';

class ProductModel{

  DocumentReference? uid;
  dynamic photo;
  String? title;
  String? type;
  int? rating;
  double? price;
  DateTime? createdAt;

  ProductModel();

  ProductModel.fromDocument(DocumentSnapshot doc) {
    uid = doc.reference;
    photo = doc[KEY_PRODUCT_PHOTO];
    title = doc[KEY_PRODUCT_TITLE];
    type = doc[KEY_PRODUCT_TYPE];
    rating = doc[KEY_PRODUCT_RATING];
    price = doc[KEY_PRODUCT_PRICE];
    createdAt = DateTime.parse(doc[KEY_PRODUCT_CREATED_AT].toDate().toString());
  }

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json.containsKey(KEY_PRODUCT_FILENAME))
      photo = json[KEY_PRODUCT_FILENAME];
    else if(json.containsKey(KEY_PRODUCT_PHOTO))
      photo = json[KEY_PRODUCT_PHOTO];
    else
      photo = "";

    title = json[KEY_PRODUCT_TITLE];
    type = json[KEY_PRODUCT_TYPE];
    rating = json[KEY_PRODUCT_RATING];
    price = json[KEY_PRODUCT_PRICE];
    createdAt = json.containsKey(KEY_PRODUCT_CREATED_AT) ? json[KEY_PRODUCT_CREATED_AT] : DateTime.now();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[KEY_PRODUCT_PHOTO] = this.photo;
    data[KEY_PRODUCT_TITLE] = this.title;
    data[KEY_PRODUCT_TYPE] = this.type;
    data[KEY_PRODUCT_RATING] = this.rating;
    data[KEY_PRODUCT_PRICE] = this.price;
    data[KEY_PRODUCT_CREATED_AT] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return 'ProductModel{uid: $uid, photo: $photo, title: $title, type: $type, rating: $rating, price: $price, createdAt: $createdAt}';
  }
}