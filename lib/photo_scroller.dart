import 'package:flutter/material.dart';

class PhotoScroller extends StatelessWidget {
  PhotoScroller(this.photoUrls);

  final List<String> photoUrls;

  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];

    return new Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: new ClipRRect(
        borderRadius: new BorderRadius.circular(4.0),
        child: new Image.asset(
          photo,
          width: 160.0,
          height: 120.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: new Text(
            'Photos',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: new ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}
