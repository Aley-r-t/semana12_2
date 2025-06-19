// lib/utils/extensions.dart

extension FechaCorta on DateTime {
  String toShortDate() {
    final d = this;
    return '${d.day.toString().padLeft(2, '0')}/'
           '${d.month.toString().padLeft(2, '0')}/'
           '${d.year}';
  }
}
