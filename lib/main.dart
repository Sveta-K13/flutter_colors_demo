import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.black, Colors.white],
        stops: [0, 0.7],
        transform: GradientRotation(2),
      )),
      child: Stack(
        children: [
          Image.asset(
            'images/me.jpg',
            width: 300,
          ),
          PageView(children: [
            // colors && gradients

            //

            //

            Scaffold(
              // uncomment for magic (and reload))
              // backgroundColor: Colors.transparent,

              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // color
                    Container(
                      height: 200,
                      width: 200,
                      key: Key('2'),
                      color: Color.alphaBlend(
                          Colors.yellow.withAlpha(150), Colors.blue),
                    ),
                    SizedBox(height: 30),

                    // // LinearGradient
                    // Row(
                    //   children: [
                    //     Container(
                    //       height: 200,
                    //       width: 200,
                    //       key: Key('1'),
                    //       decoration: BoxDecoration(
                    //           gradient: LinearGradient(
                    //         colors: [Colors.red, Colors.green],
                    //         stops: [0, 0.7],
                    //         transform: GradientRotation(0),
                    //       )),
                    //     ),
                    //     SizedBox(width: 30),

                    //     // LinearGradient BlendMode
                    //     Container(
                    //       height: 200,
                    //       width: 200,
                    //       key: Key('21+'),
                    //       decoration: BoxDecoration(
                    //           backgroundBlendMode: BlendMode.difference,
                    //           gradient: LinearGradient(
                    //             colors: [Colors.red, Colors.green],
                    //             stops: [0, 0.7],
                    //             transform: GradientRotation(0),
                    //           )),
                    //     ),
                    //     SizedBox(width: 30),

                    //     // LinearGradient BlendMode Rotated
                    //     Container(
                    //       height: 200,
                    //       width: 200,
                    //       key: Key('21--'),
                    //       decoration: BoxDecoration(
                    //           backgroundBlendMode: BlendMode.difference,
                    //           gradient: LinearGradient(
                    //               begin: Alignment.bottomCenter,
                    //               end: Alignment.topCenter,
                    //               colors: [Colors.red, Colors.green],
                    //               stops: [0.1, 0.9],
                    //               transform: GradientRotation(1),
                    //               tileMode: TileMode.repeated)),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 30),

                    // RadialGradient
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Container(
                            key: Key('125'),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                backgroundBlendMode: BlendMode.exclusion,
                                gradient: RadialGradient(
                                  colors: [Colors.red, Colors.green],
                                  stops: [0, 0.7],
                                  transform: GradientRotation(0),
                                )),
                          ),
                        ),
                        SizedBox(width: 30),

                        // RadialGradient BlendMode (lighten)
                        Container(
                          key: Key('2p'),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.color,
                              gradient: RadialGradient(
                                colors: [Colors.red, Colors.green],
                                stops: [0, 0.7],
                                transform: GradientRotation(0),
                              )),
                        ),
                        SizedBox(width: 30),

                        // RadialGradient BlendMode
                        Container(
                          key: Key('2joop'),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.darken,
                              gradient: RadialGradient(
                                colors: [Colors.red, Colors.green],
                                stops: [0.3, 1],
                                transform: GradientRotation(0),
                                tileMode: TileMode.mirror,
                                focal: Alignment.bottomLeft,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),

                    // SweepGradient
                    Row(
                      children: [
                        Container(
                          key: Key('gupo'),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.multiply,
                              gradient: SweepGradient(
                                colors: [Colors.red, Colors.yellow],
                                stops: [0, 0.7],
                                transform: GradientRotation(-2.9),
                              )),
                        ),
                        SizedBox(width: 30),
                        Container(
                          key: Key('gupkjh'),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.multiply,
                              gradient: SweepGradient(
                                colors: [Colors.red, Colors.transparent],
                                stops: [0, 0.7],
                                transform: GradientRotation(0),
                                startAngle: 1,
                                endAngle: pi - 1,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //
            //
            //
            //
            //
            //

            Scaffold(
                // backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                    child: SafeArea(
                        child: Column(children: [
              Row(
                children: [
                  Image.asset(
                    'images/paint.png',
                    height: 80,
                  ),
                  Image.asset(
                    'images/paint.png',
                    height: 80,
                    color: Colors.yellow,
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return RadialGradient(
                        center: Alignment.topLeft,
                        radius: 0.1,
                        colors: <Color>[
                          Colors.yellow,
                          Colors.deepOrange.shade900
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.modulate,
                    child: Image.asset(
                      'images/paint.png',
                      height: 80,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                          Colors.blue,
                          Colors.green,
                        ],
                        stops: [0.3, 1],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.difference,
                    child: Image.asset(
                      'images/paint.png',
                      height: 80,
                    ),
                  ),
                ],
              ),
              Row(children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/me.jpg',
                      height: 180,
                      colorBlendMode: BlendMode.lighten,
                      color: Colors.indigo,
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/me.jpg',
                      height: 180,
                      colorBlendMode: BlendMode.darken,
                      color: Colors.indigo,
                    )),
              ]),
            ])))),

            //
            //
            //
            //
            //
            //
            //
            //

            Scaffold(
              // backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 0.5,
                                widthFactor: 0.6,
                                child: Image.asset(
                                  'images/me.jpg',
                                  width: 300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: Align(
                                alignment: Alignment.topLeft,
                                heightFactor: 0.7,
                                widthFactor: 0.5,
                                child: Image.asset(
                                  'images/me.jpg',
                                  width: 300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                heightFactor: 0.5,
                                widthFactor: 0.5,
                                child: Image.asset(
                                  'images/me.jpg',
                                  width: 300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipPath(
                              clipper: InvertedClipper(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  heightFactor: 0.5,
                                  widthFactor: 0.5,
                                  child: Image.asset(
                                    'images/me.jpg',
                                    width: 300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            //
            //
            //
            //
            //
            //
            //
            Scaffold(
              body: Column(
                children: [
                  Row(children: [
                    ClipPath(
                      clipper: InvertedClipper(),
                      child: Image.asset(
                        'images/me.jpg',
                        width: 300,
                      ),
                    ),
                    Stack(children: [
                      Image.asset(
                        'images/me.jpg',
                        width: 300,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => LinearGradient(
                            colors: [Colors.indigo, Colors.red],
                            stops: [0.3, 0.7]).createShader(bounds),
                        child: Text(
                          'Have a nice day!',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: ShaderMask(
                          blendMode: BlendMode.srcOut,
                          shaderCallback: (bounds) => LinearGradient(
                              colors: [Colors.indigo, Colors.red],
                              stops: [0.3, 0.7]).createShader(bounds),
                          child: Text(
                            'Have a nice day!',
                            style: TextStyle(
                                fontSize: 45, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ])
                  ]),
                  Row(
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcOut,
                        shaderCallback: (bounds) => LinearGradient(
                            colors: [Colors.indigo, Colors.red],
                            stops: [0.3, 0.7]).createShader(bounds),
                        child: Image.asset(
                          'images/paint.png',
                          width: 180,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -100),
                        child: ShaderMask(
                          blendMode: BlendMode.srcOut,
                          shaderCallback: (bounds) => LinearGradient(
                              colors: [Colors.indigo, Colors.red],
                              stops: [0.3, 0.7]).createShader(bounds),
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/paint.png',
                                width: 180,
                              ),
                              Column(
                                children: [
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                  Text('have a nice day'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class InvertedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double rectSize = size.width - 120;
    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()
        ..addRect(
            Rect.fromLTWH(60, (size.height - rectSize) / 2, rectSize, rectSize))
        ..close(),
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
