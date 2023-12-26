// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
//
// void main() {
//   runApp(GraphScreen());
// }
// class GraphScreen extends StatefulWidget {
//   @override
//   _GraphScreenState createState() => _GraphScreenState();
// }
//
// class _GraphScreenState extends State<GraphScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Graph Screen'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: LineChart(
//           _createSampleData(),
//         ),
//       ),
//     );
//   }
//
//   LineChartData _createSampleData() {
//     return LineChartData(
//       gridData: FlGridData(show: false),
//       titlesData: FlTitlesData(show: false),
//       borderData: FlBorderData(show: true),
//       minX: 0,
//       maxX: 7,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: [
//             FlSpot(0, 3),
//             FlSpot(1, 1),
//             FlSpot(2, 4),
//             FlSpot(3, 2),
//             FlSpot(4, 5),
//             FlSpot(5, 3),
//             FlSpot(6, 4),
//           ],
//           isCurved: true,
//           color: Colors.blue,
//           dotData: FlDotData(show: false),
//           belowBarData: BarAreaData(show: false),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(GraphApp());
}

class GraphApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bar Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarChartScreen(),
    );
  }
}

class BarChartScreen extends StatefulWidget {
  @override
  _BarChartScreenState createState() => _BarChartScreenState();
}

class _BarChartScreenState extends State<BarChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: BarChart(
          _createSampleData(),
        ),
      ),
    );
  }

  BarChartData _createSampleData() {
    return BarChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: true),
      barGroups: [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              y: 3,
              colors: [Colors.blue], // Add the 'colors' parameter here
            ),
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              y: 1,
              colors: [Colors.blue], // Add the 'colors' parameter here
            ),
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              y: 4,
              colors: [Colors.blue], // Add the 'colors' parameter here
            ),
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              y: 2,
              colors: [Colors.blue], // Add the 'colors' parameter here
            ),
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              y: 5,
              colors: [Colors.blue], // Add the 'colors' parameter here
            ),
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              y: 3,
              colors: [Colors.blue], // Add the 'colors' parameter here
            ),
          ],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              y: 4,
              colors: [Colors.blue], // Add the 'colors' parameter here
            ),
          ],
        ),
      ],
    );
  }
}
