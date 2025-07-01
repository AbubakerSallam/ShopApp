// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/images.dart';
import 'package:shop_app/core/theming/colors.dart';
import 'package:shop_app/features/dashboard/ui/widgets/dashboard_widget.dart';
import 'package:shop_app/features/dashboard/ui/widgets/main_widge.dart';

// ignore: must_be_immutable
class UserDashboard extends StatefulWidget {
  UserDashboard({
    super.key,
    this.child,
  });
  Widget? child;
  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);

    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
    super.initState();
    if (widget.child == null) {
      widget.child = MainScreen(
        toggleDrawer: toggleDrawer,
        child: Container(),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    setState(() {
      if (isCollapsed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }

      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.customGrey,
      body: !isCollapsed
          ? SafeArea(
              child: Stack(
                children: <Widget>[
                  menu(context),
                  Dashboard(
                    duration: duration,
                    isCollapsed: isCollapsed,
                    scaleAnimation: _scaleAnimation,
                    toggleDrawer: toggleDrawer,
                    child: widget.child == null
                        ? MainScreen(child: Container())
                        : widget.child!,
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                menu(context),
                Dashboard(
                  duration: duration,
                  isCollapsed: isCollapsed,
                  scaleAnimation: _scaleAnimation,
                  toggleDrawer: toggleDrawer,
                  child: widget.child == null
                      ? MainScreen(child: Container())
                      : widget.child!,
                ),
              ],
            ),
    );
  }

  Widget menu(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 48, bottom: 32),
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //   SvgPicture.asset(Images.logoWhite),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: MaterialButton(
                            onPressed: () {},
                            highlightColor: CustomColors.customGrey,
                            child: Text(
                              'تسجيل خروج',
                              style: dashboardButtonText,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 48),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // widget.child = _user == null
                              //     ? LoginScreen(isUser: true)
                              //     : ProfileScreen();
                              // toggleDrawer();
                            });
                          },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200)),
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(Images.avatar),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'اسم العميل',
                          style: dashboardButtonText,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        true
                            ? true
                                ? Container(
                                    height: 15,
                                    width: 15,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child: const Icon(
                                      Icons.check,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  )
                                : SizedBox.shrink()
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: 8),
                  _dashboardSidebarButton(
                      text: 'المزيد',
                      icon: CupertinoIcons.home,
                      onTap: () {
                        setState(() {
                          widget.child = MainScreen(
                            child: Container(),
                            toggleDrawer: toggleDrawer,
                          );
                          toggleDrawer();
                        });
                      }),
                  const Divider(),
                  _dashboardSidebarButton(
                      text: 'سلتي',
                      icon: CupertinoIcons.list_number,
                      onTap: () {
                        setState(() {
                          toggleDrawer();
                        });
                      }),
                  const Divider(),
                  _dashboardSidebarButton(
                    text: 'المشتريات',
                    icon: CupertinoIcons.time,
                    onTap: () {},
                  ),
                  const Divider(),
                  _dashboardSidebarButton(
                      text: 'تشات',
                      icon: CupertinoIcons.chat_bubble,
                      onTap: () {}),
                  const Divider(),
                  const Spacer(),
                  Row(
                    children: [
                      _dashboardSidebarButton(
                          text: 'الاعدادات',
                          icon: CupertinoIcons.settings,
                          onTap: () {
                            setState(() {
                              toggleDrawer();
                            });
                          }),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      // SvgPicture.asset(
                      //   Images.logoWhite,
                      //   height: 35,
                      // ),
                      SizedBox(
                        width: 8,
                      ),

                      Text(
                        'BazaarOnline',
                        style: dashboardButtonText,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),

                      // SvgPicture.asset(
                      //   Images.settings,
                      // ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'اقتراحات وشكاوي',
                        style: dashboardButtonText.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle dashboardButtonText = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  Widget _dashboardSidebarButton(
      {required IconData icon,
      required String text,
      required Function() onTap}) {
    return Row(
      children: [
        SizedBox(
            height: 35,
            width: 35,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )),
        MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onTap,
          child: Text(text, style: dashboardButtonText),
        ),
      ],
    );
  }
}
