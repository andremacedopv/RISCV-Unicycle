library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RVcontrol is 
	port(opcode : in std_logic_vector(6 downto 0);
		  branch : out std_logic;
		  MemRead : out std_logic;
		  MemtoReg : out std_logic_vector(1 downto 0); 
		  MemWrite : out std_logic;
		  ALUSrc : out std_logic;
		  RegWrite : out std_logic;
		  ALUOp : out std_logic_vector(2 downto 0));
end RVcontrol;

architecture RVcontrol_arhc of RVcontrol is
	-- Out Signals
	signal branchS : std_logic;
	signal MemReadS : std_logic;
	signal MemtoRegS : std_logic_vector(1 downto 0); 
	signal MemWriteS : std_logic;
	signal ALUSrcS : std_logic;
	signal RegWriteS : std_logic;
	signal ALUOpS : std_logic_vector(2 downto 0);
	
	begin
		branch <= branchS;
		MemRead <= MemReadS;
		MemtoReg <= MemtoRegS;
		MemWrite <= MemWriteS;
		ALUSrc <= ALUSrcS;
		RegWrite <= RegWriteS;
		ALUOp <= ALUOpS;
		process(opcode)
		begin
			case opcode is
				-- R-Type (0x33)
				when "011" & X"3" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "010";
				-- Load Upper Immediate (0x37)
				when "011" & X"7" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "10";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "000";
				-- Load Type (0x03)
				when "000" & X"3" =>
					branchS <= '0';
					MemReadS <= '1';
					MemtoRegS <= "01";
					MemWriteS <= '0';
					ALUSrcS <= '1';
					RegWriteS <= '1';
					ALUOpS <= "000";
				-- Branch Conditional Type (0x63)
				when "110" & X"3" =>
					branchS <= '1';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "001";
				-- JAL (0x6F)
				when "110" & X"F" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "010";
				-- JALR (0x67)
				when "110" & X"7" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "010";
				-- Store Type (0x23)
				when "010" & X"3" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '1';
					ALUSrcS <= '1';
					RegWriteS <= '0';
					ALUOpS <= "000";
				-- ILA Type (0x13)
				-- escrever depois "001" & X"3" no lugar do "others"
				when  others =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '1';
					RegWriteS <= '1';
					ALUOpS <= "011";
			end case;
		end process;
end RVcontrol_arhc;