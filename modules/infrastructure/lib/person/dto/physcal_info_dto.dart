class PhsycalInfoDTO {
  final int heigth;
  final int weight;

  PhsycalInfoDTO({
    required this.heigth,
    required this.weight,
  });

  factory PhsycalInfoDTO.fromFirestore(Map<String, dynamic> json) {
    return PhsycalInfoDTO(heigth: json['heigth'], weight: json['weight']);
  }
}
