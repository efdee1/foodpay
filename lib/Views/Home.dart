// ignore: file_names
// ignore: file_names

// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/Views/ViewProduct/view_product_ui.dart';
import 'package:foodlocker/Views/buy_view.dart';
import 'package:foodlocker/Views/Category/category.dart';
import 'package:foodlocker/model/buying_model.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

// Products? product = Products();
// Products? body;

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
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
  // @override
  Widget build(BuildContext context) {

    print('check');
    //print(body!.products!.length);
    final height= MediaQuery.of(context).size.height;
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
     body: SingleChildScrollView(
       // physics: ClampingScrollPhysics(),
       child: Padding(
         padding: const EdgeInsets.all(18.0),
         child: SingleChildScrollView(
           child: Container(
             child: Center(
               child: Column(

                 children: [
                   CarouselSlider(
                       items: [
                         GestureDetector(
                           onTap: (){
                             print('gudie 1');

                           },
                           child: Container(
                             margin: EdgeInsets.all(5.0),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: AssetImage('assets/real.jpeg'),
                               ),
                             ),
                           ),
                         ),
                         Container(
                           margin: EdgeInsets.all(5.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: AssetImage('assets/dope.jpg'),
                             ),
                           ),
                         ),
                         Container(
                           margin: EdgeInsets.all(5.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: AssetImage('assets/dope.jpg'),
                             ),
                           ),
                         ),
                         Container(
                           margin: EdgeInsets.all(5.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: AssetImage('assets/dope.jpg'),
                             ),
                           ),
                         ),
                         Container(
                           margin: EdgeInsets.all(5.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: AssetImage('assets/dope.jpg'),
                             ),
                           ),
                         ),
                       ],
                       options: CarouselOptions(
                         height: 200.0,
                         enlargeCenterPage: true,
                         autoPlay: true,
                         aspectRatio: 16/9,
                         autoPlayCurve: Curves.fastOutSlowIn,
                         enableInfiniteScroll: true,
                         autoPlayAnimationDuration: Duration(milliseconds: 800),
                         viewportFraction: 0.8,
                       )
                   ),
                   SizedBox(height: height*0.01,),
                   Container(
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(18.0),
                           child: Text('RECENT',
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold
                             ),
                           ),
                         ),
                         TextButton(
                           onPressed: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) =>const ViewProduct()),
                             );
                           },
                           child: Text('view all products',style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.bold
                           ),),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: height*0.01,),
                   FutureBuilder(
                     future: loadProduct(),
                     builder: (context, snapshot) {

                       return
                         snapshot.hasData?
                         Container(
                         child: body!.products!.length == 0 ? Center(child:CircularProgressIndicator()): GridView.builder(
                             itemCount: 6,
                             //body!.products!.length,
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                           itemBuilder: (BuildContext context, index){
                               Product product = body!.products![index];
                             return
                              // Container(child: Text(product.length.toString()),);
                             Center(
                               child: GestureDetector(
                                 onTap: (){
                                    //product[index];
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) =>BuyingView(buyProduct: product,)),
                                   );
                                 },
                                 child: //Container()
                                 Center(
                                   child: AllProducts(
                                     name:product.name!,
                                     picture:product.image!,
                                     Unit:product.quantities![0].price!.toString(),
                                ),
                                 ),
                               ),
                             );
                           }
                       ),
                       ): Center(child:CircularProgressIndicator(),);
                     }
                   ),
                 ],

               ),
             ),

           ),
         ),
       ),
     ),
    );
  }
}

class AllProducts extends StatelessWidget {

  final String picture;
  final String   name;
  final String  Unit;

  const AllProducts({ required this.picture, required this.name, required this.Unit});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
           borderRadius:BorderRadius.all(Radius.circular(5)),
 ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
           //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                   picture,height: 100,width: 200,
                  ),

              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('${name}\n\n₦${Unit}'),
                ),
              ),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 8.0,top: 3),
              //     child: Text('\₦${Unit}'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );

  }
}

//
// Card(
// shape: RoundedRectangleBorder(
// borderRadius:BorderRadius.all(Radius.circular(20))
// ),
// child: Hero(tag: Text('HERO 1'),
// child: Material(
// child: GridTile(
// footer: Container(
// decoration: BoxDecoration(
// color: Colors.transparent,
// borderRadius: new BorderRadius.only(
// bottomLeft: const Radius.circular(20.0),
// bottomRight: const Radius.circular(20.0),
// )
// ),
// child: Padding(
// padding: const EdgeInsets.all(18.0),
// child: Column(
//
// //mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(name,
// ),
// Text("#$Unit"),
// ],
// ),
// ),
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.all(Radius.circular(20)),
// child: Image.network(
// picture,
// ),
// ),
// // ),
// ),
// ),
// )
// );