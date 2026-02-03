class base_packet;
rand bit [7:0]data;
function void show_static();
$display("Base Packet[Static]:data=%0d",data);
endfunction
virtual function void show_dynamic();
$display("Base Packet[Dynamic]:data=%0d",data);
endfunction
endclass
class audio_packet extends base_packet;
rand bit[3:0]channel;
function void show_static();
$display("Audio Packet[Static]:data=%0d,channel=%0d",data,channel);
endfunction
endclass
module tb_polymorphism_demo;
base_packet bp;
audio_packet ap;
initial begin 
ap=new();
void'(ap.randomize());
bp=ap;
$display("---Static vs Dynamic Binding---");
bp.show_static();
bp.show_dynamic();
end 
endmodule
