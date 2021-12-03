import 'package:flutter/material.dart';
import 'package:foodlocker/Views/Search/search_view.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('cart'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>const SearchScreen()),
            );
          },
              icon: Icon(Icons.search)
          ),
        ],
      ),

    );
  }
}
