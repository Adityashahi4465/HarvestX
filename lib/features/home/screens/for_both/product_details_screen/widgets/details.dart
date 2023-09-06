import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../models/product_model.dart';
import '../../../../../../theme/pallet.dart';


class Details extends StatelessWidget {
  final MGrocery item;
  const Details({
    Key ?key,
   required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: Pallete.kTitleStyle.copyWith(fontSize: 18),
              ),
              SvgPicture.asset(
                'assets/icons/favorite.svg',
                color: Pallete.kBlackColor.withOpacity(0.7),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            item.description,
            style: Pallete.kDescriptionStyle,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.horizontal_rule, color: Pallete.kBlackColor.withOpacity(0.7),),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Pallete.kBorderColor),                  
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('1', style:Pallete. kTitleStyle,),
              ),
              Icon(Icons.add, color: Pallete.kPrimaryColor),
              Spacer(),
              Text('\$${item.price}', style: Pallete.kTitleStyle.copyWith(fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }
}