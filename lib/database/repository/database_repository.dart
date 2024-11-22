import 'package:fadi_bring_me_app/features/home_screen/models/country_group.dart';

abstract class DatabaseRepository {
  // Gibt die Anzahl der Items zurück.
  Future<int> get itemCount;

  // Gibt die Items zurück.
  Future<List<CountryGroup>> getCountrys();

  // Fügt ein neues Item hinzu.
  Future<void> addItem(String item);

  // Löscht ein Item an einem bestimmten Index.
  Future<void> deleteItem(int index);

  // Aktualisiert ein Item an einem bestimmten Index.
  Future<void> editItem(int index, String newItem);
}
