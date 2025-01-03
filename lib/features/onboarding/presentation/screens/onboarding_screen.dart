
import 'package:aksamedia_mobile_app_test/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:aksamedia_mobile_app_test/features/product/presentation/screens/product_detail_screen.dart';
import 'package:aksamedia_mobile_app_test/shared/atomic/atoms/onboarding_skip_button.dart';
import 'package:aksamedia_mobile_app_test/shared/atomic/organisms/onboarding_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<OnboardingController>(
          builder: (context, controller, _) {
            return Stack(
              children: [
                Positioned.fill(
                  bottom: MediaQuery.of(context).size.height * 0.3,
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.onboardingItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.onboardingItems[index];
                      return Image.asset(item.imagePath, fit: BoxFit.cover);
                    },
                  ),
                ),
                OnboardingSkipButton(onPressed: () {
                  // Navigasi ke halaman berikut
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
                }),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.39,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: controller.onboardingItems.length,
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.37,
                  child: OnboardingFooter(
                    title: controller.onboardingItems[controller.currentPage].title,
                    description: controller.onboardingItems[controller.currentPage].description,
                    isLastPage: controller.isLastPage,
                    onNext: controller.isLastPage
                        ? () {
                            // Navigasi ke layar utama
                          }
                        : controller.nextPage,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
