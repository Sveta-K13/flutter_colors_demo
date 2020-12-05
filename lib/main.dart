import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:image/image.dart' as image;
import 'package:flutter/services.dart';

Future<ui.Image> getUiImage(
    String imageAssetPath, int height, int width) async {
  final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
  image.Image baseSizeImage =
      image.decodeImage(assetImageByteData.buffer.asUint8List());
  image.Image resizeImage =
      image.copyResize(baseSizeImage, height: height, width: width);
  ui.Codec codec = await ui.instantiateImageCodec(image.encodePng(resizeImage));
  ui.FrameInfo frameInfo = await codec.getNextFrame();
  return frameInfo.image;
}

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
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 30,
          ),
        ),
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

const Color green = Colors.green;
const Color blue = Colors.blue;
const Color violet = Colors.purple;
const Color unknownColor = Colors.pink;
Color bgColor = Colors.yellow[200];

class _MyHomePageState extends State<MyHomePage> {
  Widget get colorBox {
    return Container(
      height: 200,
      width: 200,
      key: Key('Color Box '),
      color: Color.alphaBlend(green.withOpacity(0.5), blue),
    );
  }

  Widget get linearGradientBox {
    return Container(
      height: 200,
      width: 200,
      key: Key('Linear Gradient Box '),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [green, blue],
        stops: [0, 0.7],
        transform: GradientRotation(0),
      )),
    );
  }

  Widget get linearGradientExamples {
    return Row(children: [
      Container(
        height: 200,
        width: 200,
        key: Key('Unknown Colored Text Background'),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(transform: GradientRotation(pi / 2), colors: [
          Color.alphaBlend(unknownColor.withOpacity(0.6), bgColor),
          bgColor,
        ], stops: [
          0,
          1
        ])),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Пункт 1',
              style: TextStyle(color: unknownColor),
            ),
          ),
        ),
      ),
      SizedBox(width: 20),
      Container(
        height: 200,
        width: 200,
        key: Key('LinearGradient Rotated Repeated'),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0, 0),
                end: Alignment(0, 0.2),
                colors: [unknownColor, Colors.transparent],
                stops: [0.1, 0.1],
                transform: GradientRotation(pi / 6),
                tileMode: TileMode.repeated)),
      ),
      SizedBox(width: 20),
      shapeGradient,
    ]);
  }

  Widget get shapeGradient {
    return Container(
      key: Key('RadialGradient Example'),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.darken,
          gradient: RadialGradient(
            colors: [unknownColor, Colors.transparent],
            stops: [0.1, 0.1],
            tileMode: TileMode.repeated,
            focal: Alignment(-1, 0),
            center: Alignment(0.2, 0),
            transform: GradientRotation(10 * pi / 6),
          )),
    );
  }

  Widget get sweepGradientExample {
    return Container(
      key: Key('Sweep Gradient Example'),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.multiply,
          gradient: SweepGradient(
            colors: [unknownColor, Colors.transparent, unknownColor],
            stops: [0.7, 0.7, 0.75],
            transform: GradientRotation(0),
            startAngle: -pi / 2,
            endAngle: pi,
          )),
    );
  }

  //

  //

  //

  //

  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      //
      //
      //
      //
      //
      //
      //
      //
      //
      Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              colorBox,
              SizedBox(height: 30),
              linearGradientBox,
              SizedBox(height: 30),
              linearGradientExamples,
              SizedBox(height: 30),
              sweepGradientExample,
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
      //
      //
      //
      //
      //
      //
      Scaffold(
          body: SafeArea(
              child: Column(children: [
        Image.asset(
          'images/profile.png',
          height: 80,
        ),
        buildColoredImage(),
        SizedBox(height: 30),
        buildShaderMask(),
        SizedBox(height: 30),
        buildImageShader(),
      ]))),

      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //

      Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          buildLightenOverlay(),
          buildDarkenOverlay(),
          buildImageDifference(),
        ],
      ))),
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //

      Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildClipRect(),
              buildClipOval(),
              buildClipRRect(),
              buildClipInverted(),
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
      //
      //
      //
      //
      //
      //
      //
      Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('images/me.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRichWidget(),
              Stack(
                children: [
                  buildGradientText(),
                  buildDraggableTransparentText(),
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
      //
      //
      //
      //
      //
      //
      //
      Container(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Draggable(
                childWhenDragging: Container(),
                feedback: buildMagicText(),
                child: buildMagicText(),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Image buildColoredImage() {
    return Image.asset(
      'images/profile.png',
      height: 80,
      color: blue,
    );
  }

  Container buildMagicText() {
    return Container(
        key: Key('text'),
        foregroundDecoration: BoxDecoration(
            color: Colors.white, backgroundBlendMode: BlendMode.difference),
        child: Text('hi',
            style: TextStyle(
                color: Colors.white, decoration: TextDecoration.none)));
  }

  ShaderMask buildGradientText() {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          LinearGradient(colors: [Colors.indigo, Colors.red], stops: [0.3, 0.7])
              .createShader(bounds),
      child: Text(
        'I love Flutter',
        style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
      ),
    );
  }

  Draggable buildDraggableTransparentText() {
    return Draggable(
      childWhenDragging: SizedBox(),
      feedback: buildTransparentText(),
      child: buildTransparentText(),
    );
  }

  ShaderMask buildTransparentText() {
    return ShaderMask(
      blendMode: BlendMode.srcOut,
      shaderCallback: (bounds) =>
          LinearGradient(colors: [Colors.indigo, Colors.red], stops: [0.3, 0.7])
              .createShader(bounds),
      child: Text(
        'I love Flutter',
        style: TextStyle(
            fontSize: 65,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none),
      ),
    );
  }

  ShaderMask buildRichWidget() {
    return ShaderMask(
      blendMode: BlendMode.difference,
      shaderCallback: (bounds) =>
          LinearGradient(colors: [Colors.indigo, Colors.red], stops: [0.3, 0.7])
              .createShader(bounds),
      child: Container(
        width: double.infinity,
        key: Key('Container with mask'),
        decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.clear, color: Colors.amber),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset(
              'images/paint.png',
              width: 280,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('хорошего дня!'),
                Text('  хорошего дня!'),
                Text('хорошего дня!'),
                Text('  хорошего дня!'),
                Text('хорошего дня!'),
                Text('  хорошего дня!'),
                Text('хорошего дня!'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClipInverted() {
    return Row(
      children: [
        ClipPath(
          clipper: InvertedClipper(),
          child: Image.asset(
            'images/me.jpg',
            width: 160,
          ),
        ),
        SizedBox(width: 30),
        buildClipExample(),
      ],
    );
  }

  Widget buildClipExample() {
    return SizedBox(
      width: 160,
      height: 220,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/me.jpg',
            fit: BoxFit.cover,
          ),
          ClipPath(
            clipper: InvertedClipper(),
            child: Container(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildClipPath() {
    return Padding(
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
    );
  }

  Padding buildClipRRect() {
    return Padding(
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
    );
  }

  Padding buildClipOval() {
    return Padding(
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
    );
  }

  Padding buildClipRect() {
    return Padding(
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
    );
  }

  Padding buildImageDifference() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[green, blue],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            blendMode: BlendMode.difference,
            child: Image.asset(
              'images/me.jpg',
              height: 180,
              colorBlendMode: BlendMode.darken,
            )));
  }

  Padding buildDarkenOverlay() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'images/me.jpg',
          height: 180,
          colorBlendMode: BlendMode.darken,
          color: Colors.indigo,
        ));
  }

  Padding buildLightenOverlay() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'images/me.jpg',
          height: 180,
          colorBlendMode: BlendMode.lighten,
          color: Colors.indigo,
        ));
  }

  Container buildOutIcon() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[
          Colors.white,
          Colors.black,
        ],
        stops: [0.3, 1],
        tileMode: TileMode.clamp,
      )),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: <Color>[
              blue,
              green,
            ],
            stops: [0.3, 1],
            tileMode: TileMode.clamp,
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcOut,
        child: Image.asset(
          'images/profile.png',
          height: 80,
        ),
      ),
    );
  }

  FutureBuilder<ui.Image> buildImageShader() {
    return FutureBuilder(
        future: getUiImage('images/me.jpg', 180, 180),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return ImageShader(snapshot.data, TileMode.clamp,
                    TileMode.clamp, Matrix4.identity().storage);
              },
              blendMode: BlendMode.srcIn,
              child: Image.asset(
                'images/profile.png',
                height: 180,
              ),
            );
          }
          return Center();
        });
  }

  ShaderMask buildShaderMask() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: <Color>[green, blue],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: Image.asset(
        'images/profile.png',
        height: 80,
      ),
    );
  }
}

class InvertedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double rectSize = size.width / 2;
    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()
        ..addRect(Rect.fromLTWH((size.width - rectSize) / 2,
            (size.height - rectSize) / 2, rectSize, rectSize))
        ..close(),
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
