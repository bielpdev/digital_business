class CardModel {
  final String name;
  final String jobArea;
  final String email;
  final String picture;
  final String about;
  final String interest;
  final String instagram;
  final String github;
  final String facebook;
  final String twitter;

  CardModel({
    required this.name,
    required this.jobArea,
    required this.email,
    required this.picture,
    required this.about,
    required this.interest,
    required this.instagram,
    required this.github,
    required this.facebook,
    required this.twitter,
  });

  static CardModel fromJson(Map map) {
    return CardModel(
      name: map['name'] ?? '',
      jobArea: map['jobArea'] ?? '',
      email: map['email'] ?? '',
      picture: map['avatar'] ?? '',
      about: map['about'] ?? '',
      interest: map['interest'] ?? '',
      instagram: map['instagram'] ?? '',
      github: map['github'] ?? '',
      facebook: map['facebook'] ?? '',
      twitter: map['twitter'] ?? '',
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
