import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_telkomsel_bcg/src/blocs/music/bloc/music_bloc.dart';
import 'package:test_telkomsel_bcg/src/models/request/music/music_request.dart';
import 'package:test_telkomsel_bcg/src/models/response/music/music_response.dart';

void main() {
  final MusicResponse response = MusicResponse();

  group('Music Bloc', () {
    MusicBloc musicBloc;

    setUp(() {
      musicBloc = MusicBloc();
    });

    tearDown(() {
      musicBloc?.close();
    });

    test('throws AssertionError when weatherRepository is null', () {
      expect(() => MusicBloc(), throwsAssertionError);
    });

    test('has a correct initial state', () {
      expect(musicBloc.state, MusicInitial());
    });

    group('Search Music', () {
      blocTest(
        'emits [MusicLoading, MusicSuccess] when success search music',
        build: () {
          return musicBloc;
        },
        act: (bloc) => bloc.add(SearchMusic(request: MusicRequest(term: 'isyana'))),
        expect: [
          MusicLoading(),
          MusicSuccess(musicResponse: response),
        ],
      );
    });
  });
}
