import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:migratorydata_client_dart_v6/client.dart';

import 'configuration.dart';

final tableMatches = querySelector('#matches') as TableElement;
final migratoryDataClient = MigratoryDataClient();

void main() {
  createMatchesTable();

  connectClient();

  startSimulation();
}

void createMatchesTable() {
  var tBody = tableMatches.createTBody();

  matches.forEach((index, element) {
    var row = tBody.addRow();
    row.id = element['id'] as String;
    row.insertCell(0).text = element['home_team'] as String;
    row.insertCell(1).text = '0';
    row.insertCell(2).text = '-';
    row.insertCell(3).text = '0';
    row.insertCell(4).text = element['away_team'] as String;
  });
}

void startSimulation() {
  print('Simulation started!');
  Timer.periodic(Duration(seconds: 2), (Timer t) {
    scoreSimulation();
  });
}

void scoreSimulation() {
  for (var i = 0; i < rng.nextInt(5); i += 1) {
    var match = matches[matchesKeys[rng.nextInt(matches.length)]];
    var scoreUpdate = rng.nextInt(2) == 0 ? 'score_home' : 'score_away';
    match![scoreUpdate] = (match[scoreUpdate] as int) + 1;
    var content = json.encode({
      'id': match['id'],
      'score_home': match['score_home'],
      'score_away': match['score_away'],
      'goal': scoreUpdate
    });
    migratoryDataClient.publish(MigratoryDataMessage(
        subjectPrefix + (match['id'] as String),
        Uint8List.fromList(utf8.encode(content))));
  }
}

void connectClient() {
  migratoryDataClient.setEntitlementToken(token);
  migratoryDataClient.setListener(ListenerImpl());
  migratoryDataClient.setEncryption(encryption);
  migratoryDataClient.setServers([server]);
  migratoryDataClient.subscribe(subjects);
  migratoryDataClient.connect();
}

class ListenerImpl implements MigratoryDataListener {
  @override
  void onMessage(MigratoryDataMessage message) {
    var update = json.decode(utf8.decode(message.content));
    var row = querySelector('#' + update['id']) as TableRowElement;

    row.cells[1].text = (update['score_home'] % 10).toString();
    row.cells[3].text = (update['score_away'] % 10).toString();

    matches[update['id']]!['score_home'] = update['score_home'] % 10;
    matches[update['id']]!['score_away'] = update['score_away'] % 10;

    if (message.getMessageType() == MessageType.UPDATE) {
      if (update['goal'] == 'score_home') {
        flash(row.cells[0], row.cells[1]);
      } else {
        flash(row.cells[3], row.cells[4]);
      }
      print('onMessage - $update');
    }
  }

  @override
  void onStatus(String type, String info) {
    print('onStatus - $type - $info');
  }

  void flash(TableCellElement cell, TableCellElement cell2) {
    cell.className = 'flash';
    cell2.className = 'flash';

    Timer(Duration(seconds: 2), () {
      cell.className = '';
      cell2.className = '';
    });
  }
}
