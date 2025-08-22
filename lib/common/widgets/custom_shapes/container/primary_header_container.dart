import 'package:ecommerseproject/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.only(bottom:  0),
        child: SizedBox(
        height: 350,
        child: Stack(
          children: [
            ///Background custom Shape
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
