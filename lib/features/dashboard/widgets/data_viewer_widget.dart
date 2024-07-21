import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../data/data_viewer_model.dart';
import 'export_button.dart';

class DataViewerWidget extends StatelessWidget {
  const DataViewerWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.data,
  });
  final String title;
  final String subTitle;
  final List<DataViewerModel> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const ExportButton(),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade200))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Text(subTitle)),
                    const Expanded(flex: 1, child: Text("Visits")),
                    const Expanded(flex: 1, child: Text("Progress")),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(flex: 2, child: Text(data[index].name)),
                    Expanded(flex: 1, child: Text("${data[index].visitors}")),
                    Expanded(
                      flex: 1,
                      child: SfLinearGauge(
                        showTicks: false,
                        showLabels: false,
                        barPointers: [
                          LinearBarPointer(
                            value: data[index].percent.toDouble(),
                            thickness: 3,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: data.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 18);
              },
            )
          ],
        ),
      ),
    );
  }
}
