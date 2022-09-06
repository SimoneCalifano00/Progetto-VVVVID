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

class Generi {
  final String nome;
  int rating;

  /* String get genereText {
    switch (nome) {
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
  */

  Generi({
    required this.nome,
    required this.rating,
  });
}
