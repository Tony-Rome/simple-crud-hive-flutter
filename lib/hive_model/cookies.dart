

import 'package:hive/hive.dart';

part 'cookies.g.dart';

@HiveType(typeId : 0)
class Cookies{
	@HiveField(0)
	String flavour;
	@HiveField(1)
	String chips;

  Cookies({
    this.flavour,
    this.chips
  });
}
 
 



/* class Cookies{
	String flavour;
	String chips;

  Cookies({
    this.flavour,
    this.chips
  });
} */
 