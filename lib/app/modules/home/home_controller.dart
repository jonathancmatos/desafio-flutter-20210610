import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'models/product_model.dart';
import 'repositories/product_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  FirebaseFirestore? firestore;
  _HomeController(){
    firestore = FirebaseFirestore.instance;
    _getList();
  }

  @observable
  ObservableStream<List<ProductModel>>? products;

  @action
  void refreshList() => _getList();

  @action
  Future<void> update(ProductModel productModel) async{
    await ProductRepository(firestore!).update(productModel);
  }

  @action
  Future<void> delete(ProductModel productModel) async{
    await ProductRepository(firestore!).delete(productModel.uid!);
  }

  @action
  _getList(){
    products = ProductRepository(firestore!).getProducts()?.asObservable();
  }

}