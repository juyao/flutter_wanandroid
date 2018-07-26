class Knowledge {
  List<Children> _children;
  int _courseId;
  int _id;
  String _name;
  int _order;
  int _parentChapterId;
  int _visible;

  Knowledge(
      {List<Children> children,
        int courseId,
        int id,
        String name,
        int order,
        int parentChapterId,
        int visible}) {
    this._children = children;
    this._courseId = courseId;
    this._id = id;
    this._name = name;
    this._order = order;
    this._parentChapterId = parentChapterId;
    this._visible = visible;
  }

  List<Children> get children => _children;
  set children(List<Children> children) => _children = children;
  int get courseId => _courseId;
  set courseId(int courseId) => _courseId = courseId;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get order => _order;
  set order(int order) => _order = order;
  int get parentChapterId => _parentChapterId;
  set parentChapterId(int parentChapterId) =>
      _parentChapterId = parentChapterId;
  int get visible => _visible;
  set visible(int visible) => _visible = visible;

  Knowledge.fromJson(Map<String, dynamic> json) {
    if (json['children'] != null) {
      _children = new List<Children>();
      json['children'].forEach((v) {
        _children.add(new Children.fromJson(v));
      });
    }
    _courseId = json['courseId'];
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._children != null) {
      data['children'] = this._children.map((v) => v.toJson()).toList();
    }
    data['courseId'] = this._courseId;
    data['id'] = this._id;
    data['name'] = this._name;
    data['order'] = this._order;
    data['parentChapterId'] = this._parentChapterId;
    data['visible'] = this._visible;
    return data;
  }
}

class Children {
  int _courseId;
  int _id;
  String _name;
  int _order;
  int _parentChapterId;
  int _visible;

  Children(
      {int courseId,
        int id,
        String name,
        int order,
        int parentChapterId,
        int visible}) {
    this._courseId = courseId;
    this._id = id;
    this._name = name;
    this._order = order;
    this._parentChapterId = parentChapterId;
    this._visible = visible;
  }

  int get courseId => _courseId;
  set courseId(int courseId) => _courseId = courseId;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get order => _order;
  set order(int order) => _order = order;
  int get parentChapterId => _parentChapterId;
  set parentChapterId(int parentChapterId) =>
      _parentChapterId = parentChapterId;
  int get visible => _visible;
  set visible(int visible) => _visible = visible;

  Children.fromJson(Map<String, dynamic> json) {
    _courseId = json['courseId'];
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this._courseId;
    data['id'] = this._id;
    data['name'] = this._name;
    data['order'] = this._order;
    data['parentChapterId'] = this._parentChapterId;
    data['visible'] = this._visible;
    return data;
  }
}

