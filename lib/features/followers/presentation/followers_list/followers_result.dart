import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/followers_cubit/followers_cubit.dart';

class FollowersResult extends StatefulWidget {
  final String userName;

  const FollowersResult({required this.userName, super.key});

  @override
  State<FollowersResult> createState() => _FollowersResultState();
}

class _FollowersResultState extends State<FollowersResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = FollowersCubit.get(context);
    cubit.getFollowers(widget.userName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
        title: const Text(
          'Followers',
        ),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FollowersCubit, FollowersState>(

          builder: (context, state) {


            if (state is FollowersSuccessState) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: state.followers.length,
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://w7.pngwing.com/pngs/857/611/png-transparent-github-git-hub-logo-icon-thumbnail.png'),
                        fit: BoxFit.cover, // Ensure image covers the container
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "${state.followers[index].login}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            if(state is FollowersFailureState){

            }
            return  const Center(child:Text('hskjjj'));
            //Center(child: CircularProgressIndicator(color: Colors.black,),);
          }
        ),
      ),
    );
  }
}
