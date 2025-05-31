import 'package:catbreeds_app/presentation/widgets/utils/no_image_available.dart';
import 'package:flutter/material.dart';

class BreedImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;

  const BreedImage({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: width,
      height: height,
      child: ClipRRect(
        child: url != null && url!.isNotEmpty
            ? Image.network(
                url!,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) =>
                    const NoImageAvailable(),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                filterQuality: FilterQuality.medium,
              )
            : const NoImageAvailable(),
      ),
    );
  }
}
