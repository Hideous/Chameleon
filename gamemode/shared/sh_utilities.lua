//this is loaded first, so let's make sure we don't require anything from other parts of the script

Chameleon.Utilities = {}


function Chameleon.Utilities.IncludeDirectory(Directory, Prefix, Extension, Recursive)
	local Files = file.FindInLua("Chameleon/gamemode/"..Directory.."*")
	for K, V in pairs(Files) do
		if V != "." and V != ".." then
			if file.IsDir("gamemodes/Chameleon/gamemode/"..Directory..V.."/", true) and Recursive then
				Chameleon.Utilities.IncludeDirectory(Directory..V.."/", Prefix, Extension, Recursive)
			else
				if !Prefix or string.sub(V, 1, string.len(Prefix)) == Prefix then
					if !Extension or string.sub(V, string.len(Extension) * -1) == Extension then
						include("Chameleon/gamemode/"..Directory..V)
					end
				end
			end
		end
	end
end