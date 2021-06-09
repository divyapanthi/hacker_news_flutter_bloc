class ItemModel {
  String? by;
  int? descendants;
  int? id;
  bool? deleted;
  bool? dead;
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
        this.deleted,
        this.dead,
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
    deleted = json['deleted'];
    dead = json['dead'];
    parent = json['parent'];
    kids = json['kids'].cast<int>();
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
    data['deleted'] = this.deleted;
    data['dead'] = this.dead;
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
