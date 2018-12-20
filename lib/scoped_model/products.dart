import 'package:scoped_model/scoped_model.dart';
import '../model/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get products => List.from(_products);
  int get selectProductIndex => _selectedProductIndex;

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;   
    _selectedProductIndex = null; 
  }

  void setSelectProductIndex(int index) {
    _selectedProductIndex = index;
  }
}