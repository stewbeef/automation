import "safeguard.ash";
import "consume_cheer.ash";

void daily_mallbuy(string it_name, int amount, int price, string propsuffix)
{
	if(get_property("_bought_" + propsuffix) != "done" && get_property("buy_" + propsuffix) == true)
	{
		cli_execute("mallbuy " + amount + " " + it_name + " @" + price);
	}
}

void init_boolprop(string prop)
{
	if(get_property(prop) == "")
	{
		print("Initializing property " + prop + "to true");
		set_property(prop,"true");
	}
}

void do_viplounge_stuff()
{
	//cli_execute("do_clanfortune respond all,respond");
	//do_clanfortune respond all
	//do_clanfortune quick defaults
	if(get_property("clanfortune_1stContact") == "")
	{
		cli_execute("do_clanfortune quick defaults");
	}
	cli_execute("do_clanfortune respond all");
	cli_execute("do_clanfortune quicksend");

	if(is_unrestricted("deluxe fax machine"))
	{
		cli_execute("shower hot");

	}
}

void loginstuff()
{
	//if(item_amount(to_item(9529)) > 0 && get_property("_made_pocket_wishes") != "done")
	while (item_amount(to_item(9529)) > 0 && get_property("_genieWishesUsed").to_int() < 3)
	{//genie bottle
			for i from 1 to 3 by 1
			{
				cli_execute("genie wish for more wishes");
			}
			set_property("_made_pocket_wishes","done");
	}
	if(get_property("hasDetectiveSchool") == "true")
	{
		cli_execute("call Detective Solver.ash");
	}
	
	if(item_amount(to_item("Clan VIP Lounge key")) > 0)
	{
		do_viplounge_stuff();
	}
	
	if(item_amount(to_item(9592)) > 0 && get_property("_have_mummered") != "done")
	{//9592 mumming trunk
	/*setup
		set_property("mummery_meat",to_familiar(213)) //xo-seleton 213
		set_property("mummery_item",to_familiar()) //
		set_property("mummery_mp",to_familiar(210)) //Optimistic Candle 210
		set_property("mummery_hp",to_familiar(209)) //Space Jellyfish 209
		set_property("mummery_muscle",to_familiar()) //
		set_property("mummery_myst",to_familiar(211)) //robortender 211
		set_property("mummery_moxie",to_familiar()) //
	*/
		use_familiar(get_property("mummery_meat").to_familiar());
		cli_execute("mummery meat");
		use_familiar(get_property("mummery_mp").to_familiar());
		cli_execute("mummery mp");
		use_familiar(get_property("mummery_hp").to_familiar());
		cli_execute("mummery hp");
		use_familiar(get_property("mummery_myst").to_familiar());
		cli_execute("mummery myst");
		set_property("_have_mummered","done");
	}

	item piggers = to_item(9025);
	//9025 is infinite bacon machine

	//set_property("buy_bacon","true");
	//set_property("buy_expensive_bacon","true");
	//set_property("buy_hollow","true");
	//set_property("buy_britcoal","true");
	//init_boolprop("buy_bacon");
	//init_boolprop("buy_expensive_bacon");
	//init_boolprop("buy_hollow");
	//init_boolprop("buy_britcoal");
	set_property("buy_expensive_bacon","false");
	daily_mallbuy("bacon", 100, 300, "bacon");
	daily_mallbuy("bacon", 50, 400, "expensive_bacon");
	daily_mallbuy("lump of Brituminous coal", 5, 300, "britcoal");
	daily_mallbuy("Flaskfull of Hollow", 5, 300, "hollow");

	if(my_name().to_lower_case()== "stewbeef")
	{
		print("hello Mr. Beefs");
	}
	else
	{
		//Maximize("effective, 3 mainstat, item, meat, mp regen, hp regen", false);
		CheerFillUp();
		outfit("Main");
		boolean bounties = false;
		if(bounties)
		{
			cli_execute("call do_bounties.ash");
		}
	}

	sg_closet_remove();	
}

void main()
{
	if(get_property("_done_login_stuff") != "true")
	{
		loginstuff();
		set_property("_done_login_stuff",true);
	}
	
}