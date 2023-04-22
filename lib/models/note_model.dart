import 'dart:math';

class MusicalNote {

  String noteLetter = '';
  String noteName = '';
  int octave = 0;
  double hertz;

  MusicalNote(this.hertz) {

    final noteLetterAndOctave = _getNoteLetterFromHertz(hertz);

    noteLetter = noteLetterAndOctave['noteLetter'];
    octave = noteLetterAndOctave['octave'];
    noteName = _getNoteNameFromNoteLetter(noteLetter);
    hertz = hertz;

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
    final int amountOfNotes = notes.length;

    final int noteNumber = (12 * _base2Log(hertz / baseFrequenceOfA4) + baseNumberOfA4).round();
    final int noteIndex = noteNumber % 12;

    final String noteLetter = notes[noteIndex];
    final int octave = (noteNumber ~/ 12) - 1;

    return {'noteLetter': noteLetter.replaceAll(' ', ''), 'octave': octave};
  }

  double _base2Log(double number) {
    const naturalLogOf2 = 0.6931471805599453;
    return log(number) / naturalLogOf2;
  }
}
