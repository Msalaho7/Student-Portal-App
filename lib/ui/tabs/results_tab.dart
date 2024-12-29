import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_portal_app2/ui/utils/app_localization_utils.dart';
import '../../provider/data_provider.dart';
import '../models/cardContainer.dart';
import '../models/data_item_widget.dart';
import '../models/result.dart';

class Results extends StatefulWidget {
  const Results({super.key});
  static const routeName = 'Results';

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final List<Result> results = dataProvider.results;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.results,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: results.isEmpty
            ? Center(child: Text(context.l10n.noDataAvailable))
            : ListView.builder(
                // تم استبدال Column ب ListView.builder
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  return CardContainer(children: [
                    DataItemWidget(
                      label: context.l10n.courseName,
                      value: result.courseName,
                    ),
                    DataItemWidget(
                      label: context.l10n.courseGrade,
                      value: result.courseGrade,
                    ),
                    DataItemWidget(
                      label: context.l10n.courseTotal,
                      value: result.courseTotal,
                    ),
                    DataItemWidget(
                      label: context.l10n.courseYear,
                      value: result.courseYear,
                    ),
                    DataItemWidget(
                      label: context.l10n.courseSemester,
                      value: result.courseSemester,
                    ),
                  ]);
                },
              ),
      ),
    );
  }
}