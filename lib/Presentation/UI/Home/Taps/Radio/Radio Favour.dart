import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';

class RadioFav extends StatefulWidget {
  final List<Map<String, String>> favoriteRadios;
  final void Function(String name, String url, bool isFavorite) onFavoriteChanged;

  const RadioFav({super.key, required this.favoriteRadios, required this.onFavoriteChanged});

  @override
  State<RadioFav> createState() => _RadioFavState();
}

class _RadioFavState extends State<RadioFav> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState _playerState = PlayerState.stopped;
  String? _currentUrl;
  Map<String, bool> muteStatus = {};

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (mounted) {
        setState(() {
          _playerState = state;
        });
      }
    });
  }

  void _playPauseRadio(String url) async {
    if (url != _currentUrl) {
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _currentUrl = url;
      });
    } else {
      if (_playerState == PlayerState.playing) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(UrlSource(url));
      }
    }
  }

  void _toggleMute(String radioName) {
    setState(() {
      muteStatus[radioName] = !(muteStatus[radioName] ?? false);
    });
    _audioPlayer.setVolume(muteStatus[radioName]! ? 0 : 1);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.favoriteRadios.isEmpty
          ? Center(child: Text('No favorites found.'))
          : ListView.builder(
        padding: EdgeInsets.only(top: 3),
        itemCount: widget.favoriteRadios.length,
        itemBuilder: (context, index) {
          var radio = widget.favoriteRadios[index];
          final name = radio['name'] ?? "Unknown";
          final url = radio['url'] ?? '';
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
                              widget.onFavoriteChanged(name, url, false);
                            },
                            icon: Icon(
                              size: 40,
                              Icons.favorite,
                              color: MyTheme.background,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (url != null) {
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
      ),
    );
  }
}
