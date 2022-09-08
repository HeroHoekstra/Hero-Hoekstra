String string;

void setup() {
  string = tekst("time ", "4", " crime", ".");
  println(string);
}

String tekst(String a, String b, String c, String d) {
  String zin = a + b + c + d;
  return zin;
}
