library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RV_pkg.all;

--Entity for the RISC-V ula
entity ulaRV is
	--Define word size
	generic (WSIZE : natural := 32);
	port (
		opcode : in ULA_OPCODE; --Opcode input port
		A, B : in std_logic_vector(WSIZE-1 downto 0); --Input ports
		Z : out std_logic_vector(WSIZE-1 downto 0); --Output result port
		zero : out std_logic); --Set if Z is zero port
end ulaRV;

--Architecture for the RISC-V ula
architecture arch_RV of ulaRV is
	--Signal to receive the operations results and send to Z
	signal a32 : std_logic_vector(WSIZE-1 downto 0) := X"00000000";
begin
	Z <= a32;
process(A,B,opcode,a32)
	begin
		--Set 'zero' if 'Z' is 0
		if(unsigned(a32) = 0)
			then zero <= '1';
			else zero <= '0';
		end if;
		
		--Case with all the possible operations
		case opcode is
			when ADD_OP => a32 <= std_logic_vector(signed(A) + signed(B));
			when SUB_OP => a32 <= std_logic_vector(signed(A) - signed(B));
			when AND_OP => a32 <= A and B;
			when OR_OP => a32 <= A or B;
			when NOR_OP => a32 <= A nor B;
			when XOR_OP => a32 <= A xor B;
			when SLL_OP => a32 <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B))));
			when SRL_OP => a32 <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B))));
			when SRA_OP => a32 <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B))));
			when SLT_OP => if(signed(A) < signed(B)) then a32 <= X"00000001"; else a32 <= X"00000000"; end if;
			when SLTU_OP => if(unsigned(A) < unsigned(B)) then a32 <= X"00000001"; else a32 <= X"00000000"; end if;
			when SGE_OP => if(signed(A) >= signed(B)) then a32 <= X"00000001"; else a32 <= X"00000000"; end if;
			when SGEU_OP => if(unsigned(A) >= unsigned(B)) then a32 <= X"00000001"; else a32 <= X"00000000"; end if;
			when SEQ_OP => if(signed(A) = signed(B)) then a32 <= X"00000001"; else a32 <= X"00000000"; end if;
			when SNE_OP => if(signed(A) /= signed(B)) then a32 <= X"00000001"; else a32 <= X"00000000"; end if;
			when others => a32 <= X"00000000";
		end case;
			
end process;
end arch_RV;