import 'package:blocs/signIn/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({this.uid});
  final String? uid;
  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                      (Route<dynamic> route) => false);
                });
              },
            )
          ],
        ),
        body: const Center(child: Text('Welcome!')),
        drawer: NavigateDrawer(uid: uid));
  }
}

class NavigateDrawer extends StatefulWidget {
  final String? uid;
  const NavigateDrawer({Key? key, this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: FutureBuilder<DatabaseEvent>(
              future: FirebaseDatabase.instance
                  .ref()
                  .child("Users")
                  .child(widget.uid!)
                  .once(),
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData) {
                  DataSnapshot data = snapshot.data!.snapshot;
                  dynamic emailValue = data.value;

                  String email = emailValue != null
                      ? emailValue['email'] ?? ''
                      : ''; // Access the snapshot property
                  return Text(email);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            accountName: FutureBuilder<DatabaseEvent>(
                future: FirebaseDatabase.instance
                    .ref()
                    .child("Users")
                    .child(widget.uid!)
                    .once(),
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData) {
                    DataSnapshot data = snapshot.data!.snapshot;
                    dynamic nameValue =
                        data.value; // Get the value from DataSnapshot
                    String name =
                        nameValue != null ? nameValue['name'] ?? '' : '';
                    return Text(name);
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: const Text('Home'),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
              );
            },
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.settings, color: Colors.black),
              onPressed: () => null,
            ),
            title: const Text('Settings'),
            onTap: () {
              print(widget.uid);
            },
          ),
        ],
      ),
    );
  }
}
