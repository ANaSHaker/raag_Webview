import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const KPrimaryColor = Colors.white;

const KSecondaryColor = Color(0xfffaf7f7);
const kShadowOneColorDark = Color(0xff1e1639);
const kShadowTwoColorDark = Color(0xff3b3858);
const kMenuBackgroundColorDark = Color(0xff17112d);

const kShadowOneColorLight = Color(0xffb5b5b5);
const kShadowTwoColorLight = Color(0xffd7d7d7);
const kMenuBackgroundColorLight = Color(0xffe5e5e5);
const KWalletScreenText = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const KWithdrawText = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

const KEthioTelOptionText = TextStyle(
  color: KSecondaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const KScratcherText = TextStyle(
  color: Colors.white,
  fontSize: 48,
);

const KScratcherSmall = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

const KCongraText = TextStyle(
  fontSize: 18,
);
const KGameInfoHeader = TextStyle(
  fontSize: 25,
);

const KGameInfoText = TextStyle(
  fontSize: 17,
);

const KFetanLotteryText = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  color: KSecondaryColor,
);

TextStyle KSlogonText = GoogleFonts.cairo(
  fontSize: 10,
  fontWeight: FontWeight.bold,
  // fontWeight: FontWeight.bold,
  color: KSecondaryColor,
);
TextStyle textStyle (BuildContext context,{double? size , double? spacing , FontWeight? fontWeight , Color? color,double? letterSpaceing,TextDecoration? textDecoration}){
  return GoogleFonts.cairo(
      fontSize: size,
      letterSpacing:spacing,
      fontWeight: fontWeight,
      color: color,
      decoration: textDecoration

  );
}
const KDescText = TextStyle(
  // fontWeight: FontWeight.bold,
  color: Colors.white54,
);

const KGameDesc = TextStyle(
  // fontWeight: FontWeight.bold,
  color: KSecondaryColor,
);

const KVersionText = TextStyle(
  // fontWeight: FontWeight.bold,
  color: Colors.black38,
);

const KAccountEmailStyle = TextStyle(color: Colors.white70);

Widget conditionalBuilder({bool condition = false, builder,Widget? fallback}) {
  if (condition == true) {
    return builder;
  } else {
    return fallback!;
  }
}
