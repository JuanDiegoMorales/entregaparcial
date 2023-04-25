library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity VEHICULOSPROXI is

  port ( parqueadero : in std_logic_vector(3 downto 0);
posicion : in std_logic_vector(2 downto 0);
clock : in std_logic;
alarm, reset: in std_logic;
fc1 : out std_logic;
decenas, unidades, numero_vehiculo : out std_logic_vector(6 downto 0)) ;

end entity;

architecture arch of VEHICULOSPROXI is

signal u1,u2,u3,u4 : std_logic_vector(6 downto 0);
signal d1,d2,d3,d4 : std_logic_vector(6 downto 0);

component CONTADORASDES
port ( 
reset : in std_logic;
clk,enable : in std_logic;
up_down : in std_logic;
d,u: out std_logic_vector(6 downto 0)

);
end component;

begin

P1 : CONTADORASDES port map (clk => clock, reset => reset, enable => parqueadero(0), up_down => alarm, u => u1, d => d1);
P2 : CONTADORASDES port map (clk => clock, reset => reset, enable => parqueadero(1), up_down => alarm, u => u2, d => d2);
P3 : CONTADORASDES port map (clk => clock, reset => reset, enable => parqueadero(2), up_down => alarm, u => u3, d => d3);
P4 : CONTADORASDES port map (clk => clock, reset => reset, enable => parqueadero(3), up_down => alarm, u => u4, d => d4);
--P6 : ContadorAs port map (clk => clock, reset => reset, enable => parqueadero(5), alarm => alarm, dbryan => u6, ebryan => d6);
--P7 : ContadorAs port map (clk => clock, reset => reset, enable => parqueadero(6), alarm => alarm, dbryan => u7, ebryan => d7);
--P8 : ContadorAs port map (clk => clock, reset => reset, enable => parqueadero(7), alarm => alarm, dbryan => u8, ebryan => d8);


 with posicion select
 unidades <= u1 when "000",
u2 when "001",
u3 when "010",
u4 when "011",
--u5 when "100",
--u6 when "101",
--u7 when "110",
--u8 when "111",
"1111111" when others;

 with posicion select
 decenas <= d1 when "000",
d2 when "001",
d3 when "010",
d4 when "011",
--d5 when "100",
--d6 when "101",
--d7 when "110",
--d8 when "111",
"1111111" when others;

 deco_vehiculos : process(posicion) is
 begin
case posicion is
when "000" =>numero_vehiculo<= "1001111";
when "001" =>numero_vehiculo<= "0010010";
when "010" =>numero_vehiculo<= "0000110";
when "011" =>numero_vehiculo<= "1001100";
--when "100" =>numero_vehiculo<= "0100100";
--when "101" =>numero_vehiculo<= "0100000";
--when "110" =>numero_vehiculo<= "0001111";
--when "111" =>numero_vehiculo<= "0000000";
when others  =>numero_vehiculo<= "1111111";
end case;
end process;

end architecture ;