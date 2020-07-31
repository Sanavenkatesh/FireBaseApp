import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImagePage extends StatefulWidget {
  final herotag;

  const ImagePage({Key key, this.herotag}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: widget.herotag,
        child: PhotoView(
            imageProvider: NetworkImage(widget.herotag),
        ),
      )
    );
  }
}