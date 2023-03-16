class Machine {
  String name;
  String image;
  String failure_type;
  String state;
  String failure_statement;

  Machine(
      {required this.name,
      required this.image,
      required this.failure_type,
      required this.state,
      required this.failure_statement});

  factory Machine.fromJson(Map<String, dynamic> map) {
    return Machine(
        name: map["name"],
        image: map["image"],
        failure_type: map["failure_type"],
        state: map["state"],
        failure_statement: map["failure_statement"]);
  }
  // Map<String, dynamic> toMap() {
  //   var map = Map<String, dynamic>();
  //   map["name"] = name;
  //   map["image"] = image;
  //   map["failure_type"] = failure_type;
  //   map["state"] = state;
  //   map["failure_statement"] = failure_statement;
  //   if (id != null) {
  //     map["id"] = id;
  //   }
  //   return map;
  // }

  // void a() {
  //   var m = new Machine(
  //       name: "mel",
  //       image: "mmm",
  //       failure_type: "klmç",
  //       state: "jhbj",
  //       failure_statement: "hewfje");
  //   var mapMachine = m.toMap();
  // }

  // Machine.fromObject(dynamic o) {
  //   this.id = int.tryParse(o["id"]);
  //   this.name = o["name"];
  //   this.image = o["image"];
  //   this.failure_type = o["failure_type"];
  //   this.state = o["state"];
  //   this.failure_statement = o["failure_statement"];
  // }
}
