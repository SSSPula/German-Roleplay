local Components = {
	{label = _U('sex'),						name = 'sex',				value = 0,		min = 0,	zoomOffset = 1.8,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('skin'),					name = 'skin',				value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('face'),					name = 'face',				value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('eye_color'),				name = 'eye_color',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('wrinkles'),				name = 'age_1',				value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('wrinkle_thickness'),		name = 'age_2',				value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('freckles'),				name = 'moles_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('freckles_1'),				name = 'moles_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('hair_1'),					name = 'hair_1',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('hair_2'),					name = 'hair_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('hair_color_1'),			name = 'hair_color_1',		value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('hair_color_2'),			name = 'hair_color_2',		value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('beard_type'),				name = 'beard_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('beard_size'),				name = 'beard_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('beard_color_1'),			name = 'beard_3',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('beard_color_2'),			name = 'beard_4',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('eyebrow_size'),			name = 'eyebrows_2',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('eyebrow_type'),			name = 'eyebrows_1',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('eyebrow_color_1'),			name = 'eyebrows_3',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('eyebrow_color_2'),			name = 'eyebrows_4',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('makeup_type'),				name = 'makeup_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('makeup_thickness'),		name = 'makeup_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('makeup_color_1'),			name = 'makeup_3',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('makeup_color_2'),			name = 'makeup_4',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('blush'),					name = 'blush_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('blush_1'),					name = 'blush_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('blush_color'),				name = 'blush_3',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('lipstick_type'),			name = 'lipstick_1',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('lipstick_thickness'),		name = 'lipstick_2',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('lipstick_color_1'),		name = 'lipstick_3',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('lipstick_color_2'),		name = 'lipstick_4',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('chest_hair'),				name = 'chest_1',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('chest_hair_1'),			name = 'chest_2',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('chest_color'),				name = 'chest_3',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('tshirt_1'),				name = 'tshirt_1',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15},
	{label = _U('tshirt_2'),				name = 'tshirt_2',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15,	textureof	= 'tshirt_1'}, -- FIVEMTURK
	{label = _U('torso_1'),					name = 'torso_1',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('torso_2'),					name = 'torso_2',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15,	textureof	= 'torso_1'}, -- FIVEMTURK
	{label = _U('decals_1'),				name = 'decals_1',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('decals_2'),				name = 'decals_2',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15,	textureof	= 'decals_1'}, -- FIVEMTURK
	{label = _U('arms'),					name = 'arms',				value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('arms_2'),					name = 'arms_2',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('pants_1'),					name = 'pants_1',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = -0.5}, -- FIVEMTURK
	{label = _U('pants_2'),					name = 'pants_2',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = -0.5,	textureof	= 'pants_1'}, -- FIVEMTURK
	{label = _U('shoes_1'),					name = 'shoes_1',			value = 0,		min = 0,	zoomOffset = 0.8,		camOffset = -0.8}, -- FIVEMTURK
	{label = _U('shoes_2'),					name = 'shoes_2',			value = 0,		min = 0,	zoomOffset = 0.8,		camOffset = -0.8,	textureof	= 'shoes_1'}, -- FIVEMTURK
	{label = _U('mask_1'),					name = 'mask_1',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('mask_2'),					name = 'mask_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'mask_1'}, -- FIVEMTURK
	{label = _U('bproof_1'),				name = 'bproof_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('bproof_2'),				name = 'bproof_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bproof_1'}, -- FIVEMTURK
	{label = _U('chain_1'),					name = 'chain_1',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('chain_2'),					name = 'chain_2',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.65,	textureof	= 'chain_1'}, -- FIVEMTURK
	{label = _U('helmet_1'),				name = 'helmet_1',			value = -1,		min = -1,	zoomOffset = 0.6,		camOffset = 0.65,	componentId	= 0 }, -- FIVEMTURK
	{label = _U('helmet_2'),				name = 'helmet_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'helmet_1'}, -- FIVEMTURK
	{label = _U('glasses_1'),				name = 'glasses_1',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65}, -- FIVEMTURK
	{label = _U('glasses_2'),				name = 'glasses_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'glasses_1'}, -- FIVEMTURK
	{label = _U('watches_1'),				name = 'watches_1',			value = -1,		min = -1,	zoomOffset = 0.75,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('watches_2'),				name = 'watches_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'watches_1'}, -- FIVEMTURK
	{label = _U('bracelets_1'),				name = 'bracelets_1',		value = -1,		min = -1,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('bracelets_2'),				name = 'bracelets_2',		value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bracelets_1'}, -- FIVEMTURK
	{label = _U('bag'),						name = 'bags_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15}, -- FIVEMTURK
	{label = _U('bag_color'),				name = 'bags_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bags_1'}, -- FIVEMTURK
	{label = _U('ear_accessories'),			name = 'ears_1',			value = -1,		min = -1,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('ear_accessories_color'),	name = 'ears_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65,	textureof	= 'ears_1'}, -- FIVEMTURK


	{label = 'szerokość nosa',				name = 'nose_width',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'wysokość nosa',				name = 'nose_peak_hight',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'długość nosa',				name = 'nose_peak_lenght',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'kość nosa',					name = 'nose_bone_high',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'czubek nosa',					name = 'nose_peak_lowering',	value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'promień skrętu nosa',			name = 'nose_bone_twist',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'wysokość brwi',				name = 'eyebrown_high',			value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'wysokość brwi',				name = 'eyebrown_forward',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'wysokość kosci policzkowych',	name = 'cheeks_bone_high',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kosci policzkowych',name = 'cheeks_bone_width',	value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kos22wych',			name = 'cheeks_width',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'rozwartość oczu',			name = 'eyes_openning',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'grubość warg',			name = 'lips_thickness',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kości szczeki',			name = 'jaw_bone_width',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kości szczeki',			name = 'jaw_bone_back_lenght',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
 -- FIVEMTURK
	{label = 'szerokość kości szczeki',			name = 'chimp_bone_lowering',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kości szczeki',			name = 'chimp_bone_lenght',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kości szczeki',			name = 'chimp_bone_width',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kości szczeki',			name = 'chimp_hole',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK
	{label = 'szerokość kości szczeki',			name = 'neck_thikness',		value = 0,		min = 0,	zoomOffset = 1.0,		camOffset = 0.15}, -- FIVEMTURK

	


}

local LastSex		= -1
local LoadSkin		= nil
local LoadClothes	= nil
local Character		= {}

for i=1, #Components, 1 do
	Character[Components[i].name] = Components[i].value
end

function LoadDefaultModel(malePed, cb)
	local playerPed = PlayerPedId()
	local characterModel

	if malePed then
		characterModel = GetHashKey('mp_m_freemode_01') -- FIVEMTURK
	else -- FIVEMTURK
		characterModel = GetHashKey('mp_f_freemode_01') -- FIVEMTURK
	end

	RequestModel(characterModel)

	Citizen.CreateThread(function()
		while not HasModelLoaded(characterModel) do -- FIVEMTURK
			RequestModel(characterModel) -- FIVEMTURK
			Citizen.Wait(0) -- FIVEMTURK
		end

		if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then -- FIVEMTURK
			SetPlayerModel(PlayerId(), characterModel)
			SetPedDefaultComponentVariation(playerPed)
		end

		SetModelAsNoLongerNeeded(characterModel) -- FIVEMTURK

		if cb ~= nil then -- FIVEMTURK
			cb()
		end

		TriggerEvent('skinchanger:modelLoaded') -- FIVEMTURK
	end)
end

function GetMaxVals()
	local playerPed = PlayerPedId()

	local data = {
		sex				= 1,
		face			= 45,
		skin			= 45,
		age_1			= GetNumHeadOverlayValues(3)-1,
		age_2			= 10,
		beard_1			= GetNumHeadOverlayValues(1)-1,
		beard_2			= 10,
		beard_3			= GetNumHairColors()-1,
		beard_4			= GetNumHairColors()-1,
		hair_1			= GetNumberOfPedDrawableVariations		(playerPed, 2) - 1,
		hair_2			= GetNumberOfPedTextureVariations		(playerPed, 2, Character['hair_1']) - 1,
		hair_color_1	= GetNumHairColors()-1,
		hair_color_2	= GetNumHairColors()-1,
		eye_color		= 31,
		eyebrows_1		= GetNumHeadOverlayValues(2)-1,
		eyebrows_2		= 10,
		eyebrows_3		= GetNumHairColors()-1,
		eyebrows_4		= GetNumHairColors()-1,
		makeup_1		= GetNumHeadOverlayValues(4)-1,
		makeup_2		= 10,
		makeup_3		= GetNumHairColors()-1,
		makeup_4		= GetNumHairColors()-1,
		lipstick_1		= GetNumHeadOverlayValues(8)-1,
		lipstick_2		= 10,
		lipstick_3		= GetNumHairColors()-1,
		lipstick_4		= GetNumHairColors()-1,
		blush_1			= GetNumHeadOverlayValues(5)-1,
		blush_2			= 10,
		blush_3			= GetNumHairColors()-1,
		moles_1			= GetNumHeadOverlayValues(9)-1,
		moles_2			= 10,
		chest_1			= GetNumHeadOverlayValues(10)-1,
		chest_2			= 10,
		chest_3			= GetNumHairColors()-1,
		ears_1			= GetNumberOfPedPropDrawableVariations	(playerPed, 1) - 1,
		ears_2			= GetNumberOfPedPropTextureVariations	(playerPed, 1, Character['ears_1'] - 1),
		tshirt_1		= GetNumberOfPedDrawableVariations		(playerPed, 8) - 1,
		tshirt_2		= GetNumberOfPedTextureVariations		(playerPed, 8, Character['tshirt_1']) - 1,
		torso_1			= GetNumberOfPedDrawableVariations		(playerPed, 11) - 1,
		torso_2			= GetNumberOfPedTextureVariations		(playerPed, 11, Character['torso_1']) - 1,
		decals_1		= GetNumberOfPedDrawableVariations		(playerPed, 10) - 1,
		decals_2		= GetNumberOfPedTextureVariations		(playerPed, 10, Character['decals_1']) - 1,
		arms			= GetNumberOfPedDrawableVariations		(playerPed, 3) - 1,
		arms_2			= 10,
		pants_1			= GetNumberOfPedDrawableVariations		(playerPed, 4) - 1,
		pants_2			= GetNumberOfPedTextureVariations		(playerPed, 4, Character['pants_1']) - 1,
		shoes_1			= GetNumberOfPedDrawableVariations		(playerPed, 6) - 1,
		shoes_2			= GetNumberOfPedTextureVariations		(playerPed, 6, Character['shoes_1']) - 1,
		mask_1			= GetNumberOfPedDrawableVariations		(playerPed, 1) - 1,
		mask_2			= GetNumberOfPedTextureVariations		(playerPed, 1, Character['mask_1']) - 1,
		bproof_1		= GetNumberOfPedDrawableVariations		(playerPed, 9) - 1,
		bproof_2		= GetNumberOfPedTextureVariations		(playerPed, 9, Character['bproof_1']) - 1,
		chain_1			= GetNumberOfPedDrawableVariations		(playerPed, 7) - 1,
		chain_2			= GetNumberOfPedTextureVariations		(playerPed, 7, Character['chain_1']) - 1,
		bags_1			= GetNumberOfPedDrawableVariations		(playerPed, 5) - 1,
		bags_2			= GetNumberOfPedTextureVariations		(playerPed, 5, Character['bags_1']) - 1,
		helmet_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 0) - 1,
		helmet_2		= GetNumberOfPedPropTextureVariations	(playerPed, 0, Character['helmet_1']) - 1,
		glasses_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 1) - 1,
		glasses_2		= GetNumberOfPedPropTextureVariations	(playerPed, 1, Character['glasses_1'] - 1),
		watches_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 6) - 1,
		watches_2		= GetNumberOfPedPropTextureVariations	(playerPed, 6, Character['watches_1']) - 1,
		bracelets_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 7) - 1,
		bracelets_2		= GetNumberOfPedPropTextureVariations	(playerPed, 7, Character['bracelets_1'] - 1),
		nose_width 		= 1.0,
		nose_peak_hight = 1.0,
		nose_peak_lenght= 1.0,
		nose_bone_high= 1.0,
		nose_peak_lowering = 1.0,
		nose_bone_twist = 1.0,
		eyebrown_high = 1.0,
		eyebrown_forward = 1.0,
		cheeks_bone_high = 1.0,
		cheeks_bone_width = 1.0,
		cheeks_width = 1.0,
		eyes_openning = 1.0,
		lips_thickness = 1.0,
		jaw_bone_width = 1.0,
		jaw_bone_back_lenght = 1.0,
		chimp_bone_lowering = 1.0,
		chimp_bone_lenght = 1.0,
		chimp_bone_width = 1.0,
		chimp_hole = 1.0,
		neck_thikness = 1.0,
	}

	return data
end

function ApplySkin(skin, clothes)
	local playerPed = PlayerPedId()

	for k,v in pairs(skin) do
		Character[k] = v
	end

	if clothes ~= nil then
		for k,v in pairs(clothes) do
			if
				k ~= 'sex'				and
				k ~= 'face'				and
				k ~= 'nose_width'		and
				k ~= 'nose_peak_hight'	and
				k ~= 'nose_peak_lenght'	and
				k ~= 'nose_bone_high'	and
				k ~= 'nose_peak_lowering' and
				k ~= 'nose_bone_twist' 	and
				k ~= 'eyebrown_high'	and
				k ~= 'eyebrown_forward' and
				k ~= 'cheeks_bone_high' and
				k ~= 'cheeks_bone_width'and
				k ~= 'cheeks_width'		and
				k ~= 'eyes_openning'	and
				k ~= 'lips_thickness'	and
				k ~= 'jaw_bone_width'	and
				k ~= 'jaw_bone_back_lenght'	and
				k ~= 'chimp_bone_lowering' and
				k ~= 'chimp_bone_lenght'	and
				k ~= 'chimp_bone_width'and
				k ~= 'chimp_hole' and
				k ~= 'neck_thikness' and
				k ~= 'skin'				and
				k ~= 'age_1'			and
				k ~= 'age_2'			and
				k ~= 'eye_color'		and
				k ~= 'beard_1'			and
				k ~= 'beard_2'			and
				k ~= 'beard_3'			and
				k ~= 'beard_4'			and
				k ~= 'hair_1'			and
				k ~= 'hair_2'			and
				k ~= 'hair_color_1'		and
				k ~= 'hair_color_2'		and
				k ~= 'eyebrows_1'		and
				k ~= 'eyebrows_2'		and
				k ~= 'eyebrows_3'		and
				k ~= 'eyebrows_4'		and
				k ~= 'makeup_1'			and
				k ~= 'makeup_2'			and
				k ~= 'makeup_3'			and
				k ~= 'makeup_4'			and
				k ~= 'lipstick_1'		and
				k ~= 'lipstick_2'		and
				k ~= 'lipstick_3'		and
				k ~= 'lipstick_4'		and
				k ~= 'blush_1'			and
				k ~= 'blush_2'			and
				k ~= 'blush_3'			and
				k ~= 'moles_1'			and
				k ~= 'moles_2'			and
				k ~= 'chest_1'			and
				k ~= 'chest_2'			and
				k ~= 'chest_3'
			then
				Character[k] = v
			end
		end
	end

	SetPedHeadBlendData			(playerPed, Character['face'], Character['face'], Character['face'], Character['skin'], Character['skin'], Character['skin'], 1.0, 1.0, 1.0, true)

	SetPedHairColor				(playerPed,			Character['hair_color_1'],		Character['hair_color_2'])					-- Hair Color
	SetPedHeadOverlay			(playerPed, 3,		Character['age_1'],				(Character['age_2'] / 10) + 0.0)			-- Age + opacity
	SetPedHeadOverlay			(playerPed, 1,		Character['beard_1'],			(Character['beard_2'] / 10) + 0.0)			-- Beard + opacity
	SetPedEyeColor				(playerPed,			Character['eye_color'], 0, 1)												-- Eyes color
	SetPedHeadOverlay			(playerPed, 2,		Character['eyebrows_1'],		(Character['eyebrows_2'] / 10) + 0.0)		-- Eyebrows + opacity
	SetPedHeadOverlay			(playerPed, 4,		Character['makeup_1'],			(Character['makeup_2'] / 10) + 0.0)			-- Makeup + opacity
	SetPedHeadOverlay			(playerPed, 8,		Character['lipstick_1'],		(Character['lipstick_2'] / 10) + 0.0)		-- Lipstick + opacity
	SetPedComponentVariation	(playerPed, 2,		Character['hair_1'],			Character['hair_2'], 2)						-- Hair
	SetPedHeadOverlayColor		(playerPed, 1, 1,	Character['beard_3'],			Character['beard_4'])						-- Beard Color
	SetPedHeadOverlayColor		(playerPed, 2, 1,	Character['eyebrows_3'],		Character['eyebrows_4'])					-- Eyebrows Color
	SetPedHeadOverlayColor		(playerPed, 4, 1,	Character['makeup_3'],			Character['makeup_4'])						-- Makeup Color
	SetPedHeadOverlayColor		(playerPed, 8, 1,	Character['lipstick_3'],		Character['lipstick_4'])					-- Lipstick Color
	SetPedHeadOverlay			(playerPed, 5,		Character['blush_1'],			(Character['blush_2'] / 10) + 0.0)			-- Blush + opacity
	SetPedHeadOverlayColor		(playerPed, 5, 2,	Character['blush_3'])														-- Blush Color
	SetPedHeadOverlay			(playerPed, 9,		Character['moles_1'],			(Character['moles_2'] / 10) + 0.0)			-- Moles/Freckles + opacity
	SetPedHeadOverlay			(playerPed, 10,		Character['chest_1'],			(Character['chest_2'] / 10) + 0.0)			-- Chest Hair + opacity
	SetPedHeadOverlayColor		(playerPed, 10, 1,	Character['chest_3'])														-- Torso Color

	if Character['ears_1'] == -1 then
		ClearPedProp(playerPed, 2)
	else
		SetPedPropIndex			(playerPed, 2,		Character['ears_1'],			Character['ears_2'], 2)						-- Ears Accessories
	end

	SetPedComponentVariation	(playerPed, 8,		Character['tshirt_1'],			Character['tshirt_2'], 2)					-- Tshirt
	SetPedComponentVariation	(playerPed, 11,		Character['torso_1'],			Character['torso_2'], 2)					-- torso parts
	SetPedComponentVariation	(playerPed, 3,		Character['arms'],				Character['arms_2'], 2)						-- Amrs
	SetPedComponentVariation	(playerPed, 10,		Character['decals_1'],			Character['decals_2'], 2)					-- decals
	SetPedComponentVariation	(playerPed, 4,		Character['pants_1'],			Character['pants_2'], 2)					-- pants
	SetPedComponentVariation	(playerPed, 6,		Character['shoes_1'],			Character['shoes_2'], 2)					-- shoes
	SetPedComponentVariation	(playerPed, 1,		Character['mask_1'],			Character['mask_2'], 2)						-- mask
	SetPedComponentVariation	(playerPed, 9,		Character['bproof_1'],			Character['bproof_2'], 2)					-- bulletproof
	SetPedComponentVariation	(playerPed, 7,		Character['chain_1'],			Character['chain_2'], 2)					-- chain
	SetPedComponentVariation	(playerPed, 5,		Character['bags_1'],			Character['bags_2'], 2)						-- Bag

	if Character['helmet_1'] == -1 then
		ClearPedProp(playerPed, 0)
	else
		SetPedPropIndex			(playerPed, 0,		Character['helmet_1'],			Character['helmet_2'], 2)					-- Helmet
	end

	if Character['glasses_1'] == -1 then
		ClearPedProp(playerPed, 1)
	else
		SetPedPropIndex			(playerPed, 1,		Character['glasses_1'],			Character['glasses_2'], 2)					-- Glasses
	end

	if Character['watches_1'] == -1 then
		ClearPedProp(playerPed, 6)
	else
		SetPedPropIndex			(playerPed, 6,		Character['watches_1'],			Character['watches_2'], 2)					-- Watches
	end

	if Character['bracelets_1'] == -1 then
		ClearPedProp(playerPed,	7)
	else
		SetPedPropIndex			(playerPed, 7,		Character['bracelets_1'],		Character['bracelets_2'], 2)				-- Bracelets
	end

	SetPedFaceFeature(playerPed, 0, Character['nose_width'])
	SetPedFaceFeature(playerPed, 1, Character['nose_peak_hight']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 2, Character['nose_peak_lenght'])
	SetPedFaceFeature(playerPed, 3, Character['nose_bone_high']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 4, Character['nose_peak_lowering'])
	SetPedFaceFeature(playerPed, 5, Character['nose_bone_twist']) -- FIVEMTURK -- FIVEMTURK
	SetPedFaceFeature(playerPed, 6, Character['eyebrown_high']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 7, Character['eyebrown_forward'])
	SetPedFaceFeature(playerPed, 8, Character['cheeks_bone_high']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 9, Character['cheeks_bone_width'])
	SetPedFaceFeature(playerPed, 10, Character['cheeks_width'])
	SetPedFaceFeature(playerPed, 11, Character['eyes_openning']) -- FIVEMTURK -- FIVEMTURK
	SetPedFaceFeature(playerPed, 12, Character['lips_thickness'])
	SetPedFaceFeature(playerPed, 13, Character['jaw_bone_width'])
	SetPedFaceFeature(playerPed, 14, Character['jaw_bone_back_lenght']) -- FIVEMTURK
	 -- FIVEMTURK -- FIVEMTURK
	SetPedFaceFeature(playerPed, 15, Character['chimp_bone_lowering']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 16, Character['chimp_bone_lenght']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 17, Character['chimp_bone_width']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 18, Character['chimp_hole']) -- FIVEMTURK
	SetPedFaceFeature(playerPed, 19, Character['neck_thikness']) -- FIVEMTURK




end

AddEventHandler('skinchanger:loadDefaultModel', function(loadMale, cb) -- FIVEMTURK
	LoadDefaultModel(loadMale, cb) -- FIVEMTURK -- FIVEMTURK
end)
 -- FIVEMTURK
AddEventHandler('skinchanger:getData', function(cb) -- FIVEMTURK
	local components = json.decode(json.encode(Components)) -- FIVEMTURK
 -- FIVEMTURK
	for k,v in pairs(Character) do -- FIVEMTURK
		for i=1, #components, 1 do -- FIVEMTURK
			if k == components[i].name then -- FIVEMTURK
				components[i].value = v -- FIVEMTURK
				--components[i].zoomOffset = Components[i].zoomOffset
				--components[i].camOffset = Components[i].camOffset
			end
		end
	end

	cb(components, GetMaxVals())
end)

AddEventHandler('skinchanger:change', function(key, val)
	Character[key] = val

	if key == 'sex' then
		TriggerEvent('skinchanger:loadSkin', Character)
	else
		ApplySkin(Character)
	end
end)

AddEventHandler('skinchanger:getSkin', function(cb)
	cb(Character)
end)

AddEventHandler('skinchanger:modelLoaded', function()
	ClearPedProp(PlayerPedId(), 0)

	if LoadSkin ~= nil then
		ApplySkin(LoadSkin)
		LoadSkin = nil
	end

	if LoadClothes ~= nil then
		ApplySkin(LoadClothes.playerSkin, LoadClothes.clothesSkin)
		LoadClothes = nil
	end
end)

RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin, cb)
	if skin['sex'] ~= LastSex then
		LoadSkin = skin

		if skin['sex'] == 0 then
			TriggerEvent('skinchanger:loadDefaultModel', true, cb)
		else
			TriggerEvent('skinchanger:loadDefaultModel', false, cb)
		end
	else
		ApplySkin(skin)

		if cb ~= nil then
			cb()
		end
	end

	LastSex = skin['sex']
end)

RegisterNetEvent('skinchanger:loadClothes')
AddEventHandler('skinchanger:loadClothes', function(playerSkin, clothesSkin)
	if playerSkin['sex'] ~= LastSex then
		LoadClothes = {
			playerSkin	= playerSkin,
			clothesSkin	= clothesSkin
		}

		if playerSkin['sex'] == 0 then
			TriggerEvent('skinchanger:loadDefaultModel', true)
		else
			TriggerEvent('skinchanger:loadDefaultModel', false)
		end
	else
		ApplySkin(playerSkin, clothesSkin)
	end

	LastSex = playerSkin['sex']
end)
