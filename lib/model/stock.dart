import 'package:hive/hive.dart';

part 'stock.g.dart';

@HiveType(typeId: 1)
class Stock {
  @HiveField(0)
  int? id;

  @HiveField(1)
 String? itemname;

  @HiveField(2)
 int? openingStock;

  @HiveField(3)
  int? reorderStock;

  @HiveField(4)
  String? stallNo;

  @HiveField(5)
  int? sellingPrice;

  @HiveField(6)
  int? costPrice;

   @HiveField(7)
  String? imagePath; 

  Stock({
    this.id,
    required this.itemname,
    required this.openingStock,
    required this.reorderStock,
    required this.stallNo,
    required this.sellingPrice,
    required this.costPrice,
    this.imagePath,
  });
}
