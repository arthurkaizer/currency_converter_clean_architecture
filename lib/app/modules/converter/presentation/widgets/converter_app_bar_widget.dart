import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ConverteAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  const ConverteAppBarWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          GestureDetector(
            onTap: (){
              Modular.to.pushNamed('about');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Image.asset('assets/images/logo_home_1.png'),
            ),
          ),
          Text(
            title?.i18n() ?? '',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
