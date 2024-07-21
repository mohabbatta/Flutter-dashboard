import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/colors_constants.dart';
import '../data/channel_model.dart';
import '../data/chart_models.dart';
import '../data/data_viewer_model.dart';
import '../data/social_media_model.dart';
import '../widgets/data_viewer_widget.dart';
import '../widgets/return_customers_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Sales',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.more_vert_outlined)
                            ],
                          ),
                          SizedBox(height: 300,child: ReturningCustomersProgressWidget()),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Container(
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Revenue',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.more_vert_outlined)
                            ],
                          ),
                          SfCartesianChart(
                            primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                            series: <ChartSeries>[
                              StackedAreaSeries<AreaData, double>(
                                dataSource: areaData,
                                xValueMapper: (AreaData data, _) => data.x,
                                yValueMapper: (AreaData data, _) => data.y,
                                name: 'Area',
                                color: ColorsConstants.primaryColor.withOpacity(0.3),
                              ),
                              ColumnSeries<ColumnData, double>(
                                dataSource: columnData,
                                xValueMapper: (ColumnData data, _) => data.x,
                                yValueMapper: (ColumnData data, _) => data.y,
                                name: 'Column',
                                width: 0.2,
                                color: Colors.green.withOpacity(0.3),
                                borderColor: Colors.green,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DataViewerWidget(
                    title: "Channels",
                    subTitle: "Channel",
                    data: mapChannelModelToDataViewerModel(channelTraffic),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: DataViewerWidget(
                    title: "Social Media Traffic",
                    subTitle: "Network",
                    data: mapSocialTrafficToDataViewerModel(socialMediaTraffic),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
