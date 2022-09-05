import 'package:flutter/material.dart';

import '../assets_menager/assets_menager.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {Key? key,
      required this.title,
      required this.child,
      this.bottom,
      this.floatingActionButton,
      this.resizeToAvoidBottomInset,
      this.appBarBottom})
      : super(key: key);
  final String title;
  final Widget child;
  final Widget? bottom;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final TabBar? appBarBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white1,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColors.white1,
          appBar: AppBar(
            bottom: appBarBottom,
            backgroundColor: AppColors.white1,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryBlack,
                )),
            title: Text(
              title,
              style: TextStyle(
                color: AppColors.primaryBlack,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: child,
          bottomNavigationBar: bottom,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        ),
      ),
    );
  }
}
