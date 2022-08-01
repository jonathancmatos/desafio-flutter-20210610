import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_20210610/app/modules/home/models/product_model.dart';
import 'package:desafio_flutter_20210610/app/modules/home/repositories/product_repository_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../helpers/variables.dart';

class ProductRepository implements IProductRepository {

  final FirebaseFirestore firestore;
  ProductRepository(this.firestore);

  @override
  Future<bool?> saveAll(List<ProductModel>? products) async{
    try{
      QuerySnapshot query = await firestore.collection(KEY_COLLECTION_PRODUCT).get();
      List<DocumentSnapshot> listProducts = query.docs;

      if(listProducts == null || listProducts.isEmpty){
        Future.wait(products!.map((product) async{
          if(product.photo != null && await product.photo is File)
            product.photo = await uploadImageProduct(product.photo);
          await firestore.collection(KEY_COLLECTION_PRODUCT).add(product.toJson());
        }).toList());
      }

      return true;

    }on FirebaseException catch(e){
      print(e.toString());
      Future.error("Houve um erro ao registrar os produtos");
      return false;
    }
  }

  @override
  Future<bool?> update(ProductModel productModel) async{
    try{
      await firestore.collection(KEY_COLLECTION_PRODUCT)
          .doc(productModel.uid?.id)
          .update(productModel.toJson());

      return true;

    }on FirebaseException catch(e){
      print(e.toString());
      Future.error("Houve um erro ao editar o produto");
      return false;
    }
  }

  @override
  Future<bool?> delete(DocumentReference<Object?> reference) async{
    try{

      await reference.delete();
      return true;

    }on FirebaseException catch(e){
      print(e.toString());
      Future.error("Houve um erro ao remover produto");
      return false;
    }
  }

  @override
  Stream<List<ProductModel>>? getProducts() {
    try{
      return firestore.collection(KEY_COLLECTION_PRODUCT).snapshots().map((
          query) {
        return query.docs.map((doc) {
          return ProductModel.fromDocument(doc);
        }).toList();
      });
    }on FirebaseException catch(e){
      print(e.toString());
      Future.error("Houve um erro ao retornar os produtos");
      return null;
    }
  }

  @override
  Future<String?> uploadImageProduct(File file) async{
    try{
      final Reference storageReference = FirebaseStorage.instance.ref()
          .child("images")
          .child("${file.path.split('/').last}");

      UploadTask uploadTask = storageReference.putFile(file);
      return await (await uploadTask).ref.getDownloadURL();

    }catch(e){
      print(e.toString());
      Future.error("Não foi possível fazer o upload da imagem.");
      return null;
    }
  }

}