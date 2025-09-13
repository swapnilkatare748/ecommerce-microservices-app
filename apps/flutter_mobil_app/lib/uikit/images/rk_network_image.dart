import 'package:extended_image/extended_image.dart';
import 'package:feedbackdesign/uikit/styles/app_colors.dart';
import 'package:flutter/material.dart';

class RKNetworkImage extends StatelessWidget {
  const RKNetworkImage({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.placeHolder,
    this.shape,
  }) : super(key: key);

  const RKNetworkImage.icon({
    Key? key,
    required this.url,
    double? size = 24,
    this.color,
    this.fit,
    this.placeHolder,
    this.shape,
  })  : height = size,
        width = size,
        super(key: key);

  final String? url;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Widget? placeHolder;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {

    ///TODO: Uncomment this once Kit is ready
    /*   if (AppClient.isWeb && isCanvasKit) {
      /// Workaround to make it work on web as we are using canvas as renderer

      double actualWidth = width ?? DeviceUtils.deviceWidth;
      if (width == double.infinity) {
        actualWidth = DeviceUtils.deviceWidth;
      }
      return ImageNetwork(
        image: (url ?? "").trim(),
        height:
            height ?? (actualWidth / MediaQuery.devicePixelRatioOf(context)),
        width: actualWidth,
        fitAndroidIos: fit ?? BoxFit.none,
        duration: 0,
        fitWeb: _getWebFit(),
        onLoading: _buildLoadingAndErrorState(),
        onError: _buildLoadingAndErrorState(),
        imageCache: ExtendedNetworkImageProvider(
          url ?? "",
          cacheMaxAge: const Duration(days: 9),
        ),
        borderRadius: shape == BoxShape.circle
            ? BorderRadius.circular(360)
            : BorderRadius.zero,
      );
    } else { */
    return ExtendedImage.network(
      (url ?? "").trim(),
      color: color,
      height: height,
      width: width,
      fit: fit,
      shape: shape,
      cacheMaxAge: const Duration(days: 9),
      loadStateChanged: (ExtendedImageState state) {
        if (state.extendedImageLoadState == LoadState.completed) {
          return state.completedWidget;
        } else {
          return _buildLoadingAndErrorState();
        }
      },
    );
    // }
  }

  Widget _buildLoadingAndErrorState() {
    return placeHolder ??
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color ?? AppColors.foreground8,
            shape: shape ??
                (height == width ? BoxShape.circle : BoxShape.rectangle),
          ),
        );
  }
}
