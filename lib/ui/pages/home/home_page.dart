import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/catalog_model.dart';
import 'package:my_flutter_app/ui/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    // 
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(30, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Catalog App'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple, 
              ),
            )
          : ListView.builder(
              itemCount: dummyList.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  item: dummyList[index],
                );
              },
            ),
      drawer: const Drawer(),
    );
  }
}
