class Offer {
  final int offerID;
  final String imagePath;
  final String offerTitle;

  Offer({this.offerID, this.imagePath, this.offerTitle});

  factory Offer.fromJSON(Map<String, dynamic> json) => Offer(
      imagePath: json['Simple_Path'] as String,
      offerID: json['Design_ID'] as int,
      offerTitle: json['Design_Title'] as String);
}

class OfferList {
  final List<Offer> offerList;
  OfferList({this.offerList});

  factory OfferList.fromJson(List<dynamic> list) {
    List<Offer> offers = List<Offer>();
    offers = list.map((i) => Offer.fromJSON(i)).toList();
    return OfferList(offerList: offers);
  }
}
