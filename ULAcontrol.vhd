library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RV_pkg.all;

entity ULAcontrol is 
	port(ALUOp : in std_logic_vector(2 downto 0);
		  funct7 : in std_logic_vector(6 downto 0);
		  funct3 : in std_logic_vector(2 downto 0);
		  aluctr : out ULA_OPCODE);
end ULAcontrol;

architecture ULAcontrol_arch of ULAcontrol is
	signal ctr : ULA_OPCODE;
	begin
		aluctr <= ctr;
		process(ALUOp, funct3, funct7)
		begin
			case ALUOp is
				-- Load, Store
				when "000" => ctr <= ADD_OP;
				-- BEQ, BNE
				when "001" => ctr <= SUB_OP;
				-- R-Type
				when "010" =>
					case funct3 is
						when "000" =>
							if(funct7(5)) = '1')
								then ctr <= SUB_OP;
							else ctr <= ADD_OP;
							end if;
						when "001" => ctr <= SLL_OP;
						when "010" => ctr <= SLT_OP;
						when "011" => ctr <= SLTU_OP;
						when "100" => ctr <= XOR_OP;
						when "101" =>
							if(funct7(5)) = '1')
								then ctr <= SRA_OP;
							else ctr <= SRL_OP;
							end if;
						when "110" => ctr <= OR_OP;
						when "111" => ctr <= AND_OP;
				-- ILA Type
				when "011" =>
					case funct3 is
						when "000" => ctr <= ADD_OP;
						when "001" => ctr <= SLL_OP;
						when "010" => ctr <= SLT_OP;
						when "011" => ctr <= SLTU_OP;
						when "100" => ctr <= XOR_OP;
						when "101" =>
							if(funct7(5)) = '1')
								then ctr <= SRA_OP;
							else ctr <= SRL_OP;
							end if;
						when "110" => ctr <= OR_OP;
						when "111" => ctr <= AND_OP;
end ULAcontrol_arch;