import 'package:stock/model/stock.dart';

List<Stock> searchStocks(List<Stock> stocks, String searchQuery) {
  return stocks.where((stock) =>
      stock.itemname!.toLowerCase().contains(searchQuery.toLowerCase()) ||
      stock.stallNo!.toLowerCase().contains(searchQuery.toLowerCase())).toList();
}
