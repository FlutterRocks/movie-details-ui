import 'package:flutter/material.dart';
import 'package:movie_details_ui/models.dart';

class PhotoScroller extends StatelessWidget {
  PhotoScroller(this.photoUrls);

  final List<String> photoUrls;

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
            itemBuilder: (BuildContext context, int position) {
              return _buildPhoto(context, position);
            }
          ),
        ),
      ],
    );
  }

  _buildPhoto(BuildContext context, int position) {
    var photo = photoUrls[position];

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
}
