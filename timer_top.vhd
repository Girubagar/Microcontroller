----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Girubagar P L
-- 
-- Create Date: 01/22/2019 03:01:48 PM
-- Design Name: 
-- Module Name: timer_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer_top is
  Port (   clk_in : in std_logic;
           rst : in std_logic;
           tmr_ld_value : in std_logic_vector (7 downto 0);
           tcsr : inout std_logic_vector ( 7 downto 0);
           tmr: out std_logic_vector(7 downto 0)
            );
end timer_top;

architecture Behavioral of timer_top is

signal tmr_signal : std_logic_vector(7 downto 0);
--signal tcsr_signal : std_logic_vector(2 downto 0);

--type tmr_sm is (idle, tmr_mode, ld_tmr_mode, ld_tmr_cnt);
--signal st_m : tmr_sm;



begin
tmr<=tmr_signal;
cmpt : process(clk_in,rst)
begin
     
     if(rst= '1') then
       tmr_signal<=x"00";
       tcsr<= "000";
     elsif(rising_edge(clk_in)) then
       if(tcsr(0)='0') then 
         tmr<=x"00";
       elsif(tcsr(1)='0') then
         tmr_signal <= tmr_signal + 1;
       else
         tmr_signal<= tmr_ld_value;
         tcsr(1)<= '0';
       end if;
       tcsr(2)<= tmr_signal(0) and tmr_signal(1) and tmr_signal(2) and tmr_signal(3) and tmr_signal(4) and tmr_signal(5) and tmr_signal(6) and tmr_signal(7);
     end if;
end process;
end Behavioral;
