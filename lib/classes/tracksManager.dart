import 'track.dart';
import 'dart:math' show Random, pow;

class _TracksManager {
  List<Track> tracks = [
    Track(name: "asd", startTime: DateTime(10), endTime: DateTime(11))
  ];

  void addTrack(Track track) {
    tracks.add(track);
  }

  void removeTrack(Track track) {
    tracks.remove(track);
  }

  void generateRandomTracks(int count) {
    tracks.clear();
    var rnd = new Random();
    for (int i = 0; i < count; i++) {
      int startday = rnd.nextInt(10);
      int endday = startday + rnd.nextInt(20);
      int starthour = rnd.nextInt(6);
      int endhour = starthour + rnd.nextInt(6);
      int startminute = rnd.nextInt(30);
      int endminute = startminute + rnd.nextInt(30);
      int startms = rnd.nextInt(500);
      int endms = startms + rnd.nextInt(500);
      tracks.add(Track(
        name: "Track $i",
        startTime: DateTime(2018, 7, startday, starthour, startminute, startms),
        endTime: DateTime(2018, 7, endday, endhour, endminute, endms),
      ));
    }

    print(tracks.length);
  }
}

_TracksManager TracksManager = _TracksManager();
