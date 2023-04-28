import 'package:flutter/material.dart';
import 'info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: MyHomePage(),
      ),
      routes: {
        '/info': (context) => const JapanPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    Widget stanCard({required Widget stack}) {
      return SizedBox(
        height: 150,
        child: Card(
            elevation: 24.0,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: stack),
      );
    }

    Widget stanStack(
        {required String imageAssets, required String name, required TextStyle style}) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(imageAssets),
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(name, style: style)
          )
        ],
      );
    }

    // ------- TextStyle -------
    var screenWidth = MediaQuery.of(context).size.width;
    var fontSize = screenWidth * 0.04;

    var letterSpacing = screenWidth * 0.03;

    var styleForText = TextStyle(
        color: Colors.white.withOpacity(0.8),
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontStyle: FontStyle.italic);
    // ------- END TextStyle -------

    // ------- WHOLE STACK -------
    var stackForJapan = stanStack(
        imageAssets: 'assets/images/manuel-cosentino-n--CMLApjfI-unsplash.jpg',
        name: 'JAPAN',
        style: styleForText);

    var stackForKorea = stanStack(
        imageAssets: 'assets/images/sava-bobov-eVa2FK83K6w-unsplash.jpg',
        name: 'KOREA',
        style: styleForText
    );

    // ------- END WHOLE STACK -------

    // ------- WHOLE VIEW -------
    var viewJapan = GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/info'),
        child: Hero(
          tag: 'japan_card',
          child: stanCard(stack: stackForJapan),
        ));

    var viewKorea = GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/info'),
        child: Hero(
          tag: 'japan_card',
          child: stanCard(stack: stackForKorea)));
    //------- END WHOLE VIEW -------

    return Scaffold(
      appBar: AppBar(
        title: const Text('Country'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          viewJapan,
          viewKorea,
        ],
      ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     var descTextStyle = const TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.w500,
//       fontFamily: 'Roboto',
//       letterSpacing: 1.5,
//       fontSize: 15,
//       height: 2,
//     );
//
//     var titleText = const Text(
//       'Chicago Freestyle',
//       style: TextStyle(
//         color: Colors.black,
//         fontWeight: FontWeight.w500,
//         fontFamily: 'Roboto',
//         letterSpacing: 1.5,
//         fontSize: 25,
//         height: 2,
//       ),
//     );
//
//     var subTitle = const Text('''
//       Area code in my phone
//       What numbers do I still have?
//       Who do I know from the past?
//       Hit one, she say she got a man
//       Hit another one, it goes green
//       Must've changed phones on the team
//       'Member when you lead me in between?
//       That was 2017
//       ''',
//       style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//           fontFamily: 'Roboto',
//           letterSpacing: 1.5,
//           fontSize: 12,
//           height: 2,
//       )
//     );
//
//     var stars = Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(Icons.star, color: Colors.green[500]),
//         Icon(Icons.star, color: Colors.green[500]),
//         Icon(Icons.star, color: Colors.green[500]),
//         const Icon(Icons.star, color: Colors.black),
//         const Icon(Icons.star, color: Colors.black),
//       ],
//     );
//
//     final rating = Container(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           stars,
//           const Text('170 reviews',
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: 'Roboto',
//                 letterSpacing: 3.0,
//                 fontSize: 20,
//               )),
//         ],
//       ),
//     );
//
//     final iconList = DefaultTextStyle.merge(
//         style: descTextStyle,
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Icon(Icons.kitchen, color: Colors.green[500]),
//                   const Text("PREP:"),
//                   const Text('25 min')
//                 ],
//               ),
//               Column(
//                 children: [
//                   Icon(Icons.timer, color: Colors.green[500]),
//                   const Text('COOCK:'),
//                   const Text('1 hr')
//                 ],
//               ),
//               Column(
//                 children: [
//                   Icon(Icons.restaurant_rounded, color: Colors.green[500]),
//                   const Text('FEEDS:'),
//                   const Text('4-5')
//                 ],
//               )
//             ],
//           ),
//         ));
//
//     var lefColum = Container(
//       padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
//       child: Column(
//         children: [
//           titleText,
//           subTitle,
//           rating,
//           iconList,
//         ],
//       ),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Strawberry Pavlova"),
//       ),
//       body: Container(
//         margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
//         height: 600,
//         width: 600,
//         child: Card(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 child: null,
//               ),
//               lefColum
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
