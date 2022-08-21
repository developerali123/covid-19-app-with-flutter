import 'package:covid19_app/Services/states.dart';
import 'package:covid19_app/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'Modal/countriesmodal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller=AnimationController(duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  Widget build(BuildContext context) {
    States states=States();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                FutureBuilder(future: states.statesapi(),builder: (context,AsyncSnapshot<Countriesmodal> snapshot){
                  if(!snapshot.hasData){
                    return Container(child: SpinKitCircle(
                      color: Colors.white,
                      size: 50,
                      controller: _controller,
                    ));
                  }else{
                    return Column(
                      children: [
                        PieChart(dataMap: {
                          "total cases":double.parse(snapshot.data!.cases.toString()),
                          "today cases":double.parse(snapshot.data!.todayCases.toString()),
                          "active":double.parse(snapshot.data!.active.toString()),
                          "critical":double.parse(snapshot.data!.critical.toString()),
                          "recovered":double.parse(snapshot.data!.recovered.toString()),
                          "today recovered":double.parse(snapshot.data!.todayRecovered.toString()),
                          "deaths":double.parse(snapshot.data!.deaths.toString()),
                          "today deaths":double.parse(snapshot.data!.todayDeaths.toString()),
                        },animationDuration: Duration(milliseconds: 1500),
                          chartType: ChartType.ring,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          colorList: [
                            Colors.red,
                            Colors.blue,
                            Colors.green,
                            Colors.yellow,
                            Colors.orange,
                            Colors.pink,
                            Colors.purple,
                            Colors.brown,
                          ],
                          chartRadius: 200,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(title: 'total cases', value: snapshot.data!.cases.toString()),
                                ReusableRow(title: 'today cases', value: snapshot.data!.todayCases.toString()),
                                ReusableRow(title: 'active', value: snapshot.data!.active.toString()),
                                ReusableRow(title: 'critical', value: snapshot.data!.critical.toString()),
                                ReusableRow(title: 'recovered', value: snapshot.data!.recovered.toString()),
                                ReusableRow(title: 'today recovered', value: snapshot.data!.todayRecovered.toString()),
                                ReusableRow(title: 'deaths', value: snapshot.data!.deaths.toString()),
                                ReusableRow(title: 'today deaths', value: snapshot.data!.todayDeaths.toString()),
                                ReusableRow(title: 'tests done', value: snapshot.data!.tests.toString()),
                                ReusableRow(title: 'affected counties', value: snapshot.data!.affectedCountries.toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('Track Countries'),
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Countries()));
                          },
                        )
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
  ReusableRow({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
            ],
          ),
          SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}
