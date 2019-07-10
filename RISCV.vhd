library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RV_pkg.all;

entity RISCV is
	port(clock : in std_logic;
		  branchOUT, MemReadOUT, MemWriteOUT, ALUSrcOUT, RegWriteOUT : out std_logic;
		  MemToRegOUT : out std_logic_vector(1 downto 0);
		  ALUOpOUT : out std_logic_vector(2 downto 0);
		  ALUSelectOUT : out ULA_OPCODE;
		  PCout : out std_LOGIC_VECTOR(7 downto 0);
		  instrOut : out std_LOGIC_VECTOR(31 downto 0));
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
	
	-- Component of ALUcontrol
	component ULAcontrol is 
	port(ALUOp : in std_logic_vector(2 downto 0);
		  funct7 : in std_logic_vector(6 downto 0);
		  funct3 : in std_logic_vector(2 downto 0);
		  aluctr : out ULA_OPCODE);
	end component;
	
	-- Component of RVcontrol
	component RVcontrol is 
	port(opcode : in std_logic_vector(6 downto 0);
		  branch : out std_logic;
		  MemRead : out std_logic;
		  MemtoReg : out std_logic_vector(1 downto 0); 
		  MemWrite : out std_logic;
		  ALUSrc : out std_logic;
		  RegWrite : out std_logic;
		  ALUOp : out std_logic_vector(2 downto 0));
	end component;

	-- SIGNALS
	-- instruction
	signal instruction : std_logic_vector(31 downto 0) := X"00000000";
	-- PC
	signal pc : std_logic_vector(7 downto 0) := "00000000";
	-- control signals
	signal branch, MemRead, MemWrite, ALUSrc, RegWrite : std_logic;
	signal MemToReg : std_logic_vector(1 downto 0);
	signal ALUOp : std_logic_vector(2 downto 0);
	signal ALUSelect : ULA_OPCODE;
	-- immediate
	signal imm : signed(31 downto 0);
	-- opcode
	signal opcode : std_logic_vector(6 downto 0);
	-- functs
	signal funct3 : std_logic_vector(2 downto 0);
	signal funct7 : std_logic_vector(6 downto 0);
	-- registers bank
	signal rs1, rs2, rd : std_logic_vector(4 downto 0);
	signal bregA, bregB : std_logic_vector(31 downto 0);
	-- ALU result
	signal ALURes : std_logic_vector(31 downto 0);
	signal ALUZero : std_logic;
	-- Muxes signals
	signal MuxPC : std_logic_vector(7 downto 0);
	signal MuxUlaMem, MuxBUla : std_logic_vector(31 downto 0);
	-- Memory signals
	signal dataMemRed : std_logic_vector(31 downto 0);
	-- signals for riscv top adders and multiplexers
	signal PCplus4, PCplusOffset: std_logic_vector(7 downto 0);
	signal CondBranch : std_logic;

	begin
	-- PC register
	PC_proc: process(clock)
	begin
		if(rising_edge(clock)) then
			pc <= MuxPC;
		end if;
	end process;

	-- Port maps of the components

	-- Instruction memory
	INST_MEM: ins_RAM
	port map(address => pc,
				clock => clock,
				data => X"00000000",
				wren => '0',
				q => instruction);
	
	-- Signals for register addressing
	rs1 <= instruction(19 downto 15);
	rs2 <= instruction(24 downto 20);
	rd <= instruction(11 downto 7);
	
	-- Registers bank
	BREGISTERS: BregRV
	port map(clk => clock,
				wren => RegWrite,
				rst => '0',
				rs1 => rs1,
				rs2 => rs2,
				rd => rd,
				data => MuxUlaMem,
				ro1 => bregA,
				ro2 => bregB);
	
	-- Immediate generator
	IMMGEN: genImm32
	port map(instr => instruction,
				imm32 => imm);
				
	-- Mux of the second ALU operator
	with AluSrc select
	MuxBUla <= bregB when '0',
				  std_logic_vector(imm) when others;
	
	-- Functs signals
	funct3 <= instruction(14 downto 12);
	funct7 <= instruction(31 downto 25);
	
	-- ALU control port map
	ALUCTRL: ULAcontrol
	port map(ALUOp => ALUOp,
				funct7 => funct7,
				funct3 => funct3,
				aluctr => ALUSelect);
				
	-- extracting the opcode
	opcode <= instruction(6 downto 0);
	
	-- RISCV control
	RVCTRL: RVcontrol
	port map(opcode => opcode,
				branch => branch,
				MemRead => MemRead,
				MemtoReg => MemToReg,
				MemWrite => MemWrite,
				ALUSrc => ALUSrc,
				RegWrite => RegWrite,
				ALUOp => ALUOp);
	
	-- ULA or ALU, you choose, I don't care
	ULAorALU: ulaRV
	port map(opcode => ALUSelect,
				A => bregA,
				B => MuxBUla,
				Z => AluRes,
				zero => AluZero);
	
	-- Data memory port map
	DATARAM: Data_RAM
	port map(address => AluRes(7 downto 0),
				clock => clock,
				data => bregB,
				wren => MemWrite,
				q => dataMemRed);
	
	-- Making the ALU/MEM multiplexer
	with MemToReg select
	MuxUlaMem <= dataMemRed when "01",
					 AluRes when others;
					 
	-- Essa parte ainda não está atualizada
	-- com os jumps e branches

	-- PC + 4 adder
	PCplus4 <= std_logic_vector(signed(pc) + 4);
	-- PC + offset adder
	PCplusOffset <= std_logic_vector(signed(pc) + signed( imm(7 downto 0) ));
	-- condition for branch
	condBranch <= branch and AluZero;
	
	-- Multiplexer for next PC
	with condBranch select
	MuxPC <= PCplus4 when '0',
				PCplusOffset when others;
	
	-- out signals for test
	branchOUT <= branch;
	MemReadOUT <= MemRead;
	MemWriteOUT <= MemWrite;
	ALUSrcOUT <= ALUSrc;
	RegWriteOUT <= RegWrite;
	MemToRegOUT <= MemToReg;
	ALUOpOUT <= ALUOp;
	ALUSelectOUT <= ALUSelect;
	PCout <= pc;
	instrOut <= instruction;
	
end RISCV_arch;