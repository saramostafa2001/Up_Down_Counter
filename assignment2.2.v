module Up_Dn_Counter(

input      [4:0]          IN,
input                     Load,
input                     Up,
input                     Down,
input                     CLK,
output                    High,
output                    Low,
output reg  [4:0]         Counter  ); 


// 3 two-input MUX
 
always @ (posedge CLK)
 begin 
 
	  if (Load)
	   begin 
		Counter <= IN;
	   end
	  
	  else if(Down && !Low)
	   begin  
		Counter <= Counter - 5'b00001;
	   end
	   
	  else if (Up && !High)
	   begin
		Counter <= Counter + 5'b00001;
	   end

 end

 assign Low = (Counter == 5'b0);

 assign High = (Counter == 5'b11111);


endmodule 


   