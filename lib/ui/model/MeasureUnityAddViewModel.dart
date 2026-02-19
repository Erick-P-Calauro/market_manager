import 'package:flutter/material.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/data/repository/MeasureUnityRepository.dart';

class MeasureUnityAddViewModel extends ChangeNotifier {
  MeasureUnityAddViewModel({required MeasureUnityRepository unityRepository})
      : _unityRepository = unityRepository;

  final MeasureUnityRepository _unityRepository;
  MeasureUnity? _unity;

  void cadastrar(MeasureUnity unity) async {
    _unityRepository.cadastrar(unity);

    notifyListeners();
  }

  void editar(int id, MeasureUnity unity) async {
    _unityRepository.editar(id, unity);

    notifyListeners();
  }

  void definirUnidade(int id) async {
    _unity = await _unityRepository.buscar(id);

    notifyListeners();
  }

  MeasureUnity? get unityEscolhida => _unity;
}
