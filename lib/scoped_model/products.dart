import 'package:scoped_model/scoped_model.dart';
import '../model/product.dart';

mixin ProductsModel on Model  {
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorite = false;

  List<Product> get products => List.from(_products);
  int get selectProductIndex => _selectedProductIndex;
  Product get selectProduct {
    if(_selectedProductIndex == null) {
      return null;
    } else {
      return _products[_selectedProductIndex];
    }
  }
  List<Product> get displayProducts {
    if(_showFavorite) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return _products;
  }
  bool get showFavorite => _showFavorite;

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

  void toggletProductFavoriteStatus() {
    final Product updatedProduct = Product(
      title: selectProduct.title,
      description: selectProduct.description,
      price: selectProduct.price,
      imageUrl: selectProduct.imageUrl,
      isFavorite: !selectProduct.isFavorite
    );
    updateProduct(updatedProduct);
    _selectedProductIndex = null; 
    notifyListeners();
  }

  void toggleDisplayFavoriteProducts() {
    _showFavorite = !_showFavorite;
    notifyListeners();
  }
}