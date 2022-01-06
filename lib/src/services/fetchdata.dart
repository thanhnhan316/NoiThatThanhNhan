import 'package:thanhnhan_project/src/models/categoris.dart';
import 'package:thanhnhan_project/src/models/product.dart';
import 'package:http/http.dart' as http;

class FetchData {
  Future<List<Product>> fetchDataProduct() async {
    String url = "https://5f210aa9daa42f001666535e.mockapi.io/api/products";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      List<Product> ls =
          ProductFromJson(reponse.body); //vì FromJson đã trả về list cho mình
      print("${ls[0].title}");
      return ls;
    } else {
      return throw Exception('Không có dữ liệu');
    }
  }

  Future<List<Categorie>> fetchDataCategorie() async {
    String url = "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      List<Categorie> ls =
          CategorieFromJson(reponse.body); //vì FromJson đã trả về list cho mình
      print("${ls[0].title}");
      return ls;
    } else {
      return throw Exception('Không có dữ liệu');
    }
  }

  // https://5f210aa9daa42f001666535e.mockapi.io/api/categories

  // Future<List<Product>> fetchData() async {
  //   String url = "https://fakestoreapi.com/products?limit=100";
  //   var client = http.Client();
  //   var reponse = await client.get(Uri.parse(url));
  //   if (reponse.statusCode == 200) {
  //     var result = reponse.body;
  //     var jsonData = json.decode(result);
  //     print(jsonData);
  //     List<Product> ls = [];

  //     for (var item in jsonData) {
  //       dynamic rate = item["rating"]["rate"];
  //       dynamic count = item["rating"]["count"];
  //       Rating rating = new Rating(rate: rate, coutn: count);
  //       Product p = new Product(
  //         id: item["id"],
  //         title: item["title"],
  //         price: item["price"],
  //         description: item["description"],
  //         category: item["category"],
  //         imgge: item["image"],
  //         rating: rating,
  //       );

  //       print("============================= $p");
  //       ls.add(p);
  //     }
  //     return ls;
  //   } else {
  //     return throw Exception('Không có dữ liệu');
  //   }
  // }
}
