class BaseModel {
  @override
  Map toJson() {}

  Map toNullFreeJson({Map data}) {
    if (data == null) data = this?.toJson();
    data.removeWhere((key, value) => key == null || value == null);
    return data;
  }
}

class Internship extends BaseModel {
  String name;
  String dept;
  String id;

  Internship({
    this.name,
    this.dept,
    this.id,
  });

  Internship.fromJson(Map<String, dynamic> json) {
    dept = json['dept'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'dept': dept,
        'id':id,
      };
}
