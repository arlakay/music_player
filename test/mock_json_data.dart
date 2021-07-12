import 'package:test_telkomsel_bcg/src/models/response/music/music_response.dart';

class MockJsonData {
  static String responseError = 'Your request produced an error.';
  static String responseSuccess = '{'
      '\"resultCount\": 3,'
      '\"results\": $responseArray'
      '}';

  static String responseArray = '['
      '{'
      '\"wrapperType\": \"track\",'
      '\"kind\": \"song\",'
      '\"artistId\":929562709,'
      '\"trackId\":1008745173,'
      '\"artistName\":\"Isyana Sarasvati\",'
      '\"trackName\":\"Tetap Dalam Jiwa\",'
      '\"trackCensoredName\":\"Tetap Dalam Jiwa\",'
      '\"artistViewUrl\":\"https:\/\/music.apple.com\/us\/artist\/isyana-sarasvati\/929562709?uo=4\",'
      '\"trackViewUrl\":\"https:\/\/music.apple.com\/us\/music-video\/tetap-dalam-jiwa\/1008745173?uo=4\",'
      '\"previewUrl\":\"https:\/\/video-ssl.itunes.apple.com\/itunes-assets\/Video128\/v4\/ee\/33\/39\/ee3339a1-9cc3-1fb5-9ef7-d8e0da2dd1a7\/mzvf_564125232993320812.640x362.h264lc.U.p.m4v\",'
      '\"artworkUrl30\":\"https:\/\/is4-ssl.mzstatic.com\/image\/thumb\/Video118\/v4\/e6\/dd\/b4\/e6ddb4b4-8346-c08a-4b93-181f10a0c458\/source\/30x30bb.jpg\",'
      '\"artworkUrl60\":\"https:\/\/is4-ssl.mzstatic.com\/image\/thumb\/Video118\/v4\/e6\/dd\/b4\/e6ddb4b4-8346-c08a-4b93-181f10a0c458\/source\/60x60bb.jpg\",'
      '\"artworkUrl100\":\"https:\/\/is4-ssl.mzstatic.com\/image\/thumb\/Video118\/v4\/e6\/dd\/b4\/e6ddb4b4-8346-c08a-4b93-181f10a0c458\/source\/100x100bb.jpg\",'
      '\"collectionPrice\":1.99,'
      '\"trackPrice\":1.99,'
      '\"releaseDate\":\"2015-06-24T07:00:00Z\",'
      '\"collectionExplicitness\": \"notExplicit\",'
      '\"trackExplicitness\": \"notExplicit\",'
      '\"trackTimeMillis\":236968,'
      '\"country\": \"USA\",'
      '\"currency\": \"USD\",'
      '\"primaryGenreName\":\"Indo Pop\",'
      '\"collectionId\": 1,'
      '\"collectionName\": \"Indo Pop\",'
      '\"collectionCensoredName\": \"Indo Pop\",'
      '\"collectionViewUrl\": \"Indo Pop\",'
      '\"discCount\": 1,'
      '\"discNumber\": 1,'
      '\"trackCount\": 1,'
      '\"trackNumber\": 1,'
      '\"isStreamable\": true,'
      '\"collectionArtistId\": 1,'
      '\"collectionArtistName\": \"R&B/Soul\"'
      '}'
      ']';

  static String mockRequest = 'isyana';
}
