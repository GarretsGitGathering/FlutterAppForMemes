import 'package:flutter/material.dart';
import 'package:garrets_flutter_app/countinggame.dart';
import 'package:garrets_flutter_app/cooldrawing.dart';
import 'package:garrets_flutter_app/memespage.dart';
import 'package:garrets_flutter_app/realtimememespage.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Epic Memes Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Take a look at some cool stuff:',),
            ElevatedButton(
                onPressed: () {
                  print("Counting Game (super amusing)");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CountingGame(title: 'Counting Game')),
                  );
                },
                child: const Text("Counting Game (super amusing)")
            ),
            ElevatedButton(
                onPressed: () {
                  print("The floating button is clicked.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RealtimeMemesPage(title: 'Realtime Memes')),
                  );
                },
                child: const Text("Memes From Realtime Database")
            ),
            ElevatedButton(
                onPressed: () {
                  print("The floating button is clicked.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CoolDrawing(title: 'Cool Drawing I Made')),
                  );
                },
                child: const Text("Cool Drawing I Made")
            ),
            ElevatedButton(
                onPressed: () {
                  print("The floating button is clicked.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MemesPage(title: 'Funny Memes')),
                  );
                },
                child: const Text("Memes Forum")
            )
          ],
        ),
      ),
    );
  }
}
