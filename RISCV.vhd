library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RV_pkg.all;

entity RISCV is 
end RISCV;

architecture RISCV_arch of RISCV is 

	-- Component of immediate generator
	component genImm32 is 
		port(instr : in std_logic_vector(31 downto 0);
			  imm32 : out signed(31 downto 0) );
	end component;
	
	-- Component of ULA
	component ulaRV is
		--Define word size
		generic (WSIZE : natural := 32);
		port (
			opcode : in ULA_OPCODE; --Opcode input port
			A, B : in std_logic_vector(WSIZE-1 downto 0); --Input ports
			Z : out std_logic_vector(WSIZE-1 downto 0); --Output result port
			zero : out std_logic); --Set if Z is zero port
	end component;
	
	-- Component of register bank
	component BregRV is
		generic (WSIZE : natural := 32);
		port (
				clk, wren, rst : in std_logic;
				rs1, rs2, rd : in std_logic_vector(4 downto 0);
				data : in std_logic_vector(WSIZE-1 downto 0);
				ro1, ro2 : out std_logic_vector(WSIZE-1 downto 0)
				);
	end component;
	
	-- Component of data memory
	component ins_RAM IS
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	END component;
	
	-- Component of instruction memory
	component Data_RAM IS
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	END component;

	-- SIGNALS
	-- instruction
	signal instr : std_logic_vector(31 downto 0);
	-- PC
	signal pc : std_logic_vector(7 downto 0);
	-- control signals
	signal branch, MemRead, MemToRead, MemWrite, ALUSrc, RegWrite : std_logic;
	signal ALUOp : std_logic_vector(2 downto 0);
	signal ALUSelect : ULA_OPCODE;
	-- immediate
	signal imm : std_logic_vector(31 downto 0);
	-- registers
	signal rs1, rs2, rd : std_logic(31 downto 0);
	-- ALU result
	signal ALURes : std_logic_vector(31 downto 0);
	signal ALUZero : std_logic;


	
end RISCV_arch;