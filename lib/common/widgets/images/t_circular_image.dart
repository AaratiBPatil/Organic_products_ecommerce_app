// import 'package:flutter/material.dart';
// import 'package:naturally/utils/constants/colors.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:naturally/utils/helpers/helpers_functions.dart';

// class TCircularImage extends StatelessWidget {
//   const TCircularImage({
//     super.key,
//     this.width = 56,
//     this.height = 56,
//     this.overlayColor,
//     this.backgroundColor,
//     required this.image,
//     this.fit = BoxFit.cover,
//     this.padding = TSizes.sm,
//     this.isNetworkImage = false,
//   });

//   final BoxFit? fit;
//   final String image;
//   final bool isNetworkImage;
//   final Color? overlayColor;
//   final Color? backgroundColor;
//   final double width, height, padding;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                           width: width,
//                           height: height,
//                           padding: EdgeInsets.all(padding),
//                           decoration: BoxDecoration(
//                             color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
//                             borderRadius: BorderRadius.circular(100), 
//                           ),
//                           child: Center(
//                             child: Image(
//                               fit: fit,
//                               image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
//                               color: overlayColor,
//                             ),
//                           ),
//                         );
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:naturally/common/shimmer_effect/shimmer.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
            ? CachedNetworkImage(
              fit: fit,
              color: overlayColor,
              imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 55, height: 55, radius: 55),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ): Image(
                fit: fit,
                image: AssetImage(image),
                color: overlayColor,
              ),
        ),
      ),
    );
  }
}
