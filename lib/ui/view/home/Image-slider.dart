import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<Widget> image;
  final Color dotColor;
  final double dotSize;
  final Color borderColor;
  const ImageSlider(
      {Key key,
      this.dotColor = Colors.white,
      this.dotSize = 14.0,
      this.borderColor = Colors.black12,
      @required this.image})
      : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 200.0),
      child: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentPosition = index;
              });
            },
            children: List<Widget>.generate(
                widget.image.length, (index) => widget.image[index]),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            bottom: 10.0,
            child: buildRow(
                count: widget.image.length,
                index: currentPosition,
                dotColor: widget.dotColor,
                borderColor: widget.borderColor),
          )
        ],
      ),
    );
  }

  Row buildRow({int count, int index = 0, Color dotColor, Color borderColor}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(count, (position) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: _buildDot(
                dotSize: widget.dotSize,
                borderColor: borderColor,
                dotColor: index == position ? dotColor : Colors.transparent),
          );
        }));
  }

  Widget _buildDot({double dotSize, Color dotColor, Color borderColor}) {
    return Container(
      width: dotSize,
      height: dotSize,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: dotColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 1.0)),
    );
  }
}
