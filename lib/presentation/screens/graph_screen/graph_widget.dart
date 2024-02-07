import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MultiStockLineChart extends StatelessWidget {
  final List<List<FlSpot>>
      allStocksData; // Datos de todas las acciones, cada lista de FlSpot representa una acción

  const MultiStockLineChart({
    Key? key,
    required this.allStocksData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
                showTitles: false), // Opcional: ajusta para tus necesidades
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1, // Ajusta este valor según el rango de tus datos
              getTitlesWidget: (value, meta) =>
                  Text('\$${value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        lineBarsData: allStocksData
            .map((stockData) => LineChartBarData(
                  spots: stockData,
                  isCurved: true,
                  color: Colors
                      .blue, // Considera asignar colores únicos por acción
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ))
            .toList(),
      ),
    );
  }
}
