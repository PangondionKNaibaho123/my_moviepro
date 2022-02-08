class Genre {
  final int id;
  final String genre_name;

  Genre(this.id, this.genre_name);

  Genre.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        genre_name = jsonMap['name'];
}