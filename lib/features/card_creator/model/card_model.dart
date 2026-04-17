class CardModel {
  String name;
  String location;
  String date;
  String? imagePath;

  CardModel({
    required this.name,
    required this.location,
    required this.date,
    this.imagePath,
  });
}