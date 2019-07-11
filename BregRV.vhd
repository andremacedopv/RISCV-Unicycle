library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BregRV is
	generic (WSIZE : natural := 32);
	port (
			clk, wren, rst : in std_logic;
			rs1, rs2, rd : in std_logic_vector(4 downto 0);
			data : in std_logic_vector(WSIZE-1 downto 0);
			ro1, ro2 : out std_logic_vector(WSIZE-1 downto 0)
			);
end BregRV;

architecture arch_BregRV of BregRV is
	type breg_type is array (0 to 31) of std_logic_vector(31 downto 0);
	signal breg : breg_type := (X"00000000", X"00000000", X"00000000", X"00000000", X"00000000",
										 X"00000000", X"00000000", X"00000000", X"00000000", X"00000000",
										 X"00000000", X"00000000", X"00000000", X"00000000", X"00000000",
										 X"00000000", X"00000000", X"00000000", X"00000000", X"00000000",
										 X"00000000", X"00000000", X"00000000", X"00000000", X"00000000",
										 X"00000000", X"00000000", X"00000000", X"00000000", X"00000000",
										 X"00000000", X"00000000");
	signal out1, out2 : std_logic_vector(WSIZE-1 downto 0) := X"00000000";
begin
	ro1 <= out1;
	ro2 <= out2;
	bregProc : process(clk,wren,rst,rs1,rs2,rd,data)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				for i in 0 to 31 loop
					breg(i) <= X"00000000";
				end loop;
			elsif (wren = '1') then
				breg(to_integer(unsigned(rd))) <= data;
			end if;
			--out1 <= breg(to_integer(unsigned(rs1)));
			--out2 <= breg(to_integer(unsigned(rs2)));
		end if;
		out1 <= breg(to_integer(unsigned(rs1)));
		out2 <= breg(to_integer(unsigned(rs2)));
		breg(0) <= X"00000000";
	end process;
end arch_BregRV;