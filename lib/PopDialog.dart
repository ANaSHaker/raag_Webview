import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import 'Screens/constants.dart';


Future<Object?> popDialog({
  required context,
  required String title,
  required String content,
  required Color boxColor,
}) {
  return showFlash(
      context: context,
      persistent: true,
      transitionDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
            behavior: FlashBehavior.floating,
            position: FlashPosition.bottom,
            boxShadows: kElevationToShadow[4],
            margin: EdgeInsets.only(bottom: 75),
            backgroundColor: boxColor,
            borderRadius: BorderRadius.circular(2),
            controller: controller,
            onTap: () => controller.dismiss(),
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width:220,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: textStyle(
                                context, color: boxColor, size: 12,fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade100,
                          thickness: 1,
                        ),
                        Text(
                          content,
                          maxLines: 2,
                          style: textStyle(
                              context, color: Colors.black, size: 11,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
      });
}