class Note{
  final String title;
  final String content;
  final String importance;
  final String createdTime;
  final String lastUpdated;
  
  Note({
    required this.title,
    required this.content,
    this.importance = 'low',
    required this.createdTime,
    required this.lastUpdated,
  });

  Note copy({
    String? title,
    String? content,
    String? importance,
    String? createdTime,
    String? lastUpdated
  }) => Note(
    title: title ?? this.title, 
    content: content ?? this.content,
    importance: importance ?? this.importance, 
    createdTime: createdTime ?? this.createdTime, 
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );

  static Note fromJson(Map<String, dynamic> json) => Note(
    title: json['title'],
    content: json['content'],
    importance: json['importance'],
    createdTime: json['createdTime'],//+json['createdClock'],
    lastUpdated: json['lastUpdated']//+json['lastUpClock']
  ); 

}