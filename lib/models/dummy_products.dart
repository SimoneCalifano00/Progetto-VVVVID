import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/episode.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/reply.dart';
import 'package:new_vvvvid/models/season.dart';
import 'package:new_vvvvid/models/user.dart';

List<String> generi = ['Drammatico', 'Azione', 'Shonen', 'Comico'];

final DUMMY_PRODUCTS = [
  //Anime1-Hunter x Hunter

  Products.episodic(
      id: 1,
      title: 'Hunter x Hunter',
      previewImgUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/Hunter_x_Hunter_2011-cover.jpg',
      description:
          "Mostri, animali rari, tesori e meraviglie, terre selvagge e luoghi inesplorati. La parola 'sconosciuto' reca in sé un enorme fascino e vi sono persone incredibili al mondo attratte da tale potere. Esse sono conosciute con il nome di 'Hunter'! Gon vuole diventare uno di loro, come suo padre prima di lui, ma riuscirà in questa incredibile impresa?",
      comments: [
        Comment(
            creatorId: 1,
            text: 'Finale soddisfacente.',
            likes: 28,
            date: DateTime.utc(2022, 07, 28),
            idLikes: [],
            replies: [
              Reply(
                  text: 'Se, proprio',
                  date: DateTime.utc(2022, 07, 29),
                  userCommentingId: 2,
                  idLikes: [])
            ]),
        Comment(
          creatorId: 2,
          text: 'N-non vedremo mai la fine...',
          likes: 102,
          date: DateTime.utc(2022, 08, 17),
          idLikes: [],
          replies: [],
        ),
        Comment(
            creatorId: 3,
            text: 'e meglio tokio ghul',
            likes: 0,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2021, 09, 13)),
        Comment(
            creatorId: 4,
            text: 'Belle animazioni!',
            likes: 37,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2022, 03, 25)),
      ],
      previewImgsUrls: [
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/Hunter_x_Hunter_2011-cover.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/hxh2.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/hxh1.jpg',
      ],
      date: DateTime.utc(2011, 10, 2),
      seasons: [
        Season(
            sNumber: 1,
            nEpisodes: 36,
            productTitle: "Hunter x Hunter",
            episodes: [
              Episode(nEpisode: 1, title: 'Partenza e compagni', comments: [
                Comment(
                    creatorId: 2,
                    text: "Bell'esipodio!",
                    idLikes: [],
                    likes: 27,
                    replies: [],
                    date: DateTime.utc(2022, 08, 21))
              ]),
              Episode(nEpisode: 2, title: "L'esame dell'esame", comments: []),
              Episode(
                  nEpisode: 3,
                  title: "Rivali per la sopravvivenza",
                  comments: []),
              Episode(nEpisode: 4, title: "Speranza e ambizione", comments: []),
              Episode(nEpisode: 5, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 6, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 7, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 8, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 9, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 10, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 11, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 12, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 13, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 14, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 15, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 16, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 17, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 19, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 19, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 20, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 21, title: 'Partenza e compagni', comments: []),
              Episode(nEpisode: 22, title: 'Partenza e compagni'),
              Episode(nEpisode: 23, title: ''),
              Episode(nEpisode: 24, title: ''),
              Episode(nEpisode: 25, title: ''),
              Episode(nEpisode: 26, title: ''),
              Episode(nEpisode: 27, title: ''),
              Episode(nEpisode: 28, title: ''),
              Episode(nEpisode: 29, title: ''),
              Episode(nEpisode: 30, title: ''),
              Episode(nEpisode: 31, title: ''),
              Episode(nEpisode: 32, title: ''),
              Episode(nEpisode: 33, title: ''),
              Episode(nEpisode: 34, title: ''),
              Episode(nEpisode: 35, title: ''),
              Episode(nEpisode: 36, title: ''),
            ]),
        Season(
            sNumber: 2,
            nEpisodes: 39,
            productTitle: "Hunter x Hunter",
            episodes: [
              Episode(nEpisode: 1, title: 'Partenza e compagni'),
              Episode(nEpisode: 2, title: "L'esame dell'esame"),
              Episode(nEpisode: 3, title: "Rivali per la sopravvivenza"),
              Episode(nEpisode: 4, title: "Speranza e ambizione"),
              Episode(nEpisode: 5, title: 'Partenza e compagni'),
              Episode(nEpisode: 6, title: 'Partenza e compagni'),
              Episode(nEpisode: 7, title: 'Partenza e compagni'),
              Episode(nEpisode: 8, title: 'Partenza e compagni'),
              Episode(nEpisode: 9, title: 'Partenza e compagni'),
              Episode(nEpisode: 10, title: 'Partenza e compagni'),
              Episode(nEpisode: 11, title: 'Partenza e compagni'),
              Episode(nEpisode: 12, title: 'Partenza e compagni'),
              Episode(nEpisode: 13, title: 'Partenza e compagni'),
              Episode(nEpisode: 14, title: 'Partenza e compagni'),
              Episode(nEpisode: 15, title: 'Partenza e compagni'),
              Episode(nEpisode: 16, title: 'Partenza e compagni'),
              Episode(nEpisode: 17, title: 'Partenza e compagni'),
              Episode(nEpisode: 19, title: 'Partenza e compagni'),
              Episode(nEpisode: 19, title: 'Partenza e compagni'),
              Episode(nEpisode: 20, title: 'Partenza e compagni'),
              Episode(nEpisode: 21, title: 'Partenza e compagni'),
              Episode(nEpisode: 22, title: 'Partenza e compagni'),
              Episode(nEpisode: 23, title: ''),
              Episode(nEpisode: 24, title: ''),
              Episode(nEpisode: 25, title: ''),
              Episode(nEpisode: 26, title: ''),
              Episode(nEpisode: 27, title: ''),
              Episode(nEpisode: 28, title: ''),
              Episode(nEpisode: 29, title: ''),
              Episode(nEpisode: 30, title: ''),
              Episode(nEpisode: 31, title: ''),
              Episode(nEpisode: 32, title: ''),
              Episode(nEpisode: 33, title: ''),
              Episode(nEpisode: 34, title: ''),
              Episode(nEpisode: 35, title: ''),
              Episode(nEpisode: 36, title: ''),
              Episode(nEpisode: 37, title: ''),
              Episode(nEpisode: 38, title: ''),
              Episode(nEpisode: 39, title: ''),
            ]),
        Season(
            sNumber: 3,
            nEpisodes: 73,
            productTitle: "Hunter x Hunter",
            episodes: [
              Episode(nEpisode: 1, title: 'Partenza e compagni'),
              Episode(nEpisode: 2, title: "L'esame dell'esame"),
              Episode(nEpisode: 3, title: "Rivali per la sopravvivenza"),
              Episode(nEpisode: 4, title: "Speranza e ambizione"),
              Episode(nEpisode: 5, title: 'Partenza e compagni'),
              Episode(nEpisode: 6, title: 'Partenza e compagni'),
              Episode(nEpisode: 7, title: 'Partenza e compagni'),
              Episode(nEpisode: 8, title: 'Partenza e compagni'),
              Episode(nEpisode: 9, title: 'Partenza e compagni'),
              Episode(nEpisode: 10, title: 'Partenza e compagni'),
              Episode(nEpisode: 11, title: 'Partenza e compagni'),
              Episode(nEpisode: 12, title: 'Partenza e compagni'),
              Episode(nEpisode: 13, title: 'Partenza e compagni'),
              Episode(nEpisode: 14, title: 'Partenza e compagni'),
              Episode(nEpisode: 15, title: 'Partenza e compagni'),
              Episode(nEpisode: 16, title: 'Partenza e compagni'),
              Episode(nEpisode: 17, title: 'Partenza e compagni'),
              Episode(nEpisode: 19, title: 'Partenza e compagni'),
              Episode(nEpisode: 19, title: 'Partenza e compagni'),
              Episode(nEpisode: 20, title: 'Partenza e compagni'),
              Episode(nEpisode: 21, title: 'Partenza e compagni'),
              Episode(nEpisode: 22, title: 'Partenza e compagni'),
              Episode(nEpisode: 23, title: ''),
              Episode(nEpisode: 24, title: ''),
              Episode(nEpisode: 25, title: ''),
              Episode(nEpisode: 26, title: ''),
              Episode(nEpisode: 27, title: ''),
              Episode(nEpisode: 28, title: ''),
              Episode(nEpisode: 29, title: ''),
              Episode(nEpisode: 30, title: ''),
              Episode(nEpisode: 31, title: ''),
              Episode(nEpisode: 32, title: ''),
              Episode(nEpisode: 33, title: ''),
              Episode(nEpisode: 34, title: ''),
              Episode(nEpisode: 35, title: ''),
              Episode(nEpisode: 36, title: ''),
              Episode(nEpisode: 37, title: ''),
              Episode(nEpisode: 38, title: ''),
              Episode(nEpisode: 39, title: ''),
              Episode(nEpisode: 40, title: ''),
              Episode(nEpisode: 41, title: ''),
              Episode(nEpisode: 42, title: ''),
              Episode(nEpisode: 43, title: ''),
              Episode(nEpisode: 44, title: ''),
              Episode(nEpisode: 45, title: ''),
              Episode(nEpisode: 46, title: ''),
              Episode(nEpisode: 47, title: ''),
              Episode(nEpisode: 48, title: ''),
              Episode(nEpisode: 49, title: ''),
              Episode(nEpisode: 50, title: ''),
              Episode(nEpisode: 51, title: ''),
              Episode(nEpisode: 52, title: ''),
              Episode(nEpisode: 53, title: ''),
              Episode(nEpisode: 54, title: ''),
              Episode(nEpisode: 55, title: ''),
              Episode(nEpisode: 56, title: ''),
              Episode(nEpisode: 57, title: ''),
              Episode(nEpisode: 58, title: ''),
              Episode(nEpisode: 59, title: ''),
              Episode(nEpisode: 60, title: ''),
              Episode(nEpisode: 61, title: ''),
              Episode(nEpisode: 62, title: ''),
              Episode(nEpisode: 63, title: ''),
              Episode(nEpisode: 64, title: ''),
              Episode(nEpisode: 65, title: ''),
              Episode(nEpisode: 66, title: ''),
              Episode(nEpisode: 67, title: ''),
              Episode(nEpisode: 68, title: ''),
              Episode(nEpisode: 69, title: ''),
              Episode(nEpisode: 70, title: ''),
              Episode(nEpisode: 71, title: ''),
              Episode(nEpisode: 72, title: ''),
              Episode(nEpisode: 73, title: ''),
            ]),
      ],
      genere: Genere.Azione,
      generi: ['Azione', 'Shonen'],
      sezione: Sezione.Anime),

  Products.episodic(
      id: 2,
      title: 'Trigun',
      previewImgUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/TrigunCover.jpg',
      description:
          "Vash the Stampede, noto come tifone umanoide, è il primo uomo nella storia dichiarato calamità naturale. Ritenuto responsabile di disastri in molte città, ha su di sé una taglia da 60 miliardi di doppi dollari. La sua vera natura è però ben lontana dall'essere malvagia e crudele come tutti s'immaginano: Vash è in realtà un tipo spensierato e un pacifista convinto, sempre pronto a soccorrere e salvare i più deboli, e con due sole grandi passioni, le belle donne e le ciambelle.",
      comments: [
        Comment(
            creatorId: 1,
            text: 'Finale soddisfacente.',
            likes: 28,
            date: DateTime.utc(2022, 07, 28),
            idLikes: [],
            replies: [
              Reply(
                  text: 'Se, proprio',
                  date: DateTime.utc(2022, 07, 29),
                  userCommentingId: 2,
                  idLikes: [])
            ]),
        Comment(
          creatorId: 2,
          text: 'N-non vedremo mai la fine...',
          likes: 102,
          date: DateTime.utc(2022, 08, 17),
          idLikes: [],
          replies: [],
        ),
        Comment(
            creatorId: 3,
            text: 'e meglio tokio ghul',
            likes: 0,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2021, 09, 13)),
        Comment(
            creatorId: 4,
            text: 'Belle animazioni!',
            likes: 37,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2022, 03, 25)),
      ],
      previewImgsUrls: [
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/TrigunCover.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/trigun2.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/trigun1.jpg',
      ],
      date: DateTime.utc(1998, 4, 1),
      seasons: [
        Season(sNumber: 1, nEpisodes: 26, productTitle: "Trigun", episodes: [
          Episode(
              nEpisode: 1,
              title: "L'uomo da 60 miliardi di doppi dollari",
              comments: [
                Comment(
                    creatorId: 2,
                    text: "Bell'esipodio!",
                    idLikes: [],
                    likes: 27,
                    replies: [],
                    date: DateTime.utc(2022, 08, 21))
              ]),
          Episode(nEpisode: 2, title: "Truth of Mistake", comments: []),
          Episode(nEpisode: 3, title: "Peace Maker", comments: []),
          Episode(nEpisode: 4, title: "Love & Peace", comments: []),
          Episode(nEpisode: 5, title: 'Hard Puncher', comments: []),
          Episode(nEpisode: 6, title: 'Lost July', comments: []),
          Episode(nEpisode: 7, title: 'B.D.N.', comments: []),
          Episode(
              nEpisode: 8,
              title: '...e poi, soltanto il deserto e il cielo',
              comments: []),
          Episode(nEpisode: 9, title: 'Murder Machine', comments: []),
          Episode(nEpisode: 10, title: 'Quick draw', comments: []),
          Episode(nEpisode: 11, title: 'Escape from pain', comments: []),
          Episode(nEpisode: 12, title: 'Diablo', comments: []),
          Episode(nEpisode: 13, title: 'Vash the Stampede', comments: []),
          Episode(nEpisode: 14, title: 'Little Arcadia', comments: []),
          Episode(nEpisode: 15, title: "Demon's eye", comments: []),
          Episode(nEpisode: 16, title: 'Fifth moon', comments: []),
          Episode(nEpisode: 17, title: "Rem Saverem", comments: []),
          Episode(nEpisode: 18, title: 'Per ora, addio', comments: []),
          Episode(nEpisode: 19, title: 'Hang fire', comments: []),
          Episode(nEpisode: 20, title: 'Flying ship', comments: []),
          Episode(nEpisode: 21, title: 'Out of time', comments: []),
          Episode(nEpisode: 22, title: 'Alternative', comments: []),
          Episode(nEpisode: 23, title: 'Paradise', comments: []),
          Episode(nEpisode: 24, title: 'Il Crimine', comments: []),
          Episode(nEpisode: 25, title: 'Live through', comments: []),
          Episode(
              nEpisode: 26, title: 'Sotto un cielo così azzurro', comments: []),
        ]),
      ],
      genere: Genere.Azione,
      generi: ['Drammatico', 'Azione', 'Seinen', 'Comico'],
      sezione: Sezione.Anime),

  Products.episodic(
      id: 3,
      title: 'The Office UK',
      previewImgUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/theOfficeCoverjpg.jpg',
      description:
          "Nel grigiore di Slough, piccolo agglomerato suburbano in periferia di Londra, la vita degli impiegati di un ufficio della “Wernham Hogg”, subisce un drastico cambiamento. A rendere note le vicende dei personaggi saranno le telecamere di un vero e proprio “mockumentary”, ovvero di un documentario fittizio. I monologhi disperati, i flirt-cliché e i maldestri tentativi del direttore David Brent di conquistare l'approvazione dei suoi sottoposti sono i diversi elementi che intrecciati, formano questa sitcom, diventata un marchio distintivo della BBC",
      comments: [
        Comment(
            creatorId: 1,
            text: 'Finale soddisfacente.',
            likes: 28,
            date: DateTime.utc(2022, 07, 28),
            idLikes: [],
            replies: [
              Reply(
                  text: 'Se, proprio',
                  date: DateTime.utc(2022, 07, 29),
                  userCommentingId: 2,
                  idLikes: [])
            ]),
        Comment(
          creatorId: 2,
          text: 'N-non vedremo mai la fine...',
          likes: 102,
          date: DateTime.utc(2022, 08, 17),
          idLikes: [],
          replies: [],
        ),
        Comment(
            creatorId: 3,
            text: 'e meglio tokio ghul',
            likes: 0,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2021, 09, 13)),
        Comment(
            creatorId: 4,
            text: 'Belle animazioni!',
            likes: 37,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2022, 03, 25)),
      ],
      previewImgsUrls: [
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/theOfficeCoverjpg.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/theoffice2.jpeg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/theoffice1.jpg',
      ],
      date: DateTime.utc(2001, 7, 9),
      seasons: [
        Season(
            sNumber: 1,
            nEpisodes: 6,
            productTitle: "The Office UK",
            episodes: [
              Episode(nEpisode: 1, title: "Episodio 1", comments: [
                Comment(
                    creatorId: 2,
                    text: "Bell'esipodio!",
                    idLikes: [],
                    likes: 27,
                    replies: [],
                    date: DateTime.utc(2022, 08, 21))
              ]),
              Episode(nEpisode: 2, title: "Episodio 2", comments: []),
              Episode(nEpisode: 3, title: "Episodio 3", comments: []),
              Episode(nEpisode: 4, title: "Episodio 4", comments: []),
              Episode(nEpisode: 5, title: 'Episodio 5', comments: []),
              Episode(nEpisode: 6, title: 'Episodio 6', comments: []),
            ]),
        Season(
            sNumber: 2,
            nEpisodes: 6,
            productTitle: "The Office UK",
            episodes: [
              Episode(nEpisode: 1, title: "Episodio 1", comments: [
                Comment(
                    creatorId: 2,
                    text: "Bell'esipodio!",
                    idLikes: [],
                    likes: 27,
                    replies: [],
                    date: DateTime.utc(2022, 08, 21))
              ]),
              Episode(nEpisode: 2, title: "Episodio 2", comments: []),
              Episode(nEpisode: 3, title: "Episodio 3", comments: []),
              Episode(nEpisode: 4, title: "Episodio 4", comments: []),
              Episode(nEpisode: 5, title: 'Episodio 5', comments: []),
              Episode(nEpisode: 6, title: 'Episodio 6', comments: []),
            ]),
      ],
      genere: Genere.Azione,
      generi: ['Comico'],
      sezione: Sezione.SerieTV),

  Products.film(
      id: 4,
      title: 'Tre Colori - Film Blu',
      previewImgUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/filmBluCover.png',
      description:
          "Moglie di un compositore di successo, Julie (Binoche) perde questi e la figlia in un tragico indicente. Annaspando in un suicidio dell'anima che vorrebbe cancellare l'esistenza di un passato troppo carico di significato, la vita di Julie seguirà un percorso dall'esito incerto. Il grande maestro Kieslowski unisce il “blu” della bandiera francese, simbolo di libertà, all'analisi interiore del personaggio. Il secondo protagonista del film è la musica. Leone d'Oro a Venezia e Coppa Volpi a Juliette Binoche, è il primo capitolo di una trilogia destinata a rimanere nella storia del cinema",
      minutaggio: 97,
      comments: [
        Comment(
            creatorId: 1,
            text: 'Film sottovalutato',
            likes: 28,
            date: DateTime.utc(2022, 07, 28),
            idLikes: [],
            replies: [
              Reply(
                  text: 'Se, proprio',
                  date: DateTime.utc(2022, 07, 29),
                  userCommentingId: 2,
                  idLikes: [])
            ]),
        Comment(
          creatorId: 2,
          text: 'No dai tristissimo...',
          likes: 102,
          date: DateTime.utc(2022, 08, 17),
          idLikes: [],
          replies: [],
        ),
        Comment(
            creatorId: 3,
            text: 'ke palle',
            likes: 0,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2021, 09, 13)),
        Comment(
            creatorId: 4,
            text: 'Fa veramente riflettere...',
            likes: 37,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2022, 03, 25)),
      ],
      previewImgsUrls: [
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/filmBluCover.png',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/filmblu1.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/filmblu2.jpg',
      ],
      date: DateTime.utc(1993),
      genere: Genere.Azione,
      generi: ['Drammatico'],
      sezione: Sezione.Film),

  Products.episodic(
      id: 5,
      title: 'Code Geass',
      previewImgUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/codeGeassCover.jpg',
      description:
          "Il Sacro Impero di Britannia ha conquistato il Giappone, denominandolo Area 11. Durante uno scontro tra ribelli giapponesi e soldati imperiali, il giovane Lelouch Lamperouge salva la vita ad una ragazza dai capelli verdi. Questa in realtà è una strega di nome C.C. che gli dona il potere del Geass: assoggetare chiuque lo guardi negli occhi al suo potere. Lo spirito da leader di Lelouch, che in realtà è un principe erede al trono di Britannia, si risveglia e decide di salvare il Giappone dall'oppressione. Ma il suo amato amico d'infanzia, Suzaku Kururugi, farà di tutto per fermarlo.",
      comments: [
        Comment(
            creatorId: 1,
            text: 'Bel finale. Non ironicamente',
            likes: 28,
            date: DateTime.utc(2022, 07, 28),
            idLikes: [],
            replies: [
              Reply(
                  text: 'Se, proprio',
                  date: DateTime.utc(2022, 07, 29),
                  userCommentingId: 2,
                  idLikes: [])
            ]),
        Comment(
          creatorId: 3,
          text: 'Intrattiene molto',
          likes: 102,
          date: DateTime.utc(2022, 08, 17),
          idLikes: [],
          replies: [],
        ),
        Comment(
            creatorId: 3,
            text: 'sn cm leluch',
            likes: 0,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2021, 09, 13)),
      ],
      previewImgsUrls: [
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/codeGeassCover.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/codegeass1.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/codegeass2.png',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/codegeass3.png',
      ],
      seasons: [
        Season(
            sNumber: 1,
            nEpisodes: 26,
            episodes: [
              Episode(
                  title: 'Il giorno in cui nacque il demonio',
                  nEpisode: 1,
                  comments: []),
              Episode(
                  title: 'Il risveglio del cavaliere bianco',
                  nEpisode: 2,
                  comments: []),
              Episode(
                  title: "Un'infiltrata in classe", nEpisode: 3, comments: []),
              Episode(title: 'Il suo nome è Zero', nEpisode: 4, comments: []),
              Episode(
                  title: 'La principessa e la strega',
                  nEpisode: 5,
                  comments: []),
              Episode(
                  title: 'Il furto della maschera', nEpisode: 6, comments: []),
              Episode(title: 'Fuoco su Cornelia', nEpisode: 7, comments: []),
              Episode(
                  title: "L'Ordine dei Cavalieri Neri",
                  nEpisode: 8,
                  comments: []),
              Episode(
                  title: 'Le tracce della maschera', nEpisode: 9, comments: []),
              Episode(title: 'Refrain', nEpisode: 10, comments: []),
              Episode(title: 'La danza dei Guren', nEpisode: 11, comments: []),
              Episode(title: 'Scontro a Narita', nEpisode: 12, comments: []),
              Episode(
                  title: 'Un messaggero da Kyoto', nEpisode: 13, comments: []),
              Episode(
                  title: 'Nel mirino di Shirley', nEpisode: 14, comments: []),
              Episode(title: 'Geass contro Geass', nEpisode: 15, comments: []),
              Episode(title: 'Gli applausi di Mao', nEpisode: 16, comments: []),
              Episode(
                  title: 'Il rapimento di Nunnally',
                  nEpisode: 17,
                  comments: []),
              Episode(title: 'Cavaliere', nEpisode: 18, comments: []),
              Episode(
                  title: 'La verità della Maschera',
                  nEpisode: 19,
                  comments: []),
              Episode(
                  title: 'Un ordine per Suzaku Kururugi',
                  nEpisode: 20,
                  comments: []),
              Episode(title: "L'isola degli dei", nEpisode: 21, comments: []),
              Episode(
                  title: 'Il conflitto di Kyushu', nEpisode: 22, comments: []),
              Episode(
                  title: 'Annuncio al festival scolastico',
                  nEpisode: 23,
                  comments: []),
              Episode(
                  title: 'Almeno con tristezza', nEpisode: 24, comments: []),
              Episode(
                  title: 'Lo stage della caduta', nEpisode: 25, comments: []),
              Episode(title: 'Zero', nEpisode: 26, comments: []),
            ],
            productTitle: 'Code Geass, Lelouch of the Rebellion')
      ],
      date: DateTime.utc(2006, 10, 6),
      genere: Genere.Azione,
      generi: ['Drammatico', 'Fantascienza'],
      sezione: Sezione.Anime),

  Products.episodic(
      id: 6,
      title: 'Spaced',
      previewImgUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/spacedCover.jpg',
      description:
          "Tim (Simon Pegg) e Daisy (Jessica Stevenson) si incontrano per caso in un pub mentre sono entrambi alla ricerca di un appartamento, leggono l’annuncio perfetto, ma è solo per coppie, essendo disperatamente alla ricerca decidono di fingersi tali e affittano la casa come coppia!",
      comments: [
        Comment(
            creatorId: 1,
            text: 'Finale soddisfacente.',
            likes: 28,
            date: DateTime.utc(2022, 07, 28),
            idLikes: [],
            replies: [
              Reply(
                  text: 'Se, proprio',
                  date: DateTime.utc(2022, 07, 29),
                  userCommentingId: 2,
                  idLikes: [])
            ]),
        Comment(
          creatorId: 2,
          text: 'N-non vedremo mai la fine...',
          likes: 102,
          date: DateTime.utc(2022, 08, 17),
          idLikes: [],
          replies: [],
        ),
        Comment(
            creatorId: 3,
            text: 'e meglio tokio ghul',
            likes: 0,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2021, 09, 13)),
        Comment(
            creatorId: 4,
            text: 'Belle animazioni!',
            likes: 37,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2022, 03, 25)),
      ],
      previewImgsUrls: [
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/spacedCover.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/spaced1.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/spaced2.jpg',
      ],
      date: DateTime.utc(1999, 9, 24),
      seasons: [
        Season(sNumber: 1, nEpisodes: 7, productTitle: "Spaced", episodes: [
          Episode(nEpisode: 1, title: "Beginnings", comments: [
            Comment(
                creatorId: 2,
                text: "Bell'esipodio!",
                idLikes: [],
                likes: 27,
                replies: [],
                date: DateTime.utc(2022, 08, 21))
          ]),
          Episode(nEpisode: 2, title: "Gatherings", comments: []),
          Episode(nEpisode: 3, title: "Art", comments: []),
          Episode(nEpisode: 4, title: "Battles", comments: []),
          Episode(nEpisode: 5, title: 'Chaos', comments: []),
          Episode(nEpisode: 6, title: "Epiphanies", comments: []),
          Episode(nEpisode: 7, title: "Ends", comments: []),
        ]),
        Season(
            sNumber: 2,
            nEpisodes: 6,
            productTitle: "The Office UK",
            episodes: [
              Episode(nEpisode: 1, title: "Back", comments: [
                Comment(
                    creatorId: 2,
                    text: "Bell'esipodio!",
                    idLikes: [],
                    likes: 27,
                    replies: [],
                    date: DateTime.utc(2022, 08, 21))
              ]),
              Episode(nEpisode: 2, title: "Change", comments: []),
              Episode(nEpisode: 3, title: "Mettle", comments: []),
              Episode(nEpisode: 4, title: "Help", comments: []),
              Episode(nEpisode: 5, title: "Gone", comments: []),
              Episode(nEpisode: 6, title: "Dissolution", comments: []),
              Episode(nEpisode: 6, title: "Leaves", comments: []),
            ]),
      ],
      genere: Genere.Azione,
      generi: ['Comico'],
      sezione: Sezione.SerieTV),

  Products.film(
      id: 7,
      title: 'Control',
      previewImgUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/controlCover.jpg',
      description:
          "Inghilterra, fine degli anni 70: Ian Curtis aspira a qualcosa di molto di più che vivere nella sua cittadina natale. Desideroso di emulare i suoi idoli musicali, come David Bowie e Iggy Pop, entra a far parte di un gruppo e sogna di diventare un musicista a tutti gli effetti ma nel giro di poco tempo, le paure e le emozioni che nutrono la sua musica sembrano consumarlo lentamente. Sposatosi giovanissimo e con una figlia, trascura i suoi doveri di marito e padre per inseguire un nuovo amore e per soddisfare le aspettative sempre crescenti della sua band. La tensione e la fatica minano la sua salute e con l'epilessia che va ad aggiungersi ai suoi sensi di colpa e alla sua depressione, la disperazione si impadronisce di lui. Cedendo al peso delle responsabilità, Ian si lascia consumare dalla sua anima inquieta e torturata.",
      minutaggio: 119,
      comments: [
        Comment(
          creatorId: 2,
          text: 'Film veramente triste',
          likes: 102,
          date: DateTime.utc(2022, 08, 17),
          idLikes: [],
          replies: [],
        ),
        Comment(
            creatorId: 3,
            text:
                'Film veramente poco curato, il regista si è pure scordato i colori...',
            likes: 0,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2021, 09, 13)),
        Comment(
            creatorId: 4,
            text:
                "Film curatissimo, il bianco e nero rende perfettamente lo stato d'animo di Ian Curtis. ",
            likes: 37,
            idLikes: [],
            replies: [],
            date: DateTime.utc(2022, 03, 25)),
      ],
      previewImgsUrls: [
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/controlCover.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/control1.jpg',
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/control2.jpg',
      ],
      date: DateTime.utc(2007),
      genere: Genere.Azione,
      generi: ['Drammatico'],
      sezione: Sezione.Film),
];
