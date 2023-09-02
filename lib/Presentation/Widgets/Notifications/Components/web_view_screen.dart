import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class InAppWebView extends StatelessWidget {
  final String url;
  InAppWebView({super.key, required this.url});
  final ValueNotifier<bool> loading = ValueNotifier(true);
  // int loadingPercentage =0;
  @override
  Widget build(BuildContext context) {
    print('rebuilded');
    //var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 1.sh * 0.06),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: WebViewPlus(
              backgroundColor: Colors.white,
              onPageStarted: (p) {},
              onPageFinished: (url) async {
                //  var currentUrl = await controller.webViewController.currentUrl();
                //  context.read<LoadingWebCubit>().loadingWeb(false);
                loading.value = false;
              },
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) async {
                log("testing url $url");
                controller.loadUrl(url);
                var currentUrl =
                    await controller.webViewController.currentUrl();
                log("current url ${currentUrl}");
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: loading,
              builder: (context, bool isLoading, Widget? child) {
                return isLoading
                    ? Center(child: LoadingDialog.loadingWidget())
                    : Stack();
              }),
          Positioned(
            top: 15.sp,
            left: 5.sp,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30.r,
                color: Colors.black,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
