import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('assets/logo_nike.png', height: 240,),
              ),
              
              const SizedBox(height: 50,),
          
              const Text(
                'Just Do It',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
        
              const SizedBox(height: 25),

              const Text(
                'Brand new sneakers and custom kicks made premium quality',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                ),
                textAlign: TextAlign.center,
              ),
          
              const SizedBox(height: 50),

              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(25.0),
                  child: const Center(
                    child: Text(
                      'Shop Now', 
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}