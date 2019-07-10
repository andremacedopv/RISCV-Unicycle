library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RV_pkg.all;

entity RISCV_tb is
	generic (WSIZE : natural := 32);
end RISCV_tb;

architecture RISCV_tb_arch of RISCV_tb is
	--signals
	signal clock : std_logic := '1';
	signal branchOUT, MemReadOUT, MemWriteOUT, ALUSrcOUT, RegWriteOUT : std_logic;
	signal MemToRegOUT : std_logic_vector(1 downto 0);
	signal ALUOpOUT : std_logic_vector(2 downto 0);
	signal ALUSelectOUT : ULA_OPCODE;
	signal PCout : std_LOGIC_VECTOR(31 downto 0);
	signal instrOut : std_LOGIC_VECTOR(31 downto 0);
	constant clock_period : time := 20 ns;
	
	--Declaration of component
	component RISCV is
		port(clock : in std_logic;
			  branchOUT, MemReadOUT, MemWriteOUT, ALUSrcOUT, RegWriteOUT : out std_logic;
			  MemToRegOUT : out std_logic_vector(1 downto 0);
			  ALUOpOUT : out std_logic_vector(2 downto 0);
			  ALUSelectOUT : out ULA_OPCODE;
			  PCout : out std_LOGIC_VECTOR(31 downto 0);
			  instrOut : out std_LOGIC_VECTOR(31 downto 0));
	end component;
	
--begin architecture
begin
	riscv_tb : RISCV
	port map (
				clock => clock,
				branchOUT => branchOUT,
				MemReadOUT => MemReadOUT,
				MemWriteOUT => MemWriteOUT,
				ALUSrcOUT => ALUSrcOUT,
				RegWriteOUT => RegWriteOUT,
				MemToRegOUT => MemToRegOUT,
				ALUOpOUT => ALUOpOUT,
				ALUSelectOUT => ALUSelectOUT,
				PCout => PCout,
				instrOut => instrOut
	);
	
	clk : process
	begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
	end process;
	
	init : process
	begin
		wait for clock_period*6;
		wait;
	end process;
end RISCV_tb_arch;