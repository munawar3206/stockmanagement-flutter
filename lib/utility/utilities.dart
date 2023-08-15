import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock/model/stock.dart';

// stock calculation
class StockUtils {
  final List<TextEditingController> quantityControllers;

  StockUtils(this.quantityControllers);

  void decreaseStockQuantities() {
    for (var controller in quantityControllers) {
      int quantity = int.tryParse(controller.text) ?? 0;
      quantity--;
      controller.text = quantity.toString();
    }
  }

  void increaseStockQuantities() {
    for (var controller in quantityControllers) {
      int quantity = int.tryParse(controller.text) ?? 0;
      quantity++;
      controller.text = quantity.toString();
    }
  }

  int getTotalQuantity() {
    int totalQuantity = 0;
    for (var controller in quantityControllers) {
      totalQuantity += int.tryParse(controller.text) ?? 0;
    }
    return totalQuantity;
  }


  List<int> saveQuantities() {
    List<int> quantities = [];
    for (var controller in quantityControllers) {
      int quantity = int.tryParse(controller.text) ?? 0;
      quantities.add(quantity);
    }
    return quantities;
  }
}

// image
class ImageUtils {
  static Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: source);
    return picked;
  }
}
