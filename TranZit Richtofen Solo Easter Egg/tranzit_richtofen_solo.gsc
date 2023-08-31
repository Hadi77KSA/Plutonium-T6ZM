init()
{
	thread onPlayerConnect();
	thread safety_light_power_off_listen();
	thread safety_light_power_on_listen();
}

onPlayerConnect()
{
	for (;;)
	{
		level waittill( "connected", player );

		player iPrintLn( "^5TranZit Solo Richtofen Quest Loaded" );
	}
}

safety_light_power_off_listen()
{
	while ( true )
	{
		level waittill( "safety_light_power_off" );

		thread safety_light_power_off_solo()
	}
}

safety_light_power_on_listen()
{
	while ( true )
	{
		level waittill( "safety_light_power_on" );

		thread safety_light_power_on_solo()
	}
}

safety_light_power_off_solo()
{
		wait 0.05;
		if ( getPlayers().size == 1 && level.sq_progress[ "rich" ][ "C_screecher_light" ] == 1 )
			level.sq_progress[ "rich" ][ "C_screecher_light" ] += 2;
}

safety_light_power_on_solo()
{
		wait 0.05;
		if ( getPlayers().size == 1 && level.sq_progress[ "rich" ][ "C_screecher_light" ] == 1 )
			level.sq_progress[ "rich" ][ "C_screecher_light" ]++;
}
