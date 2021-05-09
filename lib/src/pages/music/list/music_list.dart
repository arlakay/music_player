import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_telkomsel_bcg/src/blocs/music/bloc/music_bloc.dart';
import 'package:test_telkomsel_bcg/src/models/request/music/music_request.dart';
import 'package:test_telkomsel_bcg/src/models/response/music/music_response.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicList extends StatefulWidget {
  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  AudioPlayer advancedPlayer = AudioPlayer();

  List<Result> resultSongResponse;
  int selectedIndex;
  String selectedSong;

  bool isSongSelected = false;

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
          isSongSelected = false;
          advancedPlayer.stop();

          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is MusicSuccess) {
          resultSongResponse = state.musicResponse.results;
          return _widgetList();
        } else if (state is MusicError) {
          return Container(
            child: Center(
              child: Text(
                'No Music?\nSearch by Artist',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _widgetList() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int j) => const Divider(
              color: Color.fromARGB(255, 128, 128, 128),
              indent: 16.0,
              endIndent: 16.0,
            ),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: resultSongResponse.length,
            cacheExtent: 50,
            itemBuilder: (BuildContext context, int j) {
              return GestureDetector(
                onTap: () {
                  selectedIndex = j;
                  selectedSong = resultSongResponse[j].previewUrl;
                  isSongSelected = true;
                  advancedPlayer.setUrl(resultSongResponse[j].previewUrl);
                  advancedPlayer.seek(Duration());
                  advancedPlayer.pause();
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          resultSongResponse[j].artworkUrl100,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
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
                ),
              );
            },
          ),
        ),
        isSongSelected
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(-1, -1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      key: Key('play_button'),
                      onPressed: () {
                        advancedPlayer.resume();
                        setState(() {});
                      },
                      iconSize: 64.0,
                      icon: Icon(Icons.play_arrow),
                      color: Colors.cyan,
                    ),
                    IconButton(
                      key: Key('pause_button'),
                      onPressed: () {
                        advancedPlayer.pause();
                        setState(() {});
                      },
                      iconSize: 64.0,
                      icon: Icon(Icons.pause),
                      color: Colors.cyan,
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
