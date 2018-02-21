script "beefy_counter.ash";
import "beefy_SRLightsOut.ash";


boolean main(string name, int remain)
{
	
	switch(name)
	{
		case "Spookyraven Lights Out":
			if(remain == 0)
			{
				DoLightsOut();
			}
		return true;
	}
	return false;
}