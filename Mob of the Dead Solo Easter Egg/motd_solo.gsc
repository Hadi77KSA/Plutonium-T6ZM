#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

main()
{
	if ( getdvarint( "sv_maxclients" ) < 2 )
		setdvar( "sv_maxclients", "2" );

	if ( getdvarint( "party_maxplayers" ) < 2 )
		setdvar( "party_maxplayers", "2" );

	if ( getdvarint( "com_maxclients" ) < 2 )
	{
		setdvar( "com_maxclients", getdvar( "party_maxplayers" ) );
		println( "motd_solo.gsc will restart the map" );
		flag_wait( "initial_players_connected" );
		cmdexec( "map_restart" );
	}
}

init()
{
	thread motd_solo();
}

motd_solo()
{
	level waittill_multiple( "nixie_final_" + 386, "nixie_final_" + 481, "nixie_final_" + 101, "nixie_final_" + 872 );

	for (;;)
	{
		if ( getPlayers().size == 1 )
		{
			if ( getdvarint( "sv_maxclients" ) < 2 )
				setdvar( "sv_maxclients", "2" );

			if ( getdvarint( "com_maxclients" ) < 2 )
				setdvar( "com_maxclients", "2" );

			bot = addtestclient();
			bot waittill( "spawned_player" );
			wait_network_frame();
			wait 3; //spawn protection
			bot.ignoreme = 1;
			bot thread limit_afterlives();
			break;
		}

		wait 5;
	}
}

limit_afterlives()
{
	self endon( "disconnect" );
	self endon( "_zombie_game_over" );
	level endon( "stage_final" );

	for (;;)
	{
		while ( self.lives > 1 )
		{
			self maps\mp\zombies\_zm_afterlife::afterlife_remove();
			wait 1;
		}

		wait 5;
	}
}
