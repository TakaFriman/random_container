import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_container/pages/home/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionHistory = context.watch<SelectionHistoryProvider>().history;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Выбор квадратика', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Text('Выбрать квадратик', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Text(
              'История выбора: ${selectionHistory.join(", ")}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const BottomSheetContent();
      },
    );
  }
}
