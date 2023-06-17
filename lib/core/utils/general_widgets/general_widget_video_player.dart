import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resala/core/utils/general_widgets/general_widget_circular_view.dart';
import 'package:video_player/video_player.dart';

class GeneralWidgetVideoPlayer extends StatefulWidget {
  final File file;
  final String url;
  final bool isShowAct;

  const GeneralWidgetVideoPlayer(
      {Key? key, required this.file, this.url = '', this.isShowAct = false})
      : super(key: key);

  @override
  GeneralWidgetVideoPlayerState createState() =>
      GeneralWidgetVideoPlayerState();
}

class GeneralWidgetVideoPlayerState extends State<GeneralWidgetVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  late Widget videoStatusAnimation;

  @override
  void initState() {
    super.initState();

    videoStatusAnimation = Container();

    _controller = widget.isShowAct
        ? VideoPlayerController.network(widget.url)
        : VideoPlayerController.file(widget.file)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        Timer(const Duration(milliseconds: 0), () {
          if (!mounted) return;
          setState(() {});
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 16 / 9,
        child: _controller.value.isInitialized
            ? videoPlayer()
            : const GeneralWidgetCircularView(),
      );

  Widget videoPlayer() => Stack(
        children: <Widget>[
          video(),
          Align(
            alignment: Alignment.bottomCenter,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              padding: const EdgeInsets.all(16.0),
            ),
          ),
          Center(child: videoStatusAnimation),
        ],
      );

  Widget video() => GestureDetector(
        child: VideoPlayer(_controller),
        onTap: () {
          if (!_controller.value.isInitialized) {
            return;
          }
          if (_controller.value.isPlaying) {
            videoStatusAnimation =
                const FadeAnimation(child: Icon(Icons.pause, size: 100.0));
            _controller.pause();
          } else {
            videoStatusAnimation =
                const FadeAnimation(child: Icon(Icons.play_arrow, size: 100.0));
            _controller.play();
          }
        },
      );
}

class FadeAnimation extends StatefulWidget {
  const FadeAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 1000)})
      : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: widget.duration, vsync: this);
    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward(from: 0.0);
  }

  @override
  void deactivate() {
    animationController.stop();
    super.deactivate();
  }

  @override
  void didUpdateWidget(FadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => animationController.isAnimating
      ? Opacity(
          opacity: 1.0 - animationController.value,
          child: widget.child,
        )
      : Container();
}
