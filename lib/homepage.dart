import 'package:flutter/material.dart';
import 'package:fluttertask/apis/homeApi.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void getimagesforCarousel() async {
    final res = await HomeApi.imagesget(5);

    setState(() {
      HomeApi.carouselimages = res;
    });
  }

  void getimages() async {
    final res = await HomeApi.imagesget(20);

    setState(() {
      HomeApi.images = res;
    });

    print(HomeApi.carouselimages);
  }

  @override
  void initState() {
    super.initState();

    getimagesforCarousel();

    getimages();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: HomeApi.images.length < 20
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: size.width,
                      height: size.height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            String image = HomeApi.carouselimages[index];
                            return Container(
                              margin: EdgeInsets.only(left: 5),
                              width: size.width * 0.3,
                              height: size.height * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover),
                              ),
                            );
                          })),
                  Expanded(
                      child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      String images = HomeApi.images[index];
                      return Container(
                        margin: EdgeInsets.all(5),
                        width: size.height * 0.1,
                        height: size.height * 0.1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(images),
                                fit: BoxFit.cover)),
                      );
                    },
                    itemCount: 10,
                  ))
                ],
              ));
  }
}
