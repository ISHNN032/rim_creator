class Backstory {
  final String title;
  final String titleShort;
  final String desc;

  Backstory(this.title, this.titleShort, this.desc);

  factory Backstory.fromData(dynamic data) {
    return Backstory(
        data["title"].toString(),
        data["titleShort"].toString(),
        data["desc"].toString().replaceAll("{", "\${"));
  }
}
