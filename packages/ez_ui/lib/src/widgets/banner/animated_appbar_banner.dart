import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

class AnimatedAppbarBanner extends StatefulWidget {
  const AnimatedAppbarBanner({
    final Key? key,
    required this.items,
    this.title,
    required this.child,
    this.actions = const [],
  }) : super(key: key);

  final List<BannerItem> items;
  final Widget? title;
  final List<Widget> actions;
  final Widget child;

  @override
  AnimatedAppbarBannerState createState() => AnimatedAppbarBannerState();
}

class AnimatedAppbarBannerState extends State<AnimatedAppbarBanner>
    with TickerProviderStateMixin {
  final Color _color1 = const Color(0xff777777);

  final Color _bulletColor = const Color(0xff01aed6);

  int _currentImageSlider = 0;

  late ScrollController _scrollController;
  Color _topIconColor = Colors.white;
  late AnimationController _topColorAnimationController;
  late Animation<Color?> _appBarColor;
  SystemUiOverlayStyle _appBarSystemOverlayStyle = SystemUiOverlayStyle.light;

  @override
  void initState() {
    setupAnimateAppbar();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _topColorAnimationController.dispose();
    super.dispose();
  }

  void setupAnimateAppbar() {
    // use this function and parameter to animate top bar
    _topColorAnimationController =
        AnimationController(vsync: this, duration: Duration.zero);
    _appBarColor = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_topColorAnimationController);
    _scrollController = ScrollController()
      ..addListener(() {
        _topColorAnimationController.animateTo(_scrollController.offset / 120);
        // if scroll for above 150, then change app bar color to white, search
        // button to dark, and top icon color to dark
        // if scroll for below 150, then change app bar color to transparent,
        // search button to white and top icon color to light
        if (_scrollController.hasClients &&
            _scrollController.offset > (150 - kToolbarHeight)) {
          if (_topIconColor != _color1) {
            _topIconColor = _color1;
            _appBarSystemOverlayStyle = SystemUiOverlayStyle.dark;
          }
        } else {
          if (_topIconColor != Colors.white) {
            _topIconColor = Colors.white;
            _appBarSystemOverlayStyle = SystemUiOverlayStyle.light;
          }
        }
      });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _createHomeBannerSlider(),
                    widget.child,
                  ],
                ),
              ),
            ],
          ),
          _createAppBar(),
        ],
      ),
    );
  }

  Widget _createAppBar() {
    return SizedBox(
      height: 80.r,
      child: AnimatedBuilder(
        animation: _topColorAnimationController,
        builder: (final context, final child) => AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: _appBarColor.value,
          systemOverlayStyle: _appBarSystemOverlayStyle,
          elevation: 0,
          title: widget.title,
          actions: widget.actions,
        ),
      ),
    );
  }

  Widget _createHomeBannerSlider() {
    return Column(
      children: [
        CarouselSlider(
          items: widget.items
              .map(
                (final item) => EzCachedNetworkImage(
                  width: 0,
                  height: 0,
                  imageUrl: item.image ?? '',
                ),
              )
              .toList(),
          options: CarouselOptions(
            aspectRatio: 8 / 6,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayAnimationDuration: const Duration(milliseconds: 300),
            onPageChanged: (final index, final reason) {
              setState(() {
                _currentImageSlider = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.items.map((final item) {
            final index = widget.items.indexOf(item);

            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: (_currentImageSlider == index ? 16 : 8).r,
              height: 8,
              margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 4.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _currentImageSlider == index
                    ? _bulletColor
                    : Colors.grey[300],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
