//Originally created by TheFuncannon
//Updated by sillypears

state("WizardOfLegend")
{
	float gameTime: "mono.dll", 0x002655E0, 0x28, 0xD8, 0xA0, 0x230, 0x90;
	float floorTime: "mono.dll", 0x002655E0, 0x28, 0xD8, 0xA0, 0x230, 0x88;

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
	if (old.gameTime != 0 && current.gameTime != 0 && old.floorTime == 0.0 && old.floorTime != current.floorTime) {
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
