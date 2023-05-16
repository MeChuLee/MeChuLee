class Record {
  final int? id;
  final String date;
  final int menuId;

  Record({this.id, required this.date, required this.menuId});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'menuId' : menuId,
    };
  }

  @override
  String toString() {
    return 'Record{id: $id, date: $date, menuId: $menuId}';
  }
}