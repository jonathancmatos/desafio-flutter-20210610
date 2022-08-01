import 'package:desafio_flutter_20210610/app/modules/home/components/product_error_tile.dart';
import 'package:desafio_flutter_20210610/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'components/product_item_tile.dart';
import 'models/product_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRODUTOS"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Observer(builder: (_){
          if(controller.products!.hasError)
            return ProductErrorTile(
                actionRefresh: () => controller.refreshList()
            );
          else if(controller.products?.data == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          else{
            List<ProductModel> products = controller.products?.data;
            return ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              itemBuilder: (_, index){
                return ProductItemTile(
                  product: products[index],
                  controller: controller,
                );
              },
            );
          }
        })
      ),
    );
  }
}
