import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/sneaker.dart';

class Cart extends ChangeNotifier{
  List<Sneaker> sneakerShop = [
    Sneaker(
      name: "Sneaker 1", 
      price: '256', 
      imagePath: 'assets/ex_1.png', 
      description: 'lorem  lor anm  lnnd fos dd  dosmf fsdjj fvksj fkvmns dkmvd dkjsnsdjnfdov dffnvfk'
    ),

    Sneaker(
      name: "Sneaker 2", 
      price: '102', 
      imagePath: 'assets/ex_2.png', 
      description: 'lorem  lor anm  lnnd fos dd  dosmf fsdjj fvksj fkvmns dkmvd dkjsnsdjnfdov dffnvfk'
    ),

    Sneaker(
      name: "Sneaker 3", 
      price: '568', 
      imagePath: 'assets/ex_3.png', 
      description: 'lorem  lor anm  lnnd fos dd  dosmf fsdjj fvksj fkvmns dkmvd dkjsnsdjnfdov dffnvfk'
    ),

    Sneaker(
      name: "Sneaker 4", 
      price: '2228', 
      imagePath: 'assets/ex_4.png', 
      description: 'lorem  lor anm  lnnd fos dd  dosmf fsdjj fvksj fkvmns dkmvd dkjsnsdjnfdov dffnvfk'
    ),
  ];

  List<Sneaker> userCart = [];

  List<Sneaker> getSneakerList(){
    return sneakerShop;
  }

  List<Sneaker> getUserCart(){
    return userCart;
  }

  void addItemToCard(Sneaker sneaker){
    userCart.add(sneaker);
    notifyListeners();
  }

  void removeItemToCard(Sneaker sneaker){
    userCart.remove(sneaker);
    notifyListeners();
  }

  int calculateTotalCost(){
    int cost = 0;
    for (Sneaker sneaker in userCart) {
      cost += int.parse(sneaker.price);
    }
    return cost;
  }
}