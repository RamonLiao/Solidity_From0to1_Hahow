for (i = 1; i <=100; i++) {

   document.writeln(i + ", ");

   
}

document.writeln("<br/>");
document.writeln("<br/>");

for (i = 1; i <=100; i++) {
    if(i%2==0)
   document.writeln(i + ", ");
   
}


document.writeln("<br/>");
document.writeln("<br/>");

for (i = 0; i < 6; i++) {

    for (var j = 0; j <= (2 * i - 1) + 1; j++) {
        document.writeln("*");
    }

    document.writeln("<br/>");
}

document.writeln("<br/>");
document.writeln("<br/>");

for (i = 0; i < 6; i++) {

    for (var k = 0; k < 6 - i - 1; k++) {
        document.writeln("&nbsp;");
    }

    for (var j = 0; j <= (2 * i - 1) + 1; j++) {
        document.writeln("*");
    }

    document.writeln("<br/>");
}
