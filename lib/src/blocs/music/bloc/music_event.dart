part of 'music_bloc.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class GetMusic extends MusicEvent {
  GetMusic({this.term}) : assert(term != null);

  final String term;

  @override
  List<Object> get props => [term];
}

class SearchMusic extends MusicEvent {
  SearchMusic({this.term}) : assert(term != null);

  final String term;

  @override
  List<Object> get props => [term];
}
