import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_portal_app2/ui/utils/app_localization_utils.dart';
import '../../provider/data_provider.dart';
import '../models/card_container.dart';
import '../models/data_item_widget.dart';
import '../models/student.dart';

/// Data Loading and Ui

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});
  static const routeName = 'PersonalInfo';

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final Student? student = dataProvider.student;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.personalInfo,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: student == null
            ? Center(child: Text(context.l10n.noDataAvailable))
            : Center(
                child: Column(
                  children: [
                    CardContainer(
                      children: [
                        DataItemWidget(
                          label: context.l10n.name,
                          value: student.studentName,
                        ),
                        DataItemWidget(
                          label: context.l10n.fatherName,
                          value: student.fatherName,
                        ),
                        DataItemWidget(
                          label: context.l10n.studentLevel,
                          value: student.studentLevel,
                        ),
                        DataItemWidget(
                          label: context.l10n.studentLatestGrade,
                          value: student.studentLatestGrade,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
