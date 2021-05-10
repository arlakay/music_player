import 'package:flutter_test/flutter_test.dart';
import 'package:test_telkomsel_bcg/src/blocs/music/bloc/music_bloc.dart';
import 'package:test_telkomsel_bcg/src/models/request/music/music_request.dart';

void main() {
  final MusicRequest request = MusicRequest(term: 'isyana');

  group('MusicEvent', () {
    group('GetMusic', () {
      test('props are [request]', () {
        expect(GetMusic(request: request).props, [request]);
      });
    });

    group('SearchMusic', () {
      test('props are [request]', () {
        expect(SearchMusic(request: request).props, [request]);
      });
    });
  });
}
