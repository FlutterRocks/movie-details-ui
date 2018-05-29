import 'package:flutter/material.dart';
import 'package:movie_details_ui/models.dart';

class ActorScroller extends StatelessWidget {
  ActorScroller(this.actors);

  final List<Actor> actors;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: new Text(
            'Actors',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: new ListView.builder(
            itemCount: actors.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: (BuildContext context, int position) {
              return _buildActor(context, position);
            },
          ),
        ),
      ],
    );
  }

  _buildActor(BuildContext context, int position) {
    var actor = actors[position];

    return new Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: new Column(
        children: [
          new CircleAvatar(
            backgroundImage: new AssetImage(actor.avatarUrl),
            radius: 40.0,
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: new Text(actor.name),
          ),
        ],
      ),
    );
  }
}
