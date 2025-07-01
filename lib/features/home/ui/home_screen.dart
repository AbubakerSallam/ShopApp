import 'package:shop_app/core/components/buttons.dart';
import 'package:shop_app/core/components/main_page_product_card.dart';
import 'package:shop_app/core/components/rating_widget.dart';
import 'package:shop_app/core/constants/dummy_data.dart';
import 'package:shop_app/core/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/features/models/category_model.dart';
import 'package:shop_app/features/models/product.dart';
import 'package:shop_app/features/services/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  bool _isSearching = false;
  void _onSearchChanged(String query) async {
    query = query.trim();
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchResults.clear();
      });
      return;
    }

    final results = await FirebaseService().search(query);
    setState(() {
      _isSearching = true;
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
          if (_isSearching)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = _searchResults[index];
                  return HomeScreenProductCard(
                    product: product,
                    isCurrentInView: true,
                  );
                },
                childCount: _searchResults.length,
              ),
            )
          else ...[
            SliverToBoxAdapter(child: CategoriesCatalog()),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: ProductPageView(),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(child: const RandomCategoryChips()),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(child: MostPopularTitleText()),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => PopularProductCard(),
                childCount: 5,
              ),
            ),
          ],
        ],
      ),
    );

    // return SafeArea(
    //   child: CustomScrollView(
    //     slivers: [
    //       SliverToBoxAdapter(
    //           child: SearchBar(
    //         controller: _searchController,
    //         onChanged: _onSearchChanged,
    //       )),
    //       SliverToBoxAdapter(child: SizedBox(height: 8)),
    //       _isSearching
    //           ? SliverList(
    //               delegate: SliverChildBuilderDelegate(
    //                 (context, index) {
    //                   final product = _searchResults[index];
    //                   return HomeScreenProductCard(
    //                     product: product,
    //                     isCurrentInView: true,
    //                   );
    //                 },
    //                 childCount: _searchResults.length,
    //               ),
    //             )
    //           : Column(
    //               children: [
    //                 // SliverToBoxAdapter(child: CategoriesCatalog()),
    //                 SliverToBoxAdapter(child: SizedBox(height: 12)),
    //                 SliverToBoxAdapter(
    //                   child: SizedBox(
    //                     height: 300,
    //                     child: ProductPageView(),
    //                   ),
    //                 ),
    //                 SliverToBoxAdapter(child: SizedBox(height: 12)),
    //                 SliverToBoxAdapter(child: const RandomCategoryChips()),
    //                 SliverToBoxAdapter(child: SizedBox(height: 12)),
    //                 SliverToBoxAdapter(child: MostPopularTitleText()),
    //                 SliverToBoxAdapter(child: SizedBox(height: 12)),
    //                 SliverList(
    //                   delegate: SliverChildBuilderDelegate(
    //                     (context, index) => PopularProductCard(),
    //                     childCount: 5, // Or products.length if dynamic
    //                   ),
    //                 ),
    //               ],
    //             ),
    //     ],
    //   ),
    // );

    /* SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SearchBar(),
          const SizedBox(height: 8),
          const CategoriesCatalog(),
          const SizedBox(height: 12),
          SizedBox(
            height: 300, // Or whatever height suits your design
            child: ProductPageView(),
          ),
          const SizedBox(height: 12),
          const MostPopularTitleText(),
          const SizedBox(height: 12),
          const PopularProductCard(),
        ],
      ),
    );*/
  }
}

class MostPopularTitleText extends StatelessWidget {
  const MostPopularTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الاكثر مبيعا',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: GestureDetector(
              onTap: () async {},
              child: Text(
                'عرض الكل',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularProductCard extends StatelessWidget {
  const PopularProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0, 50),
                  spreadRadius: 2,
                  blurRadius: 124),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Images.sh2),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SB Zoom Blazer Low Pro',
                    style: TextStyle(
                      fontSize: 18, // Equivalent to .lg
                      fontWeight: FontWeight.w600, // semiBold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'NIKE'.toUpperCase(),
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600, // semiBold
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '﷼ 80.00',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14, // Equivalent to .sm
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const RatingWidget(rating: 5),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 35,
                width: 35,
                child: RoundedAddButton(
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductPageView extends StatefulWidget {
  const ProductPageView({super.key});

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: PageView.builder(
          controller: PageController(viewportFraction: 0.60, initialPage: 1),
          onPageChanged: (v) {
            setState(() {
              _currentPage = v;
            });
          },
          itemCount: products.length,
          itemBuilder: (context, index) {
            return HomeScreenProductCard(
              product: products[index],
              isCurrentInView: _currentPage == index,
            );
          }),
    );
  }
}

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: PrimaryShadowedButton(
              onPressed: () {},
              borderRadius: 12,
              color: Colors.black,
              child: Center(
                child: Icon(
                  FontAwesomeIcons.slidersH,
                  size: 18,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      onChanged: widget.onChanged,
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const Icon(CupertinoIcons.search, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesCatalog extends StatefulWidget {
  const CategoriesCatalog({super.key});

  @override
  CategoriesCatalogState createState() => CategoriesCatalogState();
}

class CategoriesCatalogState extends State<CategoriesCatalog> {
  int _selectedCategory = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: (index == 0)
                  ? const SizedBox(
                      width: 12,
                    )
                  : (_selectedCategory == index)
                      ? SizedBox(
                          height: 47,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryShadowedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedCategory = index;
                                    });
                                  },
                                  borderRadius: 80,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 47,
                                          width: 47,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: WhiteCategoryButton(
                                              updateCategory: () {},
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          'Sneakers $index',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )
                      : WhiteCategoryButton(
                          updateCategory: () {
                            setState(() {
                              _selectedCategory = index;
                            });
                          },
                        ),
            );
          }),
    );
  }
}

class WhiteCategoryButton extends StatelessWidget {
  const WhiteCategoryButton({Key? key, required this.updateCategory})
      : super(key: key);

  final Function() updateCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47,
      height: 47,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 24)
          ]),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: updateCategory,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(Images.sneakers),
        ),
      ),
    );
  }
}

class RandomCategoryChips extends StatefulWidget {
  const RandomCategoryChips({super.key});

  @override
  State<RandomCategoryChips> createState() => _RandomCategoryChipsState();
}

class _RandomCategoryChipsState extends State<RandomCategoryChips> {
  List<Category> _randomCategories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final all = await FirebaseService().getCategories();
    all.shuffle();
    setState(() {
      _randomCategories = all.take(2).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_randomCategories.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8,
        children: _randomCategories.map((cat) {
          return ActionChip(
            label: Text(cat.name),
            onPressed: () {
              // Navigate or filter by category
            },
          );
        }).toList(),
      ),
    );
  }
}
