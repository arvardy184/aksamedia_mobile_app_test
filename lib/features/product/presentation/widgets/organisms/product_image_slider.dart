import 'package:aksamedia_mobile_app_test/features/product/presentation/controller/product_detail_controller.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/organisms/product_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImagesSlider extends StatelessWidget {
  final List<String> images;

  const ProductImagesSlider({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailController>(
      builder: (context, controller, _) {
        return Stack(
          children: [
            // Image Slider
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height * 0.35,
              child: PageView.builder(
                controller: controller.imageController,
                onPageChanged: controller.onImageChanged,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            
            // Page Indicator
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.37,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller.imageController,
                  count: images.length,
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
            
            // Content Card
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: ProductDetailInfo(), 
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}