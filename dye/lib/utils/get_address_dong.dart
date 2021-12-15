String? getDong(String? str) {
  if (str == null) {
    return ("");
  }
  final temp = str.split(" ");
  return temp[1];
}
