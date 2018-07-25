class ArticleBean {
  String _apkLink;
  String _author;
  int _chapterId;
  String _chapterName;
  bool _collect;
  int _courseId;
  String _desc;
  String _envelopePic;
  bool _fresh;
  int _id;
  String _link;
  String _niceDate;
  String _origin;
  String _projectLink;
  int _publishTime;
  int _superChapterId;
  String _superChapterName;
  String _title;
  int _type;
  int _userId;
  int _visible;
  int _zan;

  ArticleBean(
      {String apkLink,
        String author,
        int chapterId,
        String chapterName,
        bool collect,
        int courseId,
        String desc,
        String envelopePic,
        bool fresh,
        int id,
        String link,
        String niceDate,
        String origin,
        String projectLink,
        int publishTime,
        int superChapterId,
        String superChapterName,
        String title,
        int type,
        int userId,
        int visible,
        int zan}) {
    this._apkLink = apkLink;
    this._author = author;
    this._chapterId = chapterId;
    this._chapterName = chapterName;
    this._collect = collect;
    this._courseId = courseId;
    this._desc = desc;
    this._envelopePic = envelopePic;
    this._fresh = fresh;
    this._id = id;
    this._link = link;
    this._niceDate = niceDate;
    this._origin = origin;
    this._projectLink = projectLink;
    this._publishTime = publishTime;
    this._superChapterId = superChapterId;
    this._superChapterName = superChapterName;
    this._title = title;
    this._type = type;
    this._userId = userId;
    this._visible = visible;
    this._zan = zan;
  }

  String get apkLink => _apkLink;
  set apkLink(String apkLink) => _apkLink = apkLink;
  String get author => _author;
  set author(String author) => _author = author;
  int get chapterId => _chapterId;
  set chapterId(int chapterId) => _chapterId = chapterId;
  String get chapterName => _chapterName;
  set chapterName(String chapterName) => _chapterName = chapterName;
  bool get collect => _collect;
  set collect(bool collect) => _collect = collect;
  int get courseId => _courseId;
  set courseId(int courseId) => _courseId = courseId;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get envelopePic => _envelopePic;
  set envelopePic(String envelopePic) => _envelopePic = envelopePic;
  bool get fresh => _fresh;
  set fresh(bool fresh) => _fresh = fresh;
  int get id => _id;
  set id(int id) => _id = id;
  String get link => _link;
  set link(String link) => _link = link;
  String get niceDate => _niceDate;
  set niceDate(String niceDate) => _niceDate = niceDate;
  String get origin => _origin;
  set origin(String origin) => _origin = origin;
  String get projectLink => _projectLink;
  set projectLink(String projectLink) => _projectLink = projectLink;
  int get publishTime => _publishTime;
  set publishTime(int publishTime) => _publishTime = publishTime;
  int get superChapterId => _superChapterId;
  set superChapterId(int superChapterId) => _superChapterId = superChapterId;
  String get superChapterName => _superChapterName;
  set superChapterName(String superChapterName) =>
      _superChapterName = superChapterName;
  String get title => _title;
  set title(String title) => _title = title;
  int get type => _type;
  set type(int type) => _type = type;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  int get visible => _visible;
  set visible(int visible) => _visible = visible;
  int get zan => _zan;
  set zan(int zan) => _zan = zan;

  ArticleBean.fromJson(Map<String, dynamic> json) {
    _apkLink = json['apkLink'];
    _author = json['author'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _collect = json['collect'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _envelopePic = json['envelopePic'];
    _fresh = json['fresh'];
    _id = json['id'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _origin = json['origin'];
    _projectLink = json['projectLink'];
    _publishTime = json['publishTime'];
    _superChapterId = json['superChapterId'];
    _superChapterName = json['superChapterName'];
    _title = json['title'];
    _type = json['type'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apkLink'] = this._apkLink;
    data['author'] = this._author;
    data['chapterId'] = this._chapterId;
    data['chapterName'] = this._chapterName;
    data['collect'] = this._collect;
    data['courseId'] = this._courseId;
    data['desc'] = this._desc;
    data['envelopePic'] = this._envelopePic;
    data['fresh'] = this._fresh;
    data['id'] = this._id;
    data['link'] = this._link;
    data['niceDate'] = this._niceDate;
    data['origin'] = this._origin;
    data['projectLink'] = this._projectLink;
    data['publishTime'] = this._publishTime;
    data['superChapterId'] = this._superChapterId;
    data['superChapterName'] = this._superChapterName;
    data['title'] = this._title;
    data['type'] = this._type;
    data['userId'] = this._userId;
    data['visible'] = this._visible;
    data['zan'] = this._zan;
    return data;
  }
}

