import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/router/app_router.dart';

Future<void> main() async {
  await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _router = AppRouter();
  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack, overlays: [SystemUiOverlay.top,]);
    super.initState();
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'WebNovel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        onGenerateRoute: _router.onGenerateRoute,
      ),
    );
  }
}
