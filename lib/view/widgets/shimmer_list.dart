
import 'package:clipwise_ai_assignment/view/widgets/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.all(size.width * .02),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                ShimmerClass(
                  height: 10,
                  child: Container(
                    color: Colors.black12,
                    width: size.width,
                    height: 10,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ShimmerClass(
                  height: 20,
                  child: Container(
                    width: size.width,
                    height: 10,
                    color: Colors.black12,
                  ),
                ),
                ShimmerClass(
                  height: 5,
                  child: Container(
                    color: Colors.black12,
                    width: size.width,
                    height: 10,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
