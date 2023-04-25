LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CONTADORASDES is 

port ( 
reset : in std_logic;
clk,enable : in std_logic;
up_down : in std_logic;
d,u: out std_logic_vector(6 downto 0)

);
end entity;

architecture Arq of CONTADORASDES is

signal contador: std_logic_vector(5 downto 0):= "100011";
signal DEC7CONTADOR: std_logic_vector(5 downto 0);
signal clock1hz: bit;

component divisor
port (
   clock : in std_logic;
   clock1hz : out bit);
end component;

begin


Mapeo : divisor port map (clock => clk, clock1hz => clock1hz);
 
process(reset,clock1hz,up_down) is
begin 

 if (reset='1') then
 contador <= "100011";
 
	 elsif(clock1hz' event and clock1hz='0')then
	 if (enable='1') then
	 if (up_down = '1')then
		  contador <= contador+1;
	 else 
		  contador <=contador-1;
		  if (contador = "000000")then
		  contador <= "100011";
		  end if;
	end if;
 end if;
end if;

END PROCESS;


DEC7CONTADOR <= std_logic_vector(contador);

 
Unidades : process (contador)begin
case (contador) is

when "000000" =>u<= "0000001";
when "000001" =>u<= "1001111";
when "000010" =>u<= "0010010";
when "000011" =>u<= "0000110";
when "000100" =>u<= "1001100";
when "000101" =>u<= "0100100";
when "000110" =>u<= "0100000";
when "000111" =>u<= "0001111";
when "001000" =>u<= "0000000";
when "001001" =>u<= "0000100";

when "001010" =>u<= "0000001";
when "001011" =>u<= "1001111";
when "001100" =>u<= "0010010";
when "001101" =>u<= "0000110";
when "001110" =>u<= "1001100";
when "001111" =>u<= "0100100";
when "010000" =>u<= "0100000";
when "010001" =>u<= "0001111";
when "010010" =>u<= "0000000";
when "010011" =>u<= "0000100";

when "010100" =>u<= "0000001";
when "010101" =>u<= "1001111";
when "010110" =>u<= "0010010";
when "010111" =>u<= "0000110";
when "011000" =>u<= "1001100";
when "011001" =>u<= "0100100";
when "011010" =>u<= "0100000";
when "011011" =>u<= "0001111";
when "011100" =>u<= "0000000";
when "011101" =>u<= "0000100";

when "011110" =>u<= "0000001";
when "011111" =>u<= "1001111";
when "100000" =>u<= "0010010";
when "100001" =>u<= "0000110";
when "100010" =>u<= "1001100";
when "100011" =>u<= "0100100";
when others =>u<= "1111111";


end case;
end process;

Decenas : process (contador)begin
case (contador) is

when "000000" =>d<= "0000001";
when "000001" =>d<= "0000001";
when "000010" =>d<= "0000001";
when "000011" =>d<= "0000001";
when "000100" =>d<= "0000001";
when "000101" =>d<= "0000001";
when "000110" =>d<= "0000001";
when "000111" =>d<= "0000001";
when "001000" =>d<= "0000001";
when "001001" =>d<= "0000001";

when "001010" =>d<= "1001111";
when "001011" =>d<= "1001111";
when "001100" =>d<= "1001111";
when "001101" =>d<= "1001111";
when "001110" =>d<= "1001111";
when "001111" =>d<= "1001111";
when "010000" =>d<= "1001111";
when "010001" =>d<= "1001111";
when "010010" =>d<= "1001111";
when "010011" =>d<= "1001111";

when "010100" =>d<= "0010010";
when "010101" =>d<= "0010010";
when "010110" =>d<= "0010010";
when "010111" =>d<= "0010010";
when "011000" =>d<= "0010010";
when "011001" =>d<= "0010010";
when "011010" =>d<= "0010010";
when "011011" =>d<= "0010010";
when "011100" =>d<= "0010010";
when "011101" =>d<= "0010010";

when "011110" =>d<= "0000110";
when "011111" =>d<= "0000110";

when "100000" =>d<= "0000110";
when "100001" =>d<= "0000110";
when "100010" =>d<= "0000110";
when "100011" =>d<= "0000110";
when others =>d<= "1111111";

end case;
end process;
END Arq;
 
 