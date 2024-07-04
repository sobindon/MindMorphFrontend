import 'package:flutter/material.dart';
import 'package:mindmorph/constants/color.dart';
import 'package:mindmorph/constants/urls.dart';
import 'package:mindmorph/modules/cart/data/repositories/cart_repository.dart';

class CartScreenView extends StatelessWidget {
  const CartScreenView({
    super.key,
    required this.cart,
  });

  final CartData cart;

  @override
  Widget build(BuildContext context) {
    final mapData = cart.mainServer.toMapData();
    return Container(
      color: backgrounghilghtcolor,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: listcolor),
                  onPressed: () {},
                  child: const Text(
                    'Buy all',
                    style: TextStyle(color: featureColor),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: listcolor, elevation: 20),
                  onPressed: () {},
                  child: const Text(
                    'Price',
                    style: TextStyle(color: featureColor),
                  ))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cart.courseServer.length,
              itemBuilder: ((context, index) {
                final data1 = cart.courseServer[index];
                final data2 = mapData[data1.courseId];
                return Card(
                  color: boxtilecolor,
                  semanticContainer: true,
                  clipBehavior: Clip.hardEdge,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    leading: Container(
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      width: 100,
                      height: 150,
                      child: Image.network(
                        'http://$COURSE_SERVER/${data1.courseThumbnailUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      data1.title,
                      style: const TextStyle(color: titlecolor),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 5),
                            Text(
                              data2!.course.author.fullName,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 176, 176, 175)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: listcolor),
                                onPressed: () {},
                                child: const Text(
                                  'Buy',
                                  style: TextStyle(color: Colors.amber),
                                ))
                          ],
                        ),
                        Text(
                          'Rs ${data2.course.price}',
                          style: const TextStyle(color: Colors.amber),
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 171, 90, 84),
                    ),
                    onTap: null,
                  ),
                );
              })),
        ],
      ),
    );
  }
}
