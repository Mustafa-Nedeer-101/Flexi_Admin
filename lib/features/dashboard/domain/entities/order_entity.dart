import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/utils/helpers/helper_functions.dart';
import 'package:admin/features/dashboard/domain/entities/address_entity.dart';
import 'package:admin/features/dashboard/domain/entities/cart_item_model.dart';

class OrderEntity {
  OrderEntity({
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    required this.items,
  });

  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressEntity? address;
  final DateTime? deliveryDate;
  final List<CartItemEntity> items;

  String get formattedOrderDate => UHelperFunctions.getFormattedDate(orderDate);
  String get formattedDeliveryDate => deliveryDate != null
      ? UHelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';
}
