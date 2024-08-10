// ignore_for_file: use_build_context_synchronously

import 'package:brofit/database/hive/workout_history_db/history_db_functions.dart';
import 'package:brofit/database/hive/workout_history_db/history_model.dart';
import 'package:brofit/presentation/utils/colo_extension.dart';
import 'package:brofit/presentation/utils/common_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  ActivityHistoryState createState() => ActivityHistoryState();
}

enum TimeFilter { all, last3Days, lastWeek, lastMonth }

class ActivityHistoryState extends State<ActivityHistory> {
  List<WorkoutHistory> finalworkoutHistory = [];
  TimeFilter selectedFilter = TimeFilter.all;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<WorkoutHistory> history = await getHistory();

    
    switch (selectedFilter) {
      case TimeFilter.last3Days:
        history = filterLast3Days(history);
        break;
      case TimeFilter.lastWeek:
        history = filterLastWeek(history);
        break;
      case TimeFilter.lastMonth:
        history = filterLastMonth(history);
        break;
      default:
        break;
    }

    setState(() {
      finalworkoutHistory = history;
    });
  }

 
  List<WorkoutHistory> filterLast3Days(List<WorkoutHistory> history) {
    DateTime last3Days = DateTime.now().subtract(const Duration(days: 3));
    return history.where((entry) => isDateAfter(entry.id, last3Days)).toList();
  }

  
  List<WorkoutHistory> filterLastWeek(List<WorkoutHistory> history) {
    DateTime lastWeek = DateTime.now().subtract(const Duration(days: 7));
    return history.where((entry) => isDateAfter(entry.id, lastWeek)).toList();
  }

  List<WorkoutHistory> filterLastMonth(List<WorkoutHistory> history) {
    DateTime lastMonth = DateTime.now().subtract(const Duration(days: 30));
    return history.where((entry) => isDateAfter(entry.id, lastMonth)).toList();
  }

  
  bool isDateAfter(String id, DateTime referenceDate) {
   
    DateTime entryDate = DateFormat('dd MMM yyyy').parse(id);

   
    return entryDate.isAfter(referenceDate);
  }

  Future<void> _refresh() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        title: const Text('Activity History'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Tcolo.Primarycolor2,
        actions: [
          
          DropdownButton<TimeFilter>(
            value: selectedFilter,
            onChanged: (TimeFilter? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedFilter = newValue;
                });
                fetchData(); 
              }
            },
            items: TimeFilter.values.map((TimeFilter filter) {
              return DropdownMenuItem<TimeFilter>(
                value: filter,
                child: Text(_getFilterText(filter)),
              );
            }).toList(),
          ),
        ],
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
                      final currentContext = context;
                      await deleteHistory(todayhistory: todayhistory);
                      setState(() {
                        finalworkoutHistory.removeAt(index);
                      });

                      
                      ScaffoldMessenger.of(currentContext).showSnackBar(
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
                        color: Tcolo.white,
                      ),
                    ),
                    child: ListTile(
                      title: Text(todayhistory.dailyWokout),
                      trailing: Text(todayhistory.id, style: AppTextStyles.loginEnding),
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

  
  String _getFilterText(TimeFilter filter) {
    switch (filter) {
      case TimeFilter.all:
        return 'All';
      case TimeFilter.last3Days:
        return 'Last 3 Days';
      case TimeFilter.lastWeek:
        return 'Last Week';
      case TimeFilter.lastMonth:
        return 'Last Month';
    }
  }
}
