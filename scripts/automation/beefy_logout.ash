import "beefy_tools.ash";
import "safeguard.ash";

void GotOde()
{
	effect booze_effect = to_effect(71); // ode to booze effect
	skill booze_skill = to_skill(6014); // ode to booze skill
	if(have_skill(booze_skill) && have_effect(booze_effect) < 3)
	{
		use_skill(booze_skill);
	}

}

void main()
{
	string stewname = "stewbeef";
	
	
	if(my_name() == "stewbeef")
	{
		cli_execute("call do_pvp.ash");
		maximize("5 adventures, pvp fights",false);
	}
	else
	{
		cli_execute("call do_pvp.ash");
		maximize("5 adventures, pvp fights",false);
	}
	if(is_pvp_stealable())
	{
		sg_closet_items();
	}
	//cli_execute("cleanup");
	sg_junk_items();
	
	if(my_name().to_lower_case() == stewname)
	{
		print("goodbye Mr. Beefs");
	}
	else
	{
		GotOde();
		if(inebriety_limit() - my_inebriety() == 2)
		{
			drink(1,"bottle of wine".to_item());
		}
		if(inebriety_limit() - my_inebriety() == 0)
		{
			drink(1,"fog murderer".to_item());
		}
		/*
		item number_manual = to_item("Manual of Numberology");
		int new_price = 38888000;
		if(shop_amount(number_manual) > 0)
		{
			int number_price = new_price; //mall_price(number_manual);
			
			if(number_price < shop_price(number_manual))
			{
				take_shop(number_manual);
				put_shop(number_price - 10,0,number_manual);
			}
		}
		*/
	}
}