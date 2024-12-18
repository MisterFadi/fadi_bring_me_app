import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/home_screen/models/country_group.dart';
import 'package:fadi_bring_me_app/features/home_screen/repositories/country_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();
  final List<String> _items = [];

  @override
  Future<void> addProduct(String listProduct) async {
    await Future.delayed(const Duration(seconds: 1));
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
    if (newItem.isNotEmpty && !_items.contains(newItem)) {
      _items[index] = newItem;
    }
  }

  @override
  Future<List<CountryGroup>> getCountrys() async {
    await Future.delayed(const Duration(seconds: 1));
    return countrys;
  }

  @override
  Future<int> get productCount async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _items.length;
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
