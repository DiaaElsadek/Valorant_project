import 'package:dio/dio.dart';
import 'package:diaa_quiz/models/map_model.dart';

class MapApi {
  final Dio dio = Dio();

  Future<List<MapData>> getMaps() async {
    try {
      Response response = await dio.get('https://valorant-api.com/v1/maps');
      Map<String, dynamic> json = response.data;
      List<dynamic> mapsData = json['data'];
      List<MapData> maps = [];

      for(var map in mapsData) {
        maps.add(MapData.fromJson(map));
      }

      return maps;
    } catch (e) {
      return [];
    }
  }
}