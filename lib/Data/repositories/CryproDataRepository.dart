
import '../CryptoModell/models/AllCryptoModel.dart';
import '../data_source/ApiProvider.dart';
class CryptoDataRepository{

  var response;
  ApiProvider apiProvider = ApiProvider();
  late AllCryptoModel dataFuture;


  Future<AllCryptoModel> getTopGainerData() async {
    response = await apiProvider.getTopGainerData();
    dataFuture = AllCryptoModel.fromJson(response.data);

    return dataFuture;
  }

}