import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/pages/home_screen.dart';
import 'package:movie_api/pages/movie_screen.dart';
import 'package:movie_api/pages/search_screen.dart';
import 'package:movie_api/providers/movie_provider.dart';
import 'package:movie_api/providers/navigation_bar_provider.dart';
import 'package:movie_api/providers/now_playing_provider.dart';
import 'package:movie_api/providers/recommended_provider.dart';
import 'package:movie_api/providers/search_movie_provider.dart';
import 'package:movie_api/widgets/Shimmer/homescreen_shimmer.dart';
import 'package:movie_api/widgets/Shimmer/trending_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider(
      create: (context) => NowPlayingProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => RecommendedProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchMovieProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => NavigationBarProvider(),
    ),
  ]));
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          scrollBehavior: MyScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Responsive Sizer Example',
          theme: ThemeData(scaffoldBackgroundColor: Color(0xff15141F)),
          home: MyHomePage(title: "dsad"),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Widget> pageIndex = [
    HomeScreen(),
    SearchScreen(),
    MovieScreen(movieId: 2),
  ];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Consumer(
      builder: (context, NavigationBarProvider value, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            backgroundColor: Color(0xff211F30),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  icon: Icon(Icons.home_rounded), title: Text("Home")),
              BottomNavyBarItem(
                  icon: Icon(Icons.search), title: Text("Search")),
            ],
            onItemSelected: (index) {
              value.onItemTapped(index);
            },
            selectedIndex: value.selectedIndex,
          ),
          body: pageIndex[value.selectedIndex],
        );
      },
    );
  }
}
