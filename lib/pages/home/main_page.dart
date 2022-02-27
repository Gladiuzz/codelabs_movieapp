import 'package:codelabs_movieapp/pages/home/home_page.dart';
import 'package:codelabs_movieapp/providers/page_provider.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget customBotNav() {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: whiteColor,
          currentIndex: pageProvider.currentIndex,
          onTap: (value) {
            print(value);
            pageProvider.currentIndex = value;
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Image.asset(
                  'assets/icn_home.png',
                  width: 24,
                  color:
                      pageProvider.currentIndex == 0 ? primaryColor : idleColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Image.asset(
                  'assets/icn_bookmark.png',
                  width: 24,
                  color:
                      pageProvider.currentIndex == 1 ? primaryColor : idleColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Image.asset(
                  'assets/icn_profile.png',
                  width: 24,
                  color:
                      pageProvider.currentIndex == 2 ? primaryColor : idleColor,
                ),
              ),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return HomePage();
        case 2:
          return HomePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: customBotNav(),
      body: body(),
    );
  }
}
