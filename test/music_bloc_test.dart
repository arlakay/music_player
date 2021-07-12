import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_telkomsel_bcg/src/blocs/music/music_bloc.dart';
import 'package:test_telkomsel_bcg/src/models/request/music/music_request.dart';
import 'package:test_telkomsel_bcg/src/models/response/music/music_response.dart';
import 'package:test_telkomsel_bcg/src/utils/network/network_manager.dart';

import 'mock_json_data.dart';

class MockNetworkManager extends Mock implements NetworkManager {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late NetworkManager? networkManager;
  late MusicBloc musicBloc;
  late MusicResponse? musicResponse;
  MusicRequest request = MusicRequest();

  group('Music Bloc Test', () {
    setUp(() async {
      networkManager = MockNetworkManager();
      musicBloc = MusicBloc(networkManager: networkManager);

      request = MusicRequest(term: MockJsonData.mockRequest);

      dynamic responseSuccessWithData = json.decode(MockJsonData.responseSuccess);
      musicResponse = musicResponseFromJson(responseSuccessWithData);

      List<Result> result = [];
      List<dynamic> responseJson = json.decode(MockJsonData.responseArray);
      for (int i = 0; i < responseJson.length; i++) {
        musicResponse!.results!.add(Result.fromJson(responseJson[i]));
      }
    });

    tearDown(() {
      musicBloc.close();
    });

    blocTest<MusicBloc, MusicState>(
      'emits [] when nothing is added',
      build: () => musicBloc,
      wait: const Duration(milliseconds: 700),
      expect: () => [],
    );

    test('emits initial condition', () {
      expect(musicBloc.state, MusicInitial());
    });

    blocTest<MusicBloc, MusicState>(
      'emits [MusicLoading(), MusicSuccess()] when searchMusic success',
      build: () => musicBloc,
      seed: () => MusicInitial(),
      act: (bloc) async =>
          bloc..add(GetMusic(request: MusicRequest(term: '')))..add(SearchMusic(request: MusicRequest(term: 'isyana'))),
      wait: const Duration(milliseconds: 700),
      expect: () => [MusicLoading(), MusicSuccess(musicResponse: musicResponse)],
    );

    test('Event Success With Data', () async {
      when(networkManager!.searchMusic(query: 'isyana')).thenAnswer((_) async {
        return Future.value(musicResponse);
      });

      expectLater(
          musicBloc.state,
          emitsInOrder([
            MusicInitial(),
            MusicLoading(),
            MusicSuccess(musicResponse: musicResponse),
          ]));

      musicBloc.add(SearchMusic(request: request));
    });

    test('Event Error Null Data', () async {
      when(networkManager!.searchMusic(query: 'isyana')).thenAnswer((_) async {
        return Future.value(json.decode(MockJsonData.responseError));
      });

      expectLater(
          musicBloc.state,
          emitsInOrder([
            MusicInitial(),
            MusicLoading(),
            MusicError(exception: isA<Exception>()),
          ]));

      musicBloc.add(SearchMusic(request: request));
    });

    blocTest<MusicBloc, MusicState>(
      'emits [MusicLoading(), MusicError()] when searchMusic error',
      build: () => musicBloc,
      act: (bloc) => bloc.add(SearchMusic(request: MusicRequest(term: 'isyana'))),
      wait: const Duration(milliseconds: 700),
      expect: () => [MusicLoading(), MusicError(exception: isA<Exception>())],
    );
  });
}
