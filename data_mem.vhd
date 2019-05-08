----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Girubagar P L
-- 
-- Create Date: 01/23/2019 04:34:42 PM
-- Design Name: 
-- Module Name: data_mem - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_mem is
  Port (
         clk_in : in std_logic;
         rst : in std_logic;
         rd_reg: in std_logic_vector(4 downto 0);
         rs_reg : in std_logic_vector(4 downto 0);
         tr1data : out std_logic_vector(7 downto 0);
         tr2data : out std_logic_vector(7 downto 0);
         rd_en: in std_logic;
         wr_en : in std_logic;
         wr_data : in std_logic_vector(7 downto 0);
         mv_en : in std_logic;
         tmr_ovf : in std_logic;
         tmr : in std_logic_vector(7 downto 0);
         tcsr : inout std_logic_vector(7 downto 0);
         tmr_en : in std_logic;
         pcra : out std_logic_vector(7 downto 0);
         pcrb : out std_logic_vector(7 downto 0);
         pcrc: out std_logic_vector(7 downto 0);
         pra : inout std_logic_vector(7 downto 0);
         prb : inout std_logic_vector(7 downto 0);
         prc : inout std_logic_vector(7 downto 0)
         
         );
         
end data_mem;

architecture Behavioral of data_mem is

type dt_mem is array (0 to 31) of std_logic_vector(7 downto 0);
signal mem_arr : dt_mem := (

   x"55",x"66",x"77",x"67",
   x"99",x"dd",x"30",x"31", 
   x"00",x"00",x"00",x"09", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00"
   );

begin

mem : process(clk_in,rst)
 begin
     if(rst='1') then
       tr1data<=x"00";
       tr2data<=x"00";
     elsif(rising_edge(clk_in)) then
       if(rd_en='1') then
         tr1data <= mem_arr(to_integer(unsigned(rd_reg)));
         tr2data<= mem_arr(to_integer(unsigned(rs_reg)));
       end if;
       if(mv_en='1') then
         mem_arr(to_integer(unsigned(rd_reg)))<= mem_arr(to_integer(unsigned(rs_reg)));
       end if;
       if(wr_en='1') then
         mem_arr(to_integer(unsigned(rd_reg)))<= wr_data;
       end if;
       if( mem_arr(11)=x"00") then
         pra<= mem_arr(8);
       elsif( mem_arr(11)=x"ff") then
         mem_arr(8)<= pra;
       end if;
       if( mem_arr(12)=x"00") then
         prb<= mem_arr(9);
       elsif( mem_arr(12)=x"ff") then
         mem_arr(9)<= prb;
       end if;
       if( mem_arr(13)=x"00") then
         prc<= mem_arr(9);
       elsif( mem_arr(13)=x"ff") then
         mem_arr(10)<= prc;
       end if;
     end if;
end process;

     mem_arr(14)<= tmr;
     mem_arr(15)<= mem_arr(15)(7 downto 3) & tmr_ovf & mem_arr(15)(1 downto 0);
     tcsr<= mem_arr(15);
     
         

end Behavioral;
