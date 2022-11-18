import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DropdownSpeedButton extends StatelessWidget {
  const DropdownSpeedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortingForm = context.read<SortingForm>();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: 0.5, color: Colors.grey)),
      child: Observer(
        builder: (context) {
          return DropdownButton(
            borderRadius: BorderRadius.circular(12.0),
            value: sortingForm.thresHoleTime,
            underline: const SizedBox.shrink(),
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                  value: 500,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Slow'),
                  )),
              DropdownMenuItem(
                  value: 300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Medium'),
                  )),
              DropdownMenuItem(
                  value: 100,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Fast'),
                  ))
            ],
            onChanged: sortingForm.isDisableActionForm
                ? null
                : (int? value) {
                    final itemValue = value;
                    if (itemValue != null) {
                      sortingForm.setThresHoleTime(itemValue);
                    }
                  },
          );
        },
      ),
    );
  }
}
