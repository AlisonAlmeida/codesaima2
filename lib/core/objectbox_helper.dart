import 'dart:io';
import 'package:codesaima2/models/plantao_social_model.dart';
import 'package:codesaima2/objectbox.g.dart';

import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store _store;
  late final Box<PlantaoSocial> _plantaoSocialBox;

  ObjectBox._init(this._store) {
    _plantaoSocialBox = Box<PlantaoSocial>(_store);
  }

  static Future<ObjectBox> init() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: '${dir.path}/objectbox/');
    return ObjectBox._init(store);
  }

  void removeAllPlantaoSocial() {
    _plantaoSocialBox.removeAll();
  }

  void close() => _store.close();
  bool isClosed() => _store.isClosed();
  int insertPlantaoSocial(PlantaoSocial plantaoSocial) =>
      _plantaoSocialBox.put(plantaoSocial);
  PlantaoSocial? getPlantaoSocial(int id) => _plantaoSocialBox.get(id);
  bool deletePlantaoSocial(int id) => _plantaoSocialBox.remove(id);

  List<PlantaoSocial> getAllPlantaoSocial() {
    final List<PlantaoSocial> plantaoSocialList = _plantaoSocialBox.getAll();
    return plantaoSocialList;
  }
}
