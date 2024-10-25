import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class PartnerDetailsCard extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const PartnerDetailsCard({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: ElevarmBlur(
            blurColor: ElevarmColors.neutral100,
            borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
            overlay: child,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
