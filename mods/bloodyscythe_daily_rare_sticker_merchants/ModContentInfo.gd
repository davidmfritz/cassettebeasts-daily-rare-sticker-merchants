extends ContentInfo

var setting_toggle_enabled: bool = true
export var setting_slider_additional_sticker_stock_ratio: float = 0.5

const MODUTILS: Dictionary = {
	"settings": [
		{
			"property": "setting_toggle_enabled",
			"type": "toggle",
			"label": "Enabled",
		},
		{
			"property": "setting_slider_additional_sticker_stock_ratio",
			"type": "slider",
			"label": "Additional Sticker Stock Ratio",
			"min_value": 0.5,
			"max_value": 1.0,
			"step": 0.1,
		},
	],
}

func init_content() -> void:
	assert(DLC.has_mod("cat_modutils", 0))
	var modutils: ContentInfo = DLC.mods_by_id["cat_modutils"]
	modutils.callbacks.connect_scene_ready("res://world/maps/interiors/TownHall.tscn", self, "_on_TownHall_ready")

func _on_TownHall_ready(scene: Spatial) -> void:
	if !setting_toggle_enabled:
		return
	
	var mod_scene: Spatial = preload("CustomTownHallSpawn.tscn").instance()
	scene.add_child(mod_scene)
