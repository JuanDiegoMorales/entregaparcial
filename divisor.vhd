library ieee;
use ieee.std_logic_1164.all;

entity divisor is
port (
   clock : in std_logic;
   clock1hz : out bit);
end divisor;
architecture RTL of divisor is
   signal pulso : bit;
   signal contador : integer range 0 to 24999999 := 0;
	signal reset : bit;
   begin
      process (reset, clock)
      begin
         if (reset = '0') then
            pulso <= '0';
            contador <=0;
          elsif rising_edge (clock) then
               if (contador = 24999999) then
                  pulso <= not (pulso);
                  contador <= 0;

                else
                   contador <= contador + 1;
                end if;
              end if;
            end process;
         clock1hz <= pulso;
end RTL;