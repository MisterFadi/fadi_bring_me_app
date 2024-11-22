import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/home_screen/models/country_group.dart';
import 'package:fadi_bring_me_app/features/home_screen/repositories/country_data.dart';

class MockDatabase implements DatabaseRepository {
  final List<String> _items = [];

  @override
  Future<int> get itemCount async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _items.length;
  }

  @override
  Future<List<CountryGroup>> getCountrys() async {
    await Future.delayed(const Duration(seconds: 2));
    return countrys;
  }

  @override
  Future<void> addItem(String item) async {
    //make sure item doesn't exist yet and is not empty
    if (item.isNotEmpty && !_items.contains(item)) _items.add(item);
  }

  @override
  Future<void> deleteItem(int index) async {
    _items.removeAt(index);
  }

  @override
  Future<void> editItem(int index, String newItem) async {
    // make sure not empty and not same as other
    if (newItem.isNotEmpty && !_items.contains(newItem)) {
      _items[index] = newItem;
    }
  }
}
