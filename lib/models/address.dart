import 'dart:convert';

class Address {
  Address({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.numero,
  });

  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? numero;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        numero: json["numero"],
      );

  Map<dynamic, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "numero": numero,
      };
}

/**
 * Address addressFromJson(String str) {
  print(json.decode(str));
  return Address.fromJson(json.decode(str));
}

String addressToJson(Address data) => json.encode(data.toJson());

 */