import 'package:admin/core/common/loaders/animation_loader.dart';
import 'package:admin/core/constants/images.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/dashboard/domain/entities/order_entity.dart';
import 'package:admin/features/dashboard/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    // Handle Nothing
    if (orders.isEmpty) {
      return CustomAnimationLoaderWidget(
        text: 'Whoops! No orders yet!',
        animation: CImages.orders,
        height: CSizes.imageCarouselHeight,
        onActionPressed: () {},
      );
    } else {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: orders.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: CSizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) {
          final order = orders[index];

          return OrderItem(order: order);
        },
      );
    }
  }
}
