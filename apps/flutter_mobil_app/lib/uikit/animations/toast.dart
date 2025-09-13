import 'package:bot_toast/bot_toast.dart';
import 'package:feedbackdesign/uikit/animations/rk_toast.dart';
import 'package:flutter/material.dart';

class Toast {
  Toast._();

  static Future success(
    String msg, {
    Alignment align = const Alignment(0, 0.8),
  }) {
    return _buildCustomToast(RKToast.success(text: msg), align: align);
  }

  static Future warning(
    String msg, {
    Alignment align = const Alignment(0, 0.8),
  }) {
    return _buildCustomToast(RKToast.warning(text: msg), align: align);
  }

  static Future error(String msg, {Alignment align = const Alignment(0, 0.8)}) {
    return _buildCustomToast(RKToast.error(text: msg), align: align);
  }

  static Future _buildCustomToast(
    RKToast dzToastWidget, {
    Alignment align = const Alignment(0, 0.8),
  }) {
    final Duration toastDuration = Duration(
      seconds: _getToastDuration(dzToastWidget.text),
    );

    BotToast.showCustomText(
      onlyOne: true,
      duration: toastDuration,
      align: align,
      ignoreContentClick: true,
      toastBuilder:
          (_) => IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: dzToastWidget,
            ),
          ),
    );
    return Future.delayed(toastDuration);
  }

  static void clearAll() {
    BotToast.removeAll(BotToast.textKey);
  }

  // Needed to show according to toast so user won't miss it
  static int _getToastDuration(String msg) {
    int toastDuration = msg.length ~/ 20;

    if (toastDuration < 2) {
      toastDuration = 2;
    } else if (toastDuration > 8) {
      toastDuration = 8;
    }
    return toastDuration;
  }
}
