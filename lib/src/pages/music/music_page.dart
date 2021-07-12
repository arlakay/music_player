import 'package:flutter/material.dart';
import 'package:test_telkomsel_bcg/src/pages/music/list/music_list.dart';
import 'package:test_telkomsel_bcg/src/pages/music/search/search_box.dart';

class MusicPage extends StatefulWidget {
  MusicPage({Key? key}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SearchBox(),
              Expanded(
                child: MusicList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
