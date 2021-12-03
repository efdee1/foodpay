import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodlocker/Views/Cart/cart.dart';
import 'package:foodlocker/Views/Home.dart';
import 'package:foodlocker/Views/Search/search_view.dart';
import 'package:foodlocker/model/buying_model.dart';
import 'package:http/http.dart' as http;

class BuyingView extends StatefulWidget {

  Product?   buyProduct = Product();
  // final buyUnit;
  // final name;
   BuyingView({Key? key, required this.buyProduct}) : super(key: key);

  @override
  State<BuyingView> createState() => _BuyingViewState();
}
class _BuyingViewState extends State<BuyingView> {

//List<bool> isSelected = [true,false];
  int quantity = 0;
  void add(){
    setState(() {
      quantity++;
    });
  }
  void minus(){
    setState(() {
      if (quantity !=0)
        quantity--;
    });
  }
  List quantityInfo = [];


  List<bool> _isSelected = [];

  unSelected(int index){
    print('selectedIndex');
    setState(() {
      selectedIndex = index;

    }

    );
    print('selectedIndex');
  }


  int? selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    print(widget.buyProduct!.name);
   // quantityInfo= widget.buyProduct;
   //  print(quantityInfo);
   // quantityInfo.add(widget.buyProduct[0]["quantities"]);
   //  print(widget.buyProduct.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('FoodLocker'),
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
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>const ShoppingCart()),
            );
          },
              icon: Icon(Icons.shopping_cart)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
           children: [
            Container(
              height: 300,
              child: Image.network(widget.buyProduct!.image!),
            ),
             Text('Name',style:TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),),
             SizedBox(height: 10,),
             Text(widget.buyProduct!.name!.toString()),
             SizedBox(height: 10,),
             Text("Description",style:TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),),
             SizedBox(height: 10,),
             Text(widget.buyProduct!.description!.toString()),
           // Text(widget.buyProduct[0]["quantities"][0]["name"]),
          //  Text(widget.buyProduct[0]["quantities"][0]["price"]),

             // Row(
             //   children: [
             //     Expanded(
             //         child: ToggleButtons(
             //           isSelected: isSelected,
             //           fillColor: Colors.white,
             //           color: Colors.green,
             //           children: [
             //             Padding(
             //               padding: const EdgeInsets.all(18.0),
             //               child: Text('${widget.name},\n${widget.buyUnit}' ),
             //
             //             ),
             //
             //           ],
             //           onPressed: (int index){
             //             setState(() {
             //               for (int index = 0; index < isSelected.length; index++) {
             //                 if (index == index) {
             //                   isSelected[index] = true;
             //                 } else {
             //                   isSelected[index] = false;
             //                 }
             //               }
             //             });
             //           },
             //         )
             //     ),
             //   ],
             // ),

             GridView.builder(
                 itemCount: widget.buyProduct!.quantities!.length,
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
                 itemBuilder: (BuildContext context, index){
                   return
                     // Container(child: Text(widget.buyProduct!.quantities![index].name!),);
                     GestureDetector(
                       onTap: () {

                        unSelected(index);

                         print(selectedIndex);
                       }  ,
                       child: BuyProduct(
                         color:selectedIndex != null && selectedIndex == index? Colors.green:Colors.grey[500],
                        // name: quantityInfo[0]["description"],
                        //  buyUnit:[index]["price"],
                        //    descriptionInfo:quantityInfo[0]["quantities"][0][index]["description"]
                         name:widget.buyProduct!.quantities![index].name!,
                           buyUnit: widget.buyProduct!.quantities![index].price!,
                       ),
                     );
                 }
             ),

             // ListView.builder(
             //   // itemCount: 2,
             //     itemCount: quantityInfo.length,
             //     shrinkWrap: true,
             //     physics:ClampingScrollPhysics() ,
             //     itemBuilder: (BuildContext,  index){
             //       return Container(child: Text(quantityInfo.length.toString()),);
                     // BuyProduct(
                     // descriptionInfo:quantityInfo[index]["quantities"][index]["description"],
                     // name:widget.buyProduct[0]["quantities"][0][index]["name"],
                     // buyUnit:widget.buyProduct[0]["quantity"][0][index]["price"].toString(),

                     // description:widget.buyProduct[0]["quantity"][0][index]["name"],
                     // buyname:widget.buyProduct[0]["quantities"][0][index]["name"],
                     // buyUnit:widget.buyProduct[0]["quantity"][0][index]["name"],


                   //);
                // }),

             // Expanded(
             //     child: ToggleButtons(
             //       isSelected: isSelected,
             //       fillColor: Colors.white,
             //       color: Colors.green,
             //       children: [
             //         Padding(
             //           padding: const EdgeInsets.all(18.0),
             //           child: Text('${widget.name},\n${widget.buyUnit}' ),
             //
             //         ),
             //
             //       ],
             //       onPressed: (int index){
             //         setState(() {
             //           for (int index = 0; index < isSelected.length; index++) {
             //             if (index == index) {
             //               isSelected[index] = true;
             //             } else {
             //               isSelected[index] = false;
             //             }
             //           }
             //         });
             //       },
             //     )
             // ),
             const SizedBox(height: 15.0,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   alignment: Alignment.center,
                   child: ElevatedButton(
                     style: ButtonStyle(
                         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                         backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                             RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(15),

                             )
                         )
                     ),
                     onPressed: (){
                       setState(() {
                         quantity += 1;
                       });
                     },
                     child: Text("+",
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 28.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),

                   ),
                 ),
                 const SizedBox(width: 10.0,),
                 Container(
                   alignment: Alignment.center,
                   child: Text('$quantity',
                     //textAlign: TextAlign.center,
                     style: TextStyle(
                       color: Colors.amber,
                       //letterSpacing: 2.0,
                       fontSize: 28.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 const SizedBox(width: 10.0,),
                 Container(
                   alignment: Alignment.center,
                   child: ElevatedButton(
                     onPressed: (){
                       setState(() {
                         quantity -= 1;
                         if(quantity < 1)
                           quantity=0;
                       });
                     },
                     child: Text("-",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color: Colors.black,
                         letterSpacing: 2.0,
                         fontSize: 28.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     style: ButtonStyle(
                         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                         backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                             RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(15),
                                 side: BorderSide(color: Colors.red)
                             )
                         )
                     ),
                   ),
                 ),
               ],
             ),
             const SizedBox(height: 10.0,),

    // Container(
    // child: ElevatedButton(onPressed: ()async{
    // Navigator.pushNamed(context,'/HomeView');
    //
    // try{ http.Response response = await http.post(
    // Uri.parse('https://v2.foodlocker.com.ng/apiv1/action=save_to_cart'),
    // headers: <String, String>{
    // 'Content-Type': 'application/json; charset=UTF-8',
    // },
    //
    // body: jsonEncode(<String, String>{
    // 'name': .toString(),
    // 'email': email.toString(),
    // 'phone': phonenumber.toString(),
    // 'country': country.toString(),
    // 'password': password.toString(),
    // 'passwordtwo': passwordtwo.toString(),
    //
    // ),
    //
    // );
    // print(response.body);}catch(e){print('errorrrrrr');}
    //
    // print(respon//se.body);
    // },
    //
    //
    // child: Text('Add to cart'),)
    // )


             Container(
               alignment: Alignment.center,
               child: ElevatedButton(
                 onPressed: ()   {
                   // setState(() {
                   //   // ignore: unnecessary_statements
                   //  // amount = widget.stock.amount-quantity;
                   // });
                   // totalsale=widget.stock.price*quantity;

                   Navigator.push(
                       context,MaterialPageRoute(builder: (context)
                   {return HomeView();
                   }));
                 },
                 child: Text("Add to cart",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.black,
                     letterSpacing: 2.0,
                     fontSize: 28.0,
                   ),
                 ),
               ),
             ),
           ],
        ),
      ),
    );
  }
}

class BuyProduct extends StatelessWidget {

  // final String  descriptionInfo;
  //final String  producttype;
  final String buyUnit;
  final String name;
   Color? color;
   BuyProduct({Key? key,   required this.buyUnit,  required this.name, this.color}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10,),
          border:  Border.all(

            // ignore: unnecessary_null_comparison
             color: color!,
            width: 1,
          )
        ),

        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('${name}'),
            Container(
              child: Text('\₦${buyUnit}'),
            ),
          ],
        ),
      ),
    );
  }
}

// class BuyProduct extends StatelessWidget {
//
//   final  descriptionInfo;
//   final producttype;
//   final buyUnit;
//   final name;
//
//   const BuyProduct({Key? key, this.descriptionInfo, this.producttype, this.buyUnit, this.name}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Expanded(
//             child: Text(descriptionInfo,
//               style: TextStyle(
//                   color: Colors.green
//               ),),
//           ),
//           SizedBox(height: 10,),
//         ],
//
//       ),
//     );
//   }
// }
