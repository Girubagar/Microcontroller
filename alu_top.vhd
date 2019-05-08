----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Girubagar P L
-- 
-- Create Date: 01/22/2019 11:01:07 AM
-- Design Name: 
-- Module Name: alu_top - Behavioral
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
-- the below resources are for the alu implementation without optimization
--LUT	16	53200	0.030075189
--FF	8	106400	0.01
--IO	29	200	14.5
--BUFG	1	32	3.125

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_top is
  Port ( tr1data, tr2data : in std_logic_vector(7 downto 0);
         al_ss : in std_logic_vector(2 downto 0);
         alu_out: out std_logic_vector(7 downto 0);
         clk_in : in std_logic;
         rst : in std_logic;
         en_add : in std_logic;
         en_sub : in std_logic;
         en_and : in std_logic;
         en_or : in std_logic;
         en_xor : in std_logic;
         en_not : in std_logic
         );
         
end alu_top;

architecture Behavioral of alu_top is
 signal alu_out_signal : std_logic_vector(7 downto 0);
-- signal tr1data_signal_add : std_logic_vector(7 downto 0);
-- signal tr2data_signal_add : std_logic_vector(7 downto 0);
-- signal tr1data_signal_sub : std_logic_vector(7 downto 0);
-- signal tr2data_signal_sub : std_logic_vector(7 downto 0);
-- signal tr1data_signal_and : std_logic_vector(7 downto 0);
-- signal tr2data_signal_and : std_logic_vector(7 downto 0);
-- signal tr1data_signal_or : std_logic_vector(7 downto 0);
-- signal tr2data_signal_or : std_logic_vector(7 downto 0);
-- signal tr1data_signal_xor : std_logic_vector(7 downto 0);
-- signal tr2data_signal_xor : std_logic_vector(7 downto 0);
-- signal tr1data_signal_not : std_logic_vector(7 downto 0);

begin
 alu_out <= alu_out_signal;
calc : process(clk_in,rst)
 begin
     if(rst = '1') then
       alu_out_signal <= x"00";
     elsif(rising_edge(clk_in)) then
          --if(( not(al_ss(0)) and not(al_ss(1)) and not(al_ss(2))) = '1') then
           --alu_out_signal <= tr1data + tr2data;
          --elsif( (not (al_ss(0)) and not (al_ss(1)) and al_ss(2)) = '1') then
           --alu_out_signal <= tr1data - tr2data;
          --elsif( (not (al_ss(0)) and al_ss(1) and not (al_ss(2))) = '1') then
           --alu_out_signal <= tr1data and tr2data;
          --elsif( (not (al_ss(0)) and al_ss(1) and al_ss(2)) = '1') then
           --alu_out_signal <= tr1data or tr2data;
          --elsif( ( al_ss(0) and not (al_ss(1)) and not(al_ss(2))) = '1') then
           --alu_out_signal <= tr1data xor tr2data;
          --elsif( ( (al_ss(0)) and not (al_ss(1)) and al_ss(2)) = '1') then   
           --alu_out_signal <= not(tr1data);
          --else
           --alu_out_signal <= alu_out_signal;
          --end if;
      
--          if(en_add = '1') then
--              tr1data_signal_add <= tr1data;
--              tr2data_signal_add <= tr2data;
--          elsif(en_sub = '1') then
--              tr1data_signal_sub<= tr1data;
--              tr2data_signal_sub <= tr2data;
--          elsif(en_and = '1') then
--              tr1data_signal_and<= tr1data;
--              tr2data_signal_and <= tr2data;
--          elsif(en_or = '1') then
--              tr1data_signal_or<= tr1data;
--              tr2data_signal_or <= tr2data;
--          elsif(en_xor = '1') then
--              tr1data_signal_xor<= tr1data;
--              tr2data_signal_xor <= tr2data;
--          elsif(en_not = '1') then
--              tr1data_signal_not<= tr1data;
--          end if;
                            
          case al_ss is
              when "000" => 
                              --alu_out_signal <= tr1data_signal_add+tr2data_signal_add;
                              if(en_add='1') then
                               alu_out_signal <= tr1data + tr2data;
                              else 
                                null;
                              end if;
                            
              when "001" => 
                             -- alu_out_signal <= tr1data_signal_sub-tr2data_signal_sub;
                              if(en_sub='1') then
                                alu_out_signal <= tr1data - tr2data;
                              else
                                null;
                              end if;
              when "010" => 
                              --alu_out_signal <= tr1data_signal_and and tr2data_signal_and;
                              if(en_add='1') then
                                alu_out_signal <= tr1data and tr2data;
                              else
                                null;
                              end if;
              when "011" => 
                             -- alu_out_signal <= tr1data_signal_or or tr2data_signal_or;
                              if(en_or='1') then
                                alu_out_signal <= tr1data or tr2data;
                              else 
                                null;
                              end if;
              when "100" => 
                              --alu_out_signal <= tr1data_signal_xor xor tr2data_signal_xor;
                              if(en_xor='1') then
                                alu_out_signal <= tr1data xor tr2data;
                              else
                                null;
                              end if;
              when "101" => 
                              --alu_out_signal <= not(tr1data_signal_not);
                              if(en_not='1') then
                                alu_out_signal <= not(tr1data);
                              else
                                null;
                              end if;
              when others => alu_out_signal <= x"00";
          end case;
     end if;
 end process;
 
end Behavioral;
