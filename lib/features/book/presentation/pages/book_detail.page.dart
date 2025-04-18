import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:server_side_localization/core/assets_catalog.dart';
import 'package:server_side_localization/generated/locale_keys.g.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key});

  @override
  State<BookDetailPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsCatalog.background),
          fit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.bookDetailPageTitle.tr(),
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      LocaleKeys.translationStatus.tr(),
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                    Flexible(
                      child: Text(
                        LocaleKeys.bookDetailPageText.tr(),
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
