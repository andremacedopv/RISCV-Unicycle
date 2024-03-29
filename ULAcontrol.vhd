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
				-- Branch type
				when "001" =>
					case funct3 is
						-- BEQ
						when "000" => ctr <= SUB_OP;
						-- BNE
						when "001" => ctr <= SUB_OP;
						-- BLT
						when "100" => ctr <= SLT_OP;
						-- BGE
						when "101" => ctr <= SLT_OP;
						-- others
						when others => ctr <= SUB_OP;
					end case; -- Branch type
				-- R-Type
				when "010" =>
					case funct3 is
						when "000" =>
							if(funct7(5) = '1')
								then ctr <= SUB_OP;
							else ctr <= ADD_OP;
							end if;
						when "001" => ctr <= SLL_OP;
						when "010" => ctr <= SLT_OP;
						when "011" => ctr <= SLTU_OP;
						when "100" => ctr <= XOR_OP;
						when "101" =>
							if(funct7(5) = '1')
								then ctr <= SRA_OP;
							else ctr <= SRL_OP;
							end if;
						when "110" => ctr <= OR_OP;
						when others => ctr <= AND_OP;
					end case; -- R-type
				-- ILA Type - "011"
				when "011" =>
					case funct3 is
						when "000" => ctr <= ADD_OP;
						when "001" => ctr <= SLL_OP;
						when "010" => ctr <= SLT_OP;
						when "011" => ctr <= SLTU_OP;
						when "100" => ctr <= XOR_OP;
						when "101" =>
							if(funct7(5) = '1')
								then ctr <= SRA_OP;
							else ctr <= SRL_OP;
							end if;
						when "110" => ctr <= OR_OP;
						when others => ctr <= AND_OP;
					end case; -- ILA-type
				-- Other types
				when others => ctr <= OR_OP;
			end case; -- ALUOp
		end process;
end ULAcontrol_arch;