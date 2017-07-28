/* Quartus Prime Version 17.0.0 Build 595 04/25/2017 SJ Standard Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Cfg)
		Device PartName(10AX115S2F45) Path("C:/intelFPGA/17.0/Braindrop/output_files/") File("braindrop.sof") MfrSpec(OpMask(1));
	P ActionCode(Ign)
		Device PartName(5M1270ZF324) MfrSpec(OpMask(0) SEC_Device(CFI_2GB) Child_OpMask(1 0));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
