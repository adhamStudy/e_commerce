import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:e_commerce/core/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataVeiw extends StatelessWidget {
  const HandlingDataVeiw({super.key, required this.stutusRequest, this.widget});
  final StatusRequest stutusRequest;
  final widget;
  @override
  Widget build(BuildContext context) {
    return stutusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              ImageAsset.loading,
              width: 250,
              height: 250,
            ),
          )
        : stutusRequest == StatusRequest.offlineFilure
            ? Center(
                child: Lottie.asset(
                  ImageAsset.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : stutusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(
                      ImageAsset.server,
                      width: 250,
                      height: 250,
                    ),
                  )
                : stutusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(ImageAsset.nodata,
                            width: 250, height: 250, repeat: true),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest({required this.stutusRequest, this.widget});
  final StatusRequest stutusRequest;
  final widget;
  @override
  Widget build(BuildContext context) {
    return stutusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              ImageAsset.loading,
              width: 250,
              height: 250,
            ),
          )
        : stutusRequest == StatusRequest.offlineFilure
            ? Center(
                child: Lottie.asset(
                  ImageAsset.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : widget;
  }
}
