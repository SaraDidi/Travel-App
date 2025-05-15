import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/config.dart';
import 'package:flutter_portfolio/screens/favorite_screen.dart';
import 'package:flutter_portfolio/screens/home_screen.dart';
import 'package:flutter_portfolio/screens/notification_screen.dart';
import 'package:flutter_portfolio/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    NotificationScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  

  BottomNavigationBarItem _buildBottomNavItem({
    required IconData unselectedIcon,
    required IconData selectedIcon,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(_currentIndex == index ? selectedIcon : unselectedIcon , 
      color: Colors.black,
      size: 28,
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, David 👋',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: fullHeight(context) * 0.01),
            Text(
              'Explore the world',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: fullWidth(context) * 0.2,
            height: fullWidth(context) * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
         enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          _buildBottomNavItem(
            index: 0,
            unselectedIcon: Icons.home_outlined,
            selectedIcon: Icons.home,
          ),
          _buildBottomNavItem(
            index: 1,
            unselectedIcon: Icons.access_time_rounded,
            selectedIcon:  Icons.access_time_filled_sharp
          ),
          _buildBottomNavItem(
            index: 2,
            unselectedIcon: Icons.favorite_border,
            selectedIcon: Icons.favorite
          ),
          _buildBottomNavItem(
            index: 3,
            unselectedIcon: Icons.person_outline,
            selectedIcon: Icons.person
          ),
        ],
      ),
    );
  }
}
