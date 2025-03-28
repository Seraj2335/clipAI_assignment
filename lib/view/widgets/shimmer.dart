import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerClass extends StatelessWidget {
  final Widget child;
  final double height;
  const ShimmerClass({super.key, required this.child,required this.height});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.red,
        child: SizedBox(
            height: height,
            child: child));
  }
}