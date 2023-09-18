// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:audioplayer/audioplayer.dart';
// import 'package:file_picker/file_picker.dart';

// class MusicPlayer extends StatefulWidget {
//   @override
//   _MusicPlayerState createState() => _MusicPlayerState();
// }

// class _MusicPlayerState extends State<MusicPlayer> {
//   Duration duration = Duration();
//   Duration position = Duration();

//   AudioPlayer audioPlayer;

//   AudioPlayerState audioPlayerState;

//   StreamSubscription positionSubscription;
//   StreamSubscription audioPlayerStateSubscription;

//   String filePath;

//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer();
//     audioPlayerState = AudioPlayerState.STOPPED;
//     duration = Duration();
//     position = Duration();

//     audioPlayerStateSubscription =
//         audioPlayer.onPlayerStateChanged.listen((state) {
//       setState(() {
//         audioPlayerState = state;
//       });
//     });

//     positionSubscription =
//         audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
//               position = p;
//             }));

//     pickFile();
//   }

//   Future pickFile() async {
//     FilePickerResult result = await FilePicker.platform.pickFiles(
//       type: FileType.audio,
//     );

//     if (result != null) {
//       setState(() {
//         filePath = result.files.single.path;
//       });
//       audioPlayer.setFilePath(filePath);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Music Player'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder(
//                 stream: audioPlayer.onDurationChanged,
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   if (snapshot.data == null) {
//                     return Container();
//                   }

//                   Duration d = snapshot.data;
//                   return Slider(
//                     value: position.inSeconds.toDouble(),
//                     max: d.inSeconds.toDouble(),
//                     onChanged: (double value) {
//                       audioPlayer.seek((value * 1000).toInt());
//                     },
//                   );
//                 }),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     audioPlayer.play(filePath, isLocal: true);
//                   },
//                   iconSize: 64.0,
//                   icon: Icon(Icons.play_arrow),
//                   color: Colors.green,
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     audioPlayer.pause();
//                   },
//                   iconSize: 64.0,
//                   icon: Icon(Icons.pause),
//                   color: Colors.yellow,
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     audioPlayer.stop();
//                   },
//                   iconSize: 64.0,
//                   icon: Icon(Icons.stop),
//                   color: Colors.red,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     audioPlayerStateSubscription.cancel();
//     positionSubscription.cancel();
//     audioPlayer.stop();
//     super.dispose();
//   }
// }
