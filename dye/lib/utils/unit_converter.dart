String? getDong(String? str) {
  if (str == null) {
    return ("");
  }
  final temp = str.split(" ");
  return temp[1];
}

String? getDistance(int? distance) {
  if (distance == null) return null;
  return (distance * (1 / 1000)).toStringAsFixed(1).toString();
}
