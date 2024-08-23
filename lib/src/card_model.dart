class CardModel {
  final String name;
  final String jobArea;
  final String email;
  final String picture;
  final String about;
  final String interest;

  CardModel({
    required this.name,
    required this.jobArea,
    required this.email,
    required this.picture,
    required this.about,
    required this.interest,
  });

  static CardModel fromJson(Map map) {
    return CardModel(
      name: map['name'],
      jobArea: map['jobArea'],
      email: map['email'],
      picture: map['avatar'],
      about: map['about'],
      interest: map['interest'],
    );
  }

  static List<CardModel> fromJsonList(List list) {
    var response = <CardModel>[];
    for (var json in list) {
      var obj = CardModel.fromJson(json);
      response.add(obj);
    }
    return response;
  }
}
