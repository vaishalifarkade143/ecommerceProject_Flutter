import 'package:ecommerseproject/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoicesChips extends StatelessWidget {
  const TChoicesChips({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) ;
    return Theme(
      data : Theme.of(context).copyWith(
     canvasColor: Colors.transparent
      ),
      child: ChoiceChip(
        label: isColor != null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        // ignore: dead_code
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor != null ? CircularContainer(
          width: 50,
          height: 50,
          backgroundColor: THelperFunctions.getColor(text)!): null ,
        
        shape: isColor != null ? CircleBorder() : null,
        labelPadding: isColor != null ? EdgeInsets.all(0) : null ,
        padding: isColor != null ? EdgeInsets.all(0) : null ,
        // ignore: prefer_null_aware_operators
        backgroundColor: isColor != null ? THelperFunctions.getColor(text)! : null ,
      ),
    );
  }
}
