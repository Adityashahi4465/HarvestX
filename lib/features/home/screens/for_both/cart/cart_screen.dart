import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:harvestx/core/common/alert_dialog.dart';
import 'package:harvestx/core/providers/cart_provider.dart';
import 'package:harvestx/core/utils.dart';

import '../../../../../core/common/green_button.dart';
import 'package:provider/provider.dart';

import '../place_order/screen/place_order.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({
    this.back,
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double total = context.watch<Cart>().totalPrice;

    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Your Cart',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
            leading: widget.back,
            actions: [
              context.watch<Cart>().getItems.isEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        MyAlertDialog.showMyDialog(
                          context: context,
                          title: 'Clear Cart',
                          content: 'Are you sure to clear cart',
                          tabNo: () {
                            Navigator.pop(context);
                          },
                          tabYes: () {
                            Navigator.pop(context);
                            context.read<Cart>().clearCart();
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
            ],
          ),
          body: context.watch<Cart>().getItems.isNotEmpty
              ? Consumer<Cart>(
                  builder: (context, cart, child) {
                    return ListView.builder(
                        itemCount: cart.getItems.length,
                        itemBuilder: (context, index) {
                          final product = cart.getItems[index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 120,
                                      child: Image.network(
                                        cart.getItems[index].imagesUrl.first,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              product.name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  product.price
                                                      .toStringAsFixed(2),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      product.qty == 1
                                                          ? IconButton(
                                                              onPressed: () {
                                                                cart.removeItem(
                                                                    product);
                                                              },
                                                              icon: const Icon(
                                                                Icons
                                                                    .delete_forever,
                                                                size: 18,
                                                              ),
                                                            )
                                                          : IconButton(
                                                              onPressed: () {
                                                                cart.decrement(
                                                                    product);
                                                              },
                                                              icon: const Icon(
                                                                EvaIcons.minus,
                                                                size: 18,
                                                              ),
                                                            ),
                                                      Text(
                                                        product.qty.toString(),
                                                        style: product.qty ==
                                                                product.qntty
                                                            ? const TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    Colors.red,
                                                              )
                                                            : const TextStyle(
                                                                fontSize: 20,
                                                              ),
                                                      ),
                                                      IconButton(
                                                        onPressed: product
                                                                    .qty ==
                                                                product.qntty
                                                            ? null
                                                            : () {
                                                                cart.increment(
                                                                    product);
                                                              },
                                                        icon: const Icon(
                                                          EvaIcons.plus,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your Cart is Empty!',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Material(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(25),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.6,
                          onPressed: () {
                            Navigator.canPop(context)
                                ? Navigator.pop(context)
                                : Navigator.pushReplacementNamed(
                                    context, '/customer_home');
                          },
                          child: const Text(
                            'Continue Shopping',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Total: \$',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      total.toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                GreenButton(
                  label: 'CHECK OUT',
                  width: 0.45,
                  onPressed: total == 0
                      ? null
                      : () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PlaceOrderScreen(),
                              ));
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
