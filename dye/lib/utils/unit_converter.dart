String getDong(String str) {
  final temp = str.split(" ");
  return temp[1];
}

String getDistance(int distance) {
  return (distance * (1 / 1000)).toStringAsFixed(1).toString();
}
