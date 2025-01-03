
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/product_detail_controller.dart';

class ProductActionButtons extends StatelessWidget {
  const ProductActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductDetailController>();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: OutlinedButton(
              onPressed: () {
                controller.addToStore();
                if (controller.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(controller.errorMessage!)),
                  );
                }
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Tambahkan ke toko',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                controller.addToCart();
                if (controller.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(controller.errorMessage!)),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.zero,
              ),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
    );
  }
}