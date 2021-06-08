class ItemModel {
  String? by;
  int? descendants;
  int? id;
  int? parent;
  List<int>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  ItemModel(
      {this.by,
        this.descendants,
        this.id,
        this.parent,
        this.kids,
        this.score,
        this.time,
        this.title,
        this.type,
        this.url});

  ItemModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    parent = json['parent'];
    kids = json['kids'];
    score = json['score'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['descendants'] = this.descendants;
    data['id'] = this.id;
    data['parent'] = this.parent;
    data['kids'] = this.kids;
    data['score'] = this.score;
    data['time'] = this.time;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
