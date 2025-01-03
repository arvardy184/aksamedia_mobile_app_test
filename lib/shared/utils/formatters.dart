extension PriceFormatter on double {
  String toRupiah() {
    final raw = toStringAsFixed(0);
    final regex = RegExp(r'(\d)(?=(\d{3})+$)');
    return raw.replaceAllMapped(regex, (m) => '${m[1]}.');
  }
}