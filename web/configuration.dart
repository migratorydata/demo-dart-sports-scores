import 'dart:math';

final token = 'some-token';
final encryption = false;
final server = 'demo.migratorydata.com';
final subjectPrefix = '/games/football/';

final rng = Random();

var matches = {
  'id1': {
    'id': 'id1',
    'home_team': 'Fenerbahce (Tur)',
    'away_team': 'Partizan (Srb)',
    'score_home': 0,
    'score_away': 0,
  },
  'id2': {
    'id': 'id2',
    'home_team': 'Olympiakos (Gre)',
    'away_team': 'Slovan Bratislava (Svk)',
    'score_home': 0,
    'score_away': 0,
  },
  'id3': {
    'id': 'id3',
    'home_team': 'Benfica (Por)',
    'away_team': 'Midtjylland (Den)',
    'score_home': 0,
    'score_away': 0,
  },
  'id4': {
    'id': 'id4',
    'home_team': 'PSV (Ned)',
    'away_team': 'Monaco (Fra)',
    'score_home': 0,
    'score_away': 0,
  },
  'id5': {
    'id': 'id5',
    'home_team': 'Guimaraes (Por)',
    'away_team': 'Hajduk Split (Cro)',
    'score_home': 0,
    'score_away': 0,
  },
  'id6': {
    'id': 'id6',
    'home_team': 'Malmo FF (Swe)',
    'away_team': 'Dudelange (Lux)',
    'score_home': 0,
    'score_away': 0,
  },
  'id7': {
    'id': 'id7',
    'home_team': 'Maribor (Slo)',
    'away_team': 'HJK (Fin)',
    'score_home': 0,
    'score_away': 0,
  },
  'id8': {
    'id': 'id8',
    'home_team': 'Paide (Est)',
    'away_team': 'Anderlecht (Bel)',
    'score_home': 0,
    'score_away': 0,
  },
  'id9': {
    'id': 'id9',
    'home_team': 'Neftci Baku (Aze)',
    'away_team': 'Rapid Viena (Aut)',
    'score_home': 0,
    'score_away': 0,
  },
  'id10': {
    'id': 'id10',
    'home_team': 'Soligorsk (Blr)',
    'away_team': 'CFR Cluj (Rou)',
    'score_home': 0,
    'score_away': 0,
  },
};

var matchesKeys = matches.keys.toList();
var subjects = matchesKeys.map((e) => subjectPrefix + e).toList();
