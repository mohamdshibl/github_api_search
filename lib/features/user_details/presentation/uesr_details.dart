import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/features/user_details/logic/user_details_cubit/user_details_cubit.dart';

import '../../../core/routing/routes.dart';
import '../../favoraties/injection/inj.dart';
import '../../favoraties/logic/cubit/favorite_cubit.dart';

class UserDetails extends StatefulWidget {
  final String userName;

  const UserDetails({super.key, required this.userName});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  double screenHeight = 0;
  double screenWidth = 0;
  late UserDetailsCubit cubit;
  //late FavoriteCubit favoriteCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = UserDetailsCubit.get(context)..getFollowers(widget.userName);
    //favoriteCubit = FavoriteCubit.get(context);

  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
        title: Text(widget.userName),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          BlocProvider(
            create: (context) => sd<FavoriteCubit>(),
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final favoriteCubit = BlocProvider.of<FavoriteCubit>(context); // Get cubit

                return TextButton(
                  onPressed: () {
                    favoriteCubit.favoriteBtmToggle();
                  },
                  child: Icon(
                    favoriteCubit.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),

        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
              builder: (context, state) {
            if (state is UserDetailsSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                    child: SizedBox(
                      height: screenHeight / 2.2,
                      width: double.infinity,
                      child: Image(
                        image: NetworkImage("${state.userInfo.avatarUrl}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black26,
                          fontSize: 50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      ("${state.userInfo.bio}"),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black26,
                          fontSize: 25),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Followers number : ${state.userInfo.followers}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Text(
                        'PublicRepos : ${state.userInfo.publicRepos}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //  crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              //state.userInfo.url,
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(.1)),
                                child: const Text(
                                  'Github link',
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.webView,
                                  arguments: "${state.userInfo.htmlUrl}"
                              );
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(.1)),
                                child: const Text(
                                  'Get Followers',
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is UserDetailsFailureState) {
              return Center(child: Text(state.failureMsg));
            }
            if (state is UserDetailsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
