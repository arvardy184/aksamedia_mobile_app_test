import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';

class ProductBottomSheetShare extends StatelessWidget {
  const ProductBottomSheetShare({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductDetailController>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
          
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Text(
                'Bagikan Produk',
                style: AppTypography.bodyRegular.copyWith(
                  fontWeight: FontWeight.w500,
                  
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(width: 24),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            
          ),
          _buildShareOption(
            icon: Icons.link,
            title: 'Teks dan Link',
            onTap: () {
              controller.shareProduct();
              Navigator.pop(context);
            },
          ),
           Divider(height: 1,color: AppColors.primary[400],), 
          const SizedBox(height: 8),
          _buildShareOption(
            icon: Icons.image,
            title: 'Gambar',
            onTap: () {
              controller.shareProduct();
              Navigator.pop(context);
            },
          ), Divider(height: 1,color: AppColors.primary[400],), 
        ],
      ),
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
           
            const SizedBox(width: 16),
            Text(
              title,
              style: AppTypography.bodyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
