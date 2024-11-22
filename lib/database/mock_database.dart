import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/home_screen/models/country_group.dart';
import 'package:fadi_bring_me_app/features/home_screen/repositories/country_data.dart';

class MockDatabase implements DatabaseRepository {
  final List<String> _items = [];

  @override
  Future<int> get productCount async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _items.length;
  }

  @override
  Future<List<CountryGroup>> getCountrys() async {
    await Future.delayed(const Duration(seconds: 2));
    return countrys;
  }

  @override
  Future<void> addProduct(String listProduct) async {
    await Future.delayed(const Duration(seconds: 2));

    if (listProduct.isNotEmpty && !_items.contains(listProduct))
      _items.add(listProduct);
    // throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(int index) async {
    _items.removeAt(index);
  }

  @override
  Future<void> editProduct(int index, String newItem) async {
    // make sure not empty and not same as other
    if (newItem.isNotEmpty && !_items.contains(newItem)) {
      _items[index] = newItem;
    }
  }
}
