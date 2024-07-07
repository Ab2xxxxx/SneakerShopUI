import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneaker_shop/components/bottom_nav_bar.dart';
import 'package:sneaker_shop/screens/cart_screen.dart';
import 'package:sneaker_shop/screens/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  void navigateBottombar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const ShopScreen(),
    const CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottombar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'assets/logo_nike.png', 
                    color: Colors.white,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
                    leading: Icon(Icons.home, color: Colors.white,),
                    title: const Text(
                      'Home', 
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    onTap: (){
                      Navigator.of(context).pop();
                      showDialog(
                        context: context, 
                        builder: (context) => const AlertDialog(
                          title: Text('Author'),
                          content: Text('Abdukholiq'),
                        )
                      );
                    },
                    leading: Icon(Icons.info, color: Colors.white,),
                    title: const Text(
                      'About', 
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(  
                onTap: (){
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                leading: Icon(Icons.logout, color: Colors.white,),
                title: const Text(
                  'Logout', 
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}