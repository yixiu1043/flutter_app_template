import 'package:flutter/material.dart';
import 'package:flutter_app_template/gen/assets.gen.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';
import 'package:lottie/lottie.dart';

class YxLoading extends StatelessWidget {
  final String? content;
  final Color? color;

  const YxLoading({Key? key, this.content, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 114,
        height: 100,
        decoration: BoxDecoration(
          color: color ?? ColorName.color414660.withOpacity(0.8),
          border: null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Lottie.asset(Assets.lottie.trailLoading, height: 50, width: 50),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Text(
                  content ?? "加载中...",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
