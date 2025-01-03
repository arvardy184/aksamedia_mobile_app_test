import 'package:aksamedia_mobile_app_test/features/product/presentation/controller/product_detail_controller.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/bottom_sheets/share_bottom_sheet.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/bottom_sheets/show_bottom_sheet.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/molecules/product_action_buttons.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/organisms/product_info.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/organisms/product_recommendations_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductDetailController>();

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share_outlined, color: Colors.white),
            onPressed: () => showCustomBottomSheet(context: context),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Image Section dengan Indicator
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: PageView.builder(
                        controller: controller.imageController,
                        onPageChanged: controller.onImageChanged,
                        itemCount: controller.images.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            controller.images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.05,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: controller.imageController,
                          count: controller.images.length,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: Colors.white,
                            dotColor: Colors.white,
                            dotHeight: 3,
                            dotWidth: 4,
                            expansionFactor: 4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Transform.translate(
                  offset: const Offset(0, -30),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductDetailInfo(),
                        ProductRecommendationsSection(
                          shopName: controller.store,
                          recommendedProducts: controller.recommendedProducts,
                          similarProducts: controller.similarProducts,
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Action Buttons
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:  ProductActionButtons()
          ),
        ],
      ),
    );
  }
}



// void _showShareBottomSheet(
//   BuildContext context,
//   ProductDetailController controller,
// ) {
//   showModalBottomSheet(
//     context: context,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(20),
//       ),
//     ),
//     builder: (_) => const ProductBottomSheetShare(),
//   );
// }
