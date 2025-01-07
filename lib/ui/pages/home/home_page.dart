import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Catalog App'),
      ),
      body: const Center(
        child: Text('Welcome Developer'),
      ),
      drawer: const Drawer(),
    );
  }
}
