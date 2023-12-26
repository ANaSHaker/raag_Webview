
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


_launchURL() async {
  final url =
  Uri.encodeFull('mailto:erp@galvamed.ma');
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class CustomAppBar extends StatelessWidget {
  VoidCallback callback;
  CustomAppBar(this.callback);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
         /* Card(
            elevation: 1,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp)
            ),
            child:Container(
              height: 35.h,
              width: 35.w,
              child: IconButton(
                  onPressed: _launchURL,
                  icon:  Icon(
                    Icons.support_agent,
                    size: 18.sp,
                    color: Colors.black,
                  )),
            ),
          ),
*/
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Image.asset(
                'assets/images/icon.png',
                height: 30.h,
              ),
            ],
          ),
          const Spacer(),
          Card(
            elevation: 1,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp)
            ),
            child:Container(
              height: 35.h,
              width: 35.w,
              child: IconButton(
                  onPressed: callback,
                  icon:  Icon(
                    FontAwesomeIcons.refresh,
                    size: 18.sp,
                    color: Colors.black,
                  )),
            ),
          ),


        ],
      ),
    );
  }

}
