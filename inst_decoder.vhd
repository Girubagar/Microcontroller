----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2019 03:35:10 PM
-- Design Name: 
-- Module Name: inst_decoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inst_decoder is
  Port (  pgmem_out1 : in std_logic_vector(7 downto 0);
          pgmem_out2 : in std_logic_vector(7 downto 0);
          clk_in : in std_logic;
          rst : in std_logic;
          decode : out std_logic_vector(3 downto 0);
          rd_reg : out std_logic_vector(4 downto 0);
          rs_reg : out std_logic_vector(4 downto 0);
          val_reg : out std_logic_vector(7 downto 0)
          );
end inst_decoder;

architecture Behavioral of inst_decoder is


begin

dec : process(clk_in,rst)
begin
   
      if(rst='1') then
        decode <= x"0";
        rd_reg<= "00000";
        rs_reg<="00000";
        val_reg<=x"00";
      elsif(rising_edge(clk_in)) then
        case pgmem_out1(7 downto 5) is
         
           when "000" => 
                         decode<= x"1";
                         rd_reg<= pgmem_out1(4 downto 0);
                         rs_reg<= pgmem_out2(4 downto 0);
           when "001" => 
                         decode<= x"2";
                         rd_reg<= pgmem_out1(4 downto 0);
                         rs_reg<= pgmem_out2(4 downto 0);
           when "010" =>
                         decode<= x"3";
                         rd_reg<= pgmem_out1(4 downto 0);
                         rs_reg<= pgmem_out2(4 downto 0);
           when "011" =>
                         decode<= x"4";
                         rd_reg<= pgmem_out1(4 downto 0);
                         rs_reg<= pgmem_out2(4 downto 0);
           when "100" =>
                         decode<= x"5";
                         rd_reg<= pgmem_out1(4 downto 0);
                         rs_reg<= pgmem_out2(4 downto 0);
           when "101" =>
                         decode<= x"6";
                         rd_reg<=pgmem_out1(4 downto 0);
                         rs_reg<=pgmem_out2(4 downto 0);
           when "110" =>
                         decode<=x"7";
                         rd_reg<=pgmem_out1(4 downto 0);
                         val_reg<=pgmem_out2;
           when "111" =>
                         decode<=x"8";
                         rd_reg<=pgmem_out1(4 downto 0);
                         rs_reg<=pgmem_out2(4 downto 0);
           when others =>
                          null;
         end case;
      end if;
 end process;
        
end Behavioral;
