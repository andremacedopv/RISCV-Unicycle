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
	signal ALUOpS : std_logic_vector(2 downto 0));
	
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
				-- R-Type
				when X"33" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "010";
				-- Load Upper Immediate
				when X"37" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "10";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "000";
				-- Load Type
				when X"03" =>
					branchS <= '0';
					MemReadS <= '1';
					MemtoRegS <= "01";
					MemWriteS <= '0';
					ALUSrcS <= '1';
					RegWriteS <= '1';
					ALUOpS <= "000";
				-- Branch Conditional Type
				when X"63" =>
					branchS <= '1';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "001";
				-- JAL
				when X"6F" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "010";
				-- JALR
				when X"67" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '0';
					RegWriteS <= '1';
					ALUOpS <= "010";
				-- Store Type
				when X"23" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '1';
					ALUSrcS <= '1';
					RegWriteS <= '0';
					ALUOpS <= "000";
				-- ILA Type
				when X"13" =>
					branchS <= '0';
					MemReadS <= '0';
					MemtoRegS <= "00";
					MemWriteS <= '0';
					ALUSrcS <= '1';
					RegWriteS <= '1';
					ALUOpS <= "011";
				
	
end RVcontrol_arhc;