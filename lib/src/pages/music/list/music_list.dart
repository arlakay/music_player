import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_telkomsel_bcg/src/blocs/music/bloc/music_bloc.dart';
import 'package:test_telkomsel_bcg/src/models/request/music/music_request.dart';
import 'package:test_telkomsel_bcg/src/models/response/music/music_response.dart';

class MusicList extends StatefulWidget {
  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List<Result> resultSongResponse;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(
      builder: (_, MusicState state) {
        if (state is MusicInitial) {
          BlocProvider.of<MusicBloc>(context).add(
            GetMusic(
              request: MusicRequest(
                term: '',
              ),
            ),
          );
        } else if (state is MusicLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is MusicSuccess) {
          resultSongResponse = state.musicResponse.results;
          return _widgetList();
        } else if (state is MusicError) {
          return Container();
        }
      },
    );
  }

  Widget _widgetList() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int j) => const Divider(
        color: Color.fromARGB(255, 128, 128, 128),
        indent: 16.0,
        endIndent: 16.0,
      ),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: resultSongResponse.length,
      itemBuilder: (BuildContext context, int j) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: Image.network(
                  resultSongResponse[j].artworkUrl60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    resultSongResponse[j].trackName,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 77, 77, 77),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    resultSongResponse[j].artistName,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 77, 77, 77),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    resultSongResponse[j].collectionName,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 77, 77, 77),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Image.network('src'),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
