import 'package:admin/core/constants/enums.dart';
import 'package:admin/features/dashboard/data/models/address_model.dart';
import 'package:admin/features/dashboard/data/models/cart_item_model.dart';
import 'package:admin/features/dashboard/domain/entities/order_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    super.userId = '',
    required super.status,
    required super.totalAmount,
    required super.orderDate,
    super.paymentMethod = 'Paypal',
    super.address,
    super.deliveryDate,
    required super.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UserId': userId,
      'Status': status.toString(),
      'TotalAmount': totalAmount,
      'OrderDate': orderDate,
      'PaymentMethod': paymentMethod,
      'Address': AddressModel.fromEntity(address).toJson(),
      'DeliveryDate': deliveryDate,
      'Items':
          items.map((item) => CartItemModel.fromEntity(item).toJson()).toList(),
    };
  }

  factory OrderModel.fromEntity(OrderEntity? entity) {
    if (entity == null) {
      return OrderModel.empty();
    } else {
      return OrderModel(
          id: entity.id,
          userId: entity.userId,
          address: entity.address,
          paymentMethod: entity.paymentMethod,
          deliveryDate: entity.deliveryDate,
          status: entity.status,
          totalAmount: entity.totalAmount,
          orderDate: entity.orderDate,
          items: entity.items);
    }
  }

  factory OrderModel.empty() {
    return OrderModel(
        id: '',
        status: OrderStatus.processing,
        totalAmount: 0,
        orderDate: DateTime.now(),
        items: []);
  }

  factory OrderModel.instanceFromQueryDocumentSnapshot(
      DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        id: data['Id'] as String,
        userId: data['UserId'] as String,
        status: OrderStatus.values
            .firstWhere((element) => element.toString() == data['Status']),
        totalAmount: data['TotalAmount'] as double,
        orderDate: (data['OrderDate'] as Timestamp).toDate(),
        paymentMethod: data['PaymentMethod'] as String,
        address: data['Address'] == null
            ? null
            : AddressModel.instanceFromMap(
                data['Address'] as Map<String, dynamic>),
        deliveryDate: data['DeliveryDate'] == null
            ? null
            : (data['DeliveryDate'] as Timestamp).toDate(),
        items: (data['Items'] as List<dynamic>)
            .map((item) => CartItemModel.instanceFromDocumentSnapshot(
                item as Map<String, dynamic>))
            .toList());
  }
}
