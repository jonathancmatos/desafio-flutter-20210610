import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_flutter_20210610/app/modules/home/components/form_edit_tile.dart';
import 'package:desafio_flutter_20210610/app/modules/home/home_controller.dart';
import 'package:desafio_flutter_20210610/app/modules/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutter_20210610/app/helpers/extensions.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItemTile extends StatelessWidget {

  ProductItemTile({required this.product, required this.controller});
  final ProductModel product;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(.5),
          width: 1
        ),
        borderRadius: BorderRadius.all(Radius.circular(3))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              width: 110,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: product.photo.toString(),
                placeholder: (context, url) => Image.asset("assets/images/image-default.png", fit: BoxFit.cover),
                errorWidget: (context, url, error) => Image.asset("assets/images/image-default.png", fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(product.title.toString(), style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 1.4,
                            ), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        GestureDetector(
                          child: Icon(Icons.more_horiz),
                            onTap:() => showModalBottomSheet(
                                context: context,
                                builder: (BuildContext ctx) => Container(
                                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Selecione uma Opção"),
                                      const SizedBox(height: 24),
                                      ListTile(
                                          onTap: (){
                                            Navigator.of(context).pop();
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext ctx){
                                                  return AlertDialog(
                                                    title: Text("Editar"),
                                                    content:FormEditTile(
                                                      productModel: product,
                                                      controller: controller,
                                                    ),
                                                  );
                                                }
                                            );
                                          },
                                          title: Text("Editar"),
                                          leading: Icon(Icons.edit, color: Colors.black),
                                          textColor: Colors.black
                                      ),
                                      ListTile(
                                          onTap: (){
                                            Navigator.of(ctx).pop();
                                            showAlertDialogConfirm(context);
                                          },
                                          title: Text("Remover"),
                                          leading: Icon(Icons.delete, color: Colors.redAccent,),
                                          textColor: Colors.redAccent
                                      ),
                                    ],
                                  ),
                                )
                            ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xffc0d281).withOpacity(.5),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(product.type.toString(), style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: RatingBar.builder(
                                initialRating: product.rating!.toDouble(),
                                ignoreGestures: true,
                                unratedColor: Colors.grey.withOpacity(.5),
                                itemSize: 20.0,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                                itemBuilder: (context, _){
                                  return Icon(Icons.star, color: Colors.amber);
                                },
                                onRatingUpdate: (rating){}
                            )
                        ),
                        Text("${product.price.toString().getCurrency()}", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45

                        ))
                      ],
                    )
                  ],
                )
            )
        ],
      ),
    );
  }

  showAlertDialogConfirm(BuildContext ctx){
    AlertDialog alert = AlertDialog(
      title: Text("Deseja realmente remover?"),
      content: Text("Ao confirmar, o produto selecionado irá ser removido permanentemente.", style: TextStyle(
       height: 1.3,
       fontSize: 14
      )),
      actions: [
        FlatButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text("Cancelar")
        ),
        FlatButton(
            onPressed: () async{
              await controller.delete(product);
              Navigator.of(ctx).pop();
            },
            child: Text("Sim, remover",style: TextStyle(color: Colors.redAccent))
        ),
      ],
    );
    showDialog(context: ctx, builder: (BuildContext context) => alert);
  }

}
