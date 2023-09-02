#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

init()
{
	level thread motd_solo();
}

motd_solo()
{
	level waittill_multiple( "nixie_final_" + 386, "nixie_final_" + 481, "nixie_final_" + 101, "nixie_final_" + 872 );
	if (getPlayers().size == 1)
	{
		bot = addtestclient();
		bot waittill("spawned_player");
		wait_network_frame();
		wait 3; //spawn protection
		bot.ignoreme = 1;
	}
}
