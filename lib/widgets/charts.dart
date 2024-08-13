// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
//
// class Chart extends StatefulWidget {
//   const Chart({super.key});
//
//   @override
//   _ChartState createState() => _ChartState();
// }
//
// class _ChartState extends State<Chart> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         width: double.infinity,
//         height: 300,
//         child: SfCartesianChart(
//           primaryXAxis: const CategoryAxis(),
//           series: <SplineSeries<SalesData, String>>[
//             SplineSeries<SalesData, String>(
//               color: Colors.amberAccent,
//               dataSource: <SalesData>[
//                 SalesData('Mon', 70),
//                 SalesData('Tue', 30),
//                 SalesData('Wed', 100),
//                 SalesData('Thur', 15),
//                 SalesData('Fri', 45),
//                 SalesData('Sat', 55),
//               ],
//               xValueMapper: (SalesData sales, _) => sales.day,
//               yValueMapper: (SalesData sales, _) => sales.sales,
//             ),
//           ],
//         ),
//     );
//   }
// }
//
// class SalesData {
//   SalesData(this.day, this.sales);
//   final String day;
//   final double sales;
// }
