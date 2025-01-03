import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/molecules/price_info_section.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/molecules/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../molecules/color_selector.dart';
import '../molecules/stock_info.dart';
import '../molecules/description_section.dart';
import '../../controller/product_detail_controller.dart';

class ProductDetailInfo extends StatelessWidget {
  const ProductDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<ProductDetailController>();

    final product = controller;

    // Jika product == null, tampilkan SizedBox kosong
    if (product == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =============== Label New & Product Baru ===============
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: AppColors.secondary[500]!,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text('NEW',
                          style: AppTypography.bodyRegular.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(width: 8),
                      const Text(
                        'Product Baru',
                        style: AppTypography.bodyRegularNormal,
                      ),
                    ],
                  ),
                ),

                const Spacer(),
                // Tombol Share
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: () => controller.shareProduct(),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // =============== Nama Produk + Toko ===============
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text(
              product.store,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 8),

            // =============== Price Info ===============
            PriceInfo(
              priceCustomer: product.customerPrice,
              priceReseller: product.resellerPrice,
            ),

            // =============== Komisi (jika ada) ===============

           Container(
            width: double.infinity - 32,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: AppColors.secondary[500],
          ),
          child: Center(
            child:RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black), // Default style
    children: [
      const TextSpan(
        text: 'Komisi Rp.',
        style: AppTypography.bodyRegularNormal,
      ),
      TextSpan(
        text: controller.formatPrice(product.commission),
        style: AppTypography.bodyLargeNormal.copyWith(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: ' (${product.commissionPercentage}%)',
        style: AppTypography.bodyRegularNormal,
      ),
    ],
  ),
)

          ),
        ),

            const SizedBox(height: 8),

            // =============== Pilihan Paket ===============
        // Di dalam ProductDetailInfo
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey[300]!),
    borderRadius: BorderRadius.circular(8),
  ),
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Ukuran",
        style: AppTypography.bodyRegularNormal,
      ),
      // Package Selector
      PackageSelector(
        packages: product.sizes,
        selectedPackage: controller.selectedSize,
        onPackageSelected: controller.selectSize,
      ),
      const SizedBox(height: 16),

   

      // Color Selector
      ColorSelector(
        colors: product.colors,
        selectedColor: controller.selectedColor,
        onColorSelected: controller.selectColor,
      ),
      const SizedBox(height: 16),
  
      

      // Stock Info
      StockInfo(stock: product.stock),
    ],
  ),
),
const SizedBox(height: 10,),
   Divider(height: 1,color: AppColors.primary[400] ),

            // =============== Deskripsi ===============
            DescriptionSection(
              description: product.description,
              isExpanded: controller.isDescriptionExpanded,
              onToggleExpanded: controller.toggleDescription,
              onCopy: () {
                // Contoh handle copy
                // Clipboard.setData(ClipboardData(text: product.description));
              },
            ),
     
          ],
        ),
      ),
    );
  }
}
