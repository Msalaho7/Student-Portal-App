import 'package:flutter/material.dart';
import 'package:student_portal_app2/ui/utils/app_localization_utils.dart';
import '../tabs/personal_info.dart';
import '../tabs/results_tab.dart';
import '../tabs/time_table.dart';
import '../utils/app_colors.dart';

//changeLocale and UI

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.changeLocale});
  static const routeName = "Home";
  final Function(Locale) changeLocale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.studentPortal,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: buildIconButton(context, Icons.person,
                    context.l10n.personalInfo, () {
                      Navigator.pushNamed(context, PersonalInfo.routeName);
                    }),
              ),
              Expanded(
                child: buildIconButton(
                    context, Icons.access_time_filled, context.l10n.timeTable,
                        () {
                      Navigator.pushNamed(context, TimeTable.routeName);
                    }),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: buildIconButton(
                    context, Icons.assignment, context.l10n.results, () {
                  Navigator.pushNamed(context, Results.routeName);
                }),
              ),
              Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (Localizations.localeOf(context).languageCode ==
                              'en') {
                            changeLocale(const Locale('ar'));
                          } else {
                            changeLocale(const Locale('en'));
                          }
                        },
                        icon: Icon(
                          Localizations.localeOf(context).languageCode == 'en'
                              ? Icons.language
                              : Icons.g_translate,
                        ),
                      ),
                      Text(context.l10n.language,
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 26,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIconButton(BuildContext context, IconData whatIcon, String label,
      VoidCallback navigator) {
    return InkWell(
      onTap: navigator,
      child: Column(
        children: [
          Icon(
            whatIcon,
          ),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.secondary,
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}