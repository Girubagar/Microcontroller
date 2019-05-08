----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2019 09:55:25 AM
-- Design Name: 
-- Module Name: pc - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc is
   Port (
          done : in std_logic;
          addr : out std_logic_vector(7 downto 0);
          clk_in : in std_logic;
          rst : in std_logic
         );
end pc;

architecture Behavioral of pc is

signal addr_signal : std_logic_vector(7 downto 0);

begin

count : process(clk_in,rst)
begin

  if(rst='1') then
   addr_signal<=x"00";
  elsif(rising_edge(clk_in)) then
    if(done='1') then
      addr_signal<= addr_signal+2;
    elsif(done='0') then
      addr_signal<= addr_signal;
    end if;
  end if;
  
--addr<= addr_signal;
end process;

addr<= addr_signal;


end Behavioral;
