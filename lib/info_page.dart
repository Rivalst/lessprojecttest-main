import 'package:flutter/material.dart';

// class JapanPage extends StatefulWidget{
//   const JapanPage({super.key});
//
//   @override
//   State<JapanPage> createState() => _JapanPageState();
// }

class JapanPage extends StatelessWidget {
  const JapanPage({super.key});

  @override
  Widget build(BuildContext context) {

    var mediumTextFormat = TextStyle(
      color: Colors.white.withOpacity(0.75),
      fontSize: 19.0,
      letterSpacing: 1.5,
    );

    Widget stanCard({required Widget stack}) {
      return Card(
        elevation: 14.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: stack,
      );
    }

    Widget stanStack({required String image, required String name}) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 35,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                child: Center(
                  child: Text(
                    name,
                    style: mediumTextFormat
                  ),
                ),

              )
          )
        ],
      );
    }

    var cardKyoto = stanCard(
        stack: stanStack(
            image: 'assets/images/romeo-a-SlIl9eZjWUc-unsplash.jpg',
            name: 'Kyoto')
    );

    var listGenerator = [
      GestureDetector(
        onTap: null,
        child: cardKyoto,
      )
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Japan'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            GridView.extent(
              maxCrossAxisExtent: 250,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              shrinkWrap: true,
              children: listGenerator,
            )
          ],
        ));
  }
}
