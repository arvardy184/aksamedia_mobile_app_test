import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/atoms/flag_shape.dart';
import 'package:flutter/material.dart';

class ProductCardItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final int stock;
  final bool isNew;
  final double commissionPercent;
  final VoidCallback? onShare;
  final VoidCallback? onTap;

  const ProductCardItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.stock,
    this.isNew = false,
    this.commissionPercent = 0,
    this.onShare,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
             if (isNew)
  Positioned(
    top: 0,
    right: 8,
    child: Container(
      decoration: const ShapeDecoration(

        color: Colors.yellow,
        shape: FlagShape(),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: const Text(
        'New',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.info[500],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${commissionPercent.toStringAsFixed(0)}% Komisi',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Harga reseller',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rp${price.toStringAsFixed(0)}',
                          style: AppTypography.bodySmallNormal.copyWith(
                              color: AppColors.success[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Row(
                        children: [
                          const Icon(
                            Icons.inventory_2_outlined,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$stock+ pcs',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onShare,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.primary[950]),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      child: Text('Bagikan Produk',
                          style: AppTypography.bodyXSmallNormal.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
