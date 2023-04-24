import 'dart:math';

class MusicalNote {

  String noteLetter = '';
  String noteName = '';
  int octave = 0;
  bool inTune = false;
  bool tooTreble = false;
  bool tooBass = false;
  double hertz;

  MusicalNote(this.hertz) {

    final noteLetterAndOctave = _getNoteLetterFromHertz(hertz);
    final inTuneTooTrebleAndTooBassStatus = _getTuneStatusFromHertz(hertz);

    noteLetter = noteLetterAndOctave['noteLetter'];
    octave = noteLetterAndOctave['octave'];
    noteName = _getNoteNameFromNoteLetter(noteLetter);
    hertz = hertz;
    inTune = inTuneTooTrebleAndTooBassStatus[0];
    tooTreble = inTuneTooTrebleAndTooBassStatus[1];
    tooBass = inTuneTooTrebleAndTooBassStatus[2];

  }

  String _getNoteNameFromNoteLetter(String noteLetter) {
    Map<String, String> notesInPortuguese = {
      'C': 'Dó',
      'C#': 'Dó Sustenido',
      'D': 'Ré',
      'D#': 'Ré Sustenido',
      'E': 'Mi',
      'F': 'Fá',
      'F#': 'Fá Sustenido',
      'G': 'Sol',
      'G#': 'Sol Sustenido',
      'A': 'Lá',
      'A#': 'Lá Sustenido',
      'B': 'Si',
    };
    return notesInPortuguese[noteLetter] ?? 'Nota não encontrada';
  }

  Map<String, dynamic> _getNoteLetterFromHertz(double hertz) {
    final List<String> notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
    const double baseFrequenceOfA4 = 440.0;
    const int baseNumberOfA4 = 69;
    final int baseOctave = 4;
    final int amountOfNotes = notes.length;
    final double tolerance = 5.0;

    final int noteNumber = (12 * _base2Log(hertz / baseFrequenceOfA4) + baseNumberOfA4).round();
    final int noteIndex = noteNumber % 12;

    final String noteLetter = notes[noteIndex];
    final int octave = (noteNumber ~/ 12) - 1;

    final int distanceFromA4 = (octave - baseOctave) * amountOfNotes + noteIndex - 9;
    final double noteFrequency = baseFrequenceOfA4 * pow(2.0, distanceFromA4 / amountOfNotes);
    final double difference = hertz - noteFrequency;

    return {'noteLetter': noteLetter.replaceAll(' ', ''), 'octave': octave};
  }

  List<bool> _getTuneStatusFromHertz(double hertz) {
    final List<String> notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
    const double baseFrequenceOfA4 = 440.0;
    const int baseNumberOfA4 = 69;
    final int baseOctave = 4;
    final int amountOfNotes = notes.length;
    final double tolerance = 5.0;

    final int noteNumber = (12 * _base2Log(hertz / baseFrequenceOfA4) + baseNumberOfA4).round();
    final int noteIndex = noteNumber % 12;

    final int octave = (noteNumber ~/ 12) - 1;

    final int distanceFromA4 = (octave - baseOctave) * amountOfNotes + noteIndex - 9;
    final double noteFrequency = baseFrequenceOfA4 * pow(2.0, distanceFromA4 / amountOfNotes);
    final double difference = hertz - noteFrequency;

    final bool inTune = difference.abs() <= tolerance;
    bool tooTreble = false;
    bool tooBass = false;

    if (!inTune) {
      tooTreble = difference > 0;
      tooBass = !tooTreble;
    }

    return [inTune, tooTreble, tooBass];

  }

  double _base2Log(double number) {
    const naturalLogOf2 = 0.6931471805599453;
    return log(number) / naturalLogOf2;
  }
}
