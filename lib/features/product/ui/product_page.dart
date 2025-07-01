import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/components/buttons.dart';
import 'package:shop_app/core/components/rating_widget.dart';
import 'package:shop_app/core/theming/colors.dart';
import 'package:shop_app/features/models/product.dart';



class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          const BagButton(
            numberOfItemsPurchased: 3,
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.grey.shade200],
        )),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: MainProductPageProductCard(product: widget.product),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الوصف',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600, // semiBold
                        fontSize: 18, // adjust as needed for .lg
                      ),
                    ),
                    const RatingWidget(rating: 4),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                child: Text(
                  widget.product.description,
                  style: const TextStyle(fontSize: 18), // adjust for .lg
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                              child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    setState(() {
                                      if (_quantity > 1) _quantity -= 1;
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.minus_circle,
                                    size: 22,
                                  )),
                            ),
                            Text(
                              _quantity.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 35,
                              child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    setState(() {
                                      _quantity += 1;
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.plus_circle,
                                    size: 22,
                                  )),
                            ),
                            const Spacer(),
                            Text(
                              'مجموع: ',
                            ),
                            Text(
                              '﷼ ${widget.product.price * _quantity}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 24),
                    PrimaryShadowedButton(
                        onPressed: () {},
                        borderRadius: 16,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'اضافة الى السلة',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainProductPageProductCard extends StatefulWidget {
  const MainProductPageProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<MainProductPageProductCard> createState() =>
      _MainProductPageProductCardState();
}

class _MainProductPageProductCardState
    extends State<MainProductPageProductCard> {
  int _selectedColor = 0;
  int _selectedImageIndex = 0;

  void _updateColor(int index) {
    setState(() {
      _selectedColor = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 0.75,
          child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              margin: const EdgeInsets.only(top: 110, bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.22),
                        offset: const Offset(0, 16),
                        spreadRadius: 1.5,
                        blurRadius: 32),
                  ]),
              child: Container(
                width: double.infinity,
              )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: widget.product.productColors![_selectedColor],
                    borderRadius: BorderRadius.circular(24)),
                // margin: const EdgeInsets.only(
                //     left: 25, right: 25, top: 24, bottom: 32),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 340,
                      child: PageView.builder(
                        itemCount: widget.product.productImages!.length,
                        onPageChanged: (newIndex) => setState(() {
                          _selectedImageIndex = newIndex;
                        }),
                        itemBuilder: (context, index) => AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image.asset(
                              widget
                                  .product.productImages![_selectedImageIndex],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12,
                      top: 12,
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: FavouriteButton(
                          iconSize: 24,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        child: DotsIndicator(
                          dotsCount: 5,
                          position: _selectedImageIndex.toDouble(),
                          decorator: DotsDecorator(
                            color: Colors.black12,
                            spacing: const EdgeInsets.all(5),
                            size: const Size.square(8.0),
                            activeColor: Colors.black45,
                            activeSize: const Size.square(8),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: PrimaryShadowedButton(
                          onPressed: () {},
                          borderRadius: 12,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '﷼ ${widget.product.price}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ColorSelector(
                        colors: widget.product.productColors!,
                        selectedIndex: _selectedColor,
                        updateContainerColor: _updateColor,
                      ),
                      Text(
                        'الحجم:',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: PrimaryShadowedButton(
                          borderRadius: 500,
                          color: CustomColors.darkBlue,
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              '9',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ColorSelector extends StatelessWidget {
  const ColorSelector(
      {super.key,
      required this.colors,
      required this.updateContainerColor,
      required this.selectedIndex});
  final List<Color> colors;
  final Function(int v) updateContainerColor;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                updateContainerColor(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: (selectedIndex == index)
                          ? CustomColors.darkBlue
                          : Colors.transparent,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Center(
                      child: Container(
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[index],
                            border:
                                Border.all(width: 1.5, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
