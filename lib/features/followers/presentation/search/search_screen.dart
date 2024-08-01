import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  double screenHeight = 0;


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        color: Colors.black,
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child:  SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                const SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/Github-desktop-logo-symbol.png'),
                  ),
                ),
                const SizedBox(height: 30,),
                const Text('Github',style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.bold),),
                const SizedBox(height: 150,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.1)
                  ),
                  child:  TextField(
                    controller: textEditingController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Github username',
                      hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                    ),
                    //onSubmitted: getFollowers(),
                  ),
                ),
                const SizedBox(height: 100,),
                ElevatedButton(
                    onPressed: () {
                      if (textEditingController.text.isEmpty)
                      { return;
                      }else{
                       // Navigator.pushNamed(context, Routes.followersScreen);
                        Navigator.pushNamed(
                          context,
                          Routes.followersScreen,
                          arguments:textEditingController.text,
                        );
                      }
                   //   getFollowers();

                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(.1)
                        ),
                        child: const Text('Get Followers',
                          style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 20,),)
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void getFollowers() {

  }
}
