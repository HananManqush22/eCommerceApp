import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/configuration/components/center_progress_indicator.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          SizedBox(height: 200, child: CenterProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
