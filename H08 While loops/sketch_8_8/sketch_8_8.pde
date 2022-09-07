int a = 1;
int b = 1;
int c = 2;

for (int i = 0; i < 15; i++) {
  println(c);
  c = a + b;
  a = c + b;
  b = a + c;
}
