import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/episode.dart';
import 'package:new_vvvvid/models/season.dart';

enum Sezione {
  Anime,
  SerieTV,
  Film,
}

enum Genere {
  Avventura,
  Comico,
  Azione,
  Drammatico,
  Fantascienza,
  Fantasy,
  Horror,
  Thriller,
  Supereroistico,
}

class Products {
  final int id;
  final String title;
  final String previewImgUrl;
  final String description;
  final List<Comment> comments;
  final Sezione sezione;
  final Genere genere;
  final List<String> generi;
  final DateTime date;
  final bool watchLater = false;

  List<String>? previewImgsUrls;

  List<Season>? seasons;

  Products.film({
    required this.id,
    required this.title,
    required this.previewImgUrl,
    required this.description,
    required this.comments,
    required this.sezione,
    required this.genere,
    required this.generi, // prova
    required this.date,
  });

  Products.episodic({
    required this.id,
    required this.title,
    required this.previewImgUrl,
    this.previewImgsUrls,
    required this.description,
    required this.comments,
    required this.sezione,
    required this.genere,
    required this.generi, //prova
    required this.date,
    required this.seasons,
  });

  String get sezioneText {
    switch (sezione) {
      case Sezione.Anime:
        return 'Anime';
        break;
      case Sezione.SerieTV:
        return 'Serie TV';
        break;
      case Sezione.Film:
        return 'Film';
        break;
    }
  }

  String get genereText {
    switch (genere) {
      case Genere.Azione:
        return 'Azione';
        break;
      case Genere.Drammatico:
        return 'Drammatico';
        break;
      case Genere.Avventura:
        return 'Avventura';
        break;
      case Genere.Comico:
        return 'Comico';
        break;
      case Genere.Fantascienza:
        return 'Fantascienza';
      case Genere.Fantasy:
        return 'Fantasy';
      case Genere.Horror:
        return 'Horror';
      case Genere.Supereroistico:
        return 'Supereroistico';
      case Genere.Thriller:
        return 'Thriller';
    }
  }

  bool get isEpisodic {
    switch (sezione) {
      case Sezione.Film:
        return false;
      case Sezione.Anime:
        return true;
      case Sezione.SerieTV:
        return true;
    }
  }

  bool get isAnime {
    switch (sezione) {
      case Sezione.Film:
        return false;
      case Sezione.Anime:
        return true;
      case Sezione.SerieTV:
        return false;
    }
  }

  bool get isSerieTV {
    switch (sezione) {
      case Sezione.Film:
        return false;
      case Sezione.Anime:
        return false;
      case Sezione.SerieTV:
        return true;
    }
  }

  bool get isFilm {
    switch (sezione) {
      case Sezione.Film:
        return true;
      case Sezione.Anime:
        return false;
      case Sezione.SerieTV:
        return false;
    }
  }
}
