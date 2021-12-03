import 'package:flutter/material.dart';
import 'package:foodlocker/Views/Home.dart';
import 'package:foodlocker/Views/buy_view.dart';
import 'package:foodlocker/model/buying_model.dart';
import 'package:http/http.dart' as http;
import 'package:foodlocker/model/view_product_model_api.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);
  @override
  State<ViewProduct> createState() => _ViewProductState();

}
class _ViewProductState extends State<ViewProduct> {
  @override
  Products? product = Products();
  Products? body;
  Future loadProduct() async{

    try{ var response = await http.get(
        Uri.parse('https://v2.foodlocker.com.ng/apiv1?action=all_products'),
        headers:<String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }  );

    body = product!.productsFromJson(response.body);
    // var body = json.decode(response.body);
    print('ade');
    print(response.body);
    print('deeone');
    //print(body);
    // print(body['products']);
    // print(body);
    setState(() {
      print(body!.products);

      // body.forEach( v) => product.add(Product()););
      //  product.add(body['p
    });
    }catch(e){print(e);}
    return body;
    print(body);
  }

// List  product =[];
  void initState() {
    super.initState();
    // loadProduct();
    print('object');
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Products')),
      ),
body: Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
  child:   Center(
    child:   SingleChildScrollView(
      child:   FutureBuilder(
          future: loadProduct(),
          builder: (context, snapshot) {

            return
              snapshot.hasData?
              Container(
                color: Colors.white,
                child: body!.products!.length == 0 ? Center(child:CircularProgressIndicator()): GridView.builder(
                    itemCount: body!.products!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3),
                    itemBuilder: (BuildContext context, index){
                      Product product = body!.products![index];
                      return
                        // Container(child: Text(product.length.toString()),);
                        GestureDetector(
                          onTap: (){
                            //product[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>BuyingView(buyProduct: product,)),
                            );
                          },
                          child: //Container()
                          AllProducts(
                            name:product.name!,
                            picture:product.image!,
                            Unit:product.quantities![0].price!.toString(),
                          ),
                        );
                    }
                ),
              ): Center(child:CircularProgressIndicator(),);
          }
      ),
    ),
  ),
),

    );
  }
}


// FutureBuilder(
// future: loadViewproduct(),
// builder: (context, snapshot){
// return snapshot.hasData?
// Container(
// child:body!.data!.category!.length == 0 ? Center(child:CircularProgressIndicator()): GridView.builder(
// itemCount: body!.data!.category!.length,
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3),
// itemBuilder: (BuildContext context, index){
// // Category category = body!.categories![index];
// return //ontainer(child: Text('child'),);
// ProductIn(
// name:body.categories![index].name!,
// picture:body.categories![index].image!,
// // Unit:body.categories![index]..toString(),
// );
// }
// ),
// ): Center(child:CircularProgressIndicator(),);
// },
// ),