import 'package:cep_api/modules/home/home_controller.dart';
import 'package:cep_api/modules/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP'),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller.cepController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[controller.cepMask],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.map_outlined),
                  labelText: 'CEP',
                  hintText: '00.000-000',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.searchCep(value);
                },
              ),
              const SizedBox(height: 16),
              Obx(() {
                final HomeState state = controller.state;

                if (state is AddressLoading) {
                  return const CircularProgressIndicator();
                } else if (state is AddressResult) {
                  final address = state.address;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CEP: ${address.zipCode}'),
                      Text('Logradouro: ${address.street ?? "Não informado"}'),
                      Text(
                          'Bairro: ${address.neighborhood ?? "Não informado"}'),
                      Text('Cidade: ${address.city ?? "Não informado"}'),
                      Text(
                          'Estado: ${address.stateAbbreviation ?? "Não informado"}'),
                    ],
                  );
                } else if (state is AddressFailure) {
                  return Text('Erro: ${state.message}');
                } else {
                  return const Text('Digite um CEP para buscar');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
