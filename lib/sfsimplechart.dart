import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionSimpleChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        //height: 500,
        child: SfCartesianChart(
          title: ChartTitle(
            text: 'Laptops'
          ),
          primaryXAxis: CategoryAxis(
            title: AxisTitle(
              text: 'Laptop Names'
            )
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(
             text: 'Sales in thousands'
            )
          ),
          legend: Legend(
            isVisible: true
          ),
          series: [
            ColumnSeries(
              name: 'Laptop Sales',
            dataSource: getColumnData(), 
            xValueMapper: (SalesData sales,_)=>sales.x, 
            yValueMapper: (SalesData sales,_)=>sales.y,
            dataLabelSettings: DataLabelSettings(
              isVisible: true
            )
          ),
        ]
        ),
      ),
    );
  }
}
class SalesData{
  String x;
  double y;
  SalesData(this.x,this.y);

}
getColumnData(){
  List<SalesData> columnData=[
    SalesData('Dell',30),
    SalesData('Hp',20),
    SalesData('Lenovo',25),
    SalesData('Acer',50),
    SalesData('Toshiba',15),


  ];
  return columnData;
}