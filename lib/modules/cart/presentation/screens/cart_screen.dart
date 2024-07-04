import 'package:flutter/material.dart';
import 'package:mindmorph/widgets/error_page.dart';
import 'package:mindmorph/widgets/loading_indicator.dart';
import '../../data/repositories/cart_repository.dart';
import '../widgets/cart_screen_view.dart';
import '/constants/color.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: featureColor),
        toolbarHeight: 80,
        shadowColor: Colors.white,
        foregroundColor: Colors.red,
        backgroundColor: themecolor,
        title: const Text(
          'Cart Items',
          style: TextStyle(color: titlecolor),
        ),
      ),
      body: FutureBuilder<CartData>(
        future: CartRepository.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MindMorphLoadingIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const ErrorPage(message: 'No data available');
          } else {
            final cart = snapshot.data!;

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Total price: '),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: CartScreenView(cart: cart),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
