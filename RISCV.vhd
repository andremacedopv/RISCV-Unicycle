library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
	entity BregRV is
		generic (WSIZE : natural := 32);
		port (
				clk, wren, rst : in std_logic;
				rs1, rs2, rd : in std_logic_vector(4 downto 0);
				data : in std_logic_vector(WSIZE-1 downto 0);
				ro1, ro2 : out std_logic_vector(WSIZE-1 downto 0)
				);
	end BregRV;
	
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
	
end RISCV_arch;