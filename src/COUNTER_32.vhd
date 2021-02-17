
-----------------------------------------
--32BIT SYNC UP_COUNTER COUNTS FROM 0>>15
------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
  
entity COUNTER_32 is
    Port ( clk: in std_logic; -- clock input
           reset: in std_logic; -- reset input 
		   enabl: in std_logic; -- ENABLE TO COUNT 
           counter: out std_logic_vector(31 downto 0);
		   -- output 4-bit counter
		   
		   over_flow :out std_logic --ENABLE FOR THE NEXT 
		   
     );
end COUNTER_32;

architecture behave of COUNTER_32 is

signal OC1, OC2, OC3, OC4, OC5, OC6, OC7:std_logic;
------------------
 component UP_COUNTER
			Port ( clk: in std_logic; -- clock input
				  reset: in std_logic; -- reset input
				  enabl: in std_logic; -- ENABLE bit 
				  counter: out std_logic_vector(3 downto 0);
						-- output 4-bit counter
					
					over_flow :out std_logic ---ENABLE FOR THE NEXT 
		   
     );
 end component;

begin
	c1:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=>enabl, counter=>counter(3 downto 0),over_flow=>OC1 );
	c2:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=> OC1, counter=>counter(7 downto 4),over_flow=>OC2 );
	c3:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=> OC2, counter=>counter(11 downto 8),over_flow=>OC3 );
	c4:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=> OC3, counter=>counter(15 downto 12),over_flow=>OC4 );
	c5:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=> OC4, counter=>counter(19 downto 16),over_flow=>OC5 );
	c6:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=> OC5, counter=>counter(23 downto 20),over_flow=>OC6 );
	c7:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=> OC6, counter=>counter(27 downto 24),over_flow=>OC7 );
	c8:UP_COUNTER port map (clk=>clk, reset=>reset, enabl=> OC7, counter=>counter(31 downto 28),over_flow=>over_flow );

	

end behave;