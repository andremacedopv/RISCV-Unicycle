library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RVfmt_pkg.all;

entity genImm32 is 
	port(instr : in std_logic_vector(31 downto 0);
		  imm32 : out signed(31 downto 0) );
end genImm32;

architecture arch_genImm of genImm32 is
	signal opcode : std_logic_vector(7 downto 0);
	signal fmtType : FORMAT_RV;
	signal a32 : std_logic_vector(31 downto 0);
begin
	imm32 <= signed(a32);
	opcode <= '0' & instr(6 downto 0);
	process(instr,opcode,fmtType, a32)
	begin	
		--Get instruction type--
		if opcode = X"33" then fmtType <= R_type;
		elsif opcode = X"03" then fmtType <= I_type;
		elsif opcode = X"13" then fmtType <= I_type;
		elsif opcode = X"67" then fmtType <= I_type;
		elsif opcode = X"23" then fmtType <= S_type;
		elsif opcode = X"63" then fmtType <= SB_type;
		elsif opcode = X"37" then fmtType <= U_type;
		elsif opcode = X"6F" then fmtType <= UJ_type;
		end if;
		
		--Get immediate--
		case fmtType is
			--R_type
			when R_type => a32 <= X"00000000";
			--I_type
			when I_type => 
				case instr(14 downto 12) is
					when "001" | "101" =>
						a32 <= X"000000" & "000" & instr(19 downto 15);
					when others =>
						if (instr(31) = '0') 
							then 
								a32 <= X"00000" & instr(31 downto 20);
						else 
							a32 <= X"FFFFF" & instr(31 downto 20);
						end if;
				end case;
			--S_type
			when S_type => 
				if (instr(31) = '0')
					then 
						a32 <= X"00000" & instr(31 downto 25) & instr(11 downto 7);
				else 
					a32 <= X"FFFFF" & instr(31 downto 25) & instr(11 downto 7);
				end if;
			--SB_type
			when SB_type => 
			if (instr(31) = '0') 
				then 
					a32 <= X"0000" & "000" & instr(31) & instr(7) & instr(30 downto 25) & instr(11 downto 8) & '0';
				else
					a32 <= X"FFFF" & "111" & instr(31) & instr(7) & instr(30 downto 25) & instr(11 downto 8) & '0';
				end if;
			--UJ_type
			when UJ_type => 
			if (instr(31) = '0') 
				then 
					a32 <= X"00" & "000" & instr(31) & instr(19 downto 12) & instr(20) & instr(30 downto 21) & '0';
				else 
					a32 <= X"FF" & "111" & instr(31) & instr(19 downto 12) & instr(20) & instr(30 downto 21) & '0';
				end if;
			--U_type
			when U_type => a32 <= instr(31 downto 12) & X"000";
		end case;
		
	end process;
end arch_genImm;
			
			