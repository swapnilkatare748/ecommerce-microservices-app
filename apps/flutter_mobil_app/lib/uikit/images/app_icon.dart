  import 'package:flutter/material.dart';
  import 'package:flutter_svg/flutter_svg.dart';

  import 'rk_network_image.dart';

  class AppIcon extends StatelessWidget {
    const AppIcon(
      this.iconPath, {
      super.key,
      double? size = 24,
      this.color,
      this.fit,
    })  : width = size,
          height = size;

    const AppIcon.image(
      this.iconPath, {
      super.key,
      this.width,
      this.height,
      this.color,
      this.fit,
    });

    final String iconPath;
    final double? width;
    final double? height;
    final Color? color;
    final BoxFit? fit;

    @override
    Widget build(BuildContext context) {
      if (iconPath.startsWith("http")) {
        if (iconPath.endsWith(".svg")) {
          return _buildSVGPicture(SvgPicture.network(iconPath).bytesLoader);
        } else {
          return RKNetworkImage(
            url: iconPath,
            width: width,
            height: height,
            color: color,
            fit: fit,
          );
        }
      } else if (iconPath.endsWith(".svg")) {
        return _buildSVGPicture(SvgPicture.asset(iconPath).bytesLoader);
      } else {
        return Image.asset(
          iconPath,
          width: width,
          height: height,
          color: color,
          fit: fit,
          errorBuilder: (_, __, ___) => SizedBox(
            width: width,
            height: height,
          ),
        );
      }
    }

    Widget _buildSVGPicture(BytesLoader svgBytes) {
      return SvgPicture(
        svgBytes,
        width: width,
        height: height,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
        fit: fit ?? BoxFit.contain,
      );
    }
  }
