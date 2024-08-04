import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/followers_cubit/followers_cubit.dart';

class FollowersResult extends StatefulWidget {
  final String userName;

  const FollowersResult({required this.userName, super.key});

  @override
  State<FollowersResult> createState() => _FollowersResultState();
}
class _FollowersResultState extends State<FollowersResult> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    var cubit = FollowersCubit.get(context);
    cubit.getFollowers(widget.userName);

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if ( _scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        // Reached the end of the list, load more data
        cubit.getFollowers(widget.userName,);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
        title: const Text('Followers'),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  context.read<FollowersCubit>().getFollowers(value);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<FollowersCubit, FollowersState>(
                  builder: (context, state) {
                    if (state is FollowersSuccessState) {
                      if (state.followers.isEmpty) {
                        return const Center(child: Text('No followers found.'));
                      }
                      return GridView.builder(
                        controller: _scrollController,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: state.followers.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                Routes.userDetailsScreen,
                                arguments: "${state.followers[index].login}",
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage("${state.followers[index].avatarUrl}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${state.followers[index].login}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is FollowersFailureState) {
                      return Center(child: Text(state.failureMsg));
                    }
                    return const Center(child: CircularProgressIndicator(color: Colors.black));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar() {
    var snackBar = const SnackBar(content: Text('Check your internet connection'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}






























// class _FollowersResultState extends State<FollowersResult> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     var cubit = FollowersCubit.get(context);
//     cubit.getFollowers(widget.userName);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.black12,
//         elevation: 0,
//         title: const Text(
//           'Followers',
//         ),
//         leading: TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       backgroundColor: Colors.deepPurpleAccent,
//       body:SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: const Icon(
//                     Icons.search,
//                     color: Colors.grey,
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 onChanged: (value) {
//                  // context.read<GithubUserCubit>().filterUsers(value);
//                 },
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: BlocBuilder<FollowersCubit, FollowersState>(
//                     builder: (context, state) {
//                       if (state is FollowersSuccessState) {
//                         return GridView.builder(
//                           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent: 150,
//                             childAspectRatio: 3/2,
//                             crossAxisSpacing: 20,
//                             mainAxisSpacing: 20,
//                           ),
//                           itemCount: state.followers.length,
//                           itemBuilder: (_, index) {
//                             return GestureDetector(
//                               onTap: (){
//                                 Navigator.pushNamed(
//                                   context,
//                                   Routes.userDetailsScreen,
//                                   arguments: "${state.followers[index].login}"
//                                 );
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.black26,
//                                   borderRadius: BorderRadius.circular(15),
//                                   image:  DecorationImage(
//                                     image: NetworkImage("${state.followers[index].avatarUrl}"),
//                                     fit: BoxFit.cover, // Ensure image covers the container
//                                   ),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(height: 20),
//                                     Text(
//                                       "${state.followers[index].login}",
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         shadows: [
//                                           Shadow(
//                                             color: Colors.black,
//                                             offset: Offset(5, 2),
//                                             blurRadius: 4,
//                                           ),
//                                         ],
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }
//                       if(state is FollowersFailureState){
//                         return  Center(child: Text(state.failureMsg));
//                       }
//                       return
//                         //const Center(child:Text(''));
//                         const Center(child: CircularProgressIndicator(color: Colors.black,),);
//                     }
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
//   void showSnackBar(){
//     var snackBar =
//     const SnackBar(content: Text('check your internet connection'));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
