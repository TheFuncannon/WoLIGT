state("WizardOfLegend")
{
	float gameTime: "mono.dll", 0x002655E0, 0x28, 0xD8, 0xA0, 0x230, 0x90;
	float floorTime: "mono.dll", 0x002655E0, 0x28, 0xD8, 0xA0, 0x230, 0x88;
	bool inGame: "mono.dll", 0x002655D8, 0x0, 0xA0, 0x230, 0xE8, 0x28;
}

init
{
	vars.canSplit = 0;
}

start
{
	return (current.gameTime < 1 && current.gameTime > 0.05);
}

reset
{
	if(!current.inGame || (current.gameTime < old.gameTime) 
	{
    		vars.canSplit = 0;
    		return true;
	}
}

split
{
	if (old.gameTime != 0.0 && current.gameTime != 0.0 && old.floorTime > current.floorTime) {
		vars.canSplit = 1;
	}
	if (vars.canSplit == 1 && current.gameTime > old.gameTime)
	{
		vars.canSplit = 2;	
	}
	if (vars.canSplit == 2 && current.gameTime == old.gameTime)
	{
		vars.canSplit = 3;	
	}
	if (vars.canSplit == 3 && current.gameTime > old.gameTime)
	{
		vars.canSplit = 0;
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



