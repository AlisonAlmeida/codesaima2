// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:codesaima2/core/cep_network.dart';
import 'package:codesaima2/core/const.dart';
import 'package:codesaima2/main.dart';
import 'package:codesaima2/models/address.dart';
import 'package:codesaima2/models/plantao_social_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AcompanhamentoPlantaoSocialScreen extends StatefulWidget {
  const AcompanhamentoPlantaoSocialScreen({Key? key}) : super(key: key);

  @override
  State<AcompanhamentoPlantaoSocialScreen> createState() =>
      _AcompanhamentoPlantaoSocialScreenState();
}

class _AcompanhamentoPlantaoSocialScreenState
    extends State<AcompanhamentoPlantaoSocialScreen> {
  late FocusNode _focusNode;
  final _nameController = TextEditingController();
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
  final _timeLiveStateController = TextEditingController();
  final _howManyFamiliesController = TextEditingController();
  final _howManyPeopleLiveController = TextEditingController();
  final _kindImprovementeController = TextEditingController();
  String _socialProfile = '';
  String _groupValueSocialBenefit = '';
  String _groupValueConstructionStatus = '';
  String _groupValueSatisfactionLevel = '';
  final _observationsController = TextEditingController();
  final _responsibleCompanyController = TextEditingController();
  final _visitorController = TextEditingController();
  final _socialWorkerController = TextEditingController();

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
    _nameController.dispose();
    _phoneNumberController.dispose();
    _cepController.dispose();
    _ufController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    _districtController.dispose();
    _complementController.dispose();
    _propertyOwnerController.dispose();
    _timeLiveStateController.dispose();
    _howManyFamiliesController.dispose();
    _howManyPeopleLiveController.dispose();
    _kindImprovementeController.dispose();
    _observationsController.dispose();
    _responsibleCompanyController.dispose();
    _visitorController.dispose();
    _socialWorkerController.dispose();

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Cadastro Plantão Social',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Nome',
                    prefixIcon: Icon(Icons.person),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    hintText: 'Telefone',
                    prefixIcon: Icon(Icons.phone),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
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
                            flex: 3,
                            child: TextField(
                              controller: _cepController,
                              onEditingComplete: _getCep,
                              decoration: InputDecoration(
                                labelText: 'CEP',
                                hintText: 'CEP',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2)),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: TextField(
                              controller: _ufController,
                              decoration: InputDecoration(
                                labelText: 'UF',
                                hintText: 'UF',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2)),
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
                              borderSide: BorderSide(width: 2)),
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
                              borderSide: BorderSide(width: 2)),
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
                              borderSide: BorderSide(width: 2)),
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
                              borderSide: BorderSide(width: 2)),
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
                        decoration: InputDecoration(
                          hintText: 'Quem é o proprietário do imóvel?',
                          labelText: 'Quem é o proprietário do imóvel?',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        Text('O mesmo?'),
                        Checkbox(
                            value: _sameOwner,
                            onChanged: (v) => setState(() {
                                  _sameOwner = v!;
                                  _sameOwner
                                      ? _propertyOwnerController.text =
                                          _nameController.text
                                      : _propertyOwnerController.text = '';
                                }))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _timeLiveStateController,
                  decoration: InputDecoration(
                    hintText: 'Quanto tempo residem no estado?',
                    labelText: 'Quanto tempo residem no estado?',
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _howManyFamiliesController,
                  decoration: InputDecoration(
                    hintText: 'Quantidade de famílias na residência',
                    labelText: 'Quantidade de famílias na residência',
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _howManyPeopleLiveController,
                  decoration: InputDecoration(
                    hintText: 'Quantidade de pessoas na residência',
                    labelText: 'Quantidade de pessoas na residência',
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          '1) Perfil social do Beneficiário? (Obrigatório)',
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
                                    _socialProfile = value;
                                  });
                                });
                          },
                        )),
                  ],
                ),
              ),
              Visibility(
                visible: _groupValueSocialBenefit == 'Outros',
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    onChanged: (value) => _socialProfile = value,
                    decoration: InputDecoration(
                      hintText: 'Outro',
                      labelText: 'Outro',
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          '2) Que tipo de melhoria foi contemplada no seu imóvel?',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        controller: _kindImprovementeController,
                        minLines: 3,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText:
                              'Que tipo de melhoria foi contemplada no seu imóvel?',
                          labelText:
                              'Que tipo de melhoria foi contemplada no seu imóvel?',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('3) Andamento da obra?',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        itemCount: constructionStatusList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return RadioListTile<String>(
                              title: Text(constructionStatusList[index]),
                              value: constructionStatusList[index],
                              groupValue: _groupValueConstructionStatus,
                              onChanged: (value) {
                                setState(() {
                                  _groupValueConstructionStatus = value!;
                                });
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                          '4) Qual o grau de satisfação com os serviços que estão sendo ou já foram realizados?',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        itemCount: satisfactionLevelList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return RadioListTile<String>(
                              title: Text(satisfactionLevelList[index]),
                              value: satisfactionLevelList[index],
                              groupValue: _groupValueSatisfactionLevel,
                              onChanged: (value) {
                                setState(() {
                                  _groupValueSatisfactionLevel = value!;
                                });
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                          '5) Considerações do acompanhamento social (Vulnerabilidades, citações sobre o serviço e outros.)',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        controller: _observationsController,
                        minLines: 3,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText:
                              'Considerações do acompanhamento social (Vulnerabilidades, citações sobre o serviço e outros.)',
                          labelText:
                              'Considerações do acompanhamento social (Vulnerabilidades, citações sobre o serviço e outros.)',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                          '6) Empresa responsável pela execução da obra:',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        controller: _responsibleCompanyController,
                        decoration: InputDecoration(
                          hintText: 'Empresa responsável pela execução da obra',
                          labelText:
                              'Empresa responsável pela execução da obra',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Visitador:'),
                        TextField(
                          controller: _visitorController,
                          decoration: InputDecoration(
                            hintText: 'Visitador',
                            labelText: 'Visitador',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)),
                            border: OutlineInputBorder(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Assistente Social:'),
                        TextField(
                          controller: _socialWorkerController,
                          decoration: InputDecoration(
                            hintText: 'Assistente Social',
                            labelText: 'Assistente Social',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)),
                            border: OutlineInputBorder(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
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
          final DateTime now = DateTime.now();
          final String dateFormattedForDocument =
              DateFormat('yyyy-MM-dd-hh-mm').format(now);
          PlantaoSocial plantaoSocial = PlantaoSocial(
              name: _nameController.text,
              phoneNumber: _phoneNumberController.text,
              address: address.toJson().toString(),
              propertyOwner: _propertyOwnerController.text,
              timeLiveState: _timeLiveStateController.text,
              howManyFamilies: _howManyFamiliesController.text,
              howManyPeopleLive: _howManyPeopleLiveController.text,
              socialProfile: _socialProfile,
              kindImprovemente: _kindImprovementeController.text,
              constructionStatus: _groupValueConstructionStatus,
              satisfactionState: _groupValueSatisfactionLevel,
              observations: _observationsController.text,
              responsibleCompany: _responsibleCompanyController.text,
              visitor: _visitorController.text,
              socialWorker: _socialWorkerController.text,
              date: dateFormattedForDocument);

          objectBox.insertPlantaoSocial(plantaoSocial);
          print(plantaoSocial.address);
          Navigator.popAndPushNamed(context, '/home');
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
