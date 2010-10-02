Chameleon = {}

Msg("[i] Chameleon clientside loading...\n")

include("Chameleon/gamemode/shared/sh_main.lua")

//let's first load the rest of the clientside...
Chameleon.Utilities.IncludeDirectory("client/core/", "cl_", ".lua")
