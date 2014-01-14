JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(EPM7064AET44) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(EP1C12Q240) Path("./") File("hello_world.rbf") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
