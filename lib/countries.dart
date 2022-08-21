import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'Services/states.dart';
import 'country.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> with TickerProviderStateMixin {
  TextEditingController searchcontroller=TextEditingController();
  late final AnimationController _controller=AnimationController(duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  Widget build(BuildContext context) {
    States states=States();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  hintText: 'search with country name'
                ),
                onChanged: (value){
                  setState((){

                  });
                },
              ),
            ),
            Expanded(child: FutureBuilder(future: states.countrieslistapi(),
              builder: (context,snapshot){
              if(!snapshot.hasData){
                return ListView.builder(itemCount: states.stateslist.length,itemBuilder: (context,index){
                  return Expanded(child: SpinKitCircle(
                    color: Colors.white,
                    size: 50,
                    controller: _controller,
                  ));
                });
              }else{
                return ListView.builder(itemCount: states.stateslist.length,itemBuilder: (context,index){
                  String name=states.stateslist[index].country.toString();
                  if(searchcontroller.text.isEmpty){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: ListTile(
                              leading: Image(height: 50,width:50,image: NetworkImage(states.stateslist[index].countryInfo!.flag.toString()),),
                              title: Text(states.stateslist[index].country.toString()),
                              subtitle: Text(states.stateslist[index].countryInfo!.iso3.toString()),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Country(name:states.stateslist[index].country.toString(),
                              cases: states.stateslist[index].cases.toString(),
                                todaycases: states.stateslist[index].todayCases.toString(),
                                deaths: states.stateslist[index].deaths.toString(),
                                todaydeaths: states.stateslist[index].todayDeaths.toString(),
                                recovered: states.stateslist[index].recovered.toString(),
                                todayrecovered: states.stateslist[index].todayRecovered.toString(),
                                active: states.stateslist[index].active.toString(),
                                critical: states.stateslist[index].critical.toString(),
                                tests: states.stateslist[index].tests.toString(),
                                population: states.stateslist[index].population.toString(),
                                continent: states.stateslist[index].continent.toString(),
                                source: states.stateslist[index].countryInfo!.flag.toString(),
                              )));
                            },
                          ),
                        ],
                      ),
                      // ),
                    );
                  }else if(name.toLowerCase().contains(searchcontroller.text.toLowerCase())){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: ListTile(
                              leading: Image(height: 50,width:50,image: NetworkImage(states.stateslist[index].countryInfo!.flag.toString()),),
                              title: Text(states.stateslist[index].country.toString()),
                              subtitle: Text(states.stateslist[index].countryInfo!.iso3.toString()),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Country(name:states.stateslist[index].country.toString(),
                                cases: states.stateslist[index].cases.toString(),
                                todaycases: states.stateslist[index].todayCases.toString(),
                                deaths: states.stateslist[index].deaths.toString(),
                                todaydeaths: states.stateslist[index].todayDeaths.toString(),
                                recovered: states.stateslist[index].recovered.toString(),
                                todayrecovered: states.stateslist[index].todayRecovered.toString(),
                                active: states.stateslist[index].active.toString(),
                                critical: states.stateslist[index].critical.toString(),
                                tests: states.stateslist[index].tests.toString(),
                                population: states.stateslist[index].population.toString(),
                                continent: states.stateslist[index].continent.toString(),
                                source: states.stateslist[index].countryInfo!.flag.toString(),
                              )));
                            },
                          ),
                        ],
                      ),
                      // ),
                    );
                  }else{
                    return Container();
                  }
                      });
                }
              }
            ))
          ],
        ),
      ),
    );
  }
}
