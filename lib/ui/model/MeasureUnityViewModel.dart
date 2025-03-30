import 'package:flutter/material.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/data/repository/MeasureUnityRepository.dart';

class MeasureUnityViewModel extends ChangeNotifier {
  MeasureUnityViewModel({required MeasureUnityRepository unityRepository})
      : _unityRepository = unityRepository {
    _load();
  }

  final MeasureUnityRepository _unityRepository;
  List<MeasureUnity> _unities = [];

  void _load() async {
    _unities = await _unityRepository.listar();

    notifyListeners();
  }

  void cadastrar(MeasureUnity unity) {
    _unityRepository.cadastrar(unity);

    notifyListeners();
  }

  List<MeasureUnity> get unities => _unities;
}
