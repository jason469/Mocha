import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/features/agenda/screens/agenda_screen.dart';
import 'package:mocha/features/calendar/screens/calendar_screen.dart';
import 'package:mocha/features/profile/screens/profile_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-bar';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  List<Widget> _buildScreens() {
    return [
      const CalendarScreen(),
      const AgendaScreen(),
      const ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: "Calender",
        icon: const Icon(
          Icons.calendar_today,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Agenda",
        icon: const Icon(
          Icons.edit_note_outlined,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Profile",
        icon: const Icon(
          Icons.person_outline_outlined,
        ),
      ),
    ];
  }

  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style4, // Choose the nav bar style with this property.
    );
  }
}