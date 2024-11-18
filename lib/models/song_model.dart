class SongModel {
  final String id;
  final String name;
  final String songUrl;
  final String imageUrl;

  SongModel({
    required this.id,
    required this.name,
    required this.songUrl,
    required this.imageUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      songUrl: json['song_url'],
    );
  }
}
