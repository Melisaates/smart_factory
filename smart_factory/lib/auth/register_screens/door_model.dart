class Door {
  String name;
  String image;
  String state;
  Door({required this.name, required this.image, required this.state});

  static Door fromJson(Map<String, dynamic> map) {
    return Door(name: map["name"], image: map["image"], state: map["state"]);
  }
}
