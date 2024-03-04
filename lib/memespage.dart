import 'package:flutter/material.dart';
import 'package:garrets_flutter_app/postview.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';

class MemesPage extends StatefulWidget {
  const MemesPage({super.key, required this.title});

  final String title;

  @override
  State<MemesPage> createState() => _MemesPageState();
}

class _MemesPageState extends State<MemesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: Colors.green,
          title: Text(widget.title),
        ),
        body: ListView(
          children: const [
            SizedBox(height: 30),
            PostView(image: "https://i.redd.it/lofnox6luaj51.png", caption: "Sleep isn't real", initialLikeCount: 200, initialLikeStatus: false, initialdisLikeCount: 200, initialdisLikeStatus: true),
            PostView(image: "https://uploads-ssl.webflow.com/5f3c19f18169b62a0d0bf387/60d33be7eedf8e1f31aabcec_BwENfmI0CU5dZGYlSyo142mpfG08-rYgTS-Qm47uMUXN6JXtmdZvtzVzTooUQdXTWmTD8uzF9N6XQJA2vUIMi53tunFyVtvOBJTNfOjHit2P_JkTmFzFsK7ep6Vb9781XZnRAryH.png", caption: "coding is so much fun.", initialLikeCount: 150, initialLikeStatus: true, initialdisLikeCount: 200, initialdisLikeStatus: false),
            PostView(image: "https://miro.medium.com/v2/resize:fit:640/1*BMdNGcek6kqR5J5pwjQwAw.png", caption: "coding > looking at memes", initialLikeCount: 5000, initialLikeStatus: false, initialdisLikeCount: 200, initialdisLikeStatus: false),
            //PostView(image: documentStream.elementAt(1).toString(), caption: "Short-term memory loss is a prerequisite\nto being a programmer, change my mind.", initialLikeCount: 10, initialLikeStatus: false, initialdisLikeCount: 200, initialdisLikeStatus: false)
          ],
        )
    );
  }
}