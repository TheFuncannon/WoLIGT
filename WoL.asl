state("WizardOfLegend")
{
	float gameTime: "mono.dll", 0x002655E0, 0x28, 0xD8, 0xA0, 0x230, 0x90;
	float floorTime: "mono.dll", 0x002655E0, 0x28, 0xD8, 0xA0, 0x230, 0x88;
	bool inGame: "WizardOfLegend.exe", 0x014550C8, 0x0, 0x8, 0x3A8, 0x1B0, 0x28;
}

start
{
	return (current.gameTime < 1 && current.gameTime > 0.05);
}

reset
{
	return (current.gameTime < 0.05);
}

split
{
	if (old.gameTime != 0 && current.gameTime != 0 && old.floorTime > current.floorTime && current.inGame) {
		return true;
	}
}

isLoading
{
	return true;
}

gameTime
{
	return TimeSpan.FromSeconds(current.gameTime);
}
