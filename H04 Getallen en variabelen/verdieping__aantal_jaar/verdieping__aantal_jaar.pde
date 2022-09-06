int sec = 91726;

float min;
float uur;
float dagen;
float jaren;

min = sec / 60;
uur = min / 60;
dagen = uur / 24;
jaren = dagen / 365;

print("het is ");
print(uur);
println(" uur");

print("het is ");
print(dagen);
println(" dagen");

print("het is ");
print(jaren);
print(" jaar");
