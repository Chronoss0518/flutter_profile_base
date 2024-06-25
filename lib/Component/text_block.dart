import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextBlock extends StatelessWidget
{

  const TextBlock(this.drawText,{this.fontSize,this.textColor,this.backGroundColor,this.padding,this.margin,super.key});

  final String drawText;
  final double? fontSize;
  
  final Color? textColor;
  final Color? backGroundColor;
  
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context)
  {
    return Container(padding: padding,margin: margin,color: backGroundColor,child:Text(drawText,style: TextStyle(color: textColor,fontSize: fontSize)));
  }
}