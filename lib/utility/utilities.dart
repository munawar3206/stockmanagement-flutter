import 'package:flutter/material.dart';

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

  void restorePreviousQuantities(List<int> quantities) {
    for (int i = 0; i < quantityControllers.length; i++) {
      if (i < quantities.length) {
        quantityControllers[i].text = quantities[i].toString();
      }
    }
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
