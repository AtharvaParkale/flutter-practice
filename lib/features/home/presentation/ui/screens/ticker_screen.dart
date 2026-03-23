import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });
  }


  void start() {
    _ticker.start();
  }

  void stop() {
    _ticker.stop();
  }

  void reset() {
    _ticker.stop();
    setState(() {
      _elapsed = Duration.zero;
    });
  }

  String formatDuration(Duration duration) {
    String minutes = duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String seconds = duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String milliseconds = duration.inMilliseconds
        .remainder(1000)
        .toString()
        .padLeft(2, '0');

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ticker Stopwatch')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            formatDuration(_elapsed),
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: start,
                child: const Text("Start"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: stop,
                child: const Text("Stop"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: reset,
                child: const Text("Reset"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
