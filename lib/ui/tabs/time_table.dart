import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_portal_app2/ui/utils/app_localization_utils.dart';
import '../../provider/data_provider.dart';
import '../models/card_container.dart';
import '../models/data_item_widget.dart';
import '../models/lecture.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});
  static const routeName = 'TimeTable';

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final List<Lecture> lectures = dataProvider.lectures;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.timeTable,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: lectures.isEmpty
              ? Center(child: Text(context.l10n.noDataAvailable))
              : ListView.builder(
                  itemCount: lectures.length,
                  itemBuilder: (context, index) {
                    final lecture = lectures[index];
                    return CardContainer(
                      children: [
                        DataItemWidget(
                          label: context.l10n.time,
                          value: lecture.lectureTime,
                        ),
                        DataItemWidget(
                          label: context.l10n.day,
                          value: lecture.lectureDay,
                        ),
                        DataItemWidget(
                          label: context.l10n.place,
                          value: lecture.lecturePlace,
                        ),
                        DataItemWidget(
                          label: context.l10n.instructor,
                          value: lecture.instructor,
                        ),
                      ],
                    );
                  },
                ),
        ));
  }
}