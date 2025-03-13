class Address {
  Address({
    required this.zipCode,
    this.street,
    this.complement,
    this.unit,
    this.neighborhood,
    this.city,
    this.stateAbbreviation,
    this.state,
    this.region,
    this.ibgeCode,
    this.giaCode,
    this.areaCode,
    this.siafiCode,
  });

  final String zipCode;
  final String? street;
  final String? complement;
  final String? unit;
  final String? neighborhood;
  final String? city;
  final String? stateAbbreviation;
  final String? state;
  final String? region;
  final String? ibgeCode;
  final String? giaCode;
  final String? areaCode;
  final String? siafiCode;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        zipCode: json['cep'],
        street: json['logradouro'],
        complement: json['complemento'],
        unit: json['unidade'],
        neighborhood: json['bairro'],
        city: json['localidade'],
        stateAbbreviation: json['uf'],
        state: json['estado'],
        region: json['regiao'],
        ibgeCode: json['ibge'],
        giaCode: json['gia'],
        areaCode: json['ddd'],
        siafiCode: json['siafi']);
  }
}
