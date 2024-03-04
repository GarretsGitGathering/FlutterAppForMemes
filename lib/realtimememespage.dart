import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeMemesPage extends StatefulWidget {
  const RealtimeMemesPage({super.key, required this.title});

  final String title;

  @override
  State<RealtimeMemesPage> createState() => _RealtimeMemesPageState();
}

class _RealtimeMemesPageState extends State<RealtimeMemesPage> {

  String link1 = "";
  String link2 = "";
  bool _resourceLoaded = false;

  fetchData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot1 = await ref.child('link2').get();
    final snapshot2 = await ref.child('link1').get();
    if (snapshot1.exists && snapshot2.exists) {
      link1 = snapshot1.value.toString();
      link2 = snapshot2.value.toString();
      _resourceLoaded = true;
    } else {
      print('No data available.');
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize Firebase
    Firebase.initializeApp().then((_) {
      // Once Firebase is initialized, load the resource from the database
      fetchData().then((_) {
        // After the resource is loaded, update the state to show the scaffold
        setState(() {
          _resourceLoaded = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // If _resourceLoaded is false, return a loading indicator
    if (!_resourceLoaded) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // If _resourceLoaded is true, return the scaffold of the page
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: Colors.pink,
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(link1, height: 400.0,),
                Image.network(link2, height: 300.0,)
              ]
            )
        )
    );
  }
}
