import 'package:flutter_test/flutter_test.dart';
import 'package:test/models/note_model.dart';

void main() {

  late MusicalNote systemUnderTest;

  test('All exact note frequences should return the correct note letter and octave', () {
    final notes = {
      16.35: 'C 0', 17.32: 'C# 0', 18.35: 'D 0', 19.45: 'D# 0', 20.60: 'E 0', 21.83: 'F 0', 23.12: 'F# 0', 24.50: 'G 0', 25.96: 'G# 0', 27.50: 'A 0', 29.14: 'A# 0', 30.87: 'B 0',
      32.70: 'C 1', 34.65: 'C# 1', 36.71: 'D 1', 38.89: 'D# 1', 41.20: 'E 1', 43.65: 'F 1', 46.25: 'F# 1', 49.00: 'G 1', 51.91: 'G# 1', 55.00: 'A 1', 58.27: 'A# 1', 61.74: 'B 1',
      65.41: 'C 2', 69.30: 'C# 2', 73.42: 'D 2', 77.78: 'D# 2', 82.41: 'E 2', 87.31: 'F 2', 92.50: 'F# 2', 98.00: 'G 2', 103.83: 'G# 2', 110.00: 'A 2', 116.54: 'A# 2', 123.47: 'B 2',
      130.81: 'C 3', 138.59: 'C# 3', 146.83: 'D 3', 155.56: 'D# 3', 164.81: 'E 3', 174.61: 'F 3', 185.00: 'F# 3', 196.00: 'G 3', 207.65: 'G# 3', 220.00: 'A 3', 233.08: 'A# 3', 246.94: 'B 3',
      261.63: 'C 4', 277.18: 'C# 4', 293.66: 'D 4', 311.13: 'D# 4', 329.63: 'E 4', 349.23: 'F 4', 369.99: 'F# 4', 392.00: 'G 4', 415.30: 'G# 4', 440.00: 'A 4', 466.16: 'A# 4', 493.88: 'B 4',
      523.25: 'C 5', 554.37: 'C# 5', 587.33: 'D 5', 622.25: 'D# 5', 659.25: 'E 5', 698.46: 'F 5', 739.99: 'F# 5', 783.99: 'G 5', 830.61: 'G# 5', 880.00: 'A 5', 932.33: 'A# 5', 987.77: 'B 5',
      1046.50: 'C 6', 1108.73: 'C# 6', 1174.66: 'D 6', 1244.51: 'D# 6', 1318.51: 'E 6', 1396.91: 'F 6', 1479.98: 'F# 6', 1567.98: 'G 6', 1661.22: 'G# 6', 1760.00: 'A 6', 1864.66: 'A# 6', 1975.53: 'B 6',
      2093.00: 'C 7', 2217.46: 'C# 7', 2349.32: 'D 7', 2489.02: 'D# 7', 2637.02: 'E 7', 2793.83: 'F 7', 2959.96: 'F# 7', 3135.96: 'G 7', 3322.44: 'G# 7', 3520.00: 'A 7', 3729.31: 'A# 7', 3951.07: 'B 7',
      4186.01: 'C 8', 4434.92: 'C# 8', 4698.63: 'D 8', 4978.03: 'D# 8', 5274.04: 'E 8', 5587.65: 'F 8', 5919.91: 'F# 8', 6271.93: 'G 8', 6644.88: 'G# 8', 7040.00: 'A 8', 7458.62: 'A# 8', 7902.13: 'B 8'
    };

    notes.forEach((frequence, noteLetter) {

      systemUnderTest = MusicalNote(frequence);

      String letter = noteLetter.split(' ')[0];
      int octave = int.parse(noteLetter.split(' ')[1]);

      expect(systemUnderTest.noteLetter, letter);
      expect(systemUnderTest.octave, octave);
      expect(systemUnderTest.inTune, true);
      expect(systemUnderTest.tooBass, false);
      expect(systemUnderTest.tooTreble, false);

    });

  });

  test('A non exact note frequence should evaluate to its closest exact frequence note', () {
    systemUnderTest = MusicalNote(430);
    expect(systemUnderTest.noteLetter, 'A');
    expect(systemUnderTest.octave, 4);
    expect(systemUnderTest.inTune, false);
    expect(systemUnderTest.tooBass, true);
    expect(systemUnderTest.tooTreble, false);

    systemUnderTest = MusicalNote(425);
    expect(systemUnderTest.noteLetter, 'G#');
    expect(systemUnderTest.octave, 4);
    expect(systemUnderTest.inTune, false);
    expect(systemUnderTest.tooBass, false);
    expect(systemUnderTest.tooTreble, true);

  });

}
