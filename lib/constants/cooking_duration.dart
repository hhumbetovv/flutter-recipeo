enum CookingDuration {
  lessThanTen('<10', 1),
  thirty('30', 2),
  moreThanSixty('>60', 3);

  const CookingDuration(
    this.label,
    this.sliderValue,
  );

  final String label;
  final int sliderValue;
}
