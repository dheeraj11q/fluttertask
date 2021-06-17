import 'package:flutter/material.dart';
import 'package:fluttertask/apis/homeApi.dart';
import 'package:fluttertask/homepage.dart';
import 'package:fluttertask/messagepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  PageController pageController;

  List<Widget> tabpages = [Homepage(), Messagepage()];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageIndex);
  }

  void onpageChange(int page) {
    setState(() {
      this.pageIndex = page;
    });
  }

  void ontabTap(int page) {
    onpageChange(page);
    this.pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: tabpages,
          controller: pageController,
          onPageChanged: onpageChange,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (i) {
            ontabTap(i);
          },

          //  (i) {
          //   print(i);
          //   setState(() {
          //     pageIndex = i;
          //   });
          // },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text("Massage")),
          ],
        ),
      ),
    );
  }
}
