import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../screens/commonwidget/coursettitle/coursetitle.dart';
import '/constants/color.dart';
import '../../../screens/elementlist/imagelist.dart';
import '../../../screens/elementlist/pricelist.dart';
import '../../../screens/elementlist/stringlist.dart';

class FeatureCourseList extends StatelessWidget {
  const FeatureCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgrounghilghtcolor,
      shadowColor: const Color.fromARGB(255, 17, 17, 16),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 170,
        width: 500,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => GestureDetector(
                onTap: () => context.go('/video-player'),
                child: Container(
                  height: 250,
                  width: 178,
                  padding: const EdgeInsets.all(7),
                  child: Column(children: [
                    featurelistRow(
                      image: courselist[index],
                      name: coursedetail[index],
                      price: int.parse(pricelist[index].split('.').last),
                      discountPercent: 10,
                      rating: 4,
                    ),
                  ]).box.make(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
