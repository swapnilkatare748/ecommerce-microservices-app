import 'package:flutter/material.dart';

class RKPaddings extends EdgeInsets {
  static const RKPaddings zero = RKPaddings.only();
  const RKPaddings.all(super.value) : super.all();

  const RKPaddings.symmetric({super.vertical, super.horizontal})
      : super.symmetric();

  const RKPaddings.fromLTRB(super.left, super.top, super.right, super.bottom)
      : super.fromLTRB();

  const RKPaddings.only({
    super.left,
    super.top,
    super.right,
    super.bottom,
  }) : super.only();

  const RKPaddings.a16() : super.all(16);
  const RKPaddings.a20() : super.all(20);
  const RKPaddings.a24() : super.all(24);
  const RKPaddings.b30() : super.only(bottom: 30);


  const RKPaddings.h16() : super.symmetric(horizontal: 16);
  const RKPaddings.h20() : super.symmetric(horizontal: 20);
  const RKPaddings.h16v20() : super.symmetric(horizontal: 16, vertical: 20);
  const RKPaddings.h20v16() : super.symmetric(horizontal: 20, vertical: 16);
  const RKPaddings.h16v24() : super.symmetric(horizontal: 16, vertical: 24);
  const RKPaddings.h20v24() : super.symmetric(horizontal: 20, vertical: 24);
  const RKPaddings.h20v32() : super.symmetric(horizontal: 20, vertical: 32);
  const RKPaddings.h16v10() : super.symmetric(horizontal: 16, vertical: 10);
  const RKPaddings.sheetDefault() : super.fromLTRB(20, 22, 20, 20);
}
