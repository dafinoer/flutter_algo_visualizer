import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DropdownTotalDataWidget extends StatelessWidget {
  const DropdownTotalDataWidget({Key? key}) : super(key: key);

  void onChoiceAmountOfData(BuildContext context, int? lotsOfItem) {
    final amountData = lotsOfItem;
    if (amountData != null) {
      context.read<SortingForm>().setTotalItem(amountData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: 0.5, color: Colors.grey)),
      child: Observer(
        builder: (context) {
          return DropdownButton(
            borderRadius: BorderRadius.circular(12.0),
            value: context.read<SortingForm>().totalItem,
            underline: const SizedBox.shrink(),
            isExpanded: true,
            hint: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Amount Data'),
            ),
            items: const [
              DropdownMenuItem(
                value: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('10'),
                ),
              ),
              DropdownMenuItem(
                value: 20,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('20'),
                ),
              ),
              DropdownMenuItem(
                value: 30,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('30'),
                ),
              ),
              DropdownMenuItem(
                value: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('40'),
                ),
              ),
              DropdownMenuItem(
                value: 50,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('50'),
                ),
              ),
            ],
            onChanged: context.read<SortingForm>().isRunning
                ? null
                : (int? value) => onChoiceAmountOfData(context, value),
          );
        },
      ),
    );
  }
}
