import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_20210610/app/modules/home/models/product_model.dart';

abstract class IProductRepository{

  Future<bool?> saveAll(List<ProductModel>? products);

  Future<bool?> update(ProductModel productModel);

  Future<bool?> delete(DocumentReference reference);

  Future<String?> uploadImageProduct(File file);

  Stream<List<ProductModel>>? getProducts();

}