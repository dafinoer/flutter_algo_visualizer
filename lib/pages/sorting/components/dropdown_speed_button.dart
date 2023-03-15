import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../presentation/sorting/sorting_form.dart';

class DropdownSpeedButton extends StatelessWidget {
  const DropdownSpeedButton({Key? key}) : super(key: key);

  void onPressAction(BuildContext context, int? value) {
    final time = value;
    if (time != null) {
      context.read<SortingForm>().setThresholdTime(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      child: Observer(
        builder: (context) => DropdownButton(
          borderRadius: BorderRadius.circular(12.0),
          value: context.read<SortingForm>().thresholdTime,
          underline: const SizedBox.shrink(),
          isExpanded: true,
          hint: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Speed'),
          ),
          items: const [
            DropdownMenuItem(
              value: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Slow'),
              ),
            ),
            DropdownMenuItem(
              value: 300,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Medium'),
              ),
            ),
            DropdownMenuItem(
              value: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Fast'),
              ),
            )
          ],
          onChanged: (value) => onPressAction(context, value),
        ),
      ),
    );
  }
}
