import 'package:flutter/material.dart';

class FlagShape extends ShapeBorder {
  const FlagShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    
   
    path.moveTo(rect.left, rect.top);
    
  
    path.lineTo(rect.right, rect.top);
    
 
    path.lineTo(rect.right, rect.bottom);

    path.lineTo(rect.center.dx, rect.bottom - 6);
    

    path.lineTo(rect.left, rect.bottom);
    

    path.close();
    
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}