import 'package:flutter/material.dart';
import 'package:web_novel_app/widgets/novel_widgets/tag_container.dart';

class TagsBuilder extends StatefulWidget {
  final List<String> tags;
  final double width;
  final double height;

  const TagsBuilder(
      {Key? key, required this.tags, required this.width, required this.height})
      : super(key: key);

  @override
  State<TagsBuilder> createState() => _TagsBuilderState();
}

class _TagsBuilderState extends State<TagsBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height / 2,
      width: widget.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.tags.length,
        itemBuilder: (context, index) {
          return TagContainer(tag: widget.tags[index]);
        },
      ),
    );
  }
}
