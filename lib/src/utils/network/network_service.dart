import 'package:equatable/equatable.dart';

abstract class NetworkService extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchMusicService extends NetworkService {
  SearchMusicService({
    this.searchQuery,
  });

  final String? searchQuery;
}

class GetMusicService extends NetworkService {
  GetMusicService({
    this.searchQuery,
  });

  final String? searchQuery;
}
