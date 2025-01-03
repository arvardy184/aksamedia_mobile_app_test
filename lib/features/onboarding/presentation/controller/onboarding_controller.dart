import 'package:aksamedia_mobile_app_test/features/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingController  extends ChangeNotifier{
  final PageController pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      imagePath: 'assets/images/onboarding_1.png',
      title: 'Gratis Materi Belajar Menjadi Seller Handal',
      description: 'Nggak bisa jualan? \nJangan khawatir, Tokorame akan membimbing kamu hingga menjadi seller langsung dari ahlinya',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding_2.png',
      title: 'Ribuan Produk dengan Kualitas Terbaik',
      description: 'Tokorame menyediakan ribuan produk dengan kualitas terbaik dari seller terpercaya',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding_3.png',
      title: 'Toko Online Unik Untuk Kamu Jualan',
      description: 'Subdomain unik dan toko online profesional siap pakai',
    ),
  ];

  int get currentPage => _currentPage;

  bool get isLastPage => _currentPage == onboardingItems.length - 1;

  void nextPage(){
    if(!isLastPage){
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void onPageChanged(int page){
    _currentPage = page;
    notifyListeners();
  }

  @override 
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
}