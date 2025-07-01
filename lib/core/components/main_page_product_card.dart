import 'package:shop_app/core/components/buttons.dart';
import 'package:shop_app/core/components/rating_widget.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/features/models/product.dart';

import 'package:flutter/material.dart';

class HomeScreenProductCard extends StatefulWidget {
  const HomeScreenProductCard(
      {super.key, required this.product, required this.isCurrentInView});

  final Product product;
  final bool isCurrentInView;

  @override
  HomeScreenProductCardState createState() => HomeScreenProductCardState();
}

class HomeScreenProductCardState extends State<HomeScreenProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _imageAnimationController;

  @override
  void initState() {
    _imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    super.initState();

    _imageAnimationController.addListener(() {
      setState(() {});
    });
    _imageAnimationController.forward();
  }

  @override
  void dispose() {
    _imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            margin:
                const EdgeInsets.only(top: 110, left: 8, right: 8, bottom: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.12),
                      offset: const Offset(0, 12),
                      spreadRadius: 1,
                      blurRadius: 24),
                ]),
            child: Container(
              width: double.infinity,
            )),
        SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.productPage,
                        arguments: widget.product,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: widget.product.productColors![0],
                          boxShadow: [
                            widget.isCurrentInView
                                ? BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: const Offset(0, 8),
                                    spreadRadius: 1,
                                    blurRadius: 8)
                                : const BoxShadow(
                                    color: Colors.transparent,
                                    offset: Offset(0, 8),
                                  ),
                          ],
                          borderRadius: BorderRadius.circular(24)),
                      // margin: const EdgeInsets.only(
                      //     left: 25, right: 25, top: 24, bottom: 32),
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 0.9,
                            child: Transform.rotate(
                                angle: widget.isCurrentInView
                                    ? (_imageAnimationController.value * -0.5)
                                    : 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.asset(
                                    widget.product.productImages![0],
                                  ),
                                )),
                          ),
                          Positioned(
                            right: 12,
                            top: 12,
                            child: SizedBox(
                                height: _imageAnimationController.value * 27,
                                width: _imageAnimationController.value * 27,
                                child: FavouriteButton(
                                  iconSize:
                                      _imageAnimationController.value * 17,
                                  onPressed: () {},
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0, left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            widget.product.name,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Expanded(
                            flex: 2,
                            child: RatingWidget(rating: widget.product.rating)),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                widget.product.brand,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              '﷼ ${widget.product.price}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: _imageAnimationController.value * 30,
                          width: _imageAnimationController.value * 30,
                          child: RoundedAddButton(
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
