import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:feedbackdesign/shared/utils/device_utils.dart';
import 'package:feedbackdesign/uikit/styles/app_colors.dart';
import 'package:flutter/material.dart';


class RKOverlayView {
  /// Shows a loading overlay while executing [future]
  static Future<T> showLoaderWithSuccess<T>({
    required Future<T> Function() future,
    Function(T)? onSuccess,
    Function(Object error)? onError,
    bool shouldHideKeyboard = true,
    Color? backgroundColor,
    bool canCrossPage = false,
  }) async {
    if (shouldHideKeyboard) {
       DeviceUtils.hideKeyboard();

    }

    final CancelFunc popupLoadingFunc = overlay(
      canCrossPage: canCrossPage,
      child: _buildLoadingOverlay(backgroundColor),
    );

    try {
      final T result = await future();
      popupLoadingFunc(); // Dismiss overlay
      onSuccess?.call(result);
      return result;
    } catch (e) {
      popupLoadingFunc(); // Dismiss overlay
      onError?.call(e);
      rethrow;
    }
  }

  /// Shows a generic overlay widget
  static CancelFunc overlay({
    required Widget child,
    bool clickClose = false,
    bool canCrossPage = false,
    VoidCallback? onClose,
    Color backgroundColor = Colors.transparent,
  }) {
    return BotToast.showCustomLoading(
      clickClose: clickClose,
      crossPage: canCrossPage,
      onClose: onClose,
      backgroundColor: backgroundColor,
      toastBuilder: (_) => child,
    );
  }

  /// Builds the loading overlay widget
  static Widget _buildLoadingOverlay(Color? backgroundColor) {
    return Container(
      color: backgroundColor ?? AppColors.background.addOpacity(50),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  /// Closes all loading overlays
  static void closeAllLoading() {
    BotToast.closeAllLoading();
  }
}
