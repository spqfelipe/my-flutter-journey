import "dart:convert";
import "package:http/http.dart" as http;

class GifService{

  String _search;
  String _offset;

  // Constructor 

  // Gets and Sets

  String getSearch() => _search;
  void setSearch(String value) { _search = value; }
   
  String getOffset() => _offset;
  void setOffset(String value) { _offset = value; }

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&limit=20&rating=G");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&q=$_search&limit=25&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }
}
