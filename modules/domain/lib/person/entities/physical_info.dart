class PhysicalInfo {
  PhysicalInfo({required int heigth, required int weight}) {
    _setHeigth(heigth);
    _setWeight(weight);
  }

  late int _heigth;
  late int _weight;

  int getHeigth() => _heigth;
  int getWeight() => _weight;

  void _setHeigth(int heigth) {
    _heigth = heigth;
  }

  void _setWeight(int weight) {
    _weight = weight;
  }

  factory PhysicalInfo.fromJson(Map<String, dynamic> json) {
    return PhysicalInfo(
      heigth: json['heigth'],
      weight: json['weight'],
    );
  }
  Map<String, dynamic> toJson() => {
        'heigth': getHeigth(),
        'weight': getWeight(),
      };
}
