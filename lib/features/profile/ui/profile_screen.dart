import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/images.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              elevation: 10,
              shadowColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 33,
                      backgroundImage: AssetImage(Images.avatar),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        Text(
                          'اسم العميل',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'ِcustomer@gmail.com',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            ProfileScreenCardView(
              title: 'المشتريات',
              accentColor: Colors.blue.shade200,
              icon: CupertinoIcons.cart,
              onPressed: () {},
            ),
            ProfileScreenCardView(
              title: 'عملياتي',
              accentColor: Colors.red.shade200,
              icon: CupertinoIcons.clock,
              onPressed: () {},
            ),
            ProfileScreenCardView(
              title: 'المفضلة',
              accentColor: Colors.purple.shade200,
              icon: CupertinoIcons.heart,
              onPressed: () {},
            ),
            ProfileScreenCardView(
              title: 'الدعم والمساعدة',
              accentColor: Colors.green.shade200,
              icon: CupertinoIcons.phone,
              onPressed: () {},
            ),
            ProfileScreenCardView(
              title: 'سياسة الخصوصية',
              accentColor: Colors.amber.shade200,
              icon: CupertinoIcons.book_circle,
              onPressed: () {},
            ),
            ProfileScreenCardView(
              title: 'قيم التطبيق',
              accentColor: Colors.amber.shade200,
              icon: CupertinoIcons.star,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreenCardView extends StatelessWidget {
  const ProfileScreenCardView(
      {Key? key,
      required this.title,
      required this.accentColor,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String title;
  final Color accentColor;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: accentColor),
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
