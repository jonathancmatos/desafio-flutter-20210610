import 'package:desafio_flutter_20210610/app/modules/home/home_controller.dart';
import 'package:desafio_flutter_20210610/app/modules/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutter_20210610/app/helpers/extensions.dart';

class FormEditTile extends StatelessWidget {

  FormEditTile({required this.productModel, required this.controller});
  final ProductModel productModel;
  final HomeController controller;

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Form(
          key: _keyForm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: productModel.title.toString(),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Título"
                ),
                validator: (v){
                  if(v.toString().isEmpty)
                    return "Campo obrigatório";
                },
                onSaved: (v){
                  productModel.title = v.toString();
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                initialValue: productModel.type.toString(),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Tipo"
                ),
                validator: (v){
                  if(v.toString().isEmpty)
                    return "Campo obrigatório";
                },
                onSaved: (v){
                  productModel.type = v.toString();
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                initialValue: productModel.price.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço"
                ),
                validator: (v){
                  if(v.toString().isEmpty)
                    return "Campo obrigatório";
                },
                onSaved: (v){
                  productModel.price = double.parse(v.toString());
                },
              ),
              const SizedBox(height: 16),

              Wrap(
                alignment: WrapAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Cancelar")
                  ),
                  FlatButton(
                      onPressed: () async{
                        if(_keyForm.currentState!.validate()){
                          _keyForm.currentState?.save();
                          await controller.update(productModel);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text("Editar")
                  ),
                ],
              )

            ],
          )
      ),
    );
  }
}
