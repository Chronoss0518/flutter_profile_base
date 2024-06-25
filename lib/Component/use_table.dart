
import 'package:flutter/material.dart';
import 'text_block.dart';

const double FONT_SIZE = 40.0;
const int ROW_COUNT = 3;
const double ROW_SIZE = 220.0;

class UseTablePanel
{
  const UseTablePanel(this.text,{this.textColor});

  final String text;
  final Color? textColor;
}

class UseTable extends StatelessWidget
{
  UseTable(this.panels,{this.defaultColor});

  List<UseTablePanel> panels;
  final Color? defaultColor;
  @override
  Widget build(BuildContext context)
  {
    var drawPanels = <TableRow>[];

    List<Widget>row  = <Widget>[];

    for(int i = 0;i<panels.length;i++)
    {
      row.add(TextBlock(panels[i].text,textColor: panels[i].textColor ?? defaultColor,fontSize: FONT_SIZE));

      if((i + 1) % ROW_COUNT != 0)continue;

      drawPanels.add(
        TableRow(children:row,)
      );
      
      row = <Widget>[];
    }

    if(!row.isEmpty)
    {
      drawPanels.add(
        TableRow(children:row,)
      );
    }
      
    return Table(
      defaultColumnWidth: const FixedColumnWidth(ROW_SIZE),
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: drawPanels,
                );
  }
}