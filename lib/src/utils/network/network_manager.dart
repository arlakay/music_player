import 'package:dio/dio.dart';
import 'package:test_telkomsel_bcg/src/models/response/music/music_response.dart';
import 'package:test_telkomsel_bcg/src/utils/network/api_request.dart';
import 'package:test_telkomsel_bcg/src/utils/network/network_service.dart';

Duration get timeout => const Duration(milliseconds: 10000);

class NetworkManager {
  static Dio dio = Dio();

  ///
  /// List all network abstraction
  ///

  Future<MusicResponse> getMusic({
    String? query,
  }) async {
    final GetMusicService getMusicService = GetMusicService(
      searchQuery: query,
    );
    final ApiRequest apiRequest = ApiRequest(service: getMusicService);
    final dynamic response = await apiRequest.request();

    return musicResponseFromJson(response.data);
  }

  Future<MusicResponse> searchMusic({
    String? query,
  }) async {
    final SearchMusicService searchMusicService = SearchMusicService(
      searchQuery: query,
    );
    final ApiRequest apiRequest = ApiRequest(service: searchMusicService);
    final dynamic response = await apiRequest.request();

    return musicResponseFromJson(response.data);
  }
}
