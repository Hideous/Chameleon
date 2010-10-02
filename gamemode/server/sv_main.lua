Chameleon = {}

Msg("[i] Chameleon serverside loading...\n")

include("Chameleon/gamemode/shared/sh_main.lua")

//let's first load the rest of the serverside...
Chameleon.Utilities.IncludeDirectory("server/core/", "sv_", ".lua")

//then add clientside files to the manifest...
Chameleon.Utilities.AddCSLuaDirectory("client/core/", "cl_", true)
Chameleon.Utilities.AddCSLuaDirectory("shared/core/", "sh_", true)