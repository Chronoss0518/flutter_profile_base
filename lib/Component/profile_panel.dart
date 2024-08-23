
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'text_block.dart';


const double FONT_SIZE = 40.0;
const double PARAMETER_NAME_FONT_SIZE = 20.0;
const double PARAMETER_VALUE_MARGIN_SIZE = 20.0;
const Color TEXT_COLOR =Colors.white;


class ProfilePanel
{
  const ProfilePanel(this._parameterName,this._parameterValue,{this.textColor = TEXT_COLOR});

  final String _parameterName;
  final String _parameterValue;
  final Color? textColor;
}

class ProfilePanelList extends StatelessWidget
{
  const ProfilePanelList(this.panels,{this.fontSize = FONT_SIZE,super.key});

  final List<ProfilePanel> panels;
  final double fontSize;

  @override
  Widget build(BuildContext context)
  {
    var drawPanels = <Widget>[];
    for(int i = 0;i<panels.length;i++)
    {
      drawPanels.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBlock(panels[i]._parameterName,textColor: panels[i].textColor,fontSize: PARAMETER_NAME_FONT_SIZE),
            TextBlock(panels[i]._parameterValue,textColor: panels[i].textColor,fontSize: fontSize,margin: const EdgeInsets.only(left:PARAMETER_VALUE_MARGIN_SIZE),),
          ],
        )
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: drawPanels,
    );
    /*
    var drawPanels = <TableRow>[];
    for(int i = 0;i<panels.length;i++)
    {
      drawPanels.add(
        TableRow(
          children: [
            TextBlock(panels[i]._parameterName,textColor: panels[i].textColor,fontSize: FONT_SIZE),
            TextBlock(":" + panels[i]._parameterValue,textColor: panels[i].textColor,fontSize: FONT_SIZE),
          ],
        )
      );
    }

    return Table(
      defaultColumnWidth: FixedColumnWidth(260),
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: drawPanels,
                );
      */
  }
}