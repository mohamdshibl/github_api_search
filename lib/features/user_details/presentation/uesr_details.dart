import 'package:flutter/material.dart';
import 'package:task_one/features/user_details/logic/user_details_cubit/user_details_cubit.dart';

class UserDetails extends StatefulWidget {
  final String userName;
   const UserDetails({super.key, required this.userName});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = UserDetailsCubit.get(context);
    cubit.getFollowers(widget.userName);
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
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
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
                  child: const Image(
                    image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/036/594/092/non_2x/man-empty-avatar-photo-placeholder-for-social-networks-resumes-forums-and-dating-sites-male-and-female-no-photo-images-for-unfilled-user-profile-free-vector.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.userName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black26,
                      fontSize: 50),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Bio',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black26,
                      fontSize: 25),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'public repo',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  Text(
                    'Followers number',
                    style: TextStyle(
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
                    Expanded(child: ElevatedButton(
                        onPressed: () {

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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {

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
          ),
        ),
      ),
    );
  }
}
