import 'package:admin/core/constants/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin/core/utils/managers/firebase_storage.dart';
import 'package:admin/features/products/data/models/product_model.dart';

abstract interface class ProductsRemoteDatasource {
  Future<List<ProductModel>> getfeaturedProducts();

  Future<List<ProductModel>> getProductsByQuery(Query query);

  Future<List<ProductModel>> getProductsforCategory(
      {required String categoryId, int limit = -1});

  Future<void> uploadProducts(List<ProductModel> products);

  Future<List<ProductModel>> getFavouritProducts(List<String> productIds);
}

class ProductsRemoteDatasourceImp implements ProductsRemoteDatasource {
  // Variables
  final _db = FirebaseFirestore.instance;
  final FirebaseStorageManager storage;

  ProductsRemoteDatasourceImp({
    required this.storage,
  });

  @override
  Future<List<ProductModel>> getfeaturedProducts() async {
    final querySnapshot = await _db
        .collection('Products')
        .where('IsFeatured', isEqualTo: true)
        .get();

    final List<ProductModel> list = querySnapshot.docs
        .map((documentSnapshot) =>
            ProductModel.instanceFromQuerySnapshot(documentSnapshot))
        .toList();

    return list;
  }

  @override
  Future<List<ProductModel>> getProductsByQuery(Query query) async {
    final querySnapshot = await query.get();

    final List<ProductModel> productList = querySnapshot.docs
        .map((documentSnapshot) => ProductModel.instanceFromQuerySnapshot(
            documentSnapshot as QueryDocumentSnapshot<Map<String, dynamic>>))
        .toList();

    return productList;
  }

  @override
  Future<List<ProductModel>> getProductsforCategory(
      {required String categoryId, int limit = -1}) async {
    final productCategoryQuery = limit == -1
        ? await _db
            .collection("ProductCategory")
            .where("CategoryId", isEqualTo: categoryId)
            .limit(30)
            .get()
        : await _db
            .collection("ProductCategory")
            .where("CategoryId", isEqualTo: categoryId)
            .limit(limit)
            .get();

    //Products ids strings
    final productIds =
        productCategoryQuery.docs.map((p) => p["ProductId"] as String).toList();

    // Products query
    final productsQuery = await _db
        .collection("Products")
        .where(FieldPath.documentId, whereIn: productIds)
        .get();

    //Products model
    final products = productsQuery.docs
        .map((product) => ProductModel.instanceFromQuerySnapshot(product))
        .toList();

    return products;
  }

  @override
  Future<void> uploadProducts(List<ProductModel> products) async {
    // Loop through each Product
    for (var product in products) {
      // Get ImageData Link from the local assets
      final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

      // Upload image and get its Url
      final url = await storage.uploadImageData("Products/Images/", thumbnail,
          product.thumbnail.split('/').last.toString());

      // Assign Url to Product.thumbnail attribute
      product.thumbnail = url;

      // Product list of images
      if (product.images != null && product.images!.isNotEmpty) {
        List<String> imagesUrl = [];

        for (var image in product.images!) {
          // Get ImageData Link from the local assets
          final assetImage = await storage.getImageDataFromAssets(image);

          // Upload image and get its Url
          final url = await storage.uploadImageData(
              "Products/Images/", assetImage, image.split('/').last.toString());

          // Add url to imagesUrl
          imagesUrl.add(url);
        }

        // Assign imagesUrl to product.images
        product.images!.clear();
        product.images!.setAll(0, imagesUrl);
      }

      // Upload variation images
      if (product.productType == ProductType.variable.toString()) {
        for (var variation in product.productVariations!) {
          // Get ImageData Link from the local assets
          final assetImage =
              await storage.getImageDataFromAssets(variation.image);

          // Upload image and get its Url
          final url = await storage.uploadImageData("Products/Images/",
              assetImage, variation.image.split('/').last.toString());

          // Assign Url to variation.image attribute
          variation.image = url;
        }
      }

      // Store Product in Firestore
      await _db.collection("Products").doc(product.id).set(product.toJson());
    }
  }

  // Return Favourite products
  @override
  Future<List<ProductModel>> getFavouritProducts(
      List<String> productIds) async {
    final querySnapshot = await _db
        .collection("Products")
        .where(FieldPath.documentId, whereIn: productIds)
        .get();

    final List<ProductModel> productList = querySnapshot.docs
        .map((documentSnapshot) =>
            ProductModel.instanceFromQuerySnapshot(documentSnapshot))
        .toList();

    return productList;
  }

  // Upload Dummy Data For Testing
  Future<void> uploadDummyDataTest(List<ProductModel> products) async {
    Map<String, String> assetImages = {};

    // Loop through each Product
    for (var product in products) {
      // Get ImageData Link from the local assets
      final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

      // Upload image and get its Url
      final url = await storage.uploadImageData("Products/Images/", thumbnail,
          product.thumbnail.split('/').last.toString());

      // Add to assetImages of existing images
      assetImages[product.thumbnail] = url;

      // Assign Url to Product.thumbnail attribute
      product.thumbnail = url;

      // Product list of images
      if (product.images != null && product.images!.isNotEmpty) {
        List<String> imagesUrl = [];

        for (var image in product.images!) {
          // Get ImageData Link from the local assets
          final assetImage = await storage.getImageDataFromAssets(image);

          final String url;
          // If image has been previously uploaded
          if (assetImages.containsKey(image)) {
            url = assetImages[image]!;
          } else {
            // Upload image and get its Url
            url = await storage.uploadImageData("Products/Images/", assetImage,
                image.split('/').last.toString());

            // Add to assetImages of existing images
            assetImages[image] = url;
          }

          // Add url to imagesUrl
          imagesUrl.add(url);
        }

        // Assign imagesUrl to product.images
        product.images!.clear();
        product.images!.setAll(0, imagesUrl);
      }

      // Upload variation images
      if (product.productType == ProductType.variable.toString()) {
        for (var variation in product.productVariations!) {
          // Get ImageData Link from the local assets
          final assetImage =
              await storage.getImageDataFromAssets(variation.image);

          final String url;
          // If image has been previously uploaded
          if (assetImages.containsKey(variation.image)) {
            url = assetImages[variation.image]!;
          } else {
            // Upload image and get its Url
            url = await storage.uploadImageData("Products/Images/", assetImage,
                variation.image.split('/').last.toString());

            // Add to assetImages of existing images
            assetImages[variation.image] = url;
          }

          // Assign Url to variation.image attribute
          variation.image = url;
        }
      }

      assetImages.clear();
      // Store Product in Firestore
      await _db.collection("Products").doc(product.id).set(product.toJson());
    }
  }
}
