import 'package:favorite_country/Global/Resource_Context.dart';
import 'package:favorite_country/Model/Model.dart';
import 'package:favorite_country/Services/regres_services.dart';
import 'package:flutter/material.dart';

class ReqresProvider extends ChangeNotifier {
  IRegrsService iRegrsService;
  List<Ulke> country = [];

  bool isLoading = false;

  ReqresProvider(this.iRegrsService) {
    Fetch();
  }
  void ChangeLoading() {
    isLoading = !isLoading;
    notifyListeners(); //Tüm ekranlar bundan etkilenecek
  }

  Future<void> Fetch() async {
    ChangeLoading();
    country = (await iRegrsService.fetchResourceItems()) ?? [];

    ChangeLoading();
  }

  void SaveToLocal(ResourceContext resourceContext) {
    resourceContext.saveModel(country);
  }
}
