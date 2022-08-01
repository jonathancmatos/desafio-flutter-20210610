import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_20210610/app/modules/home/models/product_model.dart';
import 'package:desafio_flutter_20210610/app/modules/home/repositories/product_repository.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashController with _$SplashController;

abstract class _SplashController with Store {

  FirebaseFirestore? firestore;
  _SplashController(){
    when((_) => true, () async{
      firestore = FirebaseFirestore.instance;
      await _save(firestore!);
    });
  }

  @observable
  bool loading = false;

  Future<void> _save(FirebaseFirestore firestore) async{
    try {
      loading = true;
      final products = await _getProductsConvert();
      await ProductRepository(firestore).saveAll(products);
      loading = false;

    }catch(e){
      print(e.toString());
      Future.error("Não possível salvar os produtos.");
      loading = false;
    }
  }

  Future<List<ProductModel>?> _getProductsConvert() async{
    try{
      String? response = await _readFileJson();
      if(response == null || response.isEmpty) return null;
      final products = (json.decode(response) as List)
          .map((product) => ProductModel.fromJson(product)).toList();

      return await Future.wait(products.map((product) async{
        final dbBytes = await rootBundle.load('assets/images/${product.photo}');
        final buffer = dbBytes.buffer;

        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        var filePath = tempPath + '/${product.photo}';

        File file = await new File(filePath).writeAsBytes(
            buffer.asUint8List(
                dbBytes.offsetInBytes, dbBytes.lengthInBytes)
        );

        product.photo = file;
        return ProductModel.fromJson(product.toJson());
      }).toList());

    }catch(e){
      print(e.toString());
      Future.error("Falha ao ler arquivo json.");
      return null;
    }
  }

  Future<String?> _readFileJson() async{
    try{
      final String response = await rootBundle.loadString('assets/data/products.json');
      return response;

    }catch(e){
      print(e.toString());
      Future.error("Falha ao ler arquivo json.");
      return null;
    }
  }

}