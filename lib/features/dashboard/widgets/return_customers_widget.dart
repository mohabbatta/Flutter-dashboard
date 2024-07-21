import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../constants/colors_constants.dart';

class ReturningCustomersProgressWidget extends StatelessWidget {
  const ReturningCustomersProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 150,
          endAngle: 390,
          radiusFactor: 0.7,
          annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 0.3,
                verticalAlignment: GaugeAlignment.center,
                angle: 90,
                widget: Text(
                  "50%",
                  style: TextStyle(fontSize: 11),
                )),
            GaugeAnnotation(
                positionFactor: 0.5,
                verticalAlignment: GaugeAlignment.center,
                angle: 90,
                widget: Text(
                  "Returning Customers",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsConstants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
          axisLineStyle: AxisLineStyle(
            thickness: 0.1,
            color: Colors.grey.shade200,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: const <GaugePointer>[
            RangePointer(
              value: 50,
              width: 0.1,
              pointerOffset: 0,
              sizeUnit: GaugeSizeUnit.factor,
              color: ColorsConstants.primaryColor,
            )
          ],
        ),
        RadialAxis(
          minimum: 0,
          interval: 0.1,
          maximum: 4,
          showLabels: false,
          showTicks: true,
          showAxisLine: false,
          tickOffset: -0.05,
          offsetUnit: GaugeSizeUnit.factor,
          minorTicksPerInterval: 0,
          startAngle: 150,
          endAngle: 390,
          radiusFactor: 0.7,
          majorTickStyle: const MajorTickStyle(
            length: 0.2,
            thickness: 1,
            lengthUnit: GaugeSizeUnit.factor,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
