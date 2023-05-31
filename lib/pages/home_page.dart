import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sosmmedd/components/drawer.dart';
import 'package:sosmmedd/pages/profile_page.dart';

import '../components/my_textfield.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // user
  final user = FirebaseAuth.instance.currentUser!;

  // text controller
  final textController = TextEditingController();

  // sign user out method
  void SignUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // post message
  void postMessage() {}

  void goToProfilePage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: SignUserOut,
      ),
      body: Center(
        child: Column(
          children: [
            // the wall

            // post message
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  // textfield
                  Expanded(
                    child: MyTextField(
                      controller: textController,
                      hintText: 'Write somthing on the wall..',
                      obscureText: false,
                    ),
                  ),
                  // post message
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(
                      Icons.arrow_circle_up,
                    ),
                  ),
                ],
              ),
            ),
            // logged in as
            Text("Logged in as: " + user.email!)
          ],
        ),
      ),
    );
  }
}
