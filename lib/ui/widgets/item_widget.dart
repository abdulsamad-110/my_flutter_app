// item_widget.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/catalog_model.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Card(
        color: const Color.fromARGB(255, 224, 222, 222),
        child: ListTile(
          onTap: () {
            print("${item.name} pressed =========>");
          },
          leading: Image.asset('assets/images/apple.png'),
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Text(
            "\$${item.price}",
            style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
