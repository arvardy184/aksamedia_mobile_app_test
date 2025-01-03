import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class StockInfo extends StatelessWidget {
  final int stock;

  const StockInfo({
    Key? key,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: AppTypography.bodyRegularNormal,
            children: <TextSpan>[
           TextSpan(
            text: 'Stok: ',
            style: AppTypography.bodyRegularNormal.copyWith(
              color: AppColors.primary[950]
            )
            
          ),
          TextSpan(
            text: '$stock pcs',
            style: AppTypography.bodyRegularNormal.copyWith(
              fontWeight: FontWeight.bold,
                color: AppColors.primary[950]
            ),
          ),
        ]));
  }
}
