part of 'music_bloc.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class GetMusic extends MusicEvent {
  GetMusic({this.request}) : assert(request != null);

  final MusicRequest request;

  @override
  List<Object> get props => [request];
}

class SearchMusic extends MusicEvent {
  SearchMusic({this.request}) : assert(request != null);

  final MusicRequest request;

  @override
  List<Object> get props => [request];
}
