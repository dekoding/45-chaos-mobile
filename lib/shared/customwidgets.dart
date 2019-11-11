import 'package:flutter/material.dart';
import 'package:forty_five_chaos/styling/fonts.dart';

class ChaosHeader extends StatelessWidget {
  ChaosHeader({
    Key key,
    this.primary,
    this.secondary
  }) : super(key: key);

  final String primary;
  final String secondary;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Center(child: Text(primary, style: ChaosStyles.hero))),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0
              ),
              child: Text(secondary, style: ChaosStyles.heroSub),
            ),
            alignment: AlignmentDirectional.bottomCenter,
          )
        ],
      ),
      height: MediaQuery
          .of(context)
          .size
          .height / 5,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/whiteHouseBanner.jpg'),
            colorFilter: new ColorFilter.mode(
                ChaosColors.darkBlue.withOpacity(0.9),
                BlendMode.srcATop
            ),
          )
      ),
    );
  }
}
