library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BRANCHcontrol is 
	port(funct3 : in std_logic_vector(2 downto 0);
		  zeroUla : in std_logic;
		  MakeBranch : out std_logic);
end BRANCHcontrol;

architecture BRANCHcontrol_arch of BRANCHcontrol is
	signal ctr : std_logic;
	begin
		MakeBranch <= ctr;
		process(funct3, zeroUla)
		begin
			case funct3 is
				-- BEQ
				when "000" => ctr <= zeroUla;
				-- BNE
				when "001" => ctr <= not zeroUla;
				-- BLT
				when "100" => ctr <= not zeroUla;
				-- BGE
				when "101" => ctr <= zeroUla;
				-- others
				when others => ctr <= zeroUla;
			end case; -- ALUOp
		end process;
end BRANCHcontrol_arch;