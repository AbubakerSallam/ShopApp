import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar(
      {super.key, required this.updatePage, required this.currentHomeScreen});

  final Function updatePage;
  final int currentHomeScreen;

  @override
  CustomNavigationBarState createState() => CustomNavigationBarState();
}

class CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.only(bottom: 24, top: 6),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarButton(widget.currentHomeScreen, 0, Icons.home_filled,
                    widget.updatePage),
                BottomBarButton(widget.currentHomeScreen, 1, Icons.favorite,
                    widget.updatePage),
                const SizedBox(
                  width: 50,
                ),
                BottomBarButton(widget.currentHomeScreen, 3,
                    CupertinoIcons.bell_fill, widget.updatePage),
                BottomBarButton(widget.currentHomeScreen, 4,
                    CupertinoIcons.person_fill, widget.updatePage),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: BottomBarMiddleButton(
                  widget.currentHomeScreen, widget.updatePage),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBarMiddleButton extends StatelessWidget {
  const BottomBarMiddleButton(this.currentHomeScreen, this.updatePage,
      {super.key});
  final int currentHomeScreen;
  final Function updatePage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextButton(
        onPressed: () => updatePage(2),
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          elevation: WidgetStateProperty.all(8),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shadowColor:
              WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface),
        ),
        child: Container(
          width: 55,
          height: 55,
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                  colors: [Colors.black.withOpacity(0.4), Colors.black87],
                  center: Alignment.topLeft,
                  radius: 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.cart_fill,
              color: (currentHomeScreen == 2)
                  ? Colors.purple.shade200
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton(
      this.currentPage, this.index, this.icon, this.updatePage,
      {super.key});
  final IconData icon;
  final int currentPage;
  final int index;
  final Function updatePage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: const EdgeInsets.all(0),
          onPressed: () => updatePage(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Icon(
              icon,
              color: index == currentPage
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.grey,
            ),
          )),
    );
  }
}
