import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Search'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: TextField(
                  decoration:InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(18), ),
                      hintText: 'Search for product'
                  ) ,

                ),
              ),
            ],
          ),
        ),
      ) ,
    );

  }
}
