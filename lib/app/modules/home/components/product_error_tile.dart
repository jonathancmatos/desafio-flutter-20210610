import 'package:flutter/material.dart';

class ProductErrorTile extends StatelessWidget {

  ProductErrorTile({required this.actionRefresh});
  final VoidCallback actionRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 35),
          SizedBox(height: 8),
          Text("Houve um erro! Por favor, tente novamente mais tarde !",
            textAlign: TextAlign.center),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => actionRefresh(),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.refresh, size: 20),
                const SizedBox(width: 5),
                Text("Recarregar")
              ],
            ),
          )
        ],
      ),
    );
  }
}
