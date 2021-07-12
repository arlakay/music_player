import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_telkomsel_bcg/src/blocs/music/music_bloc.dart';
import 'package:test_telkomsel_bcg/src/models/request/music/music_request.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchEC = TextEditingController();
  FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE3E3E5),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                focusNode: _focus,
                controller: _searchEC,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search Artist',
                  hintStyle: GoogleFonts.sourceSansPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF666666),
                  ),
                ),
                onChanged: (newValue) {
                  BlocProvider.of<MusicBloc>(context).add(
                      SearchMusic(request: MusicRequest(term: _searchEC.text)));
                },
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent, // button color
                child: InkWell(
                  splashColor: Colors.grey[100], // inkwell color
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      'assets/icons/ic_search_close.svg',
                      width: 24,
                      height: 24,
                      color: Color(0xff8A8A8F),
                    ),
                  ),
                  onTap: () {
                    _searchEC.clear();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
