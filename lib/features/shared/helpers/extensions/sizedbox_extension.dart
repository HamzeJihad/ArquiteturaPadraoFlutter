
import 'package:flutter/material.dart';

extension EmptySpace on num {
  /// Creates a SizedBox with the specified width.
  SizedBox get width => SizedBox(width: toDouble());

  /// Creates a SizedBox with the specified  height.
  SizedBox get height => SizedBox(height: toDouble());

  /// Creates a SizedBox with both width and height set to the value.
  SizedBox get wh => SizedBox(width: toDouble(), height: toDouble());
}