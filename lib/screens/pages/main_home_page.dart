// ignore_for_file: sort_child_properties_last, prefer_const_constructors
//this page is responsable to navigate (tab) all pages on the bottom navigation bar
import 'package:flutter/material.dart';
import 'package:your_clinic/screens/pages/dashboard_page.dart';
import 'package:your_clinic/screens/pages/google_maps/map_page.dart';
import 'package:your_clinic/screens/pages/home_page.dart';
import 'package:your_clinic/screens/pages/my_clinic.dart';
import 'package:your_clinic/screens/pages/profile_page.dart';
import 'package:your_clinic/screens/pages/search_page.dart';
import 'package:your_clinic/screens/pages/setting_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  //using another way <list> page storage
  final List<Widget> _screens = [
    DashBoardPage(),
    HomePage(),
    SettingPage(),
    ProfilePage(),
    MyClinic(),
    MapPage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    //content receiver for navigation
    return Scaffold(
      appBar: AppBar(
        //title: Text("Vamos"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      //drawer
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text("Your Clinic"),
            ),
            ListTile(
              title: Row(
                children: const [Icon(Icons.person), Text("Manage account")],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: PageStorage(bucket: bucket, child: currentScreen),

      //_selectedPage[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SearchPage()));
        },
        child: Icon(Icons.search),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        elevation: 0,
        //mini: true,
      ),
      //navigation tab
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = HomePage();
                        currentPage = 0;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentPage == 0 ? Colors.blue : Colors.grey,
                        size: 24,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color:
                                currentPage == 0 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = DashBoardPage();
                        currentPage = 1;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.dashboard,
                        color: currentPage == 1 ? Colors.blue : Colors.grey,
                        size: 24,
                      ),
                      Text(
                        'Dash',
                        style: TextStyle(
                            color:
                                currentPage == 1 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = MyClinic();
                        currentPage = 2;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.local_hospital_rounded,
                        color: currentPage == 2 ? Colors.blue : Colors.grey,
                        size: 24,
                      ),
                      Text(
                        'Clinics',
                        style: TextStyle(
                            color:
                                currentPage == 3 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = MapPage();
                        currentPage = 4;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.person,
                        color: currentPage == 4 ? Colors.blue : Colors.grey,
                        size: 24,
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                            color:
                                currentPage == 4 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

/*
 bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.medical_information_outlined)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_border_outlined))
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),*/
