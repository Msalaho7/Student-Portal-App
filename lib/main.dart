import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_portal_app2/provider/data_provider.dart';
import 'package:student_portal_app2/ui/homeScreen/home_screen.dart';
import 'package:student_portal_app2/ui/models/data.dart';
import 'package:student_portal_app2/ui/models/lecture.dart';
import 'package:student_portal_app2/ui/models/result.dart';
import 'package:student_portal_app2/ui/models/student.dart';
import 'package:student_portal_app2/ui/tabs/personal_info.dart';
import 'package:student_portal_app2/ui/tabs/results_tab.dart';
import 'package:student_portal_app2/ui/tabs/time_table.dart';
import 'package:student_portal_app2/ui/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? languageCode = prefs.getString('languageCode');

  final student = Student(
    studentName: 'Mohamed',
    fatherName: 'Salah',
    studentLevel: 'Second Year',
    studentLatestGrade: '95%',
  );
  await saveStudentInfo(student);

  final List<Lecture> lectures = [
    Lecture(
      lectureTime: '10:00 AM - 12:00 PM',
      lectureDay: 'Sunday',
      lecturePlace: 'Lab 7',
      instructor: 'Dr. Ahmed',
    ),
    Lecture(
      lectureTime: '02:00 PM - 04:00 PM',
      lectureDay: 'Monday',
      lecturePlace: 'Lab 1',
      instructor: 'Dr. Ahmed',
    ),
    Lecture(
      lectureTime: '4:00 PM - 6:00 PM',
      lectureDay: 'Tuesday',
      lecturePlace: 'Lab 8',
      instructor: 'Dr. Ahmed',
    ),
    Lecture(
      lectureTime: '02:00 PM - 04:00 PM',
      lectureDay: 'Wednesday',
      lecturePlace: 'Lab 2',
      instructor: 'Dr. Ahmed',
    ),
    Lecture(
      lectureTime: '10:00 AM - 12:00 PM',
      lectureDay: 'Thursday',
      lecturePlace: 'Lab 1',
      instructor: 'Dr. Ahmed',
    ),
  ];
  await saveLectures(lectures);

  final List<Result> results = [
    Result(
      courseName: 'Math',
      courseGrade: 'A',
      courseTotal: '90/100',
      courseYear: '2022',
      courseSemester: 'Fall',
    ),
    Result(
      courseName: 'Physics',
      courseGrade: 'B',
      courseTotal: '80/100',
      courseYear: '2022',
      courseSemester: 'Fall',
    ),
    Result(
      courseName: 'English',
      courseGrade: 'A+',
      courseTotal: '95/100',
      courseYear: '2023',
      courseSemester: 'Spring',
    ),
    Result(
      courseName: 'Web',
      courseGrade: 'B+',
      courseTotal: '85/100',
      courseYear: '2023',
      courseSemester: 'Spring',
    ),
  ];
  await saveResults(results);
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MyApp(
        initialLocale:  languageCode != null ? Locale(languageCode) : null ,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Locale? initialLocale;
  const MyApp({super.key, this.initialLocale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _currentLocale;

  @override
  void initState() {
    super.initState();
    _currentLocale = widget.initialLocale;
  }

  void _changeLocale(Locale newLocale) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', newLocale.languageCode);
    setState(() {
      _currentLocale = newLocale;
    });

  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "studentPortal",
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: _currentLocale,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(_)=>  HomeScreen(changeLocale: _changeLocale),
        PersonalInfo.routeName:(_)=> const PersonalInfo(),
        TimeTable.routeName:(_)=> const TimeTable(),
        Results.routeName:(_)=> const Results(),
      },
      theme: AppTheme.appTheme,
    );
  }
}