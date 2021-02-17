-------------------------------------
--TESTBENCH FOR 4 BIT SYNC COUNTER 
--------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_counter is
end tb_counter;

architecture behve  of tb_counter is

component COUNTER_32 
    Port ( clk: in std_logic; -- clock input
				  reset: in std_logic; -- reset input
				  enabl: in std_logic; -- ENABLE bit 
				  counter: out std_logic_vector(31 downto 0);
						-- output 32-bit counter
					
					over_flow :out std_logic ---ENABLE FOR THE NEXT 
		    
     );
end component;
signal reset,enabl, clk,over_flow: std_logic;
signal counter:std_logic_vector(31 downto 0);

begin
dut: COUNTER_32 port map (clk => clk, reset=>reset, enabl=>enabl, over_flow=>over_flow,counter => counter);
   
clock_G :process
begin
     --GENERATE CLOK SIGNAL 
     clk <= '0'; wait for 15 ns;
     clk <= '1';wait for 15 ns;
	 enabl<='1';
	 
	 
end process;

sIM: process
begin        
   
     reset <= '1';
   wait for 15 ns;    
    reset <= '0';
   wait;
end process;
end behve;