class Author {
  int id;
  String name;
  String desc;

  Author(this.id, this.name, this.desc);

  Author.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        desc = json['desc'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'desc': desc};

  @override
  String toString() {
    return 'Author{id: $id, name: $name, desc: $desc}';
  }
}
