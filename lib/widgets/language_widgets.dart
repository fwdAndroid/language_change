import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/controller/language_controller.dart';
import 'package:test/language_models/models.dart';
import 'package:test/shared/app_constants.dart';

class LanguageWidget extends StatefulWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget(
      {super.key,
      required this.index,
      required this.languageModel,
      required this.localizationController});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.localizationController.setLanguage(Locale(
            AppConstants.languages[widget.index].languageCode,
            AppConstants.languages[widget.index].languageCountry));

        widget.localizationController.setSelectedIndex(widget.index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20)),
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
          widget.localizationController.selectedIndex == widget.index
              ? Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 40,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.black,
                    size: 20,
                  ))
              : SizedBox()
        ]),
      ),
    );
  }
}
