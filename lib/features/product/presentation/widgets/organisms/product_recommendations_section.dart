import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:aksamedia_mobile_app_test/features/product/models/product_model.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/molecules/product_car_item.dart';
import 'package:flutter/material.dart';

class ProductRecommendationsSection extends StatelessWidget {
  final String shopName;
  final List<ProductModel> recommendedProducts;
  final List<ProductModel> similarProducts;

  const ProductRecommendationsSection({
    super.key,
    required this.shopName,
    required this.recommendedProducts,
    required this.similarProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 1,
            color: AppColors.primary[300],
          ),
          const SizedBox(height: 24),

          // Section Produk lain
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Produk lain dari $shopName',
              style: AppTypography.bodyRegularNormal.copyWith(
                color: AppColors.primary[950],
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // List Produk Horizontal
          SizedBox(
            height: 350,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: recommendedProducts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = recommendedProducts[index];
                return SizedBox(
                  width: 190,
                  child: ProductCardItem(
                    title: item.title ?? '',
                    imageUrl: item.images?[0] ?? '',
                    price: item.priceCustomer ?? 0,
                    stock: item.stock ?? 0,
                    isNew: item.isNew,
                    commissionPercent: item.commisionPercentage ?? 0,
                    onShare: (){
                      
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),


          // Section Produk Serupa
           Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Produk Serupa',
              style: AppTypography.bodyRegularNormal.copyWith(
                color: AppColors.primary[950],
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // List Produk Serupa
          SizedBox(
            height: 350,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: similarProducts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = similarProducts[index];
                return SizedBox(
                  width: 190,
                  child: ProductCardItem(
                    title: item.title ?? '',
                    imageUrl: item.images?[0] ?? '',
                    price: item.priceCustomer ?? 0,
                    stock: item.stock ?? 0,
                    isNew: item.isNew,
                    commissionPercent: item.commisionPercentage ?? 0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
