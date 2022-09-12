import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          "Geeks For Geeks",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         GestureDetector(
           onTap: (){
             setState(() {
               pageIndex=0;
             });
           },
           child: pageIndex==0?
           Container(height: 22,width: 22.67,
               child: Image(image: AssetImage('images/ntisa-home-active-icon.jpg')),

           ):            Container(height:22,width: 22.67,
             child: Image(image: AssetImage('images/ntisa-home-icon.png')),
           )
         ),
          GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex=1;
                });
              },
              child: pageIndex==1?
              Container(height: 22,width: 22.67,
                  child: Image(image: AssetImage('images/ntisa-orders-active-icon.png')),

              ):   Container(height:22,width: 22.67,
                child: Image(image: AssetImage('images/ntisa-orders-icon.png')),
              )
          ),
    GestureDetector(
    onTap: (){
    setState(() {
    pageIndex=2;
    });
    },
    child: pageIndex==2?
    Container(height:22,width: 22.67,
    child: Image(image: AssetImage('images/ntisa-paymetnts-active-icon.png')),
    ): Container(height: 22,width: 22.67,
    child: Image(image: AssetImage('images/ntisa-paymetnts-icon.png')),
    )
    ),
          GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex=3;
                });
              },
              child: pageIndex==3?
              Container(height:22,width: 22.67,
                child: Image(image: AssetImage('images/ntisa-accounts-active-icon.png')),
              ): Container(height: 22,width: 22.67,
                child: Image(image: AssetImage('images/ntisa-accounts-icon.png')),
              )
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }}