module test(v1 = 1, v2 = 2, v3 = 3){
    echo("this is a string ");
    topkek = 50;
    if(v1 == 1){
        echo(str("v1 is 1"));
        topkek = 10000;
        v2 = 6;
        echo(str("v2 = ", v2));
        echo(str("topkek = ", topkek));
    }
    echo(str("v2 = ", v2));
    echo(str("topkek = ", topkek));
}

test();