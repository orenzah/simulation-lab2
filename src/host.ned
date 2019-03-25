package lab2;



@license(LGPL);




//
// TODO documentation
//
module Host
{
    @display("bgb=341,235");

    int hostNumber;
    gates:
        inout in_out;
    types:
        simple Application
        {
            parameters:
                volatile int packetLength;
                int intervalTime;
            gates:
                input ipIn;
                output ipOut;
        }
        simple IP
        {
            parameters:
                int stationNumber = default(0);
                string ipAddress_src = default("172.168.32.X");
                string ipAddress_dst = default("172.168.32.X");

            gates:
                input appIn;
                output appOut;

                input ethIn;
                output ethOut;
        }

        simple Ethernet
        {
            parameters:
                int stationNumber = default(0);
                string macAddress_src = default("11:11:11:11:11:0X");
                string macAddress_dst = default("11:11:11:11:11:0X");
                int arpTableTTL @unit(s) = default(1ms);
            gates:
                input ipIn;
                output ipOut;

                inout sw_gate;


        }


    submodules:
        application: Application {
            @display("p=53,39");
        }
        ip: IP {
            @display("p=53,163;is=l");

        }
        ethernet: Ethernet {
            @display("p=284,163");
        }
    connections:

        application.ipOut --> ip.appIn;
        application.ipIn <-- ip.appOut;

        ip.ethOut --> ethernet.ipIn;
        ip.ethIn <-- ethernet.ipOut;

        ethernet.sw_gate <--> in_out;
        





}

