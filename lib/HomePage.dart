import 'package:flutter/material.dart';
import 'package:orbital2020/StudentAddTask.dart';
import 'package:orbital2020/StudentMain.dart';
import 'package:orbital2020/TeacherAddGroup.dart';
import 'package:orbital2020/TeacherAddStudentToGroup.dart';
import 'package:orbital2020/TeacherAddTask.dart';
import 'package:orbital2020/TeacherAssignStudent.dart';
import 'package:orbital2020/TeacherAssignTask.dart';
import 'package:orbital2020/TeacherGroupView.dart';
import 'package:orbital2020/TeacherGroups.dart';
import 'package:orbital2020/TeacherStudentView.dart';
import 'package:orbital2020/TeacherTaskView.dart';

class HomePage extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: navigatorKey,
        initialRoute: 'teacher_groups',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'student_main':
              builder = (_) => StudentMain();
              break;
            case 'student_addTask':
              builder = (_) => StudentAddTask();
              break;
            case 'teacher_groups':
              builder = (_) => TeacherGroups();
              break;
            case 'teacher_addGroup':
              builder = (_) => TeacherAddGroup();
              break;
            case 'teacher_addStudentToGroup':
              builder = (_) => TeacherAddStudentToGroup(group: settings.arguments);
              break;
            case 'teacher_groupView':
              builder = (_) => TeacherGroupView(group: settings.arguments);
              break;
            case 'teacher_addTask':
              builder = (_) => TeacherAddTask(group: settings.arguments);
              break;
            case 'teacher_studentView':
              builder = (_) => TeacherStudentView(student: settings.arguments);
              break;
            case 'teacher_taskView':
              Map<String, dynamic> arguments = settings.arguments;
              builder = (_) => TeacherTaskView(task: arguments['task'], group: arguments['group']);
              break;
            case 'teacher_assignTask':
              builder = (_) => TeacherAssignTask(student: settings.arguments);
              break;
            case 'teacher_assignStudent':
              Map<String, dynamic> arguments = settings.arguments;
              builder = (_) => TeacherAssignStudent(task: arguments['task'], group: arguments['group']);
              break;
            default:
              throw Exception("Invalid route: ${settings.name}");
          }
          return MaterialPageRoute(builder: builder, settings: settings);

          }
      ),
    );
  }

}