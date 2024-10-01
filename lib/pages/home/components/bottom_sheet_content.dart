import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = Random().nextInt(20) + 1;
    double maxHeight = min(itemCount * 104 + 40, MediaQuery.of(context).size.height * 0.85);
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Выберите квадратик',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 1),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.read<SelectionHistoryProvider>().addSelection(index + 1);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.red,
                    margin: const EdgeInsets.symmetric(vertical: 2.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Квадратик ${index + 1}',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SelectionHistoryProvider with ChangeNotifier {
  final List<int> _history = [];

  List<int> get history => _history;

  void addSelection(int selection) {
    _history.add(selection);
    notifyListeners();
  }
}
