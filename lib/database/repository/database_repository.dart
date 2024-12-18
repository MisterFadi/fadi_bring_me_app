import 'package:fadi_bring_me_app/features/home_screen/models/country_group.dart';

abstract class DatabaseRepository {
  // Gibt die Anzahl der Produkte zurück.
  Future<int> get productCount;

  // Gibt die Landessprache zurück.
  Future<List<CountryGroup>> getCountrys();

  // Fügt ein neues Produkt hinzu.
  Future<void> addProduct(String item);

  // Löscht ein Produkt.
  Future<void> deleteProduct(int index);

  // Aktualisiert den Name des Produkts
  Future<void> editProduct(int index, String newItem);

  Future<void> signInWithGoogle();
}
