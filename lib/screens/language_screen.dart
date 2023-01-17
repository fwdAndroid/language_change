import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test/controller/language_controller.dart';
import 'package:test/widgets/language_widgets.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          GetBuilder<LocalizationController>(builder: (localizationContoller) {
        return Column(
          children: [
            Container(
              height: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1),
                itemCount: 2,
                itemBuilder: (context, index) => LanguageWidget(
                  languageModel: localizationContoller.languages[index],
                  localizationController: localizationContoller,
                  index: index,
                ),
              ),
            ),
            Text("home_appBar_title".tr)
          ],
        );
      }),
    );
  }
}
