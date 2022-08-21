import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  String name,continent,cases,todaycases,deaths,todaydeaths,recovered,todayrecovered,active,critical,tests,population,source;
  Country({
    Key? key,
    required this.name,
    required this.cases,
    required this.todaycases,
    required this.deaths,
    required this.todaydeaths,
    required this.recovered,
    required this.todayrecovered,
    required this.active,
    required this.critical,
    required this.tests,
    required this.population,
    required this.continent,
    required this.source
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            CircleAvatar(
              backgroundImage: NetworkImage(source),
              radius: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'total cases', value: cases),
                    ReusableRow(title: 'today cases', value: todaycases),
                    ReusableRow(title: 'active', value: active),
                    ReusableRow(title: 'critical', value: critical),
                    ReusableRow(title: 'recovered', value: recovered),
                    ReusableRow(title: 'today recovered', value: todayrecovered),
                    ReusableRow(title: 'deaths', value: deaths),
                    ReusableRow(title: 'today deaths', value: todaydeaths),
                    ReusableRow(title: 'tests done', value: tests),
                    ReusableRow(title: 'country population', value: population),
                    ReusableRow(title: 'continent', value: continent),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Column(
      //   children: [
      //     Text(cases),
      //     Text(todaycases),
      //     Text(deaths),
      //     Text(todaydeaths),
      //     Text(recovered),
      //     Text(todayrecovered),
      //     Text(active),
      //     Text(tests),
      //     Text(population),
      //     Text(continent),
      //   ],
      // )
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

