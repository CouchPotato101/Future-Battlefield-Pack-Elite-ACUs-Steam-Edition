local version = tonumber( (string.gsub(string.gsub(GetVersion(), '1.5.', ''), '1.6.', '')) )

if version < 3652 then -- All versions below 3652 don't have buildin global icon support, so we need to insert the icons by our own function
	LOG('Future Battlefield Pack Elite ACUs: [gamecommon.lua '..debug.getinfo(1).currentline..'] - Gameversion is older then 3652. Hooking "GetUnitIconFileNames" to add our own unit icons')

local MyUnitIdTable = {
   UAB0305=true, -- Origin of the Way - (Aeon: ACU-HQ)
   UEB0305=true, -- Command Hangar - (UEF: ACU-HQ)
   URB0305=true, -- Master-Hub - (Cybran: ACU-HQ)
   XSB0305=true, -- Am-Sayasta - (Seraphim: ACU-HQ)
}

	local IconPath = "/Mods/Future Battlefield Pack Elite ACUs"
	-- Adds icons to the unitselectionwindow
	local oldGetUnitIconFileNames = GetUnitIconFileNames
	function GetUnitIconFileNames(blueprint)
		if MyUnitIdTable[blueprint.Display.IconName] then
			local iconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			local upIconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			local downIconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			local overIconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			return iconName, upIconName, downIconName, overIconName
		else
			return oldGetUnitIconFileNames(blueprint)
		end
	end

else
	LOG('Future Battlefield Pack Elite ACUs: [gamecommon.lua '..debug.getinfo(1).currentline..'] - Gameversion is 3652 or newer. No need to insert the unit icons by our own function.')
end -- All versions below 3652 don't have buildin global icon support, so we need to insert the icons by our own function