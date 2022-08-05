import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:migratorydata_client_dart_v6/client.dart';

import 'configuration.dart';

final tableMatches = querySelector('#matches') as TableElement;
final console = querySelector('#console') as TextAreaElement;
final migratoryDataClient = createAndConnectClient();

var simulationRunning = false;

void main() {
  createMatchesTable();

  querySelector('#start_simulation')?.onClick.listen(startSimulation);
}

void createMatchesTable() {
  var tBody = tableMatches.createTBody();

  matches.asMap().forEach((index, element) {
    var row = tBody.insertRow(index);
    row.id = element['id'] as String;
    row.insertCell(0).text = element['home_team'] as String;
    row.insertCell(1).text = '0';
    row.insertCell(2).text = '-';
    row.insertCell(3).text = '0';
    row.insertCell(4).text = element['away_team'] as String;
  });
}

void startSimulation(Event e) {
  if (simulationRunning == false) {
    simulationRunning = true;
    Timer.periodic(Duration(seconds: 2), (Timer t) {
      scoreSimulation();
    });
  }
}

void scoreSimulation() {
  for (var i = 0; i < rng.nextInt(5); i += 1) {
    var match = matches[rng.nextInt(matches.length)];
    var content = json.encode({
      'id': match['id'],
      'update': rng.nextInt(2) == 0 ? 'score_home' : 'score_away'
    });
    migratoryDataClient.publish(MigratoryDataMessage(
        subject, Uint8List.fromList(utf8.encode(content))));
  }
}

MigratoryDataClient createAndConnectClient() {
  var client = MigratoryDataClient();
  client.setEntitlementToken(token);
  client.setListener(ListenerImpl());
  client.setEncryption(encryption);
  client.setServers([server]);
  client.subscribe([subject]);
  client.connect();

  return client;
}

class ListenerImpl implements MigratoryDataListener {
  @override
  void onMessage(MigratoryDataMessage message) {
    if (message.getMessageType() == MessageType.UPDATE) {
      var update = json.decode(utf8.decode(message.content));
      var row = querySelector('#' + update['id']) as TableRowElement;
      if (update['update'] == 'score_home') {
        var oldScore = int.parse(row.cells[1].text!);
        row.cells[1].text = (oldScore + 1).toString();

        flash(row.cells[0], row.cells[1]);
      } else {
        var oldScore = int.parse(row.cells[3].text!);
        row.cells[3].text = (oldScore + 1).toString();

        flash(row.cells[3], row.cells[4]);
      }
      writeToConsole('onMessage - $update\n');
    }
  }

  @override
  void onStatus(String type, String info) {
    writeToConsole('onStatus - $type - $info\n');
  }

  void flash(TableCellElement cell, TableCellElement cell2) {
    cell.className = 'flash';
    cell2.className = 'flash';

    Timer(Duration(seconds: 2), () {
      cell.className = '';
      cell2.className = '';
    });
  }

  void writeToConsole(data) {
    console.appendText(data);
    console.scrollTop = console.scrollHeight;
  }
}
