class jsonmodel {
  String id;
  String bhagvatgitaslok;
  String english;
  String hindi;
  String gujrati;
  int chpter;

  jsonmodel({
    required this.id,
    required this.bhagvatgitaslok,
    required this.english,
    required this.hindi,
    required this.gujrati,
    required this.chpter,
  });

  factory jsonmodel.fromjson({required Map Data}) {
    return jsonmodel(
        id: Data["id"],
        bhagvatgitaslok: Data['bhagavad gita slok'],
        english: Data['english'],
        hindi: Data['hindi'],
        gujrati: Data['gujrati'],
        chpter: Data['chpter']);
  }
}
