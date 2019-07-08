import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 3.0),
      child: Material(
        type: MaterialType.transparency,
        elevation: 6.0,
        color: Colors.transparent,
        shadowColor: Colors.grey[50],
        child: InkWell(
          splashColor: const Color(0xFFF1C40F),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF050E15),
                ),
              ),
            ),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: Icon(icon, 
                        size: 28,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  child: Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ) 
    );
  }
}
