import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();

  void _getFollowers() {
      if (textEditingController.text == '')
  {

  }else {

}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:  SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                const SizedBox(
                  width: 80,height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/857/611/png-transparent-github-git-hub-logo-icon-thumbnail.png'),
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
                      hintStyle: TextStyle(color: Colors.purpleAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 100,),
                ElevatedButton(
                    onPressed: () {
                      _getFollowers();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(.1)
                        ),
                        child: const Text('Get Followers',
                          style: TextStyle(color: Colors.purpleAccent,fontSize: 20,),)
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
