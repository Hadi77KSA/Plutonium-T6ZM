init()
{
    level thread tranzit_richtofen_solo();
    level thread onplayerconnect();
}

tranzit_richtofen_solo()
{
    level endon( "end_game" );
    self endon( "disconnect" );
    level thread screecher_light_on_sq_solo();

    while( 1 )
    {
        level waittill( "safety_light_power_off" );
        wait 0.05;
        if ( getPlayers().size <= 1 && level.sq_progress[ "rich" ][ "C_screecher_light" ] == 1 )
        {
            level.sq_progress[ "rich" ][ "C_screecher_light" ] += 2;
        }
    }
}

screecher_light_on_sq_solo()
{
    while( 1 )
    {
        level waittill( "safety_light_power_on" );
        wait 0.05;
        if ( getPlayers().size <= 1 && level.sq_progress[ "rich" ][ "C_screecher_light" ] == 1 )
        {
            level.sq_progress[ "rich" ][ "C_screecher_light" ]++;
        }
    }
}

onplayerconnect()
{
    for(;;)
    {
        level waittill( "connected", player );
        player iprintln( "^5TranZit Solo Quest Loaded" );
    }
}
