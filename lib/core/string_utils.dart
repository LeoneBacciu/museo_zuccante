extension StringUtils on String {
  bool icontains(String other) {
    return toLowerCase().contains(other.toLowerCase());
  }

  String evilToUpperCase() {
    int bias = 0;
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < length; i++) {
      if (this[i] == ' ') bias++;
      if ((i + bias) % 2 == 0) {
        sb.write(this[i].toUpperCase());
      } else {
        sb.write(this[i]);
      }
    }
    return sb.toString();
  }
}
