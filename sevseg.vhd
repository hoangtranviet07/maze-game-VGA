--Package statements
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevseg is 
	port(
		input : in STD_LOGIC_VECTOR(3 downto 0);
		HEX  :  out STD_LOGIC_VECTOR(0 to 6)
	);
end entity; 

architecture decoder_arch of sevseg is 
begin 
	Seven_Seg_Display : process (input)
	begin
    	case (input) is
        	when "0000" => SevenSeg <= not"1111110";
        	when "0001" => SevenSeg <= not"0110000";
        	when "0010" => SevenSeg <= not"1101101";
        	when "0011" => SevenSeg <= not"1111001";
        	when "0100" => SevenSeg <= not"0110011";
        	when "0101" => SevenSeg <= not"1011011";
        	when "0110" => SevenSeg <= not"1011111";
        	when "0111" => SevenSeg <= not"1110000";
        	when "1000" => SevenSeg <= not"1111111";
        	when "1001" => SevenSeg <= not"1111011";
        	when "1010" => SevenSeg <= not"1110111";
        	when "1011" => SevenSeg <= not"0011111";
        	when "1100" => SevenSeg <= not"0001101";
        	when "1101" => SevenSeg <= not"0111101";
        	when "1110" => SevenSeg <= not"1001111";
        	when "1111" => SevenSeg <= not"1000111";
    	end case;
	end process;
end decoder_arch; 