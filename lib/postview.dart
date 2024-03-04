import 'package:flutter/material.dart';

class PostView extends StatefulWidget {

  final String image;
  final String caption;
  final int initialLikeCount;
  final bool initialLikeStatus;
  final int initialdisLikeCount;
  final bool initialdisLikeStatus;

  const PostView({ super.key, required this.image, required this.caption, required this.initialLikeCount, required this.initialLikeStatus, required this.initialdisLikeCount, required this.initialdisLikeStatus });

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  late int _likeCount;
  late bool _isLiked;

  late int _dislikeCount;
  late bool _isdisLiked;

  @override
  void initState() {
    _likeCount = widget.initialLikeCount;
    _isLiked = widget.initialLikeStatus;
    _dislikeCount = widget.initialdisLikeCount;
    _isdisLiked = widget.initialdisLikeStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            widget.image,
            height: 200,
            width: 500,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget.caption,
              maxLines: 4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                      _likeCount += _isLiked ? 1 : -1;
                    });
                  },
                  icon: Icon(
                    _isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    color: Colors.blue,
                  )
              ),
              Text('$_likeCount', style: const TextStyle(color: Colors.blue)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isdisLiked = !_isdisLiked;
                      _dislikeCount += _isdisLiked ? 1 : -1;
                    });
                  },
                  icon: Icon(
                    _isdisLiked ? Icons.thumb_down : Icons.thumb_down_alt_outlined,
                    color: Colors.red,
                  )
              ),
              Text('$_dislikeCount', style: const TextStyle(color: Colors.red))
            ],
          )
        ],
      ),
    );
  }
}