import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Slider Example'),
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
  //we are using for CorouselSlider library
  CarouselSlider carouselSlider;
  int _current = 0; //counter for now index.

  //we create imgList.
  List imgList = [
    "images/holiday1.jpg",
    "images/holiday2.jpg",
    "images/holiday3.jpg",
    "images/holiday4.jpg",
    "images/holiday5.jpg",
    "images/holiday6.jpg",
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              height: 400, //yüksekliği
              initialPage: 0, //ilk sayfanın baslangıç listesini
              enlargeCenterPage: true, //Sayfanın konumu
              autoPlay: true, //otomatik geçiş
              reverse: false, //terse gitmesin
              enableInfiniteScroll: true, //akışkan bir şekilde olması için
              autoPlayInterval: Duration(
                  seconds: 2), //zamanlama yapıyoruz kaç saniyede kaysın
              autoPlayAnimationDuration: Duration(
                  milliseconds:
                      2000), //zamanlamayı destekleme için kullanıyoruz
              pauseAutoPlayOnTouch: Duration(
                  seconds:
                      10), //eğer biri dokunuyorsa 10 saniye sonra kendisi devam ediyo otamatik
              scrollDirection: Axis.horizontal, //yana kaymasını sağlıyo
              onPageChanged: (index) {
                setState(() {
                  //sayfalar değiştiği için canlı bir yapıya ihtiyacımız var
                  _current =
                      index; //sayfalar değiştikçe currente index eşitliyoruz
                });
              },

              items: imgList.map((imgAsset) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(color: Colors.teal[200]),
                    child: Image.asset(
                      imgAsset,
                      fit: BoxFit.fill,
                    ),
                  );
                });
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.pinkAccent[100]
                        : Colors.blueAccent[100],
                  ),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  splashColor: Colors.teal[200],
                  child: Text("<--"),
                  onPressed: goToPrevious,
                ),
                OutlineButton(
                  splashColor: Colors.teal[200],
                  onPressed: goToNext,
                  child: Text("-->"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
