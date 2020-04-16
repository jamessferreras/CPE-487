library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity leddec is
 Port ( dig : in STD_LOGIC_VECTOR (1 downto 0);
        data : in STD_LOGIC_VECTOR (3 downto 0);
        anode: out STD_LOGIC_VECTOR (3 downto 0);
        seg : out STD_LOGIC_VECTOR (6 downto 0));
end leddec;

architecture Behavioral of leddec is
begin

-- Turn on segments corresponding to 4-bit data word
    seg <= "0000001" when data="0000" else --0
        "1001111" when data="0001" else --1
        "0010010" when data="0010" else --2
        "0000110" when data="0011" else --3
        "1001100" when data="0100" else --4
        "0100100" when data="0101" else --5
        "0100000" when data="0110" else --6
        "0001111" when data="0111" else --7
        "0000000" when data="1000" else --8
        "0000100" when data="1001" else --9
        "0001000" when data="1010" else --A
        "1100000" when data="1011" else --B
        "0110001" when data="1100" else --C
        "1000010" when data="1101" else --D
        "0110000" when data="1110" else --E
        "0111000" when data="1111" else --F
        "1111111";
        
       -- Turn on anode of 7-segment display addressed by 2-bit digit selector dig
       anode    <=  "1110" when dig="00" else --0
                    "1101" when dig="01" else --1
                    "1011" when dig="10" else --2
                    "0111" when dig="11" else --3
                    "1111";
end Behavioral;