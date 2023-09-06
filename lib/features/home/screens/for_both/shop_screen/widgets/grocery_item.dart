import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/mq.dart';
import '../../../../../../core/providers/cart_provider.dart';
import '../../../../../../core/utils.dart';
import '../../../../../../models/product_model.dart';
import '../../../../../../theme/pallet.dart';
import '../../product_details_screen/details_screen.dart';
import 'package:collection/collection.dart';

class GroceryItem extends StatefulWidget {
  final MGrocery item;
  const GroceryItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<GroceryItem> createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryItem> {
  void onTap(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ItemDetailsSreen(item: widget.item)));
  }

  List images = [];

  @override
  void initState() {
    super.initState();
    images.add(widget.item.url);
  }

  @override
  Widget build(BuildContext context) {
    var existingItemCart = context.watch<Cart>().getItems.firstWhereOrNull(
        (product) => product.name == widget.item.name /*productId*/);
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: MQuery.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(color: Pallete.kBorderColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.item.hashCode,
                  child: Image.network(
                    widget.item.url,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "  ${widget.item.name.length > 20 ? widget.item.name.substring(0, 23) : widget.item.name}...",
                  style: Pallete.kTitleStyle,
                  // overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.item.price}',
                      style: Pallete.kTitleStyle
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 36,
                      width: 36,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Pallete.kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          existingItemCart != null
                              ? showSnackBar(
                                  context, 'this item is already in cart')
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
                        icon: Icon(
                          existingItemCart != null
                              ? EvaIcons.checkmark
                              : EvaIcons.plus,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
