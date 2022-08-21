import 'dart:convert';

import 'package:covid19_app/Modal/statesmodal.dart';
import 'package:http/http.dart' as http;

import '../Modal/countriesmodal.dart';
import 'apiurl.dart';

class States{
  Future<Countriesmodal> statesapi() async{
    final response=await http.get(Uri.parse(AppUrl.worldstatesapi));
    if(response.statusCode==200){
      var data=jsonDecode(response.body.toString());
      return Countriesmodal.fromJson(data);
    }else{
      throw Exception('error');
    }
  }
  List<Statesmodal> stateslist=[];
  Future<List<Statesmodal>> countrieslistapi() async{
    final response=await http.get(Uri.parse(AppUrl.countrieslist));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      stateslist.clear();
      for(Map i in data){
        stateslist.add(Statesmodal.fromJson(i));
      }
      return stateslist;
    }else{
      return stateslist;
    }
  }
}