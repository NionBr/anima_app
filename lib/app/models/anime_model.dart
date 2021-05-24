class AnimeModel {
  String title;
  String description;
  String episodes;
  String imageUrl;

  AnimeModel({this.title, this.description, this.episodes, this.imageUrl});

  AnimeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['synopsis'];
    episodes = json['episodes'].toString();
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJason() {
    return {
      title: 'title',
      description: 'synopsis',
      episodes: 'episodes',
      imageUrl: 'image_url',
    };
  }
}
