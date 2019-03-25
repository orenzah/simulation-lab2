package lab2;


@license(LGPL);


//
// TODO documentation
//

//
// TODO documentation
//
network Network
{
    @display("bgb=409,277");
    types:
    submodules:
        host: Host {
            @display("p=44,46");
        }
        host1: Host {
            @display("p=258,46");
        }
        host2: Host {
            @display("p=44,200");
        }
        host3: Host {
            @display("p=258,200");
        }
        switch: Switch {
            @display("p=153,119");
        }
}

