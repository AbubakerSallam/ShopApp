import 'package:flutter/material.dart';
import 'package:shop_app/core/theming/colors.dart';
import 'package:shop_app/features/dashboard/ui/widgets/main_widge.dart';

class Dashboard extends StatefulWidget {
  const Dashboard(
      {super.key,
      required this.duration,
      required this.child,
      required this.isCollapsed,
      required this.scaleAnimation,
      required this.toggleDrawer});
  final Duration duration;
  final bool isCollapsed;
  final Animation<double> scaleAnimation;
  final Widget child;
  final Function() toggleDrawer;

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth;
    screenWidth = size.width;
    return AnimatedPositioned(
        duration: widget.duration,
        top: 0,
        bottom: 0,
        left: widget.isCollapsed ? 0 : 0.5 * screenWidth,
        right: widget.isCollapsed ? 0 : -0.5 * screenWidth,
        child: ScaleTransition(
          scale: widget.scaleAnimation,
          child: widget.isCollapsed
              ? Stack(children: [
                  // ignore: unnecessary_null_comparison
                  (widget.child == null)
                      ? MainScreen(
                          toggleDrawer: widget.toggleDrawer,
                          child: Container(),
                        )
                      : widget.child,
                  SizedBox(
                    width: 15,
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) => widget.toggleDrawer,
                    ),
                  )
                ])
              : Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: double.infinity),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 16,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                setState(() {
                                  widget.toggleDrawer();
                                });
                              },
                              highlightColor: CustomColors.customGrey,
                              child: Text(
                                'عودة للتصفح',
                                style: dashboardButtonText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 70),
                    child: Material(
                      elevation: 2,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: widget.child),
                    ),
                  ),
                ]),
        ));
  }

  TextStyle dashboardButtonText = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
}
