while ( get_property("_genieWishesUsed").to_int() < 3)
{
	cli_execute("genie wish for more wishes");
}
cli_execute("call Detective Solver.ash");
string ltt = visit_url("place.php?whichplace=town_right&action=townright_ltt");