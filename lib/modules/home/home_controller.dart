import 'dart:async';

import 'package:cep_api/data/model/address.dart';
import 'package:cep_api/data/repository/address_repository.dart';
import 'package:cep_api/modules/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeController extends GetxController {
  HomeController(this.repository);

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel(); // Cancelar o debounce ao fechar o controller
    super.onClose();
  }

  final AddressRepository repository;

  final Rx<HomeState> _stateStream = const HomeState().obs;

  HomeState get state => _stateStream.value;

  final TextEditingController cepController = TextEditingController();

  final MaskTextInputFormatter cepMask = MaskTextInputFormatter(
    mask: '##.###-###',
    filter: <String, RegExp>{'#': RegExp(r'[0-9]')},
  );

  Timer? _debounce;

  void searchCep(String zipCode) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final String cleanedZipCode = zipCode.replaceAll(RegExp(r'[^0-9]'), '');
      if (cleanedZipCode.length == 8) {
        getAddress(zipCode: cleanedZipCode);
      } else {
        _stateStream.value =
            const AddressFailure(message: 'CEP inválido. Digite 8 números.');
      }
    });
  }

  Future<void> getAddress({required String zipCode}) async {
    _stateStream.value = AddressLoading();
    try {
      final Address address = await repository.getAddress(zipCode);
      _stateStream.value = AddressResult(address); // Estado com o endereço
    } catch (e) {
      _stateStream.value =
          AddressFailure(message: e.toString()); // Estado de falha
    }
  }
}
