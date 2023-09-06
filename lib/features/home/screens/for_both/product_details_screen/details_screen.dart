import 'package:flutter/material.dart';
import 'package:harvestx/core/common/green_button.dart';
import 'package:harvestx/core/mq.dart';
import 'package:harvestx/core/providers/cart_provider.dart';
import 'package:harvestx/features/home/screens/for_both/cart/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils.dart';
import '../../../../../models/product_model.dart';
import '../../../../../theme/pallet.dart';
import 'widgets/details.dart';
import 'widgets/expendable.dart';
import 'widgets/header.dart';
import 'package:collection/collection.dart';
import 'package:badges/badges.dart' as badge;

class ItemDetailsSreen extends StatefulWidget {
  static const routeName = 'item-details-screen/';
  final MGrocery item;

  const ItemDetailsSreen({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDetailsSreen> createState() => _ItemDetailsSreenState();
}

class _ItemDetailsSreenState extends State<ItemDetailsSreen> {
  List images = [];
  @override
  void initState() {
    super.initState();
    images.add(widget.item.url);
  }

  @override
  Widget build(BuildContext context) {
    var existingItemCart = context.read<Cart>().getItems.firstWhereOrNull(
        (product) => product.name == widget.item.name /*productId*/);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: widget.item),
              Details(item: widget.item),
              const SizedBox(height: 15),
              Divider(color: Pallete.kBorderColor),
              Expandable(
                title: 'Product Details',
                description: widget.item.description,
                trailing: Container(),
              ),
              Divider(color: Pallete.kBorderColor, indent: 15, endIndent: 15),
              Expandable(
                title: 'Nutrition',
                trailing: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallete.kSecondaryColor,
                  ),
                  child: const Text('100gr'),
                ),
                description: '',
              ),
              Divider(color: Pallete.kBorderColor, indent: 15, endIndent: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Expandable(
                  title: 'Reviews',
                  trailing: Row(
                    children: List.generate(
                        5,
                        (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            )),
                  ),
                  description: null,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.store)),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          back: BackButton(
                            onPressed: () => Navigator.pop(context),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: badge.Badge(
                    badgeAnimation: const badge.BadgeAnimation.slide(),
                    badgeStyle: const badge.BadgeStyle(
                      badgeColor: Pallete.greenSecondary,
                      padding: EdgeInsets.all(3),
                    ),
                    showBadge:
                        context.read<Cart>().getItems.isEmpty ? false : true,
                    badgeContent: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        context.watch<Cart>().getItems.length.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    child: const Icon(Icons.shopping_cart),
                  ),
                ),
              ],
            ),
            GreenButton(
              label: existingItemCart != null ? 'added to cart' : 'Add To Cart',
              onPressed: () {
                existingItemCart != null
                    ? showSnackBar(context, 'this item is already in cart')
                    : context.read<Cart>().addItem(
                          widget.item.name,
                          widget.item.price,
                          1,
                          20,
                          images,
                          'proId',
                          'suppId',
                        );
              },
              width: 0.45,
            ),
          ],
        ),
      ),
    );
  }
}
