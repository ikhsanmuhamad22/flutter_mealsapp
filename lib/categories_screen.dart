import 'package:flutter/material.dart';

class Categoriesscreen extends StatelessWidget {
  const Categoriesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your categories'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisExtent: 20,
          mainAxisSpacing: 20
        ),
        children: [
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          ],
      ),
    );
  }
} 
