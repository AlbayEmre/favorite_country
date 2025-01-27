import 'package:favorite_country/Model/Model.dart';

class ResourceContext {
  late List<Ulke>? model;

  void saveModel(List<Ulke>? model) {
    this.model = model;
  }
}
