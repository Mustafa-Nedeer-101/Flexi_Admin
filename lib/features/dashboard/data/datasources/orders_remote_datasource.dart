import 'package:admin/features/dashboard/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class OrdersRemoteDatasource {
  // Fetch user's order history
  Future<List<OrderModel>> getUserOrders({String? userId});
}

class OrdersRemoteDatasourceImp implements OrdersRemoteDatasource {
  final FirebaseFirestore firestore;

  OrdersRemoteDatasourceImp({required this.firestore});
  // Return all order related to curent user
  @override
  Future<List<OrderModel>> getUserOrders({String? userId}) async {
    // Check for Authentication first
    if (userId == null || userId.isEmpty) {
      throw 'Unable to find user information. Try again in few minutes';
    }

    final result = await firestore
        .collection('Users')
        .doc(userId)
        .collection('Orders')
        .orderBy("OrderDate", descending: true)
        .get();

    return result.docs
        .map((doc) => OrderModel.instanceFromQueryDocumentSnapshot(doc))
        .toList();
  }
}
