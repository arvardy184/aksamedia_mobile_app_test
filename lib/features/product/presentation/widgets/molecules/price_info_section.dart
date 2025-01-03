import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:aksamedia_mobile_app_test/shared/utils/formatters.dart';
import 'package:flutter/material.dart';

class PriceInfo extends StatelessWidget {
  final double priceCustomer;
  final double priceReseller;

  const PriceInfo({
    super.key,
    required this.priceCustomer,
    required this.priceReseller,
  });

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
            
                Text(
                 'Rp ${priceCustomer.toRupiah()}',
                       style: AppTypography.bodyRegularNormal
                      .copyWith(fontWeight: FontWeight.bold)
                ),
                const Text('Harga Customer'),
              ],
            ),
            Container(width: 2, height: 32, color: AppColors.primary[500]),
            Column(
              children: [
                Text(
                  'Rp ${priceReseller.toRupiah()}',
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
