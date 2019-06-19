import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Intro',
      home: HomePage(),
    ));

Color bgColor = Color(0xFFF3F3F3);
Color textColor = Color(0xFF83838A);

List<String> imagePath = [
  "assets/images/intro1.png",
  "assets/images/intro2.png",
  "assets/images/intro3.png",
];
List<String> title = ["Wellcome", "Browse", "Ready , set .."];
List<String> description = [
  "Discover new sales & fitness updates everyday with ",
  "We connect you to your favourite online retailers and show you all the best deals in one place.",
  "Find the perfect fit for you."
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            CarouselSlider(
              autoPlay: false,
              enableInfiniteScroll: false,
              initialPage: 0,
              reverse: false,
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              height: MediaQuery.of(context).size.height - 30,
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: AppItro(i));
                  },
                );
              }).toList(),
            ),
          ],
        ));
  }
}

class AppItro extends StatefulWidget {
  int index;
  AppItro(this.index);
  @override
  _AppItroState createState() => _AppItroState();
}

class _AppItroState extends State<AppItro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 24,
                  top: 14,
                  child: new Text(
                    "Numero\u00B9",
                    style: TextStyle(fontFamily: "AvenirBold", fontSize: 16),
                  )),
              Positioned(
                  right: 24,
                  top: 14,
                  child: new Text(
                    widget.index == 2 ? "DONE" : "SKIP",
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontFamily: "SultanNahia"),
                  ))
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 130,
          child: Column(
            children: <Widget>[
              Image.asset(imagePath[widget.index],
                  width: MediaQuery.of(context).size.width),
              Center(
                  child: new Text(
                title[widget.index],
                style: TextStyle(fontFamily: "Caslon", fontSize: 30),
              )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Center(
                  child: new RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: description[widget.index],
                                style: new TextStyle(fontFamily: 'Avenir')),
                            new TextSpan(
                                text: widget.index == 0 ? 'Numero1.' : '',
                                style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'AvenirBold'))
                          ])),
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 50,
          child: Stack(
            children: <Widget>[
              Dots(widget.index),
              Center(
                child: new Text("SCOLL RIGHT",
                    style: TextStyle(fontFamily: "Avenir", fontSize: 10)),
              ),
              Positioned(
                  right: 0,
                  top: widget.index != 2 ? 20 : 0,
                  child: widget.index != 2
                      ? Image.asset(
                          'assets/images/arrow.png',
                          width: 36,
                        )
                      : LetsGo())
            ],
          ),
        )
      ],
    );
  }
}

class Dots extends StatefulWidget {
  int index;
  Dots(this.index);
  @override
  _DotsState createState() => _DotsState();
}

class _DotsState extends State<Dots> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("deneme" + currentPage.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, int index) {
        return Container(
            margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == widget.index ? Colors.black : Colors.white,
                border: Border.all(color: Colors.black)));
      },
    );
  }
}

class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 16,
              left: 12,
              child: Text(
                "LET'S GO!",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
