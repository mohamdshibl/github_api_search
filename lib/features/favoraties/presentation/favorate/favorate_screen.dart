import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
        appBar: AppBar(
          centerTitle:true ,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Favorites',
          ),
        ),
        body: const Center(
          child: Text(
            'Press the star icon on the job you want to save.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),

                  );

  }
}
