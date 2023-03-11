module  counter_top(
                        cin,
                        clock,
                        updown,
                        cout,
                        q
                    );

    input               cin;
    input               clock;
    input               updown;
    output              cout;
    output      [7:0]   q;

    wire                w1;
    wire        [3:0]   w2;
    wire        [3:0]   w3;

    counter_ip counter_ip_inst0(
                                    .cin(cin),
                                    .clock(clock),
                                    .updown(updown),
                                    .cout(w1),
                                    .q(w2)
                                );

    counter_ip counter_ip_inst1(
                                    .cin(w1),
                                    .clock(clock),
                                    .updown(updown),
                                    .cout(cout),
                                    .q(w3)
                                );

    assign  q[7:0]={w3[3:0],w2[3:0]} ;

endmodule