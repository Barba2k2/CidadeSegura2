import 'package:flutter/material.dart';
import 'screens/ChamadosPage/chamados_page.dart';
import 'screens/HomePage/home_page.dart';
import 'screens/LocationPage/laction_page.dart';
import 'screens/profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with WidgetsBindingObserver {
  int selectedPage = 0;

  _getPages() {
    switch (selectedPage) {
      case 0:
        return const HomePage();
      case 1:
        return const LocationPage();
      case 2:
        return const ChamadosPage();
      case 3:
        return const ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    // var brightness = mediaQuery.platformBrightness;
    // final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      // backgroundColor: isDarkMode ? tSecondaryColor : tGreyColor,
      bottomNavigationBar: _bottomNavigationBar(),
      body: _getPages(),
    );
  }

  _bottomNavigationBar() {
    return BottomNavigationBar(
      iconSize: 24,
      selectedFontSize: 14,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.house_sharp),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Localização',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted_add),
          label: 'Chamados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Usuário',
        ),
      ],
      currentIndex: selectedPage,
      onTap: (tappedPage) {
        setState(() {
          selectedPage = tappedPage;
        });
      },
    );
  }
}
