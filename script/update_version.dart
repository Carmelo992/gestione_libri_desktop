import 'dart:io';

import 'package:pub_semver/pub_semver.dart';

const mainPubspecPath = '../pubspec.yaml';

const pubspecPaths = [
  "pubspec.yaml", // File principale
  'model/pubspec.yaml',
  'view/pubspec.yaml',
  'view_model/pubspec.yaml',
];

void main() {
  final mainPubspecFile = File(mainPubspecPath);
  if (!mainPubspecFile.existsSync()) {
    print('❌ Errore: File principale non trovato in "$mainPubspecPath"');
    exit(1);
  }

  // --- 1. Leggi la versione attuale ---
  final content = mainPubspecFile.readAsStringSync();
  final versionRegex = RegExp(r'^version:\s*([^\s+]+)', multiLine: true);
  final match = versionRegex.firstMatch(content);

  if (match == null) {
    print('❌ Errore: Impossibile trovare la versione nel file pubspec.yaml principale.');
    exit(1);
  }

  final currentVersionStr = match.group(1)!;
  final currentVersion = Version.parse(currentVersionStr);

  print('Versione attuale rilevata: $currentVersion\n');

  // --- 2. Proponi le nuove versioni ---
  final nextPatch = currentVersion.nextPatch;
  final nextMinor = currentVersion.nextMinor;
  final nextMajor = currentVersion.nextMajor;

  print('Scegli la nuova versione:');
  print('0) Build: $currentVersion (Solo il numero di build)');
  print('1) Patch: $nextPatch (Correzione di bug)');
  print('2) Minor: $nextMinor (Aggiunta di funzionalità, compatibile)');
  print('3) Major: $nextMajor (Modifica radicale, non compatibile)');
  print('q) Esci');

  // --- 3. Chiedi all'utente di scegliere ---
  stdout.write('> ');
  final choice = stdin.readLineSync()?.trim();

  Version? newVersion;
  switch (choice) {
    case '0':
      newVersion = currentVersion;
      break;
    case '1':
      newVersion = nextPatch;
      break;
    case '2':
      newVersion = nextMinor;
      break;
    case '3':
      newVersion = nextMajor;
      break;
    case 'q':
    case null:
      print('Operazione annullata.');
      exit(0);
    default:
      print('Scelta non valida.');
      exit(1);
  }

  // --- 4. Aggiorna tutti i file ---
  updateAllPubspecs(newVersion.toString());
}

void updateAllPubspecs(String newVersionStr) {
  final versionRegex = RegExp(r'^(version:\s*).*(?:\+.*)?$', multiLine: true);
  print('\nInizio aggiornamento alla versione: $newVersionStr\n');
  var filesUpdated = 0;

  // Usa il percorso base dello script per risolvere i percorsi relativi
  final scriptDir = File(Platform.script.toFilePath()).parent;

  for (final relativePath in pubspecPaths) {
    // Costruisce il percorso corretto partendo dalla posizione dello script
    final absolutePath = Uri.file(scriptDir.path).resolve(relativePath).toFilePath();
    final file = File(absolutePath);

    if (!file.existsSync()) {
      print('⚠️ ATTENZIONE: File non trovato, saltato: $absolutePath');
      continue;
    }

    try {
      String content = file.readAsStringSync();
      String buildNumber = '';
      final currentVersionLine = versionRegex.firstMatch(content);
      if (currentVersionLine != null) {
        final fullLine = currentVersionLine.group(0)!;
        if (fullLine.contains('+')) {
          buildNumber = fullLine.substring(fullLine.indexOf('+')+1);
          int? buildNumberInt = int.tryParse(buildNumber);
          if (buildNumberInt != null) {
            buildNumber = '${buildNumberInt + 1}';
          }
          buildNumber="+$buildNumber";
        }
      }

      final newContent = content.replaceFirst(versionRegex, 'version: $newVersionStr$buildNumber');
      file.writeAsStringSync(newContent);
      print('✅ Aggiornato con successo: $relativePath'); // Mostra solo il nome del file
      filesUpdated++;
    } catch (e) {
      print('❌ Errore durante l\'aggiornamento di $relativePath: $e');
    }
  }

  print('\nAggiornamento completato.');
  print('$filesUpdated su ${pubspecPaths.length} file sono stati aggiornati.');
}
