class ProgressPhoto {
  final int? id;
  final DateTime date;
  final String? front;
  final String? side;
  final String? back;

  ProgressPhoto({
    this.id,
    required this.date,
    this.front,
    this.side,
    this.back,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'front': front,
      'side': side,
      'back': back,
    };
  }

  factory ProgressPhoto.fromMap(Map<String, dynamic> map) {
    return ProgressPhoto(
      id: map['id'],
      date: DateTime.parse(map['date']),
      front: map['front'],
      side: map['side'],
      back: map['back'],
    );
  }
}
