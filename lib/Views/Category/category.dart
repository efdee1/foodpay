import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodlocker/Views/ViewProduct/view_product_ui.dart';
import 'package:foodlocker/model/category_api_model.dart';
import 'package:http/http.dart' as http;

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}
class _CategoryViewState extends State<CategoryView> {
  //Category? categories = Category();
  var body=Category();
  Future loadCategory()async{
    try{
      var response = await http.get(
          Uri.parse('https://v2.foodlocker.com.ng/apiv1?action=all_category'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      body = body.categoryFromJson(response.body);
      // body = categories!.productsFromJson(response.body)
    }catch(e){print(e);}
    return body;
  }




 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: loadCategory(),
          builder: (context, snapshot){
            return snapshot.hasData?
                Container(
                  child: body.categories!.length == 0 ? Center(child:CircularProgressIndicator()): GridView.builder(
                      itemCount: body.categories!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3),
                      itemBuilder: (BuildContext context, index){
                       // Category category = body!.categories![index];
                            return //ontainer(child: Text('child'),);
                       GestureDetector(
                         onTap: (){

                         },
                         child: CategoryProduct(
                                name:body.categories![index].name!,
                                picture:body.categories![index].image!,
                                // Unit:body.categories![index]..toString(),
                              ),
                       );
                          }
                  ),
                ): Center(child:CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}

// Container(
// child: GridView.builder(
// itemCount: AllProducts.length,
// shrinkWrap: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3),
// itemBuilder: (BuildContext context,int index){
// return AllProducts(
// name:AllProducts[index]['name'],
// picture:AllProducts[index]['picture'],
//
// );
// }
// ),
// ],
// ),












class CategoryProduct extends StatelessWidget {

  final String picture;
  final String  name;
  const CategoryProduct({ required this.picture, required this.name});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          // shape: RoundedRectangleBorder(
          //     borderRadius:BorderRadius.all(Radius.circular(20))
          // ),
          child: Hero(tag:name,
            child: Material(
              child: InkWell(onTap: (){},
                child: GridTile(
                  footer: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(name,style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                        picture
                    ),
                  ),
                  // ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
