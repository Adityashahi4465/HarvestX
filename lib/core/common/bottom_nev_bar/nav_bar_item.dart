import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/pallet.dart';
import 'package:badges/badges.dart' as badge;

import '../../providers/cart_provider.dart';

class NavBarItem extends StatefulWidget {
  final int index;
  final int activeIndex;
  final dynamic icon;
  final ValueChanged<int> onTabChanged;
  const NavBarItem({
    Key? key,
    this.icon,
    required this.index,
    required this.activeIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 1,
      upperBound: 1.3,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTap() {
    // change currentIndex to this tab's index
    if (widget.index != widget.activeIndex) {
      widget.onTabChanged(widget.index);
      _controller.forward().then((value) => _controller.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ScaleTransition(
            scale: _controller,
            child: widget.index == 2
                ? badge.Badge(
                    badgeAnimation: const badge.BadgeAnimation.slide(),
                    badgeStyle: const badge.BadgeStyle(
                        badgeColor: Pallete.greenSecondary,
                        padding: EdgeInsets.all(3)),
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
                  )
                : Icon(
                    widget.icon['icon'],
                    color: widget.activeIndex == widget.index
                        ? Pallete.kPrimaryColor
                        : null,
                  ),
          ),
          // Spacer(),
          Text(
            widget.icon['title'],
            style: TextStyle(
                color: widget.activeIndex == widget.index
                    ? Pallete.kPrimaryColor
                    : null),
          ),
        ],
      ),
    );
  }
}
