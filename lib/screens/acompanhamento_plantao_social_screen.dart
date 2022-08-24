// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:codesaima2/core/cep_network.dart';
import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/models/address.dart';
import 'package:codesaima2/models/plantao_social_model.dart';
import 'package:flutter/material.dart';

class AcompanhamentoPlantaoSocialScreen extends StatefulWidget {
  const AcompanhamentoPlantaoSocialScreen({Key? key}) : super(key: key);

  @override
  State<AcompanhamentoPlantaoSocialScreen> createState() =>
      _AcompanhamentoPlantaoSocialScreenState();
}

class _AcompanhamentoPlantaoSocialScreenState
    extends State<AcompanhamentoPlantaoSocialScreen> {
  late FocusNode _focusNode;
  final _phoneNumberController = TextEditingController();
  final _cepController = TextEditingController();
  final _ufController = TextEditingController();
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _districtController = TextEditingController();
  final _complementController = TextEditingController();
  bool _sameOwner = false;
  final _propertyOwnerController = TextEditingController();
  String _groupValueSocialBenefit = '';

  PlantaoSocial plantaoSocial = PlantaoSocial();
  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  _getCep() async {
    showGeneralLoading(context);
    try {
      final Address address;
      var r = await CepHelper.getData(
          _cepController.text.replaceAll(RegExp(r'[^0-9]'), ''));
      address = Address.fromJson(r);

      _cepController.text = address.cep!;
      _ufController.text = address.uf!;
      _cityController.text = address.localidade!;
      _streetController.text = address.logradouro!;
      _districtController.text = address.bairro!;

      if (!mounted) return; //check if the data has come
      Navigator.pop(context);
      _focusNode.requestFocus(); //send focus to number address textfield
    } catch (e) {
      Navigator.pop(context);
      showGeneralMessageDialog(context, 'Erro: $e');
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();

    _phoneNumberController.dispose();
    _cepController.dispose();
    _ufController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _districtController.dispose();
    _numberController.dispose();
    _complementController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantão Social'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text('Acompanhamento Plantão Social'),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                onChanged: (value) => plantaoSocial.name = value,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Nome',
                  prefixIcon: Icon(Icons.person, color: Colors.red),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                onChanged: (value) => plantaoSocial.telefone = value,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  hintText: 'Telefone',
                  prefixIcon: Icon(Icons.phone, color: Colors.red),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _cepController,
                            onEditingComplete: _getCep,
                            decoration: InputDecoration(
                              labelText: 'CEP',
                              hintText: 'CEP',
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2)),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                            highlightColor: Colors.red[100],
                            icon: Icon(Icons.search),
                            onPressed: _getCep,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: _streetController,
                      decoration: InputDecoration(
                        labelText: 'Rua',
                        hintText: 'Rua',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: _numberController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        labelText: 'Número',
                        hintText: 'Número',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: _districtController,
                      decoration: InputDecoration(
                        labelText: 'Bairro',
                        hintText: 'Bairro',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: _complementController,
                      decoration: InputDecoration(
                        labelText: 'Complemento',
                        hintText: 'Complemento',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _propertyOwnerController,
                      onChanged: (value) => plantaoSocial.propertyOwner = value,
                      decoration: InputDecoration(
                        hintText: 'Quem é o proprietário do imóvel?',
                        labelText: 'Quem é o proprietário do imóvel?',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Checkbox(
                      value: _sameOwner,
                      onChanged: (v) {
                        setState(() {
                          _sameOwner = v!;
                          if (_sameOwner) {
                            plantaoSocial.propertyOwner = plantaoSocial.name;
                            _propertyOwnerController.text = plantaoSocial.name;
                          } else {
                            plantaoSocial.propertyOwner = '';
                            _propertyOwnerController.text = '';
                          }
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Perfil social do Beneficiário? (Obrigatório)',
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: socialProfileList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RadioListTile<String>(
                        title: Text(socialProfileList[index]),
                        value: socialProfileList[index],
                        groupValue: _groupValueSocialBenefit,
                        onChanged: (value) {
                          setState(() {
                            _groupValueSocialBenefit = value!;
                          });
                        });
                  },
                )),
            Visibility(
              visible: _groupValueSocialBenefit == 'Outros',
              child: Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Outro',
                    labelText: 'Outro',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Address address = Address(
            cep: _cepController.text,
            logradouro: _streetController.text,
            bairro: _districtController.text,
            localidade: _cityController.text,
            uf: _ufController.text,
            numero: _numberController.text,
            complemento: _complementController.text,
          );
          plantaoSocial.address = address.toJson().toString();
          print(plantaoSocial);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
