import 'dart:math';

final token = 'some-token';
final encryption = false;
final server = 'demo.migratorydata.com';
final subject = '/games/football/all';

final rng = Random();

var matches = [
  {
    'id': 'id1',
    'home_team': 'Fenerbahce (Tur)',
    'away_team': 'Partizan (Srb)',
  },
  {
    'id': 'id2',
    'home_team': 'Olympiakos (Gre)',
    'away_team': 'Slovan Bratislava (Svk)',
  },
  {
    'id': 'id3',
    'home_team': 'Benfica (Por)',
    'away_team': 'Midtjylland (Den)',
  },
  {
    'id': 'id4',
    'home_team': 'PSV (Ned)',
    'away_team': 'Monaco (Fra)',
  },
  {
    'id': 'id5',
    'home_team': 'Guimaraes (Por)',
    'away_team': 'Hajduk Split (Cro)',
  },
  {
    'id': 'id6',
    'home_team': 'Malmo FF (Swe)',
    'away_team': 'Dudelange (Lux)',
  },
  {
    'id': 'id7',
    'home_team': 'Maribor (Slo)',
    'away_team': 'HJK (Fin)',
  },
  {
    'id': 'id8',
    'home_team': 'Paide (Est)',
    'away_team': 'Anderlecht (Bel)',
  },
  {
    'id': 'id9',
    'home_team': 'Neftci Baku (Aze)',
    'away_team': 'Rapid Viena (Aut)',
  },
  {
    'id': 'id10',
    'home_team': 'Soligorsk (Blr)',
    'away_team': 'CFR Cluj (Rou)',
  },
];
