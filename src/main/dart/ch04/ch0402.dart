main() {
  var colors = ['red', 'green', 'blue', 'orange', 'pink'];
  var sortedColors = colors.sublist(1, 3);
  print(sortedColors);
  var tmp = colors.sublist(1, 3)..sort();
  print(tmp);
}
