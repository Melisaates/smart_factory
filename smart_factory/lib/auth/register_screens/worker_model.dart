class Worker {
  Worker({
    required this.name,
    required this.image,
    required this.department,
    required this.wage,
  });

  String name;
  String image;
  String department;
  int wage;

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        name: json["name"],
        image: json["image"],
        department: json["department"],
        wage: json["wage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "department": department,
        "wage": wage,
      };
}

