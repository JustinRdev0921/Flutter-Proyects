import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:products_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-products-a8233-default-rtdb.firebaseio.com';
  late Product selectedProduct;
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;
  final storage = FlutterSecureStorage();
  File? newPictureFile;
  //TODO: HACER FETCH DE PRODUCTS

  ProductsService() {
    this.loadProducts();
  }
  //<List<Product>>
  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(
        _baseUrl, 'products.json', {'auth': await storage.read(key: 'token')});
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    this.isLoading = false;
    notifyListeners();

    return this.products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      //crear
      await createProduct(product);
    } else {
      //actualizar
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json',
        {'auth': await storage.read(key: 'token')});
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;
    //actualizar listado de prods
    final index =
        this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(
        _baseUrl, 'products.json', {'auth': await storage.read(key: 'token')});
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);
    product.id = decodedData['name'];
    this.products.add(product);
    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;
    isSaving = true;
    notifyListeners();
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dpwqviodz/image/upload?upload_preset=is6fsgzo');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);
    if (response.statusCode != 200 && response.statusCode != 201) {
      print('algo salio mal');
      return null;
    }
    newPictureFile = null;
    final decodedData = json.decode(response.body);
    return decodedData['secure_url'];
  }
}
