import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomePage extends StatefulWidget {
  const ShimmerHomePage({super.key});

  @override
  State<ShimmerHomePage> createState() => _ShimmerHomePageState();
}

class _ShimmerHomePageState extends State<ShimmerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.blueAccent.withOpacity(.1)!,
        highlightColor: Colors.blueAccent.withOpacity(.02)!,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 3.h, right: 3.h),
              child: Container(
                height: 24.h,
                
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}