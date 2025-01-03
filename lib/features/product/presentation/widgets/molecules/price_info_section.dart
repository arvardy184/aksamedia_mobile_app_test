import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceInfo extends StatelessWidget {
  final double priceCustomer;
  final double priceReseller;

  const PriceInfo({
    Key? key,
    required this.priceCustomer,
    required this.priceReseller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Rp ${priceCustomer.toStringAsFixed(0)}',
                    style: AppTypography.bodyRegularNormal
                        .copyWith(fontWeight: FontWeight.bold)),
                const Text('Harga Customer'),
              ],
            ),
            Container(width: 2, height: 32, color: AppColors.primary[500]),
            Column(
              children: [
                Text(
                  'Rp ${priceReseller.toStringAsFixed(0)}',
                  style: AppTypography.bodyRegularNormal
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text('Harga Reseller'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
