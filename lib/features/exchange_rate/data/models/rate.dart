class Rate {
  Rate({
    this.currencyValue,
  });

  final double? currencyValue;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        currencyValue: json["USD"] != null
            ? json["USD"]?.toDouble()
            : json["EGP"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD": currencyValue,
      };
}
