import 'package:flutter/material.dart';

import './models/movie.dart';
import './widgets/movie_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView from Json',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ListView from Json'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 10.0;
  void _setValue(double value) => setState(() => _value = value);

  static const List<Map<String, dynamic>> moviesJson = [
    {
      "title": "Mickey",
      "year": 1918,
      "cast": ["Mabel Normand"],
      "genres": ["Comedy"]
    },
    {
      "title": "Moonshine",
      "year": 1918,
      "cast": ["Fatty Arbuckle", "Buster Keaton"],
      "genres": ["Comedy"]
    },
    {
      "title": "Mr. Fix-It",
      "year": 1918,
      "cast": ["Douglas Fairbanks", "Wanda Hawley"],
      "genres": ["Romance", "Comedy"]
    },
    {
      "title": "Nine-Tenths of the Law",
      "year": 1918,
      "cast": ["Mitchell Lewis"],
      "genres": ["Drama"]
    },
    {"title": "Nocturnal Tunes", "year": 1918, "cast": [], "genres": []},
    {
      "title": "The Non-Stop Kid",
      "year": 1918,
      "cast": ["Harold Lloyd"],
      "genres": ["Comedy"]
    },
    {
      "title": "Nothing But Trouble",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Old Wives for New",
      "year": 1918,
      "cast": ["Elliott Dexter", "Florence Vidor"],
      "genres": ["Drama"]
    },
    {
      "title": "On the Jump",
      "year": 1918,
      "cast": ["Harold Lloyd"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Ordeal of Rosetta",
      "year": 1918,
      "cast": ["Alice Brady", "Crauford Kent"],
      "genres": ["Drama"]
    },
    {
      "title": "Out of the Inkwell",
      "year": 1918,
      "cast": [],
      "genres": ["Animated"]
    },
    {
      "title": "Out West",
      "year": 1918,
      "cast": ["Fatty Arbuckle", "Buster Keaton"],
      "genres": ["Comedy"]
    },
    {
      "title": "An Ozark Romance",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Pipe the Whiskers",
      "year": 1918,
      "cast": ["Harold Lloyd"],
      "genres": ["Comedy"]
    },
    {
      "title": "Powers That Prey",
      "year": 1918,
      "cast": ["Mary Miles Minter", "Allan Forrest"],
      "genres": ["Comedy", "Drama"]
    },
    {
      "title": "Revenge",
      "year": 1918,
      "cast": ["Edith Storey", "Wheeler Oakman"],
      "genres": ["Western"]
    },
    {
      "title": "The Richest Girl",
      "year": 1918,
      "cast": ["Anna Murdock", "David Powell"],
      "genres": ["Comedy", "Drama"]
    },
    {
      "title": "The Romance of Tarzan",
      "year": 1918,
      "cast": ["Elmo Lincoln", "Enid Markey"],
      "genres": ["Adventure"]
    },
    {
      "title": "The Safety Curtain",
      "year": 1918,
      "cast": ["Norma Talmadge", "Eugene O'Brien"],
      "genres": ["Drama"]
    },
    {
      "title": "Salomé",
      "year": 1918,
      "cast": ["Theda Bara", "G. Raymond Nye"],
      "genres": ["Drama"]
    },
    {
      "title": "The Scarlet Drop",
      "year": 1918,
      "cast": ["Harry Carey", "Molly Malone"],
      "genres": ["Western"]
    },
    {
      "title": "Set Free",
      "year": 1918,
      "cast": ["Edith Roberts", "Harold Goodwin"],
      "genres": ["Drama"]
    },
    {
      "title": "She Loves Me Not",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Shoulder Arms",
      "year": 1918,
      "cast": ["Charlie Chaplin", "Sydney Chaplin"],
      "genres": ["Comedy"]
    },
    {
      "title": "Sic 'Em, Towser",
      "year": 1918,
      "cast": ["Harold Lloyd"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Sinking of the Lusitania",
      "year": 1918,
      "cast": [],
      "genres": ["Short", "Animated"]
    },
    {
      "title": "Six Shooter Andy",
      "year": 1918,
      "cast": ["Tom Mix", "Bert Woodruff"],
      "genres": ["Western"]
    },
    {
      "title": "Social Briars",
      "year": 1918,
      "cast": ["Mary Miles Minter", "Allan Forrest"],
      "genres": ["Comedy", "Drama"]
    },
    {
      "title": "Somewhere in Turkey",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Squaw Man",
      "year": 1918,
      "cast": ["Elliott Dexter", "Ann Little"],
      "genres": ["Western"]
    },
    {
      "title": "Stella Maris",
      "year": 1918,
      "cast": ["Mary Pickford"],
      "genres": ["Drama"]
    },
    {
      "title": "Swing Your Partners",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Tad's Swimming Hole",
      "year": 1918,
      "cast": ["Ernest Butterworth"],
      "genres": ["Comedy"]
    },
    {
      "title": "Take a Chance",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Tarzan of the Apes",
      "year": 1918,
      "cast": ["Elmo Lincoln", "and", "Enid Markey"],
      "genres": ["Adventure"]
    },
    {
      "title": "That's Him",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Till I Come Back to You",
      "year": 1918,
      "cast": ["Bryant Washburn", "Florence Vidor"],
      "genres": ["Drama"]
    },
    {
      "title": "The Tip",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Treasure Island",
      "year": 1918,
      "cast": ["Francis Carpenter", "Virginia Lee Corbin"],
      "genres": ["Adventure"]
    },
    {
      "title": "Triple Trouble",
      "year": 1918,
      "cast": ["Charlie Chaplin"],
      "genres": ["Comedy"]
    },
    {
      "title": "Two-Gun Gussie",
      "year": 1918,
      "cast": ["Harold Lloyd"],
      "genres": ["Comedy"]
    },
    {
      "title": "Two Scrambled",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "Under the Yoke",
      "year": 1918,
      "cast": ["Theda Bara", "G. Raymond Nye"],
      "genres": ["Drama"]
    },
    {
      "title": "Under the Greenwood Tree",
      "year": 1918,
      "cast": ["Elsie Ferguson", "Eugene O'Brien"],
      "genres": ["Drama"]
    },
    {
      "title": "The Venus Model",
      "year": 1918,
      "cast": ["Mabel Normand", "Rod La Rocque"],
      "genres": ["Romance", "Comedy"]
    },
    {
      "title": "We Can't Have Everything",
      "year": 1918,
      "cast": ["Kathlyn Williams", "Elliott Dexter"],
      "genres": ["Drama"]
    },
    {
      "title": "When Do We Eat?",
      "year": 1918,
      "cast": ["Enid Bennett", "Albert Ray"],
      "genres": ["Comedy"]
    },
    {
      "title": "Which Woman?",
      "year": 1918,
      "cast": ["Ella Hall", "A. Edward Sutherland"],
      "genres": ["Drama"]
    },
    {
      "title": "The Whispering Chorus",
      "year": 1918,
      "cast": ["Raymond Hatton", "Kathlyn Williams"],
      "genres": ["Drama"]
    },
    {
      "title": "Why Pick on Me?",
      "year": 1918,
      "cast": ["Harold Lloyd", "Bebe Daniels"],
      "genres": ["Comedy"]
    },
    {
      "title": "23 1/2 Hours' Leave",
      "year": 1919,
      "cast": ["Douglas MacLean", "Doris May"],
      "genres": ["Comedy"]
    },
    {
      "title": "The A.B.C. of Love",
      "year": 1919,
      "cast": ["Mae Murray", "Holmes Herbert"],
      "genres": ["Drama"]
    },
    {
      "title": "Ace of the Saddle",
      "year": 1919,
      "cast": ["Harry Carey", "Peggy Pearce"],
      "genres": ["Western"]
    },
    {
      "title": "An Adventure in Hearts",
      "year": 1919,
      "cast": ["Robert Warwick", "Helene Chadwick"],
      "genres": ["Adventure"]
    },
    {
      "title": "The Adventure Shop",
      "year": 1919,
      "cast": ["Corinne Griffith", "Walter McGrail"],
      "genres": ["Comedy"]
    },
    {
      "title": "After His Own Heart",
      "year": 1919,
      "cast": ["Hale Hamilton", "Naomi Childers"],
      "genres": ["Comedy"]
    },
    {
      "title": "Alias Mike Moran",
      "year": 1919,
      "cast": ["Wallace Reid", "Ann Little"],
      "genres": ["Comedy"]
    },
    {
      "title": "All of a Sudden Norma",
      "year": 1919,
      "cast": ["Bessie Barriscale", "Joseph J. Dowling"],
      "genres": ["Comedy", "Drama"]
    },
    {
      "title": "All Wrong",
      "year": 1919,
      "cast": ["Bryant Washburn", "Mildred Davis"],
      "genres": ["Comedy"]
    },
    {
      "title": "Almost a Husband",
      "year": 1919,
      "cast": ["Will Rogers", "Peggy Wood", "Herbert Standing"],
      "genres": ["Comedy"]
    },
    {
      "title": "Almost Married",
      "year": 1919,
      "cast": ["May Allison", "June Elvidge", "Sam Hardy"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Amateur Adventuress",
      "year": 1919,
      "cast": ["Emmy Wehlen", "Eugene Pallette"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Amazing Impostor",
      "year": 1919,
      "cast": ["Mary Miles Minter", "Carl Stockdale"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Amazing Wife",
      "year": 1919,
      "cast": ["Mary MacLaren", "Frank Mayo"],
      "genres": ["Drama"]
    },
    {
      "title": "An Innocent Adventuress",
      "year": 1919,
      "cast": ["Vivian Martin", "Lloyd Hughes"],
      "genres": ["Comedy"]
    },
    {
      "title": "Anne of Green Gables",
      "year": 1919,
      "cast": ["Mary Miles Minter", "Paul Kelly"],
      "genres": ["Comedy", "Drama"]
    },
    {
      "title": "As a Man Thinks",
      "year": 1919,
      "cast": ["Leah Baird", "Warburton Gamble"],
      "genres": ["Drama"]
    },
    {
      "title": "As the Sun Went Down",
      "year": 1919,
      "cast": ["Edith Storey", "Lew Cody"],
      "genres": ["Western"]
    },
    {
      "title": "The Avalanche",
      "year": 1919,
      "cast": ["Elsie Ferguson", "Lumsden Hare"],
      "genres": ["Drama"]
    },
    {
      "title": "A Bachelor's Wife",
      "year": 1919,
      "cast": ["Mary Miles Minter", "Allan Forrest"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Bandbox",
      "year": 1919,
      "cast": ["Doris Kenyon", "Gretchen Hartman"],
      "genres": ["Mystery"]
    },
    {
      "title": "Bare-Fisted Gallagher",
      "year": 1919,
      "cast": ["William Desmond", "Agnes Vernon"],
      "genres": ["Western"]
    },
    {
      "title": "Bare Fists",
      "year": 1919,
      "cast": ["Harry Carey", "Betty Schade"],
      "genres": ["Western"]
    },
    {
      "title": "Be a Little Sport",
      "year": 1919,
      "cast": ["Albert Ray", "Elinor Fair"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Beauty Market",
      "year": 1919,
      "cast": ["Katherine MacDonald", "Winter Hall"],
      "genres": ["Romance"]
    },
    {
      "title": "Beauty-Proof",
      "year": 1919,
      "cast": ["Harry T. Morey", "Betty Blythe"],
      "genres": ["Drama"]
    },
    {
      "title": "Beating the Odds",
      "year": 1919,
      "cast": ["Harry T. Morey", "Betty Blythe"],
      "genres": ["Drama"]
    },
    {
      "title": "Beckoning Roads",
      "year": 1919,
      "cast": ["Bessie Barriscale", "Niles Welch"],
      "genres": ["Drama"]
    },
    {
      "title": "Behind the Door",
      "year": 1919,
      "cast": ["Hobart Bosworth", "Jane Novak", "Wallace Beery"],
      "genres": ["War", "Drama"]
    },
    {
      "title": "The Belle of New York",
      "year": 1919,
      "cast": ["Marion Davies", "Etienne Girardot"],
      "genres": ["Drama"]
    },
    {
      "title": "The Best Man",
      "year": 1919,
      "cast": ["J. Warren Kerrigan", "Lois Wilson"],
      "genres": ["Comedy"]
    },
    {
      "title": "Better Times",
      "year": 1919,
      "cast": ["David Butler", "ZaSu Pitts"],
      "genres": ["Drama"]
    },
    {
      "title": "The Better Wife",
      "year": 1919,
      "cast": ["Clara Kimball Young", "Nigel Barrie"],
      "genres": ["Drama"]
    },
    {
      "title": "Beware!",
      "year": 1919,
      "cast": ["Julia Hurley", "Herbert Standing"],
      "genres": ["War"]
    },
    {
      "title": "The Big Little Person",
      "year": 1919,
      "cast": ["Mae Marsh", "Rudolph Valentino"],
      "genres": ["Romance"]
    },
    {
      "title": "Bill Apperson's Boy",
      "year": 1919,
      "cast": ["Jack Pickford", "Russell Simpson", "Gloria Hope"],
      "genres": ["Drama"]
    },
    {
      "title": "Bill Henry",
      "year": 1919,
      "cast": ["Charles Ray", "Edith Roberts"],
      "genres": ["Comedy"]
    },
    {
      "title": "The Bishop's Emeralds",
      "year": 1919,
      "cast": ["Virginia Pearson", "Lucy Fox"],
      "genres": ["Drama"]
    },
    {
      "title": "The Black Circle",
      "year": 1919,
      "cast": ["Creighton Hale", "Virginia Valli"],
      "genres": ["Drama"]
    },
    {
      "title": "The Black Gate",
      "year": 1919,
      "cast": ["Earle Williams", "Ruth Clifford"],
      "genres": ["Mystery"]
    },
    {
      "title": "Blackie's Redemption",
      "year": 1919,
      "cast": ["Bert Lytell", "Alice Lake"],
      "genres": ["Drama"]
    },
    {
      "title": "Blind Husbands",
      "year": 1919,
      "cast": ["Erich von Stroheim", "Francelia Billington"],
      "genres": ["Drama", "Romance"]
    },
    {
      "title": "Blind Man's Eyes",
      "year": 1919,
      "cast": ["Bert Lytell", "Frank Currier", "Naomi Childers"],
      "genres": ["Drama"]
    },
    {
      "title": "The Blinding Trail",
      "year": 1919,
      "cast": ["Monroe Salisbury", "Claire Anderson"],
      "genres": ["Drama"]
    },
    {
      "title": "The Blue Bandanna",
      "year": 1919,
      "cast": ["William Desmond", "Russell Simpson"],
      "genres": ["Drama"]
    },
    {
      "title": "The Bluffer",
      "year": 1919,
      "cast": ["June Elvidge", "Irving Cummings", "Frank Mayo"],
      "genres": ["Drama"]
    },
    {
      "title": "Bolshevism on Trial",
      "year": 1919,
      "cast": ["Robert Frazer", "Pinna Nesbit"],
      "genres": ["Drama"]
    },
    {
      "title": "The Bondage of Barbara",
      "year": 1919,
      "cast": ["Mae Marsh", "Matt Moore"],
      "genres": ["Drama"]
    },
    {
      "title": "Bonds of Honor",
      "year": 1919,
      "cast": ["Sessue Hayakawa", "Marin Sais"],
      "genres": ["Drama"]
    },
    {
      "title": "Bonds of Love",
      "year": 1919,
      "cast": ["Pauline Frederick", "Percy Standing"],
      "genres": ["Romance"]
    },
    {
      "title": "Bonnie Bonnie Lassie",
      "year": 1919,
      "cast": ["Mary MacLaren", "Spottiswoode Aitken"],
      "genres": ["Comedy"]
    },
    {
      "title": "Boots",
      "year": 1919,
      "cast": ["Dorothy Gish", "Richard Barthelmess"],
      "genres": ["Comedy"]
    }
  ];

  final Movie movie = Movie.fromJson({
    "title": "Boots",
    "year": 1919,
    "cast": ["Dorothy Gish", "Richard Barthelmess"],
    "genres": ["Comedy"]
  });

  final List<Movie> movies =
      moviesJson.map((Map model) => Movie.fromJson(model)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: MovieList(movies),
      ),
    );
  }
}
