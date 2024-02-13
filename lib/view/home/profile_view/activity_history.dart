import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/common_text_styles.dart';
import 'package:brofit/view/home/workout_history_db/history_db_functions.dart';
import 'package:brofit/view/home/workout_history_db/history_model.dart';
import 'package:flutter/material.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  ActivityHistoryState createState() => ActivityHistoryState();
}

class ActivityHistoryState extends State<ActivityHistory> {
  List<WorkoutHistory> finalworkoutHistory = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final List<WorkoutHistory> history = await getHistory();
    setState(() {
      finalworkoutHistory = history;
    });
  }

  Future<void> _refresh() async {
    await fetchData();
  }
  // String reverseDate(String date) {
  //   List<String> parts = date.split('-');
  //   return '${parts[2]}-${parts[1]}-${parts[0]}';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        title: const Text('Activity History'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Tcolo.Primarycolor2,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: finalworkoutHistory.isNotEmpty
            ? ListView.builder(
                itemCount: finalworkoutHistory.length,
                itemBuilder: (context, index) {
                  final WorkoutHistory todayhistory = finalworkoutHistory[index];
                  return Dismissible(
                    key: Key(todayhistory.id),
                    onDismissed: (direction) async {
                      await deleteHistory(todayhistory: todayhistory);
                      setState(() {
                        finalworkoutHistory.removeAt(index);
                      });
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('History entry deleted.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    background: Container(
                      color: Tcolo.gray,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.delete,
                        color:Tcolo.white,
                      ),
                    ),
                    child: ListTile(
                      title: Text(todayhistory.dailyWokout),
                      trailing: Text(todayhistory.id,style: AppTextStyles.loginEnding,),
                      
                    ),
                  );
                },
              )
            : const Center(
                child: Text('No workout history available.'),
              ),
      ),
    );
  }
}
