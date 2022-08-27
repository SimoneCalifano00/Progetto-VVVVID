enum Sezione {
  Anime,
  SerieTV,
  Film,
}

enum Genere {
  Drammatico,
  Azione,
}

class Products {
  final String title;
  final String previewImgUrl;
  final String description;
  final List<String> comments;
  final Sezione sezione;
  final Genere genere;

  List<String>? episodes;
  int? nEpisodes;
  int? nSeasons;

  Products.film({
    required this.title,
    required this.previewImgUrl,
    required this.description,
    required this.comments,
    required this.sezione,
    required this.genere,
  });

  Products.episodic(
      {required this.title,
      required this.previewImgUrl,
      required this.description,
      required this.comments,
      required this.sezione,
      required this.genere,
      this.episodes,
      this.nEpisodes,
      this.nSeasons});

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
      //aggiungere i generi
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
