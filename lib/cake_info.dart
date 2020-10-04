class CakeInfo {
  int id;
  String title;
  String price;

  CakeInfo({
    this.id,
    this.title,
    this.price,
  });
}

class CakeData {
  List<CakeInfo> cakeNew;
  List<CakeInfo> cakeBoughtAlot;

  CakeData({this.cakeNew, this.cakeBoughtAlot});
}
