
// Yarbis Beltre mercedes
//20220907

class EmergencyEvent {

  final int? id;
  final String title;
  final String description;
  final String date;
  final String imagePath;

  EmergencyEvent({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'imagePath': imagePath,
    };
  }

  factory EmergencyEvent.fromMap(Map<String, dynamic> map) {
    return EmergencyEvent(
      id: map['id'], 
      title: map['title'], 
      description: map['description'], 
      date: map['date'], 
      imagePath: map['imagePath']
    );
  }

}