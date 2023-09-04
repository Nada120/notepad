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

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'], 
      content: json['content'], 
      importance: json['importance'],
      createdTime: json['createdTime'], 
      lastUpdated: json['lastUpdated']
    );
  }

}