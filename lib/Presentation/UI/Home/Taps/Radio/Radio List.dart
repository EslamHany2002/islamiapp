import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/models/RadioResponse.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

class RadioList extends StatefulWidget {
  final void Function(String name, String url, bool isFavorite) onFavoriteChanged;
  final List<Map<String, String>> favoriteRadios;

  const RadioList({super.key, required this.onFavoriteChanged, required this.favoriteRadios});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState _playerState = PlayerState.stopped;
  String? _currentUrl;
  late Future<RadioResponse> responseRadio;
  Map<String, bool> muteStatus = {};

  Future<RadioResponse> fetchRadio() async {
    final response = await http.get(Uri.parse('https://mp3quran.net/api/v3/radios?language=ar'));
    if (response.statusCode == 200) {
      return RadioResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load RadioResponse');
    }
  }

  @override
  void initState() {
    super.initState();
    responseRadio = fetchRadio();

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (mounted) {
        setState(() {
          _playerState = state;
        });
      }
    });
  }

  void _playPauseRadio(String url) async {
    if (mounted) {
      if (_playerState == PlayerState.playing && _currentUrl == url) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(UrlSource(url));
        if (mounted) {
          setState(() {
            _currentUrl = url;
          });
        }
      }
    }
  }

  void _toggleMute(String radioName) {
    setState(() {
      muteStatus[radioName] = !(muteStatus[radioName] ?? false);
    });
    _audioPlayer.setVolume(muteStatus[radioName]! ? 0 : 1);
  }

  void _toggleFavorite(String radioName, String url) {
    final isFavorite = widget.favoriteRadios.any((radio) => radio['name'] == radioName);
    widget.onFavoriteChanged(radioName, url, !isFavorite);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<RadioResponse>(
        future: responseRadio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 3),
              itemCount: snapshot.data?.radios?.length ?? 0,
              itemBuilder: (context, index) {
                var radio = snapshot.data?.radios?[index];
                final name = radio?.name ?? 'Unknown';
                final url = radio?.url ?? '';
                final isMuted = muteStatus[name] ?? false;

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyTheme.gold,
                    border: Border.all(color: MyTheme.gold),
                  ),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.155,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topCenter,
                            child: Text(
                              name,
                              style: TextStyle(fontSize: 25, fontFamily: "janna"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          'assets/PNG/Mosque-02.png',
                          width: MediaQuery.of(context).size.height * 0.450,
                          color: Colors.black26,
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 37.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (radio?.name != null && radio?.url != null) {
                                      _toggleFavorite(name, url);
                                    }
                                  },
                                  icon: Icon(
                                    size: 40,
                                    widget.favoriteRadios.any((radio) => radio['name'] == name)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: MyTheme.background,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (radio?.url != null) {
                                      _playPauseRadio(url);
                                    }
                                  },
                                  icon: Icon(
                                    size: 40,
                                    _playerState == PlayerState.playing && _currentUrl == url
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: MyTheme.background,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _toggleMute(name);
                                  },
                                  icon: Icon(
                                    size: 40,
                                    isMuted ? Icons.volume_off : Icons.volume_up_sharp,
                                    color: MyTheme.background,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load radios'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
