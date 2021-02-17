
-----------------------------------------
--4BIT SYNC UP_COUNTER COUNTS FROM 0>>15
------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
  
entity UP_COUNTER is
    Port ( clk: in std_logic; -- clock input
           reset: in std_logic; -- reset input 
           counter: out std_logic_vector(3 downto 0);
		   -- output 4-bit counter
		   enabl: in std_logic; -- ENABLE bit 
		   over_flow :out std_logic ---ENABLE FOR THE NEXT 
		   
     );
end UP_COUNTER;

architecture behave of UP_COUNTER is

signal cout: std_logic_vector(3 downto 0);
signal s_over_flow: std_logic;
signal max_count :std_logic_vector(3 downto 0):=x"1";
begin

 count:process(clk)
begin
 
	if(rising_edge(clk)) then
		if(reset='1') then
			cout <= x"0";
			s_over_flow<= '0';
		else
			if (enabl='0') then 
				cout<=cout;
			else 
				cout<= cout + x"1";
			end if ;
		end if;
	end if;
end process;

overflow: process (cout )
begin
		if(cout= max_count )then 
			s_over_flow<= '1';
		else 
			s_over_flow<= '0';
		end if ;


end process;	

 counter <= cout;
 over_flow<=s_over_flow;

end behave;