import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harvestx/theme/pallet.dart';

class GreenButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final double width;

  const GreenButton({
    required this.label,
    required this.onPressed,
    required this.width,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        color: Pallete.primaryGreen,
        borderRadius: BorderRadius.circular(25),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          label,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
