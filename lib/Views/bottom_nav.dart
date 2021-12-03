import 'package:flutter/material.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/Views/Home.dart';
import 'package:foodlocker/Views/ProfileViews/profile_view.dart';
import 'package:foodlocker/Views/Cart/cart.dart';
import 'package:foodlocker/Views/Category/category.dart';
import 'package:foodlocker/Views/Search/search_view.dart';
import 'package:foodlocker/Views/ViewProduct/view_product_ui.dart';
import 'package:provider/provider.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _selectedIndex = 0;
  List<Widget>_widgetOptions = <Widget>[
    HomeView(),
    //ViewProduct(),
    CategoryView(),
    ProfileScreen(),

  ];
  void _onItemTap(int index ){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
          IconButton(onPressed: ()async{
            await authService.signOut();
          },
              icon: Icon(Icons.logout)
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text(
      //           'foodlocker',
      //           style: TextStyle(color: Colors.black, fontSize: 25),
      //         ),
      //         decoration: BoxDecoration(
      //             color: Colors.green,
      //             image: DecorationImage(
      //                 fit: BoxFit.fill,
      //                 image: AssetImage('assets/dope.jpg'))),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.input),
      //         title: Text('Login'),
      //         onTap: () => {},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.verified_user),
      //         title: Text('Profile'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.person_add),
      //         title: Text('Create Account'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.help),
      //         title: Text('Help'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //
      //     ],
      //   ),
      // ),
      body:Container(
        child: _widgetOptions.elementAt(_selectedIndex),

      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.green,),
              title: Text('Home',style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.green
              )
                ,)
          ),


          BottomNavigationBarItem(
              icon: Icon(Icons.category,color: Colors.green,),
              title: Text('category',style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,
              ))
          ),


          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_rounded,color: Colors.green,),
              title: Text('My Profile',style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.green
              ))
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[900],
        onTap: _onItemTap,
      ),
    );
  }
}
