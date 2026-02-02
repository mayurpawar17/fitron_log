class ProgressPhoto {
  final int? id;
  final DateTime date;
  final String? frontPath;
  final String? sidePath;
  final String? backPath;
  final String? note;

  ProgressPhoto({
    this.id,
    required this.date,
    this.frontPath,
    this.sidePath,
    this.backPath,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'front_path': frontPath,
      'side_path': sidePath,
      'back_path': backPath,
      'note': note,
    };
  }

  factory ProgressPhoto.fromMap(Map<String, dynamic> map) {
    return ProgressPhoto(
      id: map['id'],
      date: DateTime.parse(map['date']),
      frontPath: map['front_path'],
      sidePath: map['side_path'],
      backPath: map['back_path'],
      note: map['note'],
    );
  }
}
