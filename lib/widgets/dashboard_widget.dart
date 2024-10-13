import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardWidget extends StatelessWidget {
  final List<_ChartData> chartData = [
    _ChartData('Kondisi Baik', 5, Colors.blue),
    _ChartData('Pemeliharaan', 3, Colors.orange),
    _ChartData('Rusak Berat', 2, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9; // 90% layar
    double height = 250; // Tinggi lebih kecil untuk tampilan ponsel

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Legend di sebelah kiri
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kondisi Barang',
                  style: TextStyle(
                    fontSize: 16.0, // Lebih kecil
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                _buildLegendItem('Kondisi Baik', Colors.blue),
                const SizedBox(height: 5.0),
                _buildLegendItem('Pemeliharaan', Colors.orange),
                const SizedBox(height: 5.0),
                _buildLegendItem('Rusak Berat', Colors.red),
              ],
            ),
          ),

          // Donut Chart di sebelah kanan
          Expanded(
            flex: 2,
            child: SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<_ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (_ChartData data, _) => data.color,
                  xValueMapper: (_ChartData data, _) => data.label,
                  yValueMapper: (_ChartData data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(fontSize: 10),
                  ),
                  innerRadius: '70%',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}

// Model Data untuk Pie Chart
class _ChartData {
  final String label;
  final int value;
  final Color color;

  _ChartData(this.label, this.value, this.color);
}
