import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationPanel extends StatefulWidget {
  const NavigationPanel({super.key, required this.active_item});

  final int active_item;

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) => SizedBox(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 1,

          backgroundColor: Color(0xFF636363),
          currentIndex: this.widget.active_item,
          onTap: (item) {
            if (item == 0) {
              Navigator.pushNamed(context, '/Index');
            }
            ;
            if (item == 1) {
              Navigator.pushNamed(context, '/HikePlans');
            }
            ;

          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: SizedBox(
              height: 25,
              width: 25,
              child: Image(image: AssetImage('lib/Assets/Images/Icons/home_icon.png')),
            ), label: "",
                activeIcon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(image: AssetImage('lib/Assets/Images/Icons/home_active_icon.png')),
                )),
            BottomNavigationBarItem(icon: SizedBox(
              height: 25,
              child: Image(image: AssetImage('lib/Assets/Images/Icons/map_icon.png')),
            ), label: "",
                activeIcon: SizedBox(
                  height: 30,
                  child: Image(image: AssetImage('lib/Assets/Images/Icons/map_active_icon.png')),
                )),
            BottomNavigationBarItem(icon: SizedBox(
              height: 25,
              child: Image(image: AssetImage('lib/Assets/Images/Icons/track_icon.png')),
            ), label: "",
                activeIcon: SizedBox(
                  height: 30,
                  child: Image(image: AssetImage('lib/Assets/Images/Icons/track_active_icon.png')),
                )),
            BottomNavigationBarItem(icon: SizedBox(
              height: 25,
              child: Image(image: AssetImage('lib/Assets/Images/Icons/accaunt_icon.png')),
            ), label: "",
                activeIcon: SizedBox(
                  height: 30,
                  child: Image(image: AssetImage('lib/Assets/Images/Icons/accaunt_active_icon.png')),
                )),
          ],
        ),
      ),
    ));
  }
}
