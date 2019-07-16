import "dart:convert";
import "package:http/http.dart" as http;

// ############################
// ######## GifService ########
// ############################
// Uses http module to connect to Giphy API

class GifService{

  // ############################
  // ##### CLASS ATTRIBUTES #####
  // ############################

  String _search;
  int _offset = 0;

  // ############################
  // ####### GETs AND SETs ######
  // ############################

  String getSearch() => _search;

  void setSearch(String value) { _search = value; }

  bool isSearch(){
    if (_search == null) return false;
    else return true;
  }
   
  int getOffset() => _offset;

  void setOffset(int value) { _offset = value; }

  void incrementOffset(int value) {_offset += value;}

  // ###########################
  // ###### LOGIC METHODS ######
  // ###########################

  Future<Map> getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&limit=20&rating=G");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&q=$_search&limit=19&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }

  int getCount(List data) {
    if(_search == null) return data.length;
    else return data.length + 1;
  }

}
