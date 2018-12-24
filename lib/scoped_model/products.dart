import '../model/product.dart';
import './connected_products.dart';

mixin ProductsModel on ConnectedProducts  {
  bool _showFavorite = false;

  List<Product> get allProducts => List.from(products);
  int get selectProductIndex => selectedProductIndex;
  Product get selectProduct {
    if(selectedProductIndex == null) {
      return null;
    } else {
      return products[selectedProductIndex];
    }
  }
  List<Product> get displayProducts {
    if(_showFavorite) {
      return products.where((Product product) => product.isFavorite).toList();
    }
    return products;
  }
  bool get showFavorite => _showFavorite;

  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    selectedProductIndex = null;
  }

  void updateProduct(String title, String description, String imageUrl, double price) {
    final product = Product(
      title: title,
      description: description,
      imageUrl: imageUrl,
      price: price,
      userEmail: selectProduct.userEmail,
      userId: selectProduct.userId
    );
    products[selectedProductIndex] = product;   
    selectedProductIndex = null; 
  }

  void setSelectProductIndex(int index) {
    selectedProductIndex = index;
  }

  void toggletProductFavoriteStatus() {
    final Product updatedProduct = Product(
      title: selectProduct.title,
      description: selectProduct.description,
      price: selectProduct.price,
      imageUrl: selectProduct.imageUrl,
      isFavorite: !selectProduct.isFavorite,
      userEmail: selectProduct.userEmail,
      userId: selectProduct.userId,
    );
    products[selectedProductIndex] = updatedProduct;   
    selectedProductIndex = null; 
    notifyListeners();
  }

  void toggleDisplayFavoriteProducts() {
    _showFavorite = !_showFavorite;
    notifyListeners();
  }
}