import 'package:hive/hive.dart';
import 'package:stock/model/stock.dart';

class StockRepository {
  final Box<Stock> _stockBox = Hive.box<Stock>('stockbox');

  List<Stock> getAllStock() {
    return _stockBox.values.toList();
  }

  void addStock(Stock stock) {
    _stockBox.add(stock);
  }

    void editStocks(Stock value) async {
    final stockIndex = _stockBox.keys.cast<int>().toList().indexOf(value.id??0);
    if (stockIndex != -1) {
    await  _stockBox.put(value.id, value);
      
    }
  }
  void deleteStock(int index) {
    _stockBox.deleteAt(index);
    getAllStock();
  }
}
