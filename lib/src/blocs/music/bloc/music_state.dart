part of 'music_bloc.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicSuccess extends MusicState {
  MusicSuccess({
    this.musicResponse,
  });

  final MusicResponse musicResponse;
}

class MusicError extends MusicState {
  MusicError({
    this.musicResponse,
    this.exception,
  });

  final MusicResponse musicResponse;
  final dynamic exception;
}
