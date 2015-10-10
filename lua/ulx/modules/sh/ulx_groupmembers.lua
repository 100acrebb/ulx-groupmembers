function ulx.groupmembers( calling_ply, groupname )
	--ULib.console( calling_ply, "Members of group: "..groupname )
	for k, v in pairs( ULib.ucl.users ) do	
		if v["group"] == groupname then
			if v["name"] then
				ULib.console( calling_ply, groupname.." - "..k.." - "..v["name"])
			else
				ULib.console( calling_ply, groupname.." - "..k )
			end
		end
	end
end	
local groupmembers = ulx.command( "THAB", "ulx groupmembers", ulx.groupmembers, { "!groupmembers" } )
groupmembers:addParam{ type=ULib.cmds.StringArg }
groupmembers:defaultAccess( ULib.ACCESS_ADMIN )
groupmembers:help( "Print group members information." )



function ulx.staffmembers( calling_ply )
	ULib.console( calling_ply, "Staff members:" )
	ulx.groupmembers( calling_ply, "superadmin" )
	ulx.groupmembers( calling_ply, "admin" )
	ulx.groupmembers( calling_ply, "operator" )
	ulx.groupmembers( calling_ply, "moderator" )
end	
local staffmembers = ulx.command( "THAB", "ulx staffmembers", ulx.staffmembers, { "!staffmembers" } )
staffmembers:defaultAccess( ULib.ACCESS_ADMIN )
staffmembers:help( "Print staffmember information." )