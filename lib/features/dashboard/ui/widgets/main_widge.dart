import 'package:flutter/material.dart';
import 'package:shop_app/core/components/bottom_bar_custom.dart';
import 'package:shop_app/core/components/buttons.dart';
import 'package:shop_app/features/home/ui/home_screen.dart';
import 'package:shop_app/features/profile/ui/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child, this.toggleDrawer});

  final Widget child;
  final Function()? toggleDrawer;

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late List<String> _titlesList;
  int _currentPage = 0;
  late List<Widget> _pages;

  updateCurrentPage(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  void initState() {
    _titlesList = ['Shoes', '1', '2', '3', 'Rashid Wassan'];
    _pages = [
      const HomeScreen(),
      const Center(child: Text('2')),
      const Center(child: Text('3')),
      const Center(child: Text('4')),
      const UserProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: widget.toggleDrawer,
        ),
        title: Text(_titlesList[_currentPage]),
        actions: [
          const BagButton(),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: CustomNavigationBar(
        updatePage: updateCurrentPage,
        currentHomeScreen: _currentPage,
      ),
    );
  }
}
