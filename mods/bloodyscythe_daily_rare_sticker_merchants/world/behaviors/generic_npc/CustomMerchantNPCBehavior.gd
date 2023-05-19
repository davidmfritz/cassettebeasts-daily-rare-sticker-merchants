extends "res://world/behaviors/generic_npc/MerchantNPCBehavior.gd"

export (float) var additional_stock_stat_multiplier:float = 1

func _daily_slice(rand:Random, arr:Array, num:int)->Array:
	if num <= 0:
		return arr
	
	if additional_stock_stat_key != "":
		num += floor(SaveState.stats.get_stat("exchange_purchased").get_count(additional_stock_stat_key) * additional_stock_stat_multiplier)
	
	rand.shuffle(arr)
	return arr.slice(0, num - 1)

func _create_sticker_item(sticker:BattleMove, rand:Random)->BaseItem:
	if single_use_stickers:
		return ItemFactory.create_single_use_sticker(sticker)
	var rarity = BaseItem.Rarity.RARITY_RARE
	return ItemFactory.create_sticker(sticker, rand, rarity)