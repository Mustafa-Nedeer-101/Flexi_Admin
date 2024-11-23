import 'package:admin/core/constants/enums.dart';
import 'package:flutter/material.dart';

class SHelpers {
  static Color getOrderStatusColor(OrderStatus value) {
    switch (value) {
      case OrderStatus.pending:
        return Colors.blue;
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.shipped:
        return Colors.purple;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
