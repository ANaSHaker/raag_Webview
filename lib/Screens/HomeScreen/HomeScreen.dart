import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  TextEditingController txtsearch=TextEditingController();
  PullToRefreshController? pullToRefreshController;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };
  Future<void> requestPermissions() async {
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.location,
    ].request();

  }

  UniqueKey _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    pullToRefreshController =PullToRefreshController(onRefresh: () {
      homeProviderTrue!.inAppWebViewController!.reload();
    },);
    requestPermissions();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  @override
  Widget build(BuildContext context) {
    homeProviderTrue=Provider.of<HomeProvider>(context,listen: true);
    homeProviderFalse=Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          homeProviderTrue!.inAppWebViewController!.goBack();
          return  false;

        },
        child: Scaffold(
          key: _scaffoldKey,

          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: FloatingActionButton(
              backgroundColor: Color(0xff01cc94),
              child: Icon(Icons.refresh),
              onPressed: () {
                homeProviderTrue!.inAppWebViewController!.reload();
              },
            ),
          ),
          body:LiquidPullToRefresh(
            key: _refreshIndicatorKey,	// key if you want to add
            onRefresh: ()async{
              homeProviderTrue!.inAppWebViewController!.reload();
            },
            child:    Container(
              height: MediaQuery.of(context).size.height,
              child: InAppWebView(

                initialUrlRequest: URLRequest(
                  url: Uri.parse('https://raayeg.net/courses/'),

                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    mediaPlaybackRequiresUserGesture: false,
                  ),
                ),
                androidOnGeolocationPermissionsShowPrompt:
                    (InAppWebViewController controller, String origin) async {
                  return GeolocationPermissionShowPromptResponse(
                    origin: origin,
                    allow: true,
                    retain: true,
                  );
                },
                onWebViewCreated: (InAppWebViewController controller) {
                },
                androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                  return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                },

                key: _key,
                gestureRecognizers: gestureRecognizers,
                pullToRefreshController: pullToRefreshController!,
                onProgressChanged: (controller, progress) {
                  pullToRefreshController!.endRefreshing();
                  homeProviderFalse!.changeProgress(progress/100);
                },
                onLoadStart: (controller, url) async {
                  print(url.toString());
                      if (!url.toString().contains('https://raayeg.net')) {
                        await                launch(url.toString());
                      }

                  pullToRefreshController!.endRefreshing();
                  homeProviderFalse!.inAppWebViewController = controller;
                },
                onLoadStop: (controller, url) {
                  pullToRefreshController!.endRefreshing();
                  homeProviderFalse!.inAppWebViewController = controller;

                },
                onLoadError: (controller, url, code, message) {
                  pullToRefreshController!.endRefreshing();
                  homeProviderFalse!.inAppWebViewController = controller;

                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class HomeProvider extends ChangeNotifier
{
  double progressweb=0;
  InAppWebViewController? inAppWebViewController;

  void changeProgress(double ps)
  {
    progressweb=ps;
    notifyListeners();
  }
}