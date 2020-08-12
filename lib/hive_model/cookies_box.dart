
import 'package:medium_hive_crud/hive_model/cookies.dart';
import 'package:hive/hive.dart';

part 'cookies_box.g.dart';

@HiveType(typeId : 1)
class CookiesBox{
	@HiveField(0)
	double price;
	@HiveField(1)
	String color;
  @HiveField(2)
  List<Cookies> cookiesList;

  CookiesBox(
    this.price,
    this.color,
    this.cookiesList
  );
}
