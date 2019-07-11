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
		  ALUOp : out std_logic_vector(2 downto 0);
		  Jal : out std_logic;
		  Jalr : out std_logic);
end RVcontrol;

architecture RVcontrol_arhc of RVcontrol is
	-- Out Signals
	signal branchS : std_logic := '0';
	signal MemReadS : std_logic := '0';
	signal MemtoRegS : std_logic_vector(1 downto 0) := "00"; 
	signal MemWriteS : std_logic := '0';
	signal ALUSrcS : std_logic := '0';
	signal RegWriteS : std_logic := '0';
	signal ALUOpS : std_logic_vector(2 downto 0) := "000";
	signal JalS : std_logic := '0';
	signal JalrS : std_logic := '0';
	
	begin
		branch <= branchS;
		MemRead <= MemReadS;
		MemtoReg <= MemtoRegS;
		MemWrite <= MemWriteS;
		ALUSrc <= ALUSrcS;
		RegWrite <= RegWriteS;
		ALUOp <= ALUOpS;
		Jal <= JalS;
		Jalr <= JalrS;
		process(opcode)
		begin
			case opcode is
				-- R-Type (0x33)
				when "0110011" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "010";
					JalS <= '0';
					JalrS <= '0';
				-- Load Upper Immediate (0x37)
				when "0110111" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "11";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "000";
					JalS <= '0';
					JalrS <= '0';
				-- Load Type (0x03)
				when "0000011" =>
					branchS <= '0';
					MemReadS <= '1';
					MemtoRegS <= "01";
					MemWriteS <= '0';
					ALUSrcS <= '1';
					RegWriteS <= '1';
					ALUOpS <= "000";
					JalS <= '0';
					JalrS <= '0';
				-- Branch Conditional Type (0x63)
				when "1100011" =>
					branchS <= '1';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "001";
					JalS <= '0';
					JalrS <= '0';
				-- JAL (0x6F)
				when "1101111" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "10";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "000";
					JalS <= '1';
					JalrS <= '0';
				-- JALR (0x67)
				when "1100111" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "10";
					MemWriteS <= '0';
					ALUSrcS <= '1';
					RegWriteS <= '1';
					ALUOpS <= "000"; -- Jalr
					JalS <= '0';
					JalrS <= '1';
				-- Store Type (0x23)
				when "0100011" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '1';
					ALUSrcS <= '1';
					RegWriteS <= '0';
					ALUOpS <= "000";
					JalS <= '0';
					JalrS <= '0';
				-- ILA Type (0x13)
				when  "0010011" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '1';
					RegWriteS <= '1';
					ALUOpS <= "011";
					JalS <= '0';
					JalrS <= '0';
				-- Para intruções que não existem
				when others =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '0';
					ALUOpS <= "000";
					JalS <= '0';
					JalrS <= '0';
			end case;
		end process;
end RVcontrol_arhc;