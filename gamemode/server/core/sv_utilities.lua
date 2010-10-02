function Chameleon.Utilities.AddCSLuaDirectory(Directory, Prefix, Recursive)
	local Files = file.FindInLua("Chameleon/gamemode/"..Directory.."*")
	
	if (Files) then
		for K, V in pairs(Files) do
			if (V != "." and V != "..") then
				if (file.IsDir("gamemodes/Chameleon/gamemode/"..Directory..V.."/", true) and Recursive) then
					Chameleon.Utilities.AddCSLuaDirectory(Directory..V.."/", Prefix, Recursive)
				else
					if (string.sub(V, -4) == ".lua") then
						if (!Prefix or string.sub(V, 1, string.len(Prefix)) == Prefix) then
							AddCSLuaFile("Chameleon/gamemode/"..Directory..V)
						end
					end
				end
			end
		end
	end
end