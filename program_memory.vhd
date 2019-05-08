----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Girubagar P L
-- 
-- Create Date: 01/23/2019 02:30:59 PM
-- Design Name: 
-- Module Name: program_memory - Behavioral
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
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

entity program_memory is
port(
      addr : in std_logic_vector(7 downto 0);
      rd_en : in std_logic;
      pgmem_out1 : out std_logic_vector(7 downto 0);
      pgmem_out2 : out std_logic_vector(7 downto 0);
      clk_in : in std_logic;
      rst : in std_logic
      
);
end program_memory;

architecture Behavioral of program_memory is

type pgmem_array is array (0 to 255 ) of std_logic_vector (7 downto 0);

signal pgmem_op: pgmem_array :=(
   x"55",x"66",x"77",x"67",
   x"99",x"dd",x"30",x"31", 
   x"00",x"00",x"00",x"09", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"55",x"66",x"77",x"67", 
   x"99",x"dd",x"30",x"31", 
   x"00",x"00",x"00",x"09", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00"
   ); 
begin

rdout_proc : process(clk_in,rst)

begin
   if(rst='1') then
       pgmem_out1<=x"00";
       pgmem_out2<=x"00";
   elsif(rising_edge(clk_in)) then
     if(rd_en='1') then
       pgmem_out1<= pgmem_op(to_integer(unsigned(addr)));
       pgmem_out2<= pgmem_op(to_integer(unsigned(addr+'1')));
     else
       null;
     end if;
   end if;
end process;
end Behavioral;
