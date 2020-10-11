bool isNumeric(String s) {
  if (s.isEmpty) return false;
  // pregunto si se puede parcear
  final n = num.tryParse(s);

  return ( n == null) ? false : true;
}