import 'package:aksamedia_mobile_app_test/features/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailController extends ChangeNotifier {
  // Image slider
  final PageController imageController = PageController();
  int _currentImageIndex = 0;

  // Product state
  final String title = 'Beauty Set by Irvie';
  final String store = 'Irvie group official';
  final double customerPrice = 178000;
  final double resellerPrice = 142400;
  final double commission = 35600;
  final double commissionPercentage = 20;
  final int stock = 999;

  // Selection state
  String _selectedSize = 'Paket 1'; //nilai default nya
  Color? _selectedColor;
  bool _isDescriptionExpanded = false;

  String? _errorMessage;

  // Getters
  int get currentImageIndex => _currentImageIndex;
  String get selectedSize => _selectedSize;
  Color? get selectedColor => _selectedColor;
  bool get isDescriptionExpanded => _isDescriptionExpanded;

  String? get errorMessage => _errorMessage;

  final List<String> images = [
    'assets/images/detail_img.png',
    'assets/images/detail_img.png',
    'assets/images/detail_img.png',
  ];

  final List<String> sizes = ['Paket 1', 'Paket 2'];

  final List<Color> colors = [
    const Color(0xFFE4C19C),
    const Color(0xFF4A3728),
  ];

  final String description = '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.
Menggunakan fit Relaxed Fit.

*Keunggulan Produk:*
- Bahan adem dan ringan, cocok untuk berbagai aktivitas.
- Tersedia dalam berbagai warna modern.
- Cocok untuk acara formal maupun santai.

*Perawatan:*
1. Cuci menggunakan deterjen ringan.
2. Jangan menggunakan pemutih.
3. Setrika dengan suhu rendah.

*Ukuran dan Dimensi:*
- S: Lingkar dada 88 cm, panjang 70 cm
- M: Lingkar dada 94 cm, panjang 72 cm
- L: Lingkar dada 100 cm, panjang 74 cm
- XL: Lingkar dada 106 cm, panjang 76 cm

*Catatan:*
Produk ini menggunakan bahan alami yang ramah lingkungan. Perbedaan warna sedikit mungkin terjadi karena pencahayaan saat pemotretan.''';

  final List<ProductModel> recommendedProducts = [
    ProductModel(
      title: 'Beauty Set by Irvie',
      shopName: 'Irvie group official',
      description: '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.''',
      priceCustomer: 178000,
      priceReseller: 142400,
      commision: 35600,
      commisionPercentage: 20,
      stock: 999,
      isNew: true,
      images: [
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
      ],
    ),
    ProductModel(
      title: 'Beauty Set by Irvie',
      shopName: 'Irvie group official',
      description: '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.''',
      priceCustomer: 178000,
      priceReseller: 142400,
      commision: 35600,
      commisionPercentage: 20,
      stock: 999,
      isNew: false,
      images: [
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
      ],
    ),
    ProductModel(
      title: 'Beauty Set by Irvie',
      shopName: 'Irvie group official',
      description: '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.''',
      priceCustomer: 178000,
      priceReseller: 142400,
      commision: 35600,
      commisionPercentage: 20,
      stock: 999,
      isNew: true,
      images: [
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
      ],
    ),
  ];
  final List<ProductModel> similarProducts = [
    ProductModel(
      title: 'Beauty Set by Irvie',
      shopName: 'Irvie group official',
      description: '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.''',
      priceCustomer: 178000,
      priceReseller: 142400,
      commision: 35600,
      commisionPercentage: 20,
      stock: 101,
      isNew: false,
      images: [
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
      ],
    ),
    ProductModel(
      title: 'Beauty Set by Irvie',
      shopName: 'Irvie group official',
      description: '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.''',
      priceCustomer: 178000,
      priceReseller: 142400,
      commision: 35600,
      commisionPercentage: 20,
      stock: 99,
      isNew: true,
      images: [
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
      ],
    ),
    ProductModel(
      title: 'Beauty Set by Irvie',
      shopName: 'Irvie group official',
      description: '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.''',
      priceCustomer: 178000,
      priceReseller: 142400,
      commision: 35600,
      commisionPercentage: 20,
      stock: 99,
      isNew: false,
      images: [
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
      ],
    ),
    ProductModel(
      title: 'Beauty Set by Irvie',
      shopName: 'Irvie group official',
      description: '''*New Material*
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.''',
      priceCustomer: 178000,
      priceReseller: 142400,
      commision: 35600,
      commisionPercentage: 20,
      stock: 999,
      isNew: true,
      images: [
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
        'assets/images/detail_img.png',
      ],
    ),
  ];

  // 1) Image slider
  void onImageChanged(int index) {
    _currentImageIndex = index;
    notifyListeners();
  }

  // 2) Size selection
  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  // 3) Color selection
  void selectColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  // 4) Description toggle
  void toggleDescription() {
    _isDescriptionExpanded = !_isDescriptionExpanded;
    notifyListeners();
  }

  // 5) Add to store
  void addToStore() {
    if (_selectedColor == null) {
      _errorMessage = 'Pilih warna terlebih dahulu';
      notifyListeners();
      return;
    }

    debugPrint('Menambahkan $title ke store dengan warna $_selectedColor');
  }

  // 6) Add to cart
  void addToCart() {
    if (_selectedColor == null) {
      _errorMessage = 'Pilih warna terlebih dahulu';
      notifyListeners();
      return;
    }

    debugPrint('Menambahkan $title ke keranjang dengan warna $_selectedColor');
  }

  // 7) Format price
  String formatPrice(double price) {
    final raw = price.toStringAsFixed(0);
    final regex = RegExp(r'(\d)(?=(\d{3})+$)');
    return raw.replaceAllMapped(regex, (m) => '${m[1]}.');
  }

  // 8) copy to clipboard
  Future<void> copyToClipboard(String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
      _errorMessage = 'Teks berhasil disalin';
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Gagal menyalin teks';
      notifyListeners();
    }

    Future.delayed(const Duration(seconds: 2), () {
      _errorMessage = null;
      notifyListeners();
    });
  }

  void copyProductDetails() {
    final formattedCustomerPrice = formatPrice(customerPrice);
    final formattedResellerPrice = formatPrice(resellerPrice);

    final textToCopy = '''
$title
Harga Customer: Rp$formattedCustomerPrice
Harga Reseller: Rp$formattedResellerPrice
Komisi: ${commissionPercentage.toStringAsFixed(0)}%
Stok: $stock pcs

$description
''';

    copyToClipboard(textToCopy);
  }

  //10) share product
  void shareProduct() async {
    final formattedCustomerPrice = formatPrice(customerPrice);
    final formattedResellerPrice = formatPrice(resellerPrice);

    final textToShare = '''
$title
Harga Customer: Rp$formattedCustomerPrice
Harga Reseller: Rp$formattedResellerPrice
Komisi: ${commissionPercentage.toStringAsFixed(0)}%
Stok: $stock pcs

$description
''';

    try {
      await Share.share(
        textToShare,
        subject: title,
      );
     
    } catch (e) {
      _errorMessage = 'Gagal membagikan produk';
      notifyListeners();

      // Clear error after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        _errorMessage = null;
        notifyListeners();
      });
    }
  }

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }
}
