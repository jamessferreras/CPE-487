LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY furbycontrol IS
	PORT (
		data : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END furbycontrol;

ARCHITECTURE Behavioral OF furbycontrol IS     
    SIGNAL cnt : STD_LOGIC_VECTOR (28 DOWNTO 0); -- 29 bit counter

BEGIN
   Process
        Begin
            
           --tummy
            if data = "0001" then 
            seg<= "0000110";--tilt
            seg<= "1001111" after 10 ns;--ears
            seg<= "0010010" after 10 ns;--eyes
            seg<= "0000001" after 10 ns;--mouth
            seg<= "1001100" after 10 ns;--sound
           --feed
            elsif data = "0010" then
            seg<= "0010010" after 10 ns;--eyes
            seg<= "0000001" after 10 ns;--mouth
            seg<= "1001100" after 10 ns;--sound
            seg<= "1001111" after 10 ns;--ears
            seg<= "0000110" after 10 ns;--tilt
            seg<= "1001111" after 10 ns;--ears
            --back
            elsif data = "0011" then
            seg<= "0010010" after 10 ns;--eyes
            seg<= "1001111" after 10 ns;--ears
            seg<= "0000110" after 10 ns;--tilt
            seg<= "1001111" after 10 ns;--ears
            seg<= "0000001" after 10 ns;--mouth
            seg<= "1001100" after 10 ns;--sound
            --light
            elsif data = "0100" then
            seg<= "0010010" after 10 ns;--eyes
            seg<= "0000110" after 10 ns;--tilt
            seg<= "1001111" after 10 ns;--ears
            seg<= "0000110" after 10 ns;--tilt
            seg<= "0000001" after 10 ns;--mouth
            seg<= "1001100" after 10 ns;--sound
            seg<= "0010010" after 10 ns;--eyes
            else seg <= "1111111";
            end if;            
        end process;              
	anode <= "1110"; 	         
END Behavioral;