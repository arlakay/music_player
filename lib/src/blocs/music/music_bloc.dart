import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_telkomsel_bcg/src/models/request/music/music_request.dart';
import 'package:test_telkomsel_bcg/src/models/response/music/music_response.dart';
import 'package:test_telkomsel_bcg/src/utils/network/network_manager.dart';
import 'package:rxdart/rxdart.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc({required this.networkManager}) : super(MusicInitial());

  final NetworkManager? networkManager;

  @override
  Stream<Transition<MusicEvent, MusicState>> transformEvents(
    Stream<MusicEvent> events,
    TransitionFunction<MusicEvent, MusicState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 700)),
      transitionFn,
    );
  }

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is GetMusic) {
      yield* _getMusic(event);
    } else if (event is SearchMusic) {
      yield* _searchMusic(event);
    }
  }

  Stream<MusicState> _getMusic(GetMusic event) async* {
    yield MusicError();
    // try {
    //   final MusicResponse musicResponse = await networkManager!.getMusic(
    //     query: event.request.term,
    //   );
    //   if (musicResponse.resultCount! > 0 && musicResponse.results != null) {
    //     yield MusicSuccess(
    //       musicResponse: musicResponse,
    //     );
    //   } else {
    //     yield MusicError(
    //       musicResponse: musicResponse,
    //     );
    //   }
    // } catch (e) {
    //   yield MusicError(exception: e);
    // }
  }

  Stream<MusicState> _searchMusic(SearchMusic event) async* {
    yield MusicLoading();
    try {
      final MusicResponse musicResponse = await networkManager!.searchMusic(
        query: event.request.term,
      );
      if (musicResponse.resultCount! > 0 && musicResponse.results != null) {
        yield MusicSuccess(
          musicResponse: musicResponse,
        );
      } else {
        yield MusicError(
          musicResponse: musicResponse,
        );
      }
    } catch (e) {
      yield MusicError(exception: e);
    }
  }
}
