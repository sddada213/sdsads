-- Fallen v18 hard compatibility guard
__EC13 = __EC13 or { anim = {}, click = {}, slider = {}, avatar = {}, fps = {}, user = {}, target = {}, cache = {} }
_EC13 = _EC13 or __EC13
__EC13.anim = __EC13.anim or {}
__EC13.click = __EC13.click or {}
__EC13.slider = __EC13.slider or {}
__EC13.avatar = __EC13.avatar or {}
__EC13.fps = __EC13.fps or {}
__EC13.user = __EC13.user or {}
__EC13.target = __EC13.target or {}
__EC13.cache = __EC13.cache or {}

__EC_PINK_R = 1.00
__EC_PINK_G = 0.00
__EC_PINK_B = 0.55
__EC_PINK_SOFT_R = 1.00
__EC_PINK_SOFT_G = 0.18
__EC_PINK_SOFT_B = 0.72
__EC16_MENU_ALLOWED = false
__EC16_UI = { check = {}, slider = {}, color = {}, buttons = {}, buttonLabels = {}, visible = {}, texts = {} }
__EC16_ORIGINAL_UI = UIManager
UIManager = {
CreateTab = function(id, label) return id end,
CreateWindow = function(id, label, x, y, w, h) return id end,
CreateText = function(id, text) __EC16_UI.texts[id] = text return id end,
CreateSeparator = function(id) return id end,
SetElementParent = function(id, parent) return true end,
SetElementSameLine = function(id, v) return true end,
SetElementVisible = function(id, v)
__EC16_UI.visible[id] = v == true
return true
end,
RemoveElement = function(id) return true end,
CreateCheckbox = function(id, label, default, on_change)
if __EC16_UI.check[id] == nil then __EC16_UI.check[id] = false end
return id
end,
CreateSliderInt = function(id, label, minv, maxv, default)
if __EC16_UI.slider[id] == nil then __EC16_UI.slider[id] = default or minv or 0 end
return id
end,
CreateSliderFloat = function(id, label, minv, maxv, default)
if __EC16_UI.slider[id] == nil then __EC16_UI.slider[id] = default or minv or 0 end
return id
end,
CreateColorPicker = function(id, label, r, g, b, a)
if __EC16_UI.color[id] == nil then
__EC16_UI.color[id] = {r=r or 1,g=g or 1,b=b or 1,a=a or 1,[1]=r or 1,[2]=g or 1,[3]=b or 1,[4]=a or 1}
end
return id
end,
CreateButton = function(id, label, cb)
__EC16_UI.buttons[id] = cb
__EC16_UI.buttonLabels[id] = label
if __EC16_UI.visible[id] == nil then __EC16_UI.visible[id] = true end
return id
end,
GetCheckboxValue = function(id) return __EC16_UI.check[id] == true end,
SetCheckboxValue = function(id, v) __EC16_UI.check[id] = v == true return true end,
GetSliderIntValue = function(id) return math.floor(__EC16_UI.slider[id] or 0) end,
SetSliderIntValue = function(id, v) __EC16_UI.slider[id] = v return true end,
GetSliderFloatValue = function(id) return __EC16_UI.slider[id] or 0 end,
SetSliderFloatValue = function(id, v) __EC16_UI.slider[id] = v return true end,
GetColorPickerValue = function(id)
return __EC16_UI.color[id] or {r=1,g=1,b=1,a=1,[1]=1,[2]=1,[3]=1,[4]=1}
end,
SetColorPickerValue = function(id, r, g, b, a)
__EC16_UI.color[id] = {r=r,g=g,b=b,a=a or 1,[1]=r,[2]=g,[3]=b,[4]=a or 1}
return true
end,
OpenColorPicker = function(id)
if __EC16_ORIGINAL_UI and __EC16_ORIGINAL_UI.OpenColorPicker then
return __EC16_ORIGINAL_UI.OpenColorPicker(id)
end
return true
end,
ToggleColorPicker = function(id)
if __EC16_ORIGINAL_UI and __EC16_ORIGINAL_UI.ToggleColorPicker then
return __EC16_ORIGINAL_UI.ToggleColorPicker(id)
end
return true
end
}
TAB_ID = "Eclipze"
ARMOR_MAP = {
["Armor_153"] = "Cloth Head Wrap",
["Armor_115"] = "Cloth Shirt",
["Armor_116"] = "Cloth Pants",
["Armor_156"] = "Cloth Handwraps",
["Armor_117"] = "Cloth Footwraps",
["Armor_124"] = "Wooden Chestplate",
["Armor_125"] = "Wooden Leggings",
["Armor_123"] = "Wooden Helmet",
["Armor_145"] = "Salvaged Helmet",
["Armor_146"] = "Salvaged Chestplate",
["Armor_147"] = "Salvaged Leggings",
["Armor_155"] = "Salvaged Gloves",
["Armor_148"] = "Military Helmet",
["Armor_149"] = "Military Chestplate",
["Armor_150"] = "Military Leggings",
["Armor_157"] = "Military Gloves",
["Armor_271"] = "Altyn Helmet",
["Armor_272"] = "Boris Chestplate",
["Armor_141"] = "Steel Helmet",
["Armor_142"] = "Steel Chestplate",
["Armor_143"] = "Steel Leggings",
["Armor_158"] = "Leather Gloves",
["Armor_113"] = "Shorts",
["Armor_59"] = "Hoodie",
["Armor_63"] = "Pants",
["Armor_60"] = "Hazmat Suit",
["Armor_111"] = "Boots",
["Armor_121"] = "Boots",
["Armor_112"] = "Collared Shirt",
["Armor_122"] = "Flannel Jacket",
["Armor_114"] = "Tank Top",
["Armor_159"] = "Wetsuit",
["Armor_154"] = "Baseball Cap",
["Armor_152"] = "Balaclava",
["Armor_223"] = "Bruno's Helmet",
["Armor_222"] = "Bruno's Chestplate",
["Armor_298"] = "Bone Armor",
["Salvaged_Backpack"] = "Salvaged Backpack"
}
ICON_URLS = {
["Bruno's Helmet"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/f/f1/Brunohelmet.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/f/f1/Brunohelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175533"
},
["Bruno's Chestplate"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Brunochest.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Brunochest.png/revision/latest/scale-to-width-down/100?cb=20250108175253"
},
["Altyn Helmet"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/7/7f/Borishelmet.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/7/7f/Borishelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175818"
},
["Boris Chestplate"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/f/fb/Borischest.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/f/fb/Borischest.png/revision/latest/scale-to-width-down/100?cb=20250108175533"
},
["Hoodie"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/9/95/Hoodie.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/9/95/Hoodie.png/revision/latest/scale-to-width-down/100?cb=20250108171940"
},
["Pants"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/7/7c/Pants1.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/7/7c/Pants1.png/revision/latest?cb=20250108173612"
},
["Boots"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/5/59/Boots.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/5/59/Boots.png/revision/latest/scale-to-width-down/100?cb=20250108173821"
},
["Steel Helmet"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Steel_Helmet.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Steel_Helmet.png/revision/latest/scale-to-width-down/100?cb=20250108133300"
},
["Steel Chestplate"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Steelchest.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Steelchest.png/revision/latest/scale-to-width-down/100?cb=20250108174335"
},
["Steel Leggings"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/d/d6/Steellegs.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/d/d6/Steellegs.png/revision/latest/scale-to-width-down/100?cb=20250108174457"
},
["Military Gloves"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140"
},
["Military Helmet"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Militaryhelmet.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Militaryhelmet.png/revision/latest/scale-to-width-down/100?cb=20250108174723"
},
["Military Chestplate"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/c/c6/Militarychest.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/c/c6/Militarychest.png/revision/latest/scale-to-width-down/100?cb=20250108174935"
},
["Military Leggings"] = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/7/70/Militarylegs.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/fallen-survival-new/images/7/70/Militarylegs.png/revision/latest/scale-to-width-down/100?cb=20250108174723"
},
["Cloth Head Wrap"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Clothhelmet.png/revision/latest?format=original" },
["Cloth Shirt"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/8/8d/Clothshirt.png/revision/latest?format=original" },
["Cloth Pants"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/61/Clothpants.png/revision/latest?format=original" },
["Cloth Footwraps"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e8/Clothboots.png/revision/latest?format=original" },
["Cloth Handwraps"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/98/Clothgloves.png/revision/latest?format=original" },
["Wooden Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/20/Woodhelm.png/revision/latest?format=original" },
["Wooden Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/8/87/Woodchest.png/revision/latest?format=original" },
["Wooden Leggings"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f8/Woodleg.png/revision/latest?format=original" },
["Salvaged Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/46/Salvagedhelm.png/revision/latest?format=original" },
["Salvaged Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e2/Salvagedchest.png/revision/latest?format=original" },
["Salvaged Leggings"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/be/Salvagedlegs.png/revision/latest?format=original" },
["Salvaged Gloves"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest?format=original" },
["Leather Gloves"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Leathergloves.png/revision/latest?format=original" },
["Shorts"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/47/Pants.png/revision/latest?format=original" },
["Collared Shirt"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/ba/Collaredshirt.png/revision/latest?format=original" },
["Flannel Jacket"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/26/Flanneljacket.png/revision/latest?format=original" },
["Tank Top"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2b/Tanktop.png/revision/latest?format=original" },
["Baseball Cap"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/91/Cap.png/revision/latest?format=original" },
["Balaclava"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2a/Balaclava.png/revision/latest?format=original" },
["Wetsuit"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/5f/Wetsuit.png/revision/latest?format=original" },
["Hazmat Suit"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Hazmat.png/revision/latest?format=original" },
["Bone Armor"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7d/Bonearmour.png/revision/latest?format=original" }
}
WEAPON_ICON_URLS = {
["Altyn Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7f/Borishelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175818" },
["Auto Turret"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f9/Auto_Turret_icon.png/revision/latest?cb=20151106062203" },
["Balaclava"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2a/Balaclava.png/revision/latest/scale-to-width-down/100?cb=20250108174723" },
["Bandage"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f8/Bandage_icon.png/revision/latest?cb=20151106061541" },
["Base Cabinet"] = { "https://static.wikia.nocookie.net/play-rust/images/5/57/Tool_Cupboard_icon.png/revision/latest?cb=20151106061824" },
["Baseball Cap"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/91/Cap.png/revision/latest/scale-to-width-down/100?cb=20250108174935" },
["Bear Trap"] = { "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-trap-bear-300x300.png" },
["Blueberry"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/af/Blueberries.png/revision/latest/scale-to-width-down/100?cb=20250108163924" },
["Blueprint"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/98/Blueprint.png/revision/latest?cb=20250108011413" },
["Bone Armor"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7d/Bonearmour.png/revision/latest/scale-to-width-down/100?cb=20250108175533" },
["Bone Tool"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/4e/Bone_Tool.png/revision/latest?cb=20250111164426" },
["Boots"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/59/Boots.png/revision/latest/scale-to-width-down/100?cb=20250108173821" },
["Boris Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/f/fb/Borischest.png/revision/latest/scale-to-width-down/100?cb=20250108175533" },
["Boris Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7f/Borishelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175818" },
["Boris's Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/f/fb/Borischest.png/revision/latest/scale-to-width-down/100?cb=20250108175533" },
["Boulder"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/21/Boulder.png/revision/latest?cb=20250407023615" },
["Bruno Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Brunochest.png/revision/latest/scale-to-width-down/100?cb=20250108175253" },
["Bruno Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f1/Brunohelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175533" },
["Bruno's Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Brunochest.png/revision/latest/scale-to-width-down/100?cb=20250108175253" },
["Bruno's Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f1/Brunohelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175533" },
["Cactus"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6b/Cactusflesh.png/revision/latest/scale-to-width-down/100?cb=20250108160111" },
["Chainsaw"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/c/cc/Chainsaw.png/revision/latest?cb=20250111164731" },
["Cloth Footwraps"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e8/Clothboots.png/revision/latest/scale-to-width-down/100?cb=20250108173612" },
["Cloth Handwraps"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/98/Clothgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175253" },
["Cloth Head Wrap"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Clothhelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175140" },
["Cloth Headwrap"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Clothhelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175140" },
["Cloth Hoodie"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/95/Hoodie.png/revision/latest/scale-to-width-down/100?cb=20250108171940" },
["Cloth Pants"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/61/Clothpants.png/revision/latest/scale-to-width-down/100?cb=20250108174207" },
["Cloth Shirt"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/8/8d/Clothshirt.png/revision/latest/scale-to-width-down/100?cb=20250108200247" },
["Collared Shirt"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/ba/Collaredshirt.png/revision/latest/scale-to-width-down/100?cb=20250108173822" },
["Corn"] = { "https://static.wikia.nocookie.net/play-rust/images/0/0a/Corn_icon.png/revision/latest?cb=20151106061809" },
["Crossbow"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/51/Crossbow_.png/revision/latest/scale-to-width-down/180?cb=20250108154725" },
["Dynamite Bundle"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/b3/Dynamite_Bundle.png/revision/latest?cb=20250112104649" },
["Dynamite Stick"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/20/Dynamite_Stick.png/revision/latest?cb=20250112104836" },
["Flannel Jacket"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/26/Flanneljacket.png/revision/latest/scale-to-width-down/100?cb=20250108174334" },
["Garage Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a6/Garage_Door.png/revision/latest?cb=20250111213531" },
["Hammer"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/8/81/Hammer.png/revision/latest?cb=20250108004728" },
["Hard Hat"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/4e/Hardhat.png/revision/latest/scale-to-width-down/100?cb=20250108174723" },
["Hazmat Suit"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Hazmat.png/revision/latest?cb=20250108173611" },
["Hemp"] = { "https://static.wikia.nocookie.net/play-rust/images/c/c9/Hemp_Clone_icon.png/revision/latest?cb=20170122060314" },
["Hemp Fiber"] = { "https://static.wikia.nocookie.net/play-rust/images/c/c9/Hemp_Clone_icon.png/revision/latest?cb=20170122060314" },
["Hoodie"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/95/Hoodie.png/revision/latest/scale-to-width-down/100?cb=20250108171940" },
["Iron Shard Hatchet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d7/Iron_Shard_Hatchet.png/revision/latest?cb=20250111164603" },
["Iron Shard Pickaxe"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d0/Iron_Shard_Pickaxe.png/revision/latest?cb=20250111164539" },
["Landmine"] = { "https://www.corrosionhour.com/wp-content/uploads/2022/04/rust-trap-landmine-homemade-300x300.png" },
["Large Battery"] = { "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-electric-battery-rechargable-large-300x300.png" },
["Large Box"] = { "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-box-wooden-large-300x300.png" },
["Large Medkit"] = { "https://static.wikia.nocookie.net/play-rust/images/9/99/Large_Medkit_icon.png/revision/latest?cb=20151106054425" },
["Leather Boots"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6d/Leatherboots.png/revision/latest/scale-to-width-down/100?cb=20250108174207" },
["Leather Gloves"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Leathergloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140" },
["Leather Pants"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Leatherpants.png/revision/latest/scale-to-width-down/100?cb=20250108173822" },
["Leather Poncho"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/ba/Leatherponcho.png/revision/latest/scale-to-width-down/100?cb=20250108173822" },
["Leather Shirt"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/0/0a/Leathertunic.png/revision/latest/scale-to-width-down/100?cb=20250108174207" },
["Leather_Pants"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Leatherpants.png/revision/latest/scale-to-width-down/100?cb=20250108173822" },
["Lemon"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/3/35/Lemon.png/revision/latest/scale-to-width-down/100?cb=20250108163730" },
["Machete"] = { "https://static.wikia.nocookie.net/play-rust/images/3/34/Machete_icon.png/revision/latest?cb=20151106060741" },
["Medium Battery"] = { "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-electric-battery-rechargable-medium-300x300.png" },
["Metal"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Metal Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/c/cd/Metal_Door.png/revision/latest?cb=20250112101940" },
["Metal Double Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e5/Metal_Double_Door.png/revision/latest?cb=20250111213501" },
["Metal Node"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Metal Ore"] = { "https://static.wikia.nocookie.net/play-rust/images/0/0a/Metal_Ore_icon.png/revision/latest?cb=20151106060814" },
["MetalNode"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Metal_Node"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Military AA12"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/57/Military_AA12.png/revision/latest/scale-to-width-down/180?cb=20250109110407" },
["Military Backpack"] = { "https://www.corrosionhour.com/wp-content/uploads/2024/01/rust-largebackpack-300x300.png" },
["Military Barret"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/26/Military_Barrett_.png/revision/latest/scale-to-width-down/180?cb=20250108155608" },
["Military Barrett"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/26/Military_Barrett_.png/revision/latest/scale-to-width-down/180?cb=20250108155608" },
["Military Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c6/Militarychest.png/revision/latest/scale-to-width-down/100?cb=20250108174935" },
["Military Gloves"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140" },
["Military Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Militaryhelmet.png/revision/latest/scale-to-width-down/100?cb=20250108174723" },
["Military Leggings"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/70/Militarylegs.png/revision/latest/scale-to-width-down/100?cb=20250108174723" },
["Military M39"] = { "https://static.wikia.nocookie.net/play-rust/images/3/36/M39_Rifle_icon.png/revision/latest?cb=20190420225317" },
["Military M4A1"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/b3/Military_M4A1.png/revision/latest/scale-to-width-down/180?cb=20250108152536" },
["Military MP7"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/69/Military_MP7_.png/revision/latest/scale-to-width-down/180?cb=20250108153052" },
["Military PKM"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a6/Military_PKM.png/revision/latest/scale-to-width-down/180?cb=20250108152201" },
["Military USP"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c8/Military_USP_.png/revision/latest/scale-to-width-down/180?cb=20250108155646" },
["Mining Drill"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f0/Mining_Drill.png/revision/latest?cb=20250111164710" },
["Nail Gun"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Nail_Gun_.png/revision/latest/scale-to-width-down/180?cb=20250108154650" },
["Nailgun"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Nail_Gun_.png/revision/latest/scale-to-width-down/180?cb=20250108154650" },
["Pants"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7c/Pants1.png/revision/latest?cb=20250108173612" },
["Phosphate"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Pumpkin"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/64/Pumpkin.png/revision/latest/scale-to-width-down/100?cb=20250108163605" },
["Pumpkin Launcher"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/b1/Pumpkin_Launcher_.png/revision/latest?cb=20250108161011" },
["Raspberry"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7e/Raspberries.png/revision/latest/scale-to-width-down/100?cb=20250108163842" },
["Salvaged AK4"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/ab/Fallen_-_Ak47.png/revision/latest/scale-to-width-down/180?cb=20250107194018" },
["Salvaged AK47"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/ab/Fallen_-_Ak47.png/revision/latest/scale-to-width-down/180?cb=20250107194018" },
["Salvaged AK74u"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a5/Salvaged_AK74U_.png/revision/latest/scale-to-width-down/180?cb=20250108153258" },
["Salvaged Backpack"] = { "https://www.corrosionhour.com/wp-content/uploads/2024/01/rust-smallbackpack-300x300.png" },
["Salvaged Break Action"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/7/78/Salvaged_Break_Action.png/revision/latest/scale-to-width-down/180?cb=20250109110155" },
["Salvaged Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e2/Salvagedchest.png/revision/latest/scale-to-width-down/100?cb=20250108174457" },
["Salvaged Gloves"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140" },
["Salvaged Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/46/Salvagedhelm.png/revision/latest/scale-to-width-down/100?cb=20250108174457" },
["Salvaged Leggings"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/b/be/Salvagedlegs.png/revision/latest/scale-to-width-down/100?cb=20250108175140" },
["Salvaged M14"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/55/Salvaged_M14_.png/revision/latest/scale-to-width-down/180?cb=20250108155717" },
["Salvaged Metal Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d4/Salvaged_Metal_Door.png/revision/latest?cb=20250111213231" },
["Salvaged P250"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/1/1c/Salvaged_P250.png/revision/latest/scale-to-width-down/180?cb=20250108155928" },
["Salvaged Pipe Rifle"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/50/Pipe_Rifle.png/revision/latest/scale-to-width-down/180?cb=20250109111303" },
["Salvaged Pump Action"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/0/0a/Salvaged_Pump_Action.png/revision/latest/scale-to-width-down/180?cb=20250109110837" },
["Salvaged Python"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2d/Salvaged_Python_.png/revision/latest/scale-to-width-down/180?cb=20250108155754" },
["Salvaged RPG"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/1/11/Salvaged_RPG_.png/revision/latest?cb=20250108161113" },
["Salvaged SMG"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d4/Salvaged_SMG_.png/revision/latest/scale-to-width-down/180?cb=20250108153138" },
["Salvaged Shotgun"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a0/Salvaged_Shotgun_.png/revision/latest/scale-to-width-down/180?cb=20250108154605" },
["Salvaged Skorpion"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c6/Salvaged_Skorpion_.png/revision/latest/scale-to-width-down/180?cb=20250108153325" },
["Salvaged Sniper"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/56/Salvaged_Sniper.png/revision/latest/scale-to-width-down/180?cb=20250302204446" },
["Shorts"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/47/Pants.png/revision/latest/scale-to-width-down/100?cb=20250108174206" },
["Shotgun Turret"] = { "https://static.wikia.nocookie.net/play-rust/images/6/6c/Shotgun_Trap_icon.png/revision/latest/scale-to-width-down/268?cb=20170721103159" },
["Sleeping Bag"] = { "https://static.wikia.nocookie.net/play-rust/images/b/be/Sleeping_Bag_icon.png/revision/latest?cb=20160211200428" },
["Small Battery"] = { "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-electric-battery-rechargable-small-300x300.png" },
["Small Box"] = { "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-box-wooden-300x300.png" },
["Small Medkit"] = { "https://static.wikia.nocookie.net/play-rust/images/9/99/Medical_Syringe_icon.png/revision/latest?cb=20151106061059" },
["Steel Axe"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/c/ce/Steel_Axe.png/revision/latest?cb=20250111164646" },
["Steel Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Steelchest.png/revision/latest/scale-to-width-down/100?cb=20250108174335" },
["Steel Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/61/Steel_Door.png/revision/latest?cb=20250112102424" },
["Steel Double Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/e/ec/Steel_Double_Door.png/revision/latest?cb=20250111213604" },
["Steel Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Steel_Helmet.png/revision/latest/scale-to-width-down/100?cb=20250108133300" },
["Steel Leggings"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d6/Steellegs.png/revision/latest/scale-to-width-down/100?cb=20250108174457" },
["Steel Pickaxe"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d1/Steel_Pickaxe.png/revision/latest?cb=20250111164626" },
["Stone"] = { "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145" },
["Stone Hatchet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d6/Stone_Hatchet.png/revision/latest?cb=20250111164512" },
["Stone Node"] = { "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145" },
["Stone Ore"] = { "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145" },
["Stone Pickaxe"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/4/40/Stone_Pickaxe.png/revision/latest?cb=20250111164447" },
["Stone Spear"] = { "https://static.wikia.nocookie.net/play-rust/images/0/0a/Stone_Spear_icon.png/revision/latest?cb=20151106061726" },
["StoneNode"] = { "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145" },
["Stone_Node"] = { "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145" },
["Stones"] = { "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145" },
["Storage Cabinet"] = { "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-coffin-storage-300x300.png" },
["Sulfur"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Sulfur Node"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Sulfur Ore"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["SulfurNode"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Sulfur_Node"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["Tactical Gloves"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140" },
["Tank Top"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2b/Tanktop.png/revision/latest/scale-to-width-down/100?cb=20250108173612" },
["Timed Charge"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6d/Timed_Charge.png/revision/latest?cb=20250112104716" },
["Tomato"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9d/Tomato.png/revision/latest/scale-to-width-down/100?cb=20250108164012" },
["Trap Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Trap_Door.png/revision/latest?cb=20250112102923" },
["Tree"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551" },
["Tree Large"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551" },
["Tree Medium"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551" },
["Tree Small"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551" },
["Tree XL"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551" },
["Wetsuit"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/5/5f/Wetsuit.png/revision/latest?cb=20250108175934" },
["Windmill"] = { "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wind_Turbine_icon.png/revision/latest/scale-to-width-down/1000?cb=20151106061147" },
["Wire Cutters"] = { "https://static.wikia.nocookie.net/play-rust/images/e/e0/Wire_Tool_icon.png/revision/latest?cb=20230420081635" },
["Wooden Bow"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/1/13/Wooden_Bow_.png/revision/latest/scale-to-width-down/180?cb=20250108154800" },
["Wooden Chestplate"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/8/87/Woodchest.png/revision/latest/scale-to-width-down/100?cb=20250108174335" },
["Wooden Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2c/Wooden_Door.png/revision/latest?cb=20250111212634" },
["Wooden Double Door"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/a/af/Wooden_Double_Door.png/revision/latest?cb=20250112101523" },
["Wooden Helmet"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/2/20/Woodhelm.png/revision/latest/scale-to-width-down/100?cb=20250108174335" },
["Wooden Leggings"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f8/Woodleg.png/revision/latest/scale-to-width-down/100?cb=20250108174456" },
["Wooden Spear"] = { "https://static.wikia.nocookie.net/fallen-survival-new/images/1/17/Wooden_Spear.png/revision/latest?cb=20250407032830" },
["Wool"] = { "https://static.wikia.nocookie.net/play-rust/images/c/c9/Hemp_Clone_icon.png/revision/latest?cb=20170122060314" },
["metal_node"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
["stone_node"] = { "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145" },
["sulfur_node"] = { "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904" },
}
WEAPON_ITEMS = {
["Blade"] = true,
["Blueberries"] = true,
["Cactus Flesh"] = true,
["Cactus flesh"] = true,
["Cactusflesh"] = true,
["Chocolate Bar"] = true,
["Circuit Board"] = true,
["Circuit Boards"] = true,
["Circuit board"] = true,
["Copper Cogs"] = true,
["Duct Tape"] = true,
["Fish Can"] = true,
["Glue"] = true,
["Ligther"] = true,
["Metal Plating"] = true,
["Metal Scraps"] = true,
["Milk"] = true,
["Pink Card"] = true,
["Pink Keycard"] = true,
["Pipe"] = true,
["Pistol Receiver"] = true,
["Power Cell"] = true,
["Power cell"] = true,
["Purple Card"] = true,
["Purple Keycard"] = true,
["Raspberries"] = true,
["Red Card"] = true,
["Red Keycard"] = true,
["Rifle Receiver"] = true,
["Rope"] = true,
["SMG Receiver"] = true,
["SMG receiver"] = true,
["Semi Receiver"] = true,
["Spring"] = true,
["Tape"] = true,
["Tarp"] = true,
["Thread"] = true,
["Yellow Card"] = true,
["Yellow Keycard"] = true,
["lighter"] = true,
["Altyn Helmet"] = true,
["Auto Turret"] = true,
["Balaclava"] = true,
["Bandage"] = true,
["Base Cabinet"] = true,
["Baseball Cap"] = true,
["Bear Trap"] = true,
["Blueberry"] = true,
["Blueprint"] = true,
["Bone Armor"] = true,
["Bone Tool"] = true,
["Boots"] = true,
["Boris Chestplate"] = true,
["Boris Helmet"] = true,
["Boris's Chestplate"] = true,
["Boulder"] = true,
["Bruno Chestplate"] = true,
["Bruno Helmet"] = true,
["Bruno's Chestplate"] = true,
["Bruno's Helmet"] = true,
["Bruno's M4A1"] = true,
["Cactus"] = true,
["Chainsaw"] = true,
["Cloth Footwraps"] = true,
["Cloth Handwraps"] = true,
["Cloth Head Wrap"] = true,
["Cloth Headwrap"] = true,
["Cloth Hoodie"] = true,
["Cloth Pants"] = true,
["Cloth Shirt"] = true,
["Collared Shirt"] = true,
["Corn"] = true,
["Crossbow"] = true,
["Dynamite Bundle"] = true,
["Dynamite Stick"] = true,
["Flannel Jacket"] = true,
["Garage Door"] = true,
["Halloween Scythe"] = true,
["Hammer"] = true,
["Hard Hat"] = true,
["Hazmat Suit"] = true,
["Hemp"] = true,
["Hemp Fiber"] = true,
["Hoodie"] = true,
["Iron Shard Hatchet"] = true,
["Iron Shard Pickaxe"] = true,
["Landmine"] = true,
["Large Battery"] = true,
["Large Box"] = true,
["Large Medkit"] = true,
["Leather Boots"] = true,
["Leather Gloves"] = true,
["Leather Pants"] = true,
["Leather Poncho"] = true,
["Leather Shirt"] = true,
["Leather_Pants"] = true,
["Lemon"] = true,
["Lighter"] = true,
["Machete"] = true,
["Medium Battery"] = true,
["Metal"] = true,
["Metal Door"] = true,
["Metal Double Door"] = true,
["Metal Node"] = true,
["Metal Ore"] = true,
["MetalNode"] = true,
["Metal_Node"] = true,
["Military AA12"] = true,
["Military Backpack"] = true,
["Military Barret"] = true,
["Military Barrett"] = true,
["Military Chestplate"] = true,
["Military Gloves"] = true,
["Military Grenade Launcher"] = true,
["Military Helmet"] = true,
["Military Leggings"] = true,
["Military M39"] = true,
["Military M4A1"] = true,
["Military MP7"] = true,
["Military PKM"] = true,
["Military USP"] = true,
["Mining Drill"] = true,
["Nail Gun"] = true,
["Nailgun"] = true,
["Pants"] = true,
["Phosphate"] = true,
["Pumpkin"] = true,
["Pumpkin Launcher"] = true,
["Raspberry"] = true,
["Salvaged AK4"] = true,
["Salvaged AK47"] = true,
["Salvaged AK74u"] = true,
["Salvaged Backpack"] = true,
["Salvaged Break Action"] = true,
["Salvaged Chestplate"] = true,
["Salvaged Double Barrel"] = true,
["Salvaged Gloves"] = true,
["Salvaged Grenade Launcher"] = true,
["Salvaged Helmet"] = true,
["Salvaged Leggings"] = true,
["Salvaged M14"] = true,
["Salvaged Metal Door"] = true,
["Salvaged P250"] = true,
["Salvaged Pipe Rifle"] = true,
["Salvaged Pump Action"] = true,
["Salvaged Python"] = true,
["Salvaged RPG"] = true,
["Salvaged SMG"] = true,
["Salvaged Shotgun"] = true,
["Salvaged Shovel"] = true,
["Salvaged Skorpion"] = true,
["Salvaged Sniper"] = true,
["Saw Bat"] = true,
["Shorts"] = true,
["Shotgun Turret"] = true,
["Sleeping Bag"] = true,
["Small Battery"] = true,
["Small Box"] = true,
["Small Medkit"] = true,
["Steel Axe"] = true,
["Steel Chestplate"] = true,
["Steel Door"] = true,
["Steel Double Door"] = true,
["Steel Helmet"] = true,
["Steel Leggings"] = true,
["Steel Pickaxe"] = true,
["Steel Shovel"] = true,
["Stone"] = true,
["Stone Hatchet"] = true,
["Stone Node"] = true,
["Stone Ore"] = true,
["Stone Pickaxe"] = true,
["Stone Spear"] = true,
["StoneNode"] = true,
["Stone_Node"] = true,
["Stones"] = true,
["Storage Cabinet"] = true,
["Sulfur"] = true,
["Sulfur Node"] = true,
["Sulfur Ore"] = true,
["SulfurNode"] = true,
["Sulfur_Node"] = true,
["Tactical Gloves"] = true,
["Tank Top"] = true,
["Timed Charge"] = true,
["Tomato"] = true,
["Trap Door"] = true,
["Tree"] = true,
["Tree Large"] = true,
["Tree Medium"] = true,
["Tree Small"] = true,
["Tree XL"] = true,
["Wetsuit"] = true,
["Windmill"] = true,
["Wire Cutters"] = true,
["Wooden Bow"] = true,
["Wooden Chestplate"] = true,
["Wooden Door"] = true,
["Wooden Double Door"] = true,
["Wooden Helmet"] = true,
["Wooden Leggings"] = true,
["Wooden Spear"] = true,
["Wool"] = true,
["metal_node"] = true,
["stone_node"] = true,
["sulfur_node"] = true,
}
local function armor_norm_item_key(s)
s = tostring(s or "")
s = string.lower(s)
s = string.gsub(s, "[^%w]", "")
return s
end
WEAPON_ICON_LOOKUP = nil
WEAPON_ICON_ALIASES = {
["AK47"] = "Salvaged AK47",
["AK74u"] = "Salvaged AK74u",
["M4A1"] = "Military M4A1",
["M4"] = "Military M4A1",
["P250"] = "Salvaged P250",
["Python"] = "Salvaged Python",
["SMG"] = "Salvaged SMG",
["M14"] = "Salvaged M14",
["RPG"] = "Salvaged RPG",
["Sniper"] = "Salvaged Sniper",
["Skorpion"] = "Salvaged Skorpion",
["Shotgun"] = "Salvaged Shotgun",
["Pump Action"] = "Salvaged Pump Action",
["Pipe Rifle"] = "Salvaged Pipe Rifle",
["Double Barrel"] = "Salvaged Double Barrel",
["Crossbow"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/51/Crossbow_.png/revision/latest/scale-to-width-down/180?cb=20250108154725",
["Bow"] = "Wooden Bow",
["Nailgun"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Nail_Gun_.png/revision/latest/scale-to-width-down/180?cb=20250108154650",
["Nail Gun"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Nail_Gun_.png/revision/latest/scale-to-width-down/180?cb=20250108154650",
}
local function get_weapon_icon_urls(name)
if not name then return nil end
local raw = tostring(name)
if WEAPON_ICON_ALIASES and WEAPON_ICON_ALIASES[raw] and WEAPON_ICON_URLS[WEAPON_ICON_ALIASES[raw]] then
return WEAPON_ICON_URLS[WEAPON_ICON_ALIASES[raw]]
end
if WEAPON_ICON_URLS[raw] then
return WEAPON_ICON_URLS[raw]
end
if not WEAPON_ICON_LOOKUP then
WEAPON_ICON_LOOKUP = {}
for k, v in pairs(WEAPON_ICON_URLS) do
WEAPON_ICON_LOOKUP[armor_norm_item_key(k)] = v
end
end
local nk = armor_norm_item_key(raw)
if WEAPON_ICON_LOOKUP[nk] then
return WEAPON_ICON_LOOKUP[nk]
end
local variants = {
nk,
string.gsub(nk, "salvaged", ""),
string.gsub(nk, "military", ""),
string.gsub(nk, "improvised", ""),
string.gsub(nk, "steel", ""),
string.gsub(nk, "wooden", ""),
string.gsub(nk, "custom", "")
}
for _, var in ipairs(variants) do
if var ~= "" and WEAPON_ICON_LOOKUP[var] then
return WEAPON_ICON_LOOKUP[var]
end
end
for k, v in pairs(WEAPON_ICON_URLS) do
local kk = armor_norm_item_key(k)
for _, var in ipairs(variants) do
if var ~= "" and kk ~= "" then
if string.find(kk, var, 1, true) or string.find(var, kk, 1, true) then
return v
end
end
end
end
return nil
end
RARITY = {
["Cloth"]    = {0.75, 0.75, 0.75},
["Wooden"]   = {0.65, 0.42, 0.20},
["Leather"]  = {0.75, 0.45, 0.22},
["Salvaged"] = {0.30, 0.75, 1.00},
["Steel"]    = {0.78, 0.82, 0.88},
["Military"] = {0.15, 1.00, 0.35},
["Altyn"]    = {1.00, 0.25, 0.15},
["Boris"]    = {1.00, 0.18, 0.12},
["Bruno"]    = {1.00, 0.72, 0.12},
["Bone"]     = {0.95, 0.88, 0.68},
["Hazmat"]   = {1.00, 0.92, 0.10},
["Backpack"] = {0.55, 0.75, 1.00}
}
icon_state = {}
WEAPON_DIRECT_ICON_URLS = {
["Yellow Card"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a2/Yellow_Keycard.png/revision/latest?format=original",
["Thread"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/0e/Thread.png/revision/latest?format=original",
["Tarp"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/4d/Tarp.png/revision/latest?format=original",
["Tape"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/06/Tape.png/revision/latest?format=original",
["Spring"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/cf/Spring.png/revision/latest?format=original",
["Semi Receiver"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2d/Semi_Receiver.png/revision/latest?format=original",
["SMG receiver"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/94/SMG_Receiver.png/revision/latest?format=original",
["SMG Receiver"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/94/SMG_Receiver.png/revision/latest?format=original",
["Rope"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/b/b2/Rope.png/revision/latest?format=original",
["Rifle Receiver"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/8/80/Rifle_Receiver1.png/revision/latest?format=original",
["Red Card"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/4e/Red_Keycard.png/revision/latest?format=original",
["Raspberries"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7e/Raspberries.png/revision/latest/scale-to-width-down/100?cb=20250108163842",
["Purple Card"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/8/87/Purple_Keycard.png/revision/latest?format=original",
["Power cell"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/09/Power_Cell.png/revision/latest?format=original",
["Power Cell"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/09/Power_Cell.png/revision/latest?format=original",
["Pistol Receiver"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Pistol_Receiver.png/revision/latest?format=original",
["Pipe"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6e/Pipe.png/revision/latest?format=original",
["Pink Card"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Pink_Keycard.png/revision/latest?format=original",
["Milk"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/4d/Milk.png/revision/latest?format=original",
["Metal Scraps"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/1/16/Metal_Scraps.png/revision/latest?format=original",
["Metal Plating"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/5c/Metal_Plating.png/revision/latest?format=original",
["Glue"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e7/Glue.png/revision/latest?format=original",
["Fish Can"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7e/Fish_Can.png/revision/latest?format=original",
["Duct Tape"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/06/Tape.png/revision/latest?format=original",
["Copper Cogs"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c4/Copper_Cogs.png/revision/latest?format=original",
["Circuit board"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Circuit_Boards.png/revision/latest?format=original",
["Circuit Boards"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Circuit_Boards.png/revision/latest?format=original",
["Chocolate Bar"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/28/Chocolate_Bar.png/revision/latest?format=original",
["Cactus flesh"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6b/Cactusflesh.png/revision/latest/scale-to-width-down/100?cb=20250108160111",
["Blueberries"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/af/Blueberries.png/revision/latest/scale-to-width-down/100?cb=20250108163924",
["Blade"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6e/Blade.png/revision/latest?format=original",
["Lighter"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c4/Lighter.png/revision/latest/scale-to-width-down/55?cb=20250407023539",
["Altyn Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7f/Borishelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175818",
["Auto Turret"] = "https://static.wikia.nocookie.net/play-rust/images/f/f9/Auto_Turret_icon.png/revision/latest?cb=20151106062203",
["Balaclava"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2a/Balaclava.png/revision/latest/scale-to-width-down/100?cb=20250108174723",
["Bandage"] = "https://static.wikia.nocookie.net/play-rust/images/f/f8/Bandage_icon.png/revision/latest?cb=20151106061541",
["Base Cabinet"] = "https://static.wikia.nocookie.net/play-rust/images/5/57/Tool_Cupboard_icon.png/revision/latest?cb=20151106061824",
["Baseball Cap"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/91/Cap.png/revision/latest/scale-to-width-down/100?cb=20250108174935",
["Bear Trap"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-trap-bear-300x300.png",
["Blueberry"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/af/Blueberries.png/revision/latest/scale-to-width-down/100?cb=20250108163924",
["Blueprint"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/98/Blueprint.png/revision/latest?cb=20250108011413",
["Bone Armor"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7d/Bonearmour.png/revision/latest/scale-to-width-down/100?cb=20250108175533",
["Bone Tool"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/4e/Bone_Tool.png/revision/latest?cb=20250111164426",
["Boots"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/59/Boots.png/revision/latest/scale-to-width-down/100?cb=20250108173821",
["Boris Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/f/fb/Borischest.png/revision/latest/scale-to-width-down/100?cb=20250108175533",
["Boris Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7f/Borishelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175818",
["Boris's Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/f/fb/Borischest.png/revision/latest/scale-to-width-down/100?cb=20250108175533",
["Boulder"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/21/Boulder.png/revision/latest?cb=20250407023615",
["Bruno Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Brunochest.png/revision/latest/scale-to-width-down/100?cb=20250108175253",
["Bruno Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f1/Brunohelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175533",
["Bruno's Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Brunochest.png/revision/latest/scale-to-width-down/100?cb=20250108175253",
["Bruno's Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f1/Brunohelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175533",
["Cactus"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6b/Cactusflesh.png/revision/latest/scale-to-width-down/100?cb=20250108160111",
["Chainsaw"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/cc/Chainsaw.png/revision/latest?cb=20250111164731",
["Cloth Footwraps"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e8/Clothboots.png/revision/latest/scale-to-width-down/100?cb=20250108173612",
["Cloth Handwraps"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/98/Clothgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175253",
["Cloth Head Wrap"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Clothhelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175140",
["Cloth Headwrap"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Clothhelmet.png/revision/latest/scale-to-width-down/100?cb=20250108175140",
["Cloth Hoodie"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/95/Hoodie.png/revision/latest/scale-to-width-down/100?cb=20250108171940",
["Cloth Pants"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/61/Clothpants.png/revision/latest/scale-to-width-down/100?cb=20250108174207",
["Cloth Shirt"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/8/8d/Clothshirt.png/revision/latest/scale-to-width-down/100?cb=20250108200247",
["Collared Shirt"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/b/ba/Collaredshirt.png/revision/latest/scale-to-width-down/100?cb=20250108173822",
["Corn"] = "https://static.wikia.nocookie.net/play-rust/images/0/0a/Corn_icon.png/revision/latest?cb=20151106061809",
["Crossbow"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/51/Crossbow_.png/revision/latest/scale-to-width-down/180?cb=20250108154725",
["Dynamite Bundle"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/b/b3/Dynamite_Bundle.png/revision/latest?cb=20250112104649",
["Dynamite Stick"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/20/Dynamite_Stick.png/revision/latest?cb=20250112104836",
["Flannel Jacket"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/26/Flanneljacket.png/revision/latest/scale-to-width-down/100?cb=20250108174334",
["Garage Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a6/Garage_Door.png/revision/latest?cb=20250111213531",
["Hammer"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/8/81/Hammer.png/revision/latest?cb=20250108004728",
["Hard Hat"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/4e/Hardhat.png/revision/latest/scale-to-width-down/100?cb=20250108174723",
["Hazmat Suit"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Hazmat.png/revision/latest?cb=20250108173611",
["Hemp"] = "https://static.wikia.nocookie.net/play-rust/images/c/c9/Hemp_Clone_icon.png/revision/latest?cb=20170122060314",
["Hemp Fiber"] = "https://static.wikia.nocookie.net/play-rust/images/c/c9/Hemp_Clone_icon.png/revision/latest?cb=20170122060314",
["Hoodie"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/95/Hoodie.png/revision/latest/scale-to-width-down/100?cb=20250108171940",
["Iron Shard Hatchet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d7/Iron_Shard_Hatchet.png/revision/latest?cb=20250111164603",
["Iron Shard Pickaxe"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d0/Iron_Shard_Pickaxe.png/revision/latest?cb=20250111164539",
["Landmine"] = "https://www.corrosionhour.com/wp-content/uploads/2022/04/rust-trap-landmine-homemade-300x300.png",
["Large Battery"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-electric-battery-rechargable-large-300x300.png",
["Large Box"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-box-wooden-large-300x300.png",
["Large Medkit"] = "https://static.wikia.nocookie.net/play-rust/images/9/99/Large_Medkit_icon.png/revision/latest?cb=20151106054425",
["Leather Boots"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6d/Leatherboots.png/revision/latest/scale-to-width-down/100?cb=20250108174207",
["Leather Gloves"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/62/Leathergloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140",
["Leather Pants"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Leatherpants.png/revision/latest/scale-to-width-down/100?cb=20250108173822",
["Leather Poncho"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/b/ba/Leatherponcho.png/revision/latest/scale-to-width-down/100?cb=20250108173822",
["Leather Shirt"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/0a/Leathertunic.png/revision/latest/scale-to-width-down/100?cb=20250108174207",
["Leather_Pants"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Leatherpants.png/revision/latest/scale-to-width-down/100?cb=20250108173822",
["Lemon"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/3/35/Lemon.png/revision/latest/scale-to-width-down/100?cb=20250108163730",
["Machete"] = "https://static.wikia.nocookie.net/play-rust/images/3/34/Machete_icon.png/revision/latest?cb=20151106060741",
["Medium Battery"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-electric-battery-rechargable-medium-300x300.png",
["Metal"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Metal Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/cd/Metal_Door.png/revision/latest?cb=20250112101940",
["Metal Double Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e5/Metal_Double_Door.png/revision/latest?cb=20250111213501",
["Metal Node"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Metal Ore"] = "https://static.wikia.nocookie.net/play-rust/images/0/0a/Metal_Ore_icon.png/revision/latest?cb=20151106060814",
["MetalNode"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Metal_Node"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Military AA12"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/57/Military_AA12.png/revision/latest/scale-to-width-down/180?cb=20250109110407",
["Military Backpack"] = "https://www.corrosionhour.com/wp-content/uploads/2024/01/rust-largebackpack-300x300.png",
["Military Barret"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/26/Military_Barrett_.png/revision/latest/scale-to-width-down/180?cb=20250108155608",
["Military Barrett"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/26/Military_Barrett_.png/revision/latest/scale-to-width-down/180?cb=20250108155608",
["Military Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c6/Militarychest.png/revision/latest/scale-to-width-down/100?cb=20250108174935",
["Military Gloves"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140",
["Military Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Militaryhelmet.png/revision/latest/scale-to-width-down/100?cb=20250108174723",
["Military Leggings"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/70/Militarylegs.png/revision/latest/scale-to-width-down/100?cb=20250108174723",
["Military M39"] = "https://static.wikia.nocookie.net/play-rust/images/3/36/M39_Rifle_icon.png/revision/latest?cb=20190420225317",
["Military M4A1"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/b/b3/Military_M4A1.png/revision/latest/scale-to-width-down/180?cb=20250108152536",
["Military MP7"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/69/Military_MP7_.png/revision/latest/scale-to-width-down/180?cb=20250108153052",
["Military PKM"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a6/Military_PKM.png/revision/latest/scale-to-width-down/180?cb=20250108152201",
["Military USP"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c8/Military_USP_.png/revision/latest/scale-to-width-down/180?cb=20250108155646",
["Mining Drill"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f0/Mining_Drill.png/revision/latest?cb=20250111164710",
["Nail Gun"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Nail_Gun_.png/revision/latest/scale-to-width-down/180?cb=20250108154650",
["Nailgun"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/68/Nail_Gun_.png/revision/latest/scale-to-width-down/180?cb=20250108154650",
["Pants"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7c/Pants1.png/revision/latest?cb=20250108173612",
["Phosphate"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Pumpkin"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/64/Pumpkin.png/revision/latest/scale-to-width-down/100?cb=20250108163605",
["Pumpkin Launcher"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/b/b1/Pumpkin_Launcher_.png/revision/latest?cb=20250108161011",
["Raspberry"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/7e/Raspberries.png/revision/latest/scale-to-width-down/100?cb=20250108163842",
["Salvaged AK4"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/ab/Fallen_-_Ak47.png/revision/latest/scale-to-width-down/180?cb=20250107194018",
["Salvaged AK47"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/ab/Fallen_-_Ak47.png/revision/latest/scale-to-width-down/180?cb=20250107194018",
["Salvaged AK74u"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a5/Salvaged_AK74U_.png/revision/latest/scale-to-width-down/180?cb=20250108153258",
["Salvaged Backpack"] = "https://www.corrosionhour.com/wp-content/uploads/2024/01/rust-smallbackpack-300x300.png",
["Salvaged Break Action"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/7/78/Salvaged_Break_Action.png/revision/latest/scale-to-width-down/180?cb=20250109110155",
["Salvaged Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e2/Salvagedchest.png/revision/latest/scale-to-width-down/100?cb=20250108174457",
["Salvaged Gloves"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140",
["Salvaged Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/46/Salvagedhelm.png/revision/latest/scale-to-width-down/100?cb=20250108174457",
["Salvaged Leggings"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/b/be/Salvagedlegs.png/revision/latest/scale-to-width-down/100?cb=20250108175140",
["Salvaged M14"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/55/Salvaged_M14_.png/revision/latest/scale-to-width-down/180?cb=20250108155717",
["Salvaged Metal Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d4/Salvaged_Metal_Door.png/revision/latest?cb=20250111213231",
["Salvaged P250"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/1/1c/Salvaged_P250.png/revision/latest/scale-to-width-down/180?cb=20250108155928",
["Salvaged Pipe Rifle"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/50/Pipe_Rifle.png/revision/latest/scale-to-width-down/180?cb=20250109111303",
["Salvaged Pump Action"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/0a/Salvaged_Pump_Action.png/revision/latest/scale-to-width-down/180?cb=20250109110837",
["Salvaged Python"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2d/Salvaged_Python_.png/revision/latest/scale-to-width-down/180?cb=20250108155754",
["Salvaged RPG"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/1/11/Salvaged_RPG_.png/revision/latest?cb=20250108161113",
["Salvaged SMG"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d4/Salvaged_SMG_.png/revision/latest/scale-to-width-down/180?cb=20250108153138",
["Salvaged Shotgun"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a0/Salvaged_Shotgun_.png/revision/latest/scale-to-width-down/180?cb=20250108154605",
["Salvaged Skorpion"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/c6/Salvaged_Skorpion_.png/revision/latest/scale-to-width-down/180?cb=20250108153325",
["Salvaged Sniper"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/56/Salvaged_Sniper.png/revision/latest/scale-to-width-down/180?cb=20250302204446",
["Shorts"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/47/Pants.png/revision/latest/scale-to-width-down/100?cb=20250108174206",
["Shotgun Turret"] = "https://static.wikia.nocookie.net/play-rust/images/6/6c/Shotgun_Trap_icon.png/revision/latest/scale-to-width-down/268?cb=20170721103159",
["Sleeping Bag"] = "https://static.wikia.nocookie.net/play-rust/images/b/be/Sleeping_Bag_icon.png/revision/latest?cb=20160211200428",
["Small Battery"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-electric-battery-rechargable-small-300x300.png",
["Small Box"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-box-wooden-300x300.png",
["Small Medkit"] = "https://static.wikia.nocookie.net/play-rust/images/9/99/Medical_Syringe_icon.png/revision/latest?cb=20151106061059",
["Steel Axe"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/c/ce/Steel_Axe.png/revision/latest?cb=20250111164646",
["Steel Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/3/3b/Steelchest.png/revision/latest/scale-to-width-down/100?cb=20250108174335",
["Steel Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/61/Steel_Door.png/revision/latest?cb=20250112102424",
["Steel Double Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/e/ec/Steel_Double_Door.png/revision/latest?cb=20250111213604",
["Steel Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/49/Steel_Helmet.png/revision/latest/scale-to-width-down/100?cb=20250108133300",
["Steel Leggings"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d6/Steellegs.png/revision/latest/scale-to-width-down/100?cb=20250108174457",
["Steel Pickaxe"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d1/Steel_Pickaxe.png/revision/latest?cb=20250111164626",
["Stone"] = "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145",
["Stone Hatchet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/d/d6/Stone_Hatchet.png/revision/latest?cb=20250111164512",
["Stone Node"] = "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145",
["Stone Ore"] = "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145",
["Stone Pickaxe"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/4/40/Stone_Pickaxe.png/revision/latest?cb=20250111164447",
["Stone Spear"] = "https://static.wikia.nocookie.net/play-rust/images/0/0a/Stone_Spear_icon.png/revision/latest?cb=20151106061726",
["StoneNode"] = "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145",
["Stone_Node"] = "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145",
["Stones"] = "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145",
["Storage Cabinet"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-coffin-storage-300x300.png",
["Sulfur"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Sulfur Node"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Sulfur Ore"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["SulfurNode"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Sulfur_Node"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Tactical Gloves"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/a8/Salvagedgloves.png/revision/latest/scale-to-width-down/100?cb=20250108175140",
["Tank Top"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2b/Tanktop.png/revision/latest/scale-to-width-down/100?cb=20250108173612",
["Timed Charge"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6d/Timed_Charge.png/revision/latest?cb=20250112104716",
["Tomato"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9d/Tomato.png/revision/latest/scale-to-width-down/100?cb=20250108164012",
["Trap Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/9/9f/Trap_Door.png/revision/latest?cb=20250112102923",
["Tree"] = "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551",
["Tree Large"] = "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551",
["Tree Medium"] = "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551",
["Tree Small"] = "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551",
["Tree XL"] = "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wood_icon.png/revision/latest?cb=20151106061551",
["Wetsuit"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/5/5f/Wetsuit.png/revision/latest?cb=20250108175934",
["Windmill"] = "https://static.wikia.nocookie.net/play-rust/images/f/f2/Wind_Turbine_icon.png/revision/latest/scale-to-width-down/1000?cb=20151106061147",
["Wire Cutters"] = "https://static.wikia.nocookie.net/play-rust/images/e/e0/Wire_Tool_icon.png/revision/latest?cb=20230420081635",
["Wooden Bow"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/1/13/Wooden_Bow_.png/revision/latest/scale-to-width-down/180?cb=20250108154800",
["Wooden Chestplate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/8/87/Woodchest.png/revision/latest/scale-to-width-down/100?cb=20250108174335",
["Wooden Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/2c/Wooden_Door.png/revision/latest?cb=20250111212634",
["Wooden Double Door"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/a/af/Wooden_Double_Door.png/revision/latest?cb=20250112101523",
["Wooden Helmet"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/2/20/Woodhelm.png/revision/latest/scale-to-width-down/100?cb=20250108174335",
["Wooden Leggings"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/f/f8/Woodleg.png/revision/latest/scale-to-width-down/100?cb=20250108174456",
["Wooden Spear"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/1/17/Wooden_Spear.png/revision/latest?cb=20250407032830",
["Wool"] = "https://static.wikia.nocookie.net/play-rust/images/c/c9/Hemp_Clone_icon.png/revision/latest?cb=20170122060314",
["metal_node"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["stone_node"] = "https://static.wikia.nocookie.net/play-rust/images/8/85/Stones_icon.png/revision/latest?cb=20150405123145",
["sulfur_node"] = "https://static.wikia.nocookie.net/play-rust/images/2/22/Sulfur_Ore_icon.png/revision/latest?cb=20151106061904",
["Wooden Crate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/00/Wooden_Crate.png/revision/latest/scale-to-width-down/180?cb=20250112010042",
["Locked Wooden Crate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/0/00/Wooden_Crate.png/revision/latest/scale-to-width-down/180?cb=20250112010042",
["Metal Crate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e7/Metal_Crate.png/revision/latest/scale-to-width-down/180?cb=20250112011044",
["Locked Metal Crate"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/e/e7/Metal_Crate.png/revision/latest/scale-to-width-down/180?cb=20250112011044",
["Steel Crate"] = "https://static.wikia.nocookie.net/play-rust/images/9/90/Locked_Crate.jpg/revision/latest/scale-to-width-down/180?cb=20210105201339",
["Locked Steel Crate"] = "https://static.wikia.nocookie.net/play-rust/images/9/90/Locked_Crate.jpg/revision/latest/scale-to-width-down/180?cb=20210105201339",
["Food Crate"] = "https://static.wikia.nocookie.net/play-rust/images/d/d7/Basic_Crate.png/revision/latest/scale-to-width-down/177?cb=20250128033438",
["Timed Crate"] = "https://static.wikia.nocookie.net/play-rust/images/9/90/Locked_Crate.jpg/revision/latest/scale-to-width-down/180?cb=20210105201339",
["Care Package"] = "https://static.wikia.nocookie.net/play-rust/images/4/49/Airdrop_Supply_Crate.jpg/revision/latest/scale-to-width-down/300?cb=20140723124718",
["Trash Can"] = "https://static.wikia.nocookie.net/fallensurvival/images/6/6e/Trash.png/revision/latest/scale-to-width-down/320?cb=20240613051520",
["Oil Barrel"] = "https://static.wikia.nocookie.net/fallensurvival/images/0/06/Oil.png/revision/latest/scale-to-width-down/320?cb=20240613051409",
["Body Bag"] = "https://static.wikia.nocookie.net/fallen-survival-new/images/6/6d/Body_Bag.png/revision/latest?format=original",
["Sleeper"] = "https://static.wikia.nocookie.net/play-rust/images/b/be/Sleeping_Bag_icon.png/revision/latest?cb=20160211200428",
["Wooden Boat"] = "https://static.wikia.nocookie.net/play-rust/images/c/c9/Screenshot_2-0.png/revision/latest/scale-to-width-down/283?cb=20200416084931",
["Military Boat"] = "https://static.wikia.nocookie.net/play-rust/images/c/c9/Screenshot_2-0.png/revision/latest/scale-to-width-down/283?cb=20200416084931",
["Salvaged Flycopter"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-transport-minicopter-300x300.png",
["Flycopter"] = "https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-transport-minicopter-300x300.png",
}
WEAPON_DIRECT_ALIASES = {
["Blueberries"] = "Blueberry",
["Cactus Flesh"] = "Cactus flesh",
["Cactusflesh"] = "Cactus flesh",
["Circuit Board"] = "Circuit board",
["Circuit Boards"] = "Circuit board",
["Pink Keycard"] = "Pink Card",
["Power Cell"] = "Power cell",
["Purple Keycard"] = "Purple Card",
["Raspberries"] = "Raspberry",
["Red Keycard"] = "Red Card",
["SMG Receiver"] = "SMG receiver",
["Yellow Keycard"] = "Yellow Card",
["Ligther"] = "Lighter",
["lighter"] = "Lighter",
["Torch"] = "Lighter",
["Flashlight"] = "Lighter",
["AA12"] = "Military AA12",
["AK-47"] = "Salvaged AK47",
["AK4"] = "Salvaged AK4",
["AK47"] = "Salvaged AK47",
["AK74U"] = "Salvaged AK74u",
["AK74u"] = "Salvaged AK74u",
["Axe"] = "Steel Axe",
["Barret"] = "Military Barrett",
["Barrett"] = "Military Barrett",
["Bow"] = "Wooden Bow",
["Break Action"] = "Salvaged Break Action",
["C4"] = "Timed Charge",
["Charge"] = "Timed Charge",
["Crossbow"] = "Crossbow",
["Double Barrel"] = "Salvaged Double Barrel",
["Drill"] = "Mining Drill",
["Dynamite"] = "Dynamite Stick",
["Hatchet"] = "Stone Hatchet",
["M14"] = "Salvaged M14",
["M39"] = "Military M39",
["M4"] = "Military M4A1",
["M4A1"] = "Military M4A1",
["MP7"] = "Military MP7",
["Medkit"] = "Large Medkit",
["Military Barret"] = "Military Barrett",
["Nail Gun"] = "Nail Gun",
["Nailgun"] = "Nail Gun",
["P250"] = "Salvaged P250",
["PKM"] = "Military PKM",
["Pickaxe"] = "Stone Pickaxe",
["Pipe Rifle"] = "Salvaged Pipe Rifle",
["Pump Action"] = "Salvaged Pump Action",
["Python"] = "Salvaged Python",
["RPG"] = "Salvaged RPG",
["SMG"] = "Salvaged SMG",
["Shotgun"] = "Salvaged Shotgun",
["Skorpion"] = "Salvaged Skorpion",
["Sniper"] = "Salvaged Sniper",
["USP"] = "Military USP",
}
item_cache = {}
hover_alpha = {}
target_alpha = 0
last_target_key = nil
pulse_until = 0
hotbar_x = 960
hotbar_y = 760
draw_x = hotbar_x
draw_y = hotbar_y
dragging = false
drag_dx = 0
drag_dy = 0
hotbar_vertical = false
armoriso_cached_target = nil
armoriso_cached_target_at = 0
armoriso_players_available_cache = true
armoriso_players_available_at = 0
armoriso_cached_size = 48
armoriso_cached_glow_power = 0
armoriso_cached_max_dist = 1000
UIManager.CreateTab(TAB_ID, "Eclipze")
UIManager.CreateText("armoriso_title", "Armor ESP")
UIManager.SetElementParent("armoriso_title", TAB_ID)
UIManager.CreateCheckbox("armoriso_target_enabled", "Enabled", true)
UIManager.SetElementParent("armoriso_target_enabled", TAB_ID)
UIManager.CreateCheckbox("armoriso_show_weapon", "Show Weapon Slot", true)
UIManager.SetElementParent("armoriso_show_weapon", TAB_ID)
UIManager.SetElementSameLine("armoriso_show_weapon", true)
UIManager.CreateColorPicker("armoriso_border_color", "Border Color", 1, 1, 1, 1)
UIManager.SetElementParent("armoriso_border_color", TAB_ID)
UIManager.SetElementSameLine("armoriso_border_color", true)
UIManager.CreateCheckbox("armoriso_rainbow_border", "Rainbow Border", false)
UIManager.SetElementParent("armoriso_rainbow_border", TAB_ID)
UIManager.SetElementSameLine("armoriso_rainbow_border", true)
UIManager.CreateSliderInt("armoriso_target_size", "Size", 20, 96, 50)
UIManager.SetElementParent("armoriso_target_size", TAB_ID)
UIManager.CreateSliderInt("armoriso_max_distance", "Max Distance", 50, 3000, 1000)
UIManager.SetElementParent("armoriso_max_distance", TAB_ID)
UIManager.CreateSliderInt("armoriso_glow_power", "Glow Power", 0, 100, 55)
UIManager.SetElementParent("armoriso_glow_power", TAB_ID)
UIManager.CreateButton("armoriso_reload_icons", "Reload Icons", function()
icon_state = {}
weapon_icon_state = {}
item_cache = {}
if __EC16 then
__EC16.allIconCache = {}
__EC16.iconHandleCache = {}
__EC16.playerAvatarCache = {}
__EC16.armorEspItemsCache = {}
end
notify("Isolated Armor Hotbar V12 Clean loaded", "success")
end)
UIManager.SetElementParent("armoriso_reload_icons", TAB_ID)
local function clamp(v, a, b)
if v < a then return a end
if v > b then return b end
return v
end
local function lerp(a, b, t)
return a + (b - a) * t
end
local function add_unique(list, seen, value)
if value and value ~= "" and not seen[value] then
table.insert(list, value)
seen[value] = true
end
end
local function hsv_to_rgb(h, s, v)
local i = math.floor(h * 6)
local f = h * 6 - i
local p = v * (1 - s)
local q = v * (1 - f * s)
local t = v * (1 - (1 - f) * s)
i = i % 6
if i == 0 then return v, t, p end
if i == 1 then return q, v, p end
if i == 2 then return p, v, t end
if i == 3 then return p, q, v end
if i == 4 then return t, p, v end
return v, p, q
end
local function normalize_color_value(v, fallback)
v = v or fallback
if v > 1 then v = v / 255 end
return clamp(v, 0, 1)
end
local function read_picker_color(id)
local c = UIManager.GetColorPickerValue(id)
if not c then return 1, 1, 1, 1 end
local r = c.r or c.R or c.X or c[1] or 1
local g = c.g or c.G or c.Y or c[2] or 1
local b = c.b or c.B or c.Z or c[3] or 1
local a = c.a or c.A or c.W or c[4] or 1
return normalize_color_value(r, 1),
normalize_color_value(g, 1),
normalize_color_value(b, 1),
normalize_color_value(a, 1)
end
local function get_base_border_color()
if UIManager.GetCheckboxValue("armoriso_rainbow_border") then
local h = (tick() * 0.18) % 1
local r, g, b = hsv_to_rgb(h, 1, 1)
return r, g, b, 1
end
return read_picker_color("armoriso_border_color")
end
local function get_rarity_color(name)
if not name then return nil end
if string.find(name, "Backpack") then
return RARITY.Backpack[1], RARITY.Backpack[2], RARITY.Backpack[3], 1
end
for key, col in pairs(RARITY) do
if string.find(name, key) then
return col[1], col[2], col[3], 1
end
end
return nil
end
local function get_border_color_for_item(name)
return get_base_border_color()
end
local function normalize_armor_id(name)
if not name then return nil end
local id = string.match(name, "Armor[_%s]%d+")
if not id then return nil end
id = string.gsub(id, " ", "_")
if id == "Armor_308" or id == "Armor_309" then
return nil
end
return id
end
local function get_icon(name)
local urls = ICON_URLS[name] or get_weapon_icon_urls(name)
if not urls then return nil end
local st = icon_state[name]
if not st then
st = {
index = 1,
handle = Drawing.LoadImage(urls[1]),
dead = false
}
icon_state[name] = st
end
if st.dead then return nil end
if st.handle and Drawing.IsImageReady(st.handle) then
return st.handle
end
if st.handle and Drawing.IsImageFailed(st.handle) then
st.index = st.index + 1
if urls[st.index] then
st.handle = Drawing.LoadImage(urls[st.index])
return st.handle
end
st.dead = true
return nil
end
return st.handle
end
local function safe_name(inst)
if not inst then return nil end
local ok, name = pcall(function()
return inst:get_name()
end)
if ok then return name end
return nil
end
local function get_character(p)
if p.character_addr and p.character_addr ~= 0 then
local char = rbx.instance(p.character_addr)
if char then return char end
end
if p.hrp_addr and p.hrp_addr ~= 0 then
local hrp = rbx.instance(p.hrp_addr)
if hrp then return hrp:parent() end
end
local ps = rbx.players_service()
if ps then
local plr = ps:find_first_child(p.name)
if plr then
return plr:get_character()
end
end
return nil
end
local function get_player_instance(p)
if p.player_addr and p.player_addr ~= 0 then
return rbx.instance(p.player_addr)
end
local ps = rbx.players_service()
if ps then
return ps:find_first_child(p.name)
end
return nil
end
local function scan_armor(root, out, seen, depth)
if not root or depth > 12 then return end
local ok, children = pcall(function()
return root:get_children()
end)
if not ok or not children then return end
for _, child in ipairs(children) do
local name = safe_name(child)
local id = normalize_armor_id(name)
if id then
add_unique(out, seen, ARMOR_MAP[id])
end
scan_armor(child, out, seen, depth + 1)
end
end
local function resolve_full_player(t)
for _, p in ipairs(players.get_all()) do
if p.address == t.address or p.name == t.name then
return p
end
end
return t
end
local function armor_clean_tool_name(name)
if not name or name == "" then return nil end
name = tostring(name)
name = string.gsub(name, "^%s+", "")
name = string.gsub(name, "%s+$", "")
if name == "" then return nil end
return name
end
local function armor_is_armor_or_clothing_name(name)
if not name then return false end
if ARMOR_MAP[name] then return true end
for _, armor_name in pairs(ARMOR_MAP) do
if name == armor_name then
return true
end
end
local lowered = string.lower(name)
local bad = {
"pants", "shirt", "helmet", "chestplate", "leggings", "gloves",
"boots", "hoodie", "hazmat", "balaclava", "cap", "wetsuit",
"backpack", "armor", "footwraps", "handwraps", "head wrap",
"jacket", "tank top", "shorts"
}
for _, key in ipairs(bad) do
if string.find(lowered, key, 1, true) then
return true
end
end
return false
end
local function armor_is_weapon_name(name)
if not name or name == "" then return false end
if armor_is_armor_or_clothing_name(name) then return false end
if WEAPON_ITEMS[name] then return true end
local lowered = string.lower(name)
local good = {
"ak", "m4", "m39", "aa12", "mp7", "pkm", "usp", "barret", "barrett",
"shotgun", "smg", "p250", "python", "rpg", "sniper", "bow", "spear",
"nail", "grenade", "launcher", "axe", "pickaxe", "hatchet", "shovel",
"drill", "chainsaw", "machete", "medkit", "bandage", "wire cutters",
"dynamite", "charge", "hammer", "blueprint", "boulder", "lighter",
"crossbow", "revolver", "rifle", "skorpion"
}
for _, key in ipairs(good) do
if string.find(lowered, key, 1, true) then
return true
end
end
return false
end
local function armor_get_target_tool_name(target)
if not target then return nil end
local direct_fields = {
target.tool,
target.weapon,
target.item,
target.equipped_tool,
target.held_item,
target.current_tool,
target.current_weapon
}
for _, v in ipairs(direct_fields) do
if type(v) == "string" and v ~= "" then
local name = armor_clean_tool_name(v)
if armor_is_weapon_name(name) then
return name
end
end
end
local addr_fields = {
target.tool_addr,
target.weapon_addr,
target.item_addr
}
for _, addr in ipairs(addr_fields) do
if addr and addr ~= 0 then
local ok, inst = pcall(function()
return rbx.instance(addr)
end)
if ok and inst then
local name = armor_clean_tool_name(safe_name(inst))
if armor_is_weapon_name(name) then
return name
end
end
end
end
local char = get_character(target)
if char then
local methods = {
"get_tool",
"get_equipped_tool",
"get_held_tool",
"get_current_tool"
}
for _, m in ipairs(methods) do
local ok, tool = pcall(function()
return char[m](char)
end)
if ok and tool then
local name = armor_clean_tool_name(safe_name(tool))
if armor_is_weapon_name(name) then
return name
end
end
end
local ok2, tool2 = pcall(function()
return char:find_first_child_of_class("Tool")
end)
if ok2 and tool2 then
local name = armor_clean_tool_name(safe_name(tool2))
if armor_is_weapon_name(name) then
return name
end
end
local ok_children, children = pcall(function()
return char:get_children()
end)
if ok_children and children then
for _, child in ipairs(children) do
local name = armor_clean_tool_name(safe_name(child))
if armor_is_weapon_name(name) then
local ok_class, cls = pcall(function()
return child:get_class()
end)
if (ok_class and cls == "Tool") or WEAPON_ITEMS[name] then
return name
end
end
end
end
end
return nil
end
local function get_items(raw_target)
local p = resolve_full_player(raw_target)
local key = p.address or p.name
local now = tick()
local ttl = 0.60
pcall(function()
    if __ec16_armor_cache_rate then ttl = __ec16_armor_cache_rate() end
end)
if item_cache[key] and now - item_cache[key].time < ttl then
return item_cache[key].items
end
local items = {}
local seen = {}
if UIManager.GetCheckboxValue("armoriso_show_weapon") then
local tool_name = armor_get_target_tool_name(p)
if tool_name then
add_unique(items, seen, "__weapon__" .. tool_name)
end
end
local char = get_character(p)
if char then scan_armor(char, items, seen, 0) end
local plr = get_player_instance(p)
if plr then scan_armor(plr, items, seen, 0) end
item_cache[key] = {
time = now,
items = items
}
return items
end
local function short_name(name)
local a, b = string.match(name or "", "^(%S+)%s+(%S+)")
if a and b then
return string.sub(a, 1, 1) .. string.sub(b, 1, 1)
end
return string.sub(name or "?", 1, 2)
end
local function point_in_rect(px, py, x, y, w, h)
return px >= x and py >= y and px <= x + w and py <= y + h
end
local function draw_glow(x, y, size, r, g, b, strength, alpha_mul)
if not true then return end
if strength <= 0 then return end
local base = (strength / 100) * (alpha_mul or 1)
if base < 0.02 then return end
Drawing.DrawBoxFilled(x - 5, y - 5, x + size + 5, y + size + 5, r, g, b, 0.065 * base)
end
local function draw_fake_rounded_panel(x, y, w, h, alpha)
Drawing.DrawBoxFilled(
x,
y,
x + w,
y + h,
0.010,
0.010,
0.014,
alpha
)
end
local weapon_icon_state = {}
local function weapon_norm_name(s)
s = tostring(s or "")
s = string.lower(s)
s = string.gsub(s, "[^%w]", "")
return s
end
local function weapon_make_fandom_fallbacks(url)
local out = {}
local seen = {}
local function add(u)
if u and u ~= "" and not seen[u] then
table.insert(out, u)
seen[u] = true
end
end
if not url then return out end
local base = string.match(url, "^(.-)/revision/latest")
if base then
add(base .. "/revision/latest?format=original")
add(base .. "/revision/latest/scale-to-width-down/180?format=original")
add(base .. "/revision/latest/scale-to-width-down/100?format=original")
end
add(url)
if string.find(url, "?", 1, true) then
add(url .. "&format=original")
else
add(url .. "?format=original")
end
return out
end
local function get_weapon_icon_url(name)
if not name then return nil end
if WEAPON_DIRECT_ICON_URLS[name] then
return WEAPON_DIRECT_ICON_URLS[name]
end
local alias = WEAPON_DIRECT_ALIASES[name]
if alias and WEAPON_DIRECT_ICON_URLS[alias] then
return WEAPON_DIRECT_ICON_URLS[alias]
end
local nn = weapon_norm_name(name)
if alias then
nn = weapon_norm_name(alias)
end
for k, url in pairs(WEAPON_DIRECT_ICON_URLS) do
local kk = weapon_norm_name(k)
if kk == nn then
return url
end
end
for k, url in pairs(WEAPON_DIRECT_ICON_URLS) do
local kk = weapon_norm_name(k)
if nn ~= "" and kk ~= "" then
if string.find(kk, nn, 1, true) or string.find(nn, kk, 1, true) then
return url
end
end
end
return nil
end
local function get_weapon_icon(name)
local url = get_weapon_icon_url(name)
if not url then return nil end
local st = weapon_icon_state[name]
if not st then
local urls = weapon_make_fandom_fallbacks(url)
st = {
urls = urls,
index = 1,
handle = urls[1] and Drawing.LoadImage(urls[1]) or nil,
dead = false
}
weapon_icon_state[name] = st
end
if st.dead then return nil end
if st.handle and Drawing.IsImageReady(st.handle) then
return st.handle
end
if st.handle and Drawing.IsImageFailed(st.handle) then
st.index = st.index + 1
if st.urls and st.urls[st.index] then
st.handle = Drawing.LoadImage(st.urls[st.index])
return st.handle
end
st.dead = true
return nil
end
return st.handle
end
local function draw_slot(name, x, y, size, mouse, global_alpha)
local is_weapon = false
local display_name = name
if type(name) == "string" and string.sub(name, 1, 10) == "__weapon__" then
is_weapon = true
display_name = string.sub(name, 11)
end
local br, bg, bb, ba = get_border_color_for_item(display_name)
if is_weapon then
br, bg, bb, ba = 1.0, 0.82, 0.25, 1.0
end
local glow_power = armoriso_cached_glow_power or 0
local hover = false
if mouse and point_in_rect(mouse.X, mouse.Y, x, y, size, size) then
hover = true
end
hover_alpha[display_name] = lerp(hover_alpha[display_name] or 0, hover and 1 or 0, 0.22)
local ha = hover_alpha[display_name]
local pulse = 0
if tick() < pulse_until then
pulse = (pulse_until - tick()) / 0.45
end
local scale = 1 + ha * 0.11 + pulse * 0.045
local ds = size * scale
local dx = x - (ds - size) / 2
local dy = y - (ds - size) / 2
draw_glow(dx, dy, ds, br, bg, bb, glow_power, global_alpha + ha * 0.6)
Drawing.DrawBoxFilled(dx, dy, dx + ds, dy + ds, 0.03, 0.03, 0.035, 0.78 * global_alpha)
Drawing.DrawBoxFilled(dx + 3, dy + 3, dx + ds - 3, dy + ds - 3, 0.005, 0.005, 0.007, 0.35 * global_alpha)
Drawing.DrawLine(dx + 3, dy + 3, dx + ds - 3, dy + 3, 1, 1, 1, 0.10 * global_alpha, 1)
if ha > 0.03 then
local scan_y = dy + 5 + ((tick() * 80) % math.max(1, ds - 10))
Drawing.DrawLine(dx + 5, scan_y, dx + ds - 5, scan_y, br, bg, bb, 0.22 * ha, 1.2)
end
Drawing.DrawBox(dx - 1, dy - 1, dx + ds + 1, dy + ds + 1, br, bg, bb, ba * global_alpha, 2)
Drawing.DrawBox(dx, dy, dx + ds, dy + ds, br, bg, bb, 0.55 * global_alpha, 1)
local icon = __ec16_get_cached_icon_handle(display_name, is_weapon)
if icon and Drawing.IsImageReady(icon) then
Drawing.DrawImage(icon, dx + 4, dy + 4, ds - 8, ds - 8)
else
if is_weapon then
Drawing.DrawTextWithOutline(
dx + ds / 2,
dy + ds / 2 - 6,
"WPN",
1.0, 0.82, 0.25, 1 * global_alpha,
0, 0, 0, 1 * global_alpha
)
else
Drawing.DrawTextWithOutline(
dx + ds / 2,
dy + ds / 2 - 6,
short_name(display_name),
1, 1, 1, 1 * global_alpha,
0, 0, 0, 1 * global_alpha
)
end
end
if false and ha > 0.04 then
end
end
local function get_target_user_id(target)
if target.user_id and target.user_id ~= 0 then
return target.user_id
end
local plr = get_player_instance(target)
if not plr then return nil end
local ok, uid = pcall(function()
return plr:user_id()
end)
if ok and uid and uid ~= 0 then
return uid
end
return nil
end
local function draw_animated_hotbar_frame(x, y, w, h, alpha)
if alpha < 0.05 then return end
local base_r, base_g, base_b, base_a = get_base_border_color()
Drawing.DrawBox(x, y, x + w, y + h, base_r, base_g, base_b, 0.18 * alpha, 1)
local perimeter = (w + h) * 2
local head = (tick() * 145) % perimeter
local trail = 95
local thickness = 3
local function point_at(p)
p = p % perimeter
if p < w then
return x + p, y
elseif p < w + h then
return x + w, y + (p - w)
elseif p < w + h + w then
return x + w - (p - w - h), y + h
end
return x, y + h - (p - w - h - w)
end
local function draw_piece(p1, p2, r, g, b, a, th)
local x1, y1 = point_at(p1)
local x2, y2 = point_at(p2)
if math.abs(x1 - x2) > 14 and math.abs(y1 - y2) > 14 then
return
end
Drawing.DrawLine(x1, y1, x2, y2, r, g, b, a, th)
end
Drawing.DrawBoxFilled(x - 3, y - 3, x + w + 3, y + h + 3, base_r, base_g, base_b, 0.014 * alpha)
local pieces = 8
local step = trail / pieces
for i = 0, pieces - 1 do
local k = i / pieces
local fade = 1 - k
local p1 = head - i * step
local p2 = head - (i + 1) * step
local mix = fade * 0.35
local r = base_r + (1 - base_r) * mix
local g = base_g + (1 - base_g) * mix
local b = base_b + (1 - base_b) * mix
local a = base_a * alpha * (0.10 + fade * 0.85)
draw_piece(p1, p2, r, g, b, a, thickness)
end
end
local function get_viewport_size()
local d = ScreenSize()
if d and d.Width and d.Height then
return d.Width, d.Height
end
local rd = rbx.screen_dim()
if rd and rd.Width and rd.Height then
return rd.Width, rd.Height
end
return 1920, 1080
end
local function clamp_hotbar_position(cx, cy, w, h)
local sw, sh = get_viewport_size()
local margin = 8
local min_x = margin + w / 2
local max_x = sw - margin - w / 2
local min_y = margin + h / 2
local max_y = sh - margin - h / 2
if min_x > max_x then
min_x = sw / 2
max_x = sw / 2
end
if min_y > max_y then
min_y = sh / 2
max_y = sh / 2
end
return clamp(cx, min_x, max_x), clamp(cy, min_y, max_y)
end
local function draw_target_hp_bar(target, x, y, w, alpha)
local hp = target.health or 0
local maxhp = target.max_health or 100
if maxhp <= 0 then maxhp = 100 end
local frac = clamp(hp / maxhp, 0, 1)
local r = 1 - frac
local g = frac
Drawing.DrawBoxFilled(x, y, x + w * frac, y + 5, r, g, 0.12, 0.95 * alpha)
Drawing.DrawBox(x, y, x + w, y + 5, 1, 1, 1, 0.10 * alpha, 1)
Drawing.DrawTextWithOutline(
x + w / 2,
y - 1,
string.format("%.0f / %.0f", hp, maxhp),
1, 1, 1, 0.90 * alpha,
0, 0, 0, alpha
)
end
local function armor_players_available()
local ok, all = pcall(function()
return players.get_all()
end)
if not ok or not all or #all <= 0 then
return false
end
for _, p in ipairs(all) do
if p and not p.is_self and p.address and p.address ~= 0 then
if not p.is_knocked and (not p.health or p.health > 1) then
return true
end
end
end
return false
end
local function armor_target_valid(target)
if not target then return false end
if target.is_self then return false end
if target.is_knocked then return false end
if target.is_dead then return false end
if target.health ~= nil then
local hp = tonumber(target.health) or 0
if hp <= 1 then
return false
end
end
if target.max_health ~= nil then
local maxhp = tonumber(target.max_health) or 100
if maxhp <= 0 then
return false
end
end
if not target.address or target.address == 0 then return false end
if not target.position then return false end
if not target.head_pos then return false end
if not target.position.X or not target.position.Y or not target.position.Z then return false end
if not target.head_pos.X or not target.head_pos.Y or not target.head_pos.Z then return false end
if target.position.X == 0 and target.position.Y == 0 and target.position.Z == 0 then return false end
if target.head_pos.X == 0 and target.head_pos.Y == 0 and target.head_pos.Z == 0 then return false end
local max_dist = 1000
max_dist = armoriso_cached_max_dist or 1000
if target.distance and target.distance > max_dist then
return false
end
return true
end
local function armor_refresh_target_by_address(addr)
if not addr then return nil end
local all = players.get_all()
for _, p in ipairs(all) do
if p.address == addr and armor_target_valid(p) then
return p
end
end
return nil
end
local function draw_target_hotbar(target)
if not armor_target_valid(target) then
target_alpha = lerp(target_alpha, 0, 0.18)
return
end
local items = get_items(target)
if #items <= 0 then
target_alpha = lerp(target_alpha, 0, 0.12)
return
end
target_alpha = lerp(target_alpha, 1, 0.12)
local key = target.address or target.name
if key ~= last_target_key then
last_target_key = key
pulse_until = tick() + 0.45
end
local size = armoriso_cached_size or UIManager.GetSliderIntValue("armoriso_target_size")
local gap = 6
local panel_pad = 10
local name_h = 36
local sw, sh = get_viewport_size()
local horiz_w = (#items * size) + ((#items - 1) * gap)
local horiz_h = size
local vert_w = size
local vert_h = (#items * size) + ((#items - 1) * gap)
local horiz_panel_w = horiz_w + panel_pad * 2
local horiz_panel_h = horiz_h + name_h + 12
local vert_panel_w = vert_w + panel_pad * 2
local vert_panel_h = vert_h + name_h + 12
local mouse = Windows.GetMousePos()
local lmb = Windows.IsKeyPressed(0x01)
local current_panel_w = hotbar_vertical and vert_panel_w or horiz_panel_w
local current_panel_h = hotbar_vertical and vert_panel_h or horiz_panel_h
local current_start_x = hotbar_x - current_panel_w / 2
local current_start_y = hotbar_y - name_h
if mouse then
if lmb and not dragging and point_in_rect(mouse.X, mouse.Y, current_start_x, current_start_y, current_panel_w, current_panel_h) then
dragging = true
drag_dx = mouse.X - hotbar_x
drag_dy = mouse.Y - hotbar_y
elseif not lmb then
dragging = false
end
if dragging then
hotbar_x = mouse.X - drag_dx
hotbar_y = mouse.Y - drag_dy
end
end
local horiz_left = hotbar_x - horiz_panel_w / 2
local horiz_right = hotbar_x + horiz_panel_w / 2
local edge_trigger = 12
if not hotbar_vertical then
if horiz_panel_w > sw - 16 or horiz_left < edge_trigger or horiz_right > sw - edge_trigger then
hotbar_vertical = true
end
else
if horiz_panel_w <= sw - 16 and hotbar_x - horiz_panel_w / 2 > 80 and hotbar_x + horiz_panel_w / 2 < sw - 80 then
hotbar_vertical = false
end
end
local is_vertical = hotbar_vertical
local total_w = is_vertical and vert_w or horiz_w
local total_h = is_vertical and vert_h or horiz_h
local panel_w = is_vertical and vert_panel_w or horiz_panel_w
local panel_h = is_vertical and vert_panel_h or horiz_panel_h
hotbar_x, hotbar_y = clamp_hotbar_position(hotbar_x, hotbar_y + (panel_h / 2 - name_h), panel_w, panel_h)
hotbar_y = hotbar_y - (panel_h / 2 - name_h)
draw_x = lerp(draw_x, hotbar_x, dragging and 0.35 or 0.16)
draw_y = lerp(draw_y, hotbar_y, dragging and 0.35 or 0.16)
local start_x = draw_x - total_w / 2
local start_y = draw_y
if is_vertical then
start_x = draw_x - size / 2
start_y = draw_y
end
local panel_x = draw_x - panel_w / 2
local panel_y = draw_y - name_h
local br, bg, bb, ba = get_base_border_color()
local pulse = 0
if tick() < pulse_until then
pulse = (pulse_until - tick()) / 0.45
end
draw_fake_rounded_panel(panel_x, panel_y, panel_w, panel_h, 0.58 * target_alpha)
Drawing.DrawBox(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, br, bg, bb, (0.16 + pulse * 0.22) * target_alpha, 1)
draw_animated_hotbar_frame(panel_x, panel_y, panel_w, panel_h, target_alpha)
Drawing.DrawTextWithOutline(
draw_x,
draw_y - 31,
target.name,
1, 1, 1, target_alpha,
0, 0, 0, target_alpha
)
draw_target_hp_bar(target, panel_x + panel_pad, draw_y - 13, panel_w - panel_pad * 2, target_alpha)
for i, item in ipairs(items) do
local x, y
if is_vertical then
x = draw_x - size / 2
y = draw_y + (i - 1) * (size + gap)
else
x = draw_x - total_w / 2 + (i - 1) * (size + gap)
y = draw_y
end
draw_slot(item, x, y, size, mouse, target_alpha)
end
end
hooks.on_render(function()
if not UIManager.GetCheckboxValue("armoriso_target_enabled") then return end
local ok, err = pcall(function()
local now = tick()

armoriso_cached_size = UIManager.GetSliderIntValue("armoriso_target_size") or armoriso_cached_size or 48
armoriso_cached_glow_power = UIManager.GetSliderIntValue("armoriso_glow_power") or armoriso_cached_glow_power or 0
armoriso_cached_max_dist = UIManager.GetSliderIntValue("armoriso_max_distance") or armoriso_cached_max_dist or 1000

if now - (armoriso_players_available_at or 0) > 0.50 then
armoriso_players_available_at = now
armoriso_players_available_cache = armor_players_available()
end
if not armoriso_players_available_cache then
target_alpha = lerp(target_alpha, 0, 0.18)
last_target_key = nil
armoriso_cached_target = nil
return
end

if (not armoriso_cached_target) or (now - (armoriso_cached_target_at or 0) > 0.04) then
armoriso_cached_target_at = now
armoriso_cached_target = players.get_closest_to_crosshair(280)
end

local target = armoriso_cached_target
if not armor_target_valid(target) then
target_alpha = lerp(target_alpha, 0, 0.18)
last_target_key = nil
armoriso_cached_target = nil
return
end

draw_target_hotbar(target)
end)
if not ok then
target_alpha = lerp(target_alpha, 0, 0.18)
last_target_key = nil
armoriso_cached_target = nil
end
end)
notify("Isolated Armor Hotbar V12 Clean loaded", "success")
local K1_TAB = TAB_ID
local k1 = {
show_distance = true,
world_range = 500,
loot_range = 350,
base_range = 220,
workspace_folders = {
nodes = nil,
plants = nil,
animals = nil,
drops = nil,
bases = nil,
loners = nil,
last = 0
},
base_folder_cache = {},
loot_folder_cache = {},
last_base_cache = 0,
last_loot_cache = 0,
last_loot_signature = "",
last_base_signature = ""
}
local function k1_color(r, g, b, a)
return { r = r, g = g, b = b, a = a or 1 }
end
local K1_WORLD_ITEMS = {
{ id = "stone_node", title = "Stone Node", label = "Stone", folder = "nodes", names = { ["Stone_Node"] = true }, color = k1_color(0.55, 0.55, 0.55, 1) },
{ id = "metal_node", title = "Metal Node", label = "Metal", folder = "nodes", names = { ["Metal_Node"] = true }, color = k1_color(0.70, 0.55, 0.35, 1) },
{ id = "phosphate_node", title = "Phosphate Node", label = "Phosphate", folder = "nodes", names = { ["Phosphate_Node"] = true }, color = k1_color(0.25, 0.85, 0.25, 1) },
{ id = "corn_plant", title = "Corn Plant", label = "Corn", folder = "plants", names = { ["Corn Plant"] = true }, color = k1_color(1.00, 0.90, 0.25, 1) },
{ id = "tomato_plant", title = "Tomato Plant", label = "Tomato", folder = "plants", names = { ["Tomato Plant"] = true }, color = k1_color(1.00, 0.30, 0.30, 1) },
{ id = "lemon_plant", title = "Lemon Plant", label = "Lemon", folder = "plants", names = { ["Lemon Plant"] = true }, color = k1_color(1.00, 1.00, 0.30, 1) },
{ id = "raspberry_plant", title = "Raspberry Plant", label = "Raspberry", folder = "plants", names = { ["Raspberry Plant"] = true }, color = k1_color(0.90, 0.20, 0.50, 1) },
{ id = "blueberry_plant", title = "Blueberry Plant", label = "Blueberry", folder = "plants", names = { ["Blueberry Plant"] = true }, color = k1_color(0.30, 0.35, 1.00, 1) },
{ id = "wool_plant", title = "Wool Plant", label = "Wool", folder = "plants", names = { ["Wool Plant"] = true }, color = k1_color(0.90, 0.90, 0.90, 1) },
{ id = "pumpkin_plant", title = "Pumpkin Plant", label = "Pumpkin", folder = "plants", names = { ["Pumpkin Plant"] = true }, color = k1_color(1.00, 0.50, 0.10, 1) },
{ id = "deer", title = "Deer", label = "Deer", folder = "animals", names = { ["PREFAB_ANIMAL_DEER"] = true, ["Deer"] = true }, color = k1_color(0.65, 0.42, 0.20, 1) },
{ id = "boar", title = "Wild Boar", label = "Boar", folder = "animals", names = { ["PREFAB_ANIMAL_WILDBOAR"] = true, ["Wild Boar"] = true, ["WildBoar"] = true, ["Boar"] = true }, color = k1_color(0.45, 0.32, 0.20, 1) },
{ id = "wolf", title = "Wolf", label = "Wolf", folder = "animals", names = { ["PREFAB_ANIMAL_WOLF"] = true, ["Wolf"] = true }, color = k1_color(0.55, 0.55, 0.55, 1) },
{ id = "dropped_item", title = "Dropped Items", label = "Item", folder = "drops", names = nil, color = k1_color(1.00, 0.80, 0.05, 1) }
}
local K1_LOOT_ITEMS = {
{ id = "wooden_crate", title = "Wooden Crate", label = "Wooden Crate", names = { ["Wooden Crate"] = true, ["Locked Wooden Crate"] = true }, color = k1_color(0.60, 0.40, 0.20, 1) },
{ id = "metal_crate", title = "Metal Crate", label = "Metal Crate", names = { ["Metal Crate"] = true, ["Locked Metal Crate"] = true }, color = k1_color(0.55, 0.55, 0.65, 1) },
{ id = "steel_crate", title = "Steel Crate", label = "Steel Crate", names = { ["Steel Crate"] = true, ["Locked Steel Crate"] = true }, color = k1_color(0.75, 0.75, 0.85, 1) },
{ id = "food_crate", title = "Food Crate", label = "Food Crate", names = { ["Food Crate"] = true }, color = k1_color(0.25, 0.85, 0.25, 1) },
{ id = "timed_crate", title = "Timed Crate", label = "Timed Crate", names = { ["Timed Crate"] = true }, color = k1_color(1.00, 0.50, 0.05, 1) },
{ id = "care_package", title = "Care Package", label = "Care Package", names = { ["Care Package"] = true }, color = k1_color(1.00, 0.20, 0.20, 1) },
{ id = "trash_can", title = "Trash Can", label = "Trash Can", names = { ["Trash Can"] = true }, color = k1_color(0.45, 0.45, 0.45, 1) },
{ id = "oil_barrel", title = "Oil Barrel", label = "Oil Barrel", names = { ["Oil Barrel"] = true }, color = k1_color(0.20, 0.20, 0.20, 1) },
{ id = "body_bag", title = "Body Bag", label = "Body Bag", names = { ["Body Bag"] = true, ["BodyBag"] = true, ["Body Bag(Clone)"] = true, ["BodyBag(Clone)"] = true, ["Body Bags"] = true, ["BodyBags"] = true }, color = k1_color(0.35, 0.35, 0.35, 1) },
{ id = "sleeper", title = "Sleeper", label = "Sleeper", names = { ["Sleeper"] = true }, color = k1_color(0.80, 0.40, 0.80, 1) },
{ id = "wooden_boat", title = "Wooden Boat", label = "Wooden Boat", names = { ["Wooden Boat"] = true }, color = k1_color(0.55, 0.32, 0.12, 1) },
{ id = "military_boat", title = "Military Boat", label = "Military Boat", names = { ["Military Boat"] = true }, color = k1_color(0.35, 0.45, 0.35, 1) },
{ id = "flycopter", title = "Salvaged Flycopter", label = "Flycopter", names = { ["Salvaged Flycopter"] = true, ["Flycopter"] = true }, color = k1_color(0.50, 0.70, 0.90, 1) }
}
local K1_BASE_ITEMS = {
{ id = "base_cabinet", title = "Base Cabinet", label = "Base Cabinet", names = { ["Base Cabinet"] = true, ["Cabinet"] = true }, color = k1_color(1.00, 0.80, 0.05, 1), box = true, sx = 4, sy = 4, sz = 4 },
{ id = "storage_cabinet", title = "Storage Cabinet", label = "Storage Cabinet", names = { ["Storage Cabinet"] = true, ["Large Cabinet"] = true }, color = k1_color(0.60, 0.40, 0.20, 1), box = true, sx = 4, sy = 4, sz = 4 },
{ id = "small_box", title = "Small Storage Box", label = "Small Box", names = { ["Small Storage Box"] = true, ["Small Box"] = true }, color = k1_color(0.50, 0.30, 0.10, 1), box = true, sx = 3, sy = 3, sz = 3 },
{ id = "large_box", title = "Large Storage Box", label = "Large Box", names = { ["Large Storage Box"] = true, ["Large Box"] = true }, color = k1_color(0.65, 0.42, 0.20, 1), box = true, sx = 4, sy = 4, sz = 4 },
{ id = "wooden_door", title = "Wooden Door", label = "Wooden Door", names = { ["Wooden Door"] = true }, color = k1_color(0.50, 0.30, 0.10, 1), box = true, sx = 4, sy = 6, sz = 1 },
{ id = "wooden_double_door", title = "Wooden Double Door", label = "Wooden Double Door", names = { ["Wooden Double Door"] = true }, color = k1_color(0.50, 0.30, 0.10, 1), box = true, sx = 6, sy = 6, sz = 1 },
{ id = "salvaged_door", title = "Salvaged Metal Door", label = "Salvaged Door", names = { ["Salvaged Metal Door"] = true }, color = k1_color(0.45, 0.45, 0.55, 1), box = true, sx = 4, sy = 6, sz = 1 },
{ id = "metal_door", title = "Metal Door", label = "Metal Door", names = { ["Metal Door"] = true }, color = k1_color(0.55, 0.55, 0.65, 1), box = true, sx = 4, sy = 6, sz = 1 },
{ id = "metal_double_door", title = "Metal Double Door", label = "Metal Double Door", names = { ["Metal Double Door"] = true }, color = k1_color(0.55, 0.55, 0.65, 1), box = true, sx = 6, sy = 6, sz = 1 },
{ id = "steel_door", title = "Steel Door", label = "Steel Door", names = { ["Steel Door"] = true }, color = k1_color(0.75, 0.75, 0.85, 1), box = true, sx = 4, sy = 6, sz = 1 },
{ id = "steel_double_door", title = "Steel Double Door", label = "Steel Double Door", names = { ["Steel Double Door"] = true }, color = k1_color(0.75, 0.75, 0.85, 1), box = true, sx = 6, sy = 6, sz = 1 },
{ id = "trap_door", title = "Trap Door", label = "Trap Door", names = { ["Trap Door"] = true }, color = k1_color(0.45, 0.38, 0.30, 1), box = true, sx = 4, sy = 1, sz = 4 },
{ id = "triangle_trap_door", title = "Triangle Trap Door", label = "Triangle Trap Door", names = { ["Triangle Trap Door"] = true }, color = k1_color(0.45, 0.38, 0.30, 1), box = true, sx = 4, sy = 1, sz = 4 },
{ id = "garage_door", title = "Garage Door", label = "Garage Door", names = { ["Garage Door"] = true }, color = k1_color(0.50, 0.50, 0.58, 1), box = true, sx = 7, sy = 7, sz = 1 },
{ id = "sleeping_bag", title = "Sleeping Bag", label = "Sleeping Bag", names = { ["Sleeping Bag"] = true }, color = k1_color(0.80, 0.20, 0.20, 1), box = true, sx = 4, sy = 1, sz = 5 },
{ id = "shotgun_turret", title = "Shotgun Turret", label = "Shotgun Turret", names = { ["Shotgun Turret"] = true }, color = k1_color(1.00, 0.30, 0.30, 1), box = true, sx = 4, sy = 4, sz = 4 },
{ id = "auto_turret", title = "Auto Turret", label = "Auto Turret", names = { ["Auto Turret"] = true }, color = k1_color(1.00, 0.20, 0.20, 1), box = true, sx = 4, sy = 4, sz = 4 },
{ id = "small_battery", title = "Small Battery", label = "Small Battery", names = { ["Small Battery"] = true }, color = k1_color(0.20, 0.60, 0.20, 1), box = true, sx = 3, sy = 3, sz = 3 },
{ id = "medium_battery", title = "Medium Battery", label = "Medium Battery", names = { ["Medium Battery"] = true }, color = k1_color(0.30, 0.70, 0.30, 1), box = true, sx = 4, sy = 4, sz = 4 },
{ id = "large_battery", title = "Large Battery", label = "Large Battery", names = { ["Large Battery"] = true }, color = k1_color(0.40, 0.80, 0.40, 1), box = true, sx = 4, sy = 4, sz = 4 },
{ id = "solar_panel", title = "Solar Panel", label = "Solar Panel", names = { ["Solar Panel"] = true }, color = k1_color(0.20, 0.40, 0.85, 1), box = true, sx = 5, sy = 2, sz = 1 },
{ id = "windmill", title = "Windmill", label = "Windmill", names = { ["Windmill"] = true }, color = k1_color(0.65, 0.65, 0.65, 1), box = true, sx = 7, sy = 10, sz = 7 }
}
local function k1_enabled(id)
return UIManager.GetCheckboxValue("k1_" .. id) == true
end
local function k1_color_value(id, fallback)
local c = UIManager.GetColorPickerValue("k1_" .. id .. "_color")
fallback = fallback or k1_color(1, 1, 1, 1)
if not c then return fallback.r, fallback.g, fallback.b, fallback.a end
local r = c.r or c.R or c.X or c[1] or fallback.r
local g = c.g or c.G or c.Y or c[2] or fallback.g
local b = c.b or c.B or c.Z or c[3] or fallback.b
local a = c.a or c.A or c.W or c[4] or fallback.a
if r > 1 then r = r / 255 end
if g > 1 then g = g / 255 end
if b > 1 then b = b / 255 end
if a > 1 then a = a / 255 end
return r, g, b, a
end
local function k1_children(obj)
if not obj then return nil end
local ok, children = pcall(function() return GetChildren(obj) end)
if ok then return children end
return nil
end
local function k1_find(parent, name)
local ok, obj = pcall(function() return FindFirstChild(parent, name) end)
if ok then return obj end
return nil
end
local function k1_part_pos(model)
if not model then return nil end
if model.Position then return model.Position end
local children = k1_children(model)
if not children then return nil end
for i = 1, #children do
local child = children[i]
if child and child.Position and (child.ClassName == "Part" or child.ClassName == "MeshPart" or child.ClassName == "UnionOperation") then
return child.Position
end
end
for i = 1, #children do
local child = children[i]
if child and child.ClassName == "Model" then
local pos = k1_part_pos(child)
if pos then return pos end
end
end
return nil
end
local function k1_part_info(model)
if not model then return nil end
local function make_info(part)
if not part or not part.Position then return nil end
local sx, sy, sz = 4, 4, 4
if part.Size then
sx = part.Size.X or sx
sy = part.Size.Y or sy
sz = part.Size.Z or sz
end
return {
pos = part.Position,
sx = sx,
sy = sy,
sz = sz
}
end
local main = k1_find(model, "Main")
local info = make_info(main)
if info then return info end
local primary = k1_find(model, "PrimaryPart")
info = make_info(primary)
if info then return info end
info = make_info(model)
if info then return info end
local children = k1_children(model)
if not children then return nil end
local best = nil
local best_volume = -1
for i = 1, #children do
local child = children[i]
if child and child.Position and child.Size and (child.ClassName == "Part" or child.ClassName == "MeshPart" or child.ClassName == "UnionOperation") then
local sx = child.Size.X or 1
local sy = child.Size.Y or 1
local sz = child.Size.Z or 1
local volume = sx * sy * sz
if volume > best_volume then
best_volume = volume
best = child
end
end
end
info = make_info(best)
if info then return info end
for i = 1, #children do
local child = children[i]
if child and child.ClassName == "Model" then
info = k1_part_info(child)
if info then return info end
end
end
return nil
end
local function k1_dist(a, b)
local dx = a.X - b.X
local dy = a.Y - b.Y
local dz = a.Z - b.Z
return math.sqrt(dx * dx + dy * dy + dz * dz) * 0.28
end
local function k1_screen(pos)
local s = Drawing.WorldToScreen(pos)
if s and s.X and s.X ~= -1 then return s end
return nil
end
local function k1_draw_box3d(pos, sx, sy, sz, r, g, b, a, thickness)
if DrawBox3D then
return
end
if Drawing and Drawing.DrawBox3D then
end
end
local function k1_draw_line(x1, y1, x2, y2, r, g, b, a, thickness)
if Drawing.DrawLine then
Drawing.DrawLine(x1, y1, x2, y2, r, g, b, a, thickness or 1)
end
end
local K1_WORLD_ICON_IDS = {
stone_node = true, metal_node = true, phosphate_node = true,
corn_plant = true, tomato_plant = true, lemon_plant = true, raspberry_plant = true,
blueberry_plant = true, wool_plant = true, pumpkin_plant = true,
deer = true, boar = true, wolf = true, dropped_item = true
}
K1_LOOT_ICON_IDS = {
wooden_crate = true, metal_crate = true, steel_crate = true, food_crate = true,
timed_crate = true, care_package = true, trash_can = true, oil_barrel = true,
body_bag = true, sleeper = true, wooden_boat = true, military_boat = true,
flycopter = true
}
local k1_wiki_icon_state = {}
K1_LOOT_DIRECT_ICONS = {
wooden_crate = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/0/00/Wooden_Crate.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/play-rust/images/d/d7/Basic_Crate.png/revision/latest/scale-to-width-down/177?cb=20250128033438"
},
metal_crate = {
"https://static.wikia.nocookie.net/fallen-survival-new/images/e/e7/Metal_Crate.png/revision/latest?format=original",
"https://static.wikia.nocookie.net/play-rust/images/d/d7/Military_Crate.png/revision/latest/scale-to-width-down/220?cb=20250128033521"
},
steel_crate = {
"https://static.wikia.nocookie.net/play-rust/images/9/90/Locked_Crate.jpg/revision/latest/scale-to-width-down/180?cb=20210105201339",
"https://static.wikia.nocookie.net/play-rust/images/a/ad/Elite_Crate.png/revision/latest/scale-to-width-down/220?cb=20250128033555"
},
food_crate = {
"https://static.wikia.nocookie.net/play-rust/images/8/80/Food-crate.png/revision/latest?cb=20180609013614",
"https://static.wikia.nocookie.net/play-rust/images/1/10/Food_crate.png/revision/latest/scale-to-width-down/220?cb=20160106151034"
},
timed_crate = {
"https://static.wikia.nocookie.net/play-rust/images/9/90/Locked_Crate.jpg/revision/latest/scale-to-width-down/180?cb=20210105201339"
},
care_package = {
"https://static.wikia.nocookie.net/play-rust/images/4/49/Airdrop_Supply_Crate.jpg/revision/latest/scale-to-width-down/300?cb=20140723124718"
},
trash_can = {
"https://static.wikia.nocookie.net/play-rust/images/e/eb/Tech_Trash_icon.png/revision/latest?cb=20161117193341",
"https://static.wikia.nocookie.net/fallensurvival/images/6/6e/Trash.png/revision/latest?format=original"
},
oil_barrel = {
"https://files.facepunch.com/wiki/files/b67cc/8de6b04b1f5b0bb.png",
"https://files.facepunch.com/wiki/files/b67cc/8de6b061b27ee29.png",
"https://static.wikia.nocookie.net/fallensurvival/images/0/06/Oil.png/revision/latest?format=original"
},
body_bag = {
"https://rustlabs.com/img/items180/halloween.lootbag.large.png",
"https://rustlabs.com/img/items180/halloween.lootbag.medium.png",
"https://rustlabs.com/img/items180/halloween.lootbag.small.png",
"https://static.thenounproject.com/png/body-bag-icon-4390423-512.png"
},
sleeper = {
"https://static.wikia.nocookie.net/play-rust/images/b/be/Sleeping_Bag_icon.png/revision/latest?cb=20160211200428"
},
wooden_boat = {
"https://static.wikia.nocookie.net/play-rust/images/c/c9/Screenshot_2-0.png/revision/latest/scale-to-width-down/283?cb=20200416084931"
},
military_boat = {
"https://static.wikia.nocookie.net/play-rust/images/c/c9/Screenshot_2-0.png/revision/latest/scale-to-width-down/283?cb=20200416084931"
},
flycopter = {
"https://www.corrosionhour.com/wp-content/uploads/2021/06/rust-transport-minicopter-300x300.png",
"https://static.wikia.nocookie.net/play-rust/images/4/49/Airdrop_Supply_Crate.jpg/revision/latest/scale-to-width-down/300?cb=20140723124718"
}
}
K1_LOOT_DIRECT_ICON_STATE = {}
function k1_resolve_loot_direct_icon(id)
if not id or not K1_LOOT_DIRECT_ICONS then return nil end
local urls = K1_LOOT_DIRECT_ICONS[id]
if not urls then return nil end
local st = K1_LOOT_DIRECT_ICON_STATE[id]
if not st then
st = { index = 1, handle = nil, dead = false }
K1_LOOT_DIRECT_ICON_STATE[id] = st
end
if st.dead then return nil end
if not st.handle and urls[st.index] then
st.handle = Drawing.LoadImage(urls[st.index])
end
if st.handle and Drawing.IsImageReady(st.handle) then return st.handle end
if st.handle and Drawing.IsImageFailed and Drawing.IsImageFailed(st.handle) then
st.index = st.index + 1
st.handle = nil
if urls[st.index] then
st.handle = Drawing.LoadImage(urls[st.index])
else
st.dead = true
end
end
if st.handle and Drawing.IsImageReady(st.handle) then return st.handle end
return nil
end
local function k1_url_encode(s)
s = tostring(s or "")
s = string.gsub(s, "\n", " ")
s = string.gsub(s, "([^%w%-%_%.%~ ])", function(c)
return string.format("%%%02X", string.byte(c))
end)
s = string.gsub(s, " ", "%%20")
return s
end
local function k1_title_clean(s)
s = tostring(s or "")
s = string.gsub(s, "^PREFAB_ANIMAL_", "")
s = string.gsub(s, "_", " ")
s = string.gsub(s, "%s+", " ")
s = string.gsub(s, "^%s+", "")
s = string.gsub(s, "%s+$", "")
if s == "WILDBOAR" then s = "Wild Boar" end
if s == "DEER" then s = "Deer" end
if s == "WOLF" then s = "Wolf" end
return s
end
local function k1_icon_candidates(name, id)
local n = k1_title_clean(name)
local list = { n }
if id == "stone_node" then
list[#list+1] = "Stone"
list[#list+1] = "Stones"
list[#list+1] = "Stone Ore"
list[#list+1] = "Stone Node"
list[#list+1] = "Stone_Node"
elseif id == "metal_node" then
list[#list+1] = "Metal Ore"
list[#list+1] = "Metal"
list[#list+1] = "Metal Node"
list[#list+1] = "Metal_Node"
elseif id == "phosphate_node" then
list[#list+1] = "Phosphate"
list[#list+1] = "Phosphate Node"
list[#list+1] = "Sulfur Ore"
list[#list+1] = "Sulfur"
list[#list+1] = "Sulfur_Node"
elseif id == "corn_plant" then
list[#list+1] = "Corn"
elseif id == "tomato_plant" then
list[#list+1] = "Tomato"
elseif id == "lemon_plant" then
list[#list+1] = "Lemon"
elseif id == "raspberry_plant" then
list[#list+1] = "Raspberry"
list[#list+1] = "Raspberries"
elseif id == "blueberry_plant" then
list[#list+1] = "Blueberry"
list[#list+1] = "Blueberries"
elseif id == "wool_plant" then
list[#list+1] = "Wool"
elseif id == "pumpkin_plant" then
list[#list+1] = "Pumpkin"
elseif id == "deer" then
list[#list+1] = "Deer"
elseif id == "boar" then
list[#list+1] = "Wild Boar"
list[#list+1] = "Boar"
elseif id == "wolf" then
list[#list+1] = "Wolf"
elseif id == "wooden_crate" then
list[#list+1] = "Wooden Crate"
list[#list+1] = "Locked Wooden Crate"
elseif id == "metal_crate" then
list[#list+1] = "Metal Crate"
list[#list+1] = "Locked Metal Crate"
elseif id == "steel_crate" then
list[#list+1] = "Steel Crate"
list[#list+1] = "Locked Steel Crate"
elseif id == "food_crate" then
list[#list+1] = "Food Crate"
elseif id == "timed_crate" then
list[#list+1] = "Timed Crate"
elseif id == "care_package" then
list[#list+1] = "Care Package"
elseif id == "trash_can" then
list[#list+1] = "Trash Can"
elseif id == "oil_barrel" then
list[#list+1] = "Oil Barrel"
elseif id == "body_bag" then
list[#list+1] = "Body Bag"
elseif id == "sleeper" then
list[#list+1] = "Sleeper"
elseif id == "wooden_boat" then
list[#list+1] = "Wooden Boat"
elseif id == "military_boat" then
list[#list+1] = "Military Boat"
elseif id == "flycopter" then
list[#list+1] = "Salvaged Flycopter"
list[#list+1] = "Flycopter"
elseif id == "dropped_item" then
list[#list+1] = string.gsub(n, "^Salvaged%s+", "")
list[#list+1] = string.gsub(n, "^Military%s+", "")
list[#list+1] = string.gsub(n, "^Wooden%s+", "")
list[#list+1] = string.gsub(n, "^Improvised%s+", "")
if string.find(string.lower(n), "double") and string.find(string.lower(n), "barrel") then
list[#list+1] = "Salvaged Shotgun"
list[#list+1] = "Shotgun"
end
if string.find(string.lower(n), "pipe") and string.find(string.lower(n), "rifle") then
list[#list+1] = "Salvaged Pipe Rifle"
list[#list+1] = "Pipe Rifle"
end
end
local out, seen = {}, {}
for _, v in ipairs(list) do
v = k1_title_clean(v)
if v ~= "" and not seen[v] then
seen[v] = true
out[#out+1] = v
end
end
return out
end
local function k1_fetch_wiki_icon(title)
title = k1_title_clean(title)
if title == "" then return nil end
local st = k1_wiki_icon_state[title]
if st then
if st.dead then return nil end
if st.handle and Drawing.IsImageReady(st.handle) then return st.handle end
if st.handle and Drawing.IsImageFailed and Drawing.IsImageFailed(st.handle) then st.dead = true; return nil end
return nil
end
st = { dead = false, handle = nil, url = nil }
k1_wiki_icon_state[title] = st
pcall(function()
if not (Http and Http.get and Json and Json.decode and Drawing and Drawing.LoadImage) then st.dead = true; return end
local api = "https://fallen-survival-new.fandom.com/api.php?action=query&format=json&redirects=1&prop=pageimages&piprop=thumbnail|original&pithumbsize=180&titles=" .. k1_url_encode(title)
local ok, status, body = Http.get(api, { timeout_ms = 6500 })
if (not ok) or status ~= 200 or not body then st.dead = true; return end
local j = Json.decode(body)
if not j or not j.query or not j.query.pages then st.dead = true; return end
for _, page in pairs(j.query.pages) do
local src = nil
if page.thumbnail and page.thumbnail.source then src = page.thumbnail.source end
if (not src) and page.original and page.original.source then src = page.original.source end
if src and src ~= "" then
st.url = src
st.handle = Drawing.LoadImage(src)
return
end
end
st.dead = true
end)
if st.handle and Drawing.IsImageReady(st.handle) then return st.handle end
return nil
end
function k1_resolve_icon_handle_uncached(name, id)
if K1_LOOT_ICON_IDS and K1_LOOT_ICON_IDS[id] then
local direct = k1_resolve_loot_direct_icon(id)
if direct then return direct end
end
local candidates = k1_icon_candidates(name, id)
for _, cand in ipairs(candidates) do
local handle = nil
pcall(function()
if get_icon then handle = get_icon(cand) end
end)
if handle and Drawing.IsImageReady(handle) then return handle end
pcall(function()
if get_weapon_icon then handle = get_weapon_icon(cand) end
end)
if handle and Drawing.IsImageReady(handle) then return handle end
handle = k1_fetch_wiki_icon(cand)
if handle and Drawing.IsImageReady(handle) then return handle end
end
return nil
end
function k1_resolve_icon_handle(name, id)
if not __EC16 then __EC16 = {} end
if not __EC16.iconHandleCache then __EC16.iconHandleCache = {} end
local key = tostring(id or "") .. "|" .. tostring(name or "")
local now = tick()
local rec = __EC16.iconHandleCache[key]
if rec and rec.handle and Drawing and Drawing.IsImageReady and Drawing.IsImageReady(rec.handle) then
return rec.handle
end
if rec and rec.handle and Drawing and Drawing.IsImageFailed and Drawing.IsImageFailed(rec.handle) then
__EC16.iconHandleCache[key] = { t = now, fail = true, retry = now + 8.0 }
return nil
end
if rec and rec.retry and now < rec.retry then
return nil
end
if rec and (now - (rec.t or 0)) < 1.25 then
return nil
end
local frame = math.floor(now * 10)
if __EC16.iconResolveFrame ~= frame then
__EC16.iconResolveFrame = frame
__EC16.iconResolveBudget = 2
end
if (__EC16.iconResolveBudget or 0) <= 0 then
__EC16.iconHandleCache[key] = { t = now, fail = false, retry = now + 0.35 }
return nil
end
__EC16.iconResolveBudget = (__EC16.iconResolveBudget or 0) - 1
local handle = k1_resolve_icon_handle_uncached(name, id)
if handle then
__EC16.iconHandleCache[key] = { t = now, handle = handle, retry = now + 0.50 }
return handle
end
__EC16.iconHandleCache[key] = { t = now, fail = false, retry = now + 2.0 }
return nil
end

function k1_draw_bodybag_vector(x, y, size, alpha)
if not Drawing then return false end
alpha = alpha or 1
local h = size * 0.86
local w = size * 0.46
local top = y - h * 0.42
local bottom = y + h * 0.42
local left = x - w * 0.5
local right = x + w * 0.5
if Drawing.DrawCircleFilled then
Drawing.DrawCircleFilled(x, top + w * 0.28, w * 0.50, 0.015, 0.015, 0.018, 0.95 * alpha)
Drawing.DrawCircleFilled(x, bottom - w * 0.24, w * 0.50, 0.015, 0.015, 0.018, 0.95 * alpha)
end
if Drawing.DrawBoxFilled then
Drawing.DrawBoxFilled(left, top + w * 0.24, right, bottom - w * 0.20, 0.015, 0.015, 0.018, 0.95 * alpha)
Drawing.DrawBoxFilled(left + w * 0.10, top + w * 0.14, right - w * 0.10, bottom - w * 0.10, 0.045, 0.045, 0.050, 0.82 * alpha)
Drawing.DrawBoxFilled(left + w * 0.43, top + w * 0.18, left + w * 0.55, bottom - w * 0.16, 0.72, 0.72, 0.75, 0.55 * alpha)
end
if Drawing.DrawLine then
Drawing.DrawLine(left - 1, top + h * 0.23, right + 1, top + h * 0.23, 0.78, 0.78, 0.80, 0.75 * alpha, 1)
Drawing.DrawLine(left - 1, y, right + 1, y, 0.78, 0.78, 0.80, 0.75 * alpha, 1)
Drawing.DrawLine(left - 1, bottom - h * 0.23, right + 1, bottom - h * 0.23, 0.78, 0.78, 0.80, 0.75 * alpha, 1)
Drawing.DrawLine(x, top + w * 0.12, x, bottom - w * 0.12, 0.0, 0.0, 0.0, 0.75 * alpha, 1)
end
return true
end
local function k1_draw_icon_circle(name, id, x, y, size, alpha)
if not (Drawing and Drawing.DrawCircleFilled and Drawing.DrawCircle) then return end
size = math.floor(size or 18)
if size < 10 then size = 10 end
if size > 48 then size = 48 end
alpha = alpha or 1
if alpha < 0.05 then return end
local radius = (size * 0.5) + 3
Drawing.DrawCircleFilled(x, y, radius, 0.02, 0.02, 0.03, 0.90 * alpha)
Drawing.DrawCircle(x, y, radius, __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 0.95 * alpha, 1.4)
local handle = nil
handle = k1_resolve_icon_handle(name, id)
if handle then
Drawing.DrawImage(handle, x - size * 0.5, y - size * 0.5, size, size, 1, 1, 1, alpha, math.max(2, size * 0.16))
else
local txt = short_name and short_name(name) or tostring(name or "?")
if id == "stone_node" then txt = "ST" end
if id == "metal_node" then txt = "ME" end
if id == "phosphate_node" then txt = "PH" end
if id == "corn_plant" then txt = "CO" end
if id == "tomato_plant" then txt = "TO" end
if id == "lemon_plant" then txt = "LE" end
if id == "raspberry_plant" then txt = "RA" end
if id == "blueberry_plant" then txt = "BL" end
if id == "wool_plant" then txt = "WO" end
if id == "pumpkin_plant" then txt = "PU" end
if id == "deer" then txt = "DE" end
if id == "boar" then txt = "BO" end
if id == "wolf" then txt = "WF" end
if id == "wooden_crate" then txt = "WC" end
if id == "metal_crate" then txt = "MC" end
if id == "steel_crate" then txt = "SC" end
if id == "food_crate" then txt = "FC" end
if id == "timed_crate" then txt = "TC" end
if id == "care_package" then txt = "CP" end
if id == "trash_can" then txt = "TC" end
if id == "oil_barrel" then txt = "OB" end
if id == "body_bag" then txt = "BB" end
if id == "sleeper" then txt = "SL" end
if id == "wooden_boat" then txt = "WB" end
if id == "military_boat" then txt = "MB" end
if id == "flycopter" then txt = "FL" end
if txt and #txt > 2 then txt = string.sub(txt, 1, 2) end
Drawing.DrawTextWithOutline(x, y - 6, txt or "?", 1, 1, 1, 0.98 * alpha, 0, 0, 0, 0.98 * alpha)
end
end
local function k1_should_show_icon(id)
if UIManager.GetCheckboxValue("k1_loot_show_icon") == true then
if K1_LOOT_ICON_IDS[id] then return true end
end
if UIManager.GetCheckboxValue("k1_dropped_item_show_icon") == true then
if K1_WORLD_ICON_IDS[id] or id == "dropped_item" then return true end
end
if UIManager.GetCheckboxValue("k1_ore_show_icon") == true then
if id == "stone_node" or id == "metal_node" or id == "phosphate_node" then return true end
end
return false
end
function k1_icon_visuals(id, dist, range)
local size = 16
local alpha = 1
if K1_LOOT_ICON_IDS[id] then
size = UIManager.GetSliderIntValue("k1_loot_icon_size") or 16
if UIManager.GetCheckboxValue("k1_loot_fade_distance") == true and range and range > 0 then
alpha = 1 - ((dist or 0) / range) * 0.78
end
elseif K1_WORLD_ICON_IDS[id] or id == "dropped_item" or id == "stone_node" or id == "metal_node" or id == "phosphate_node" then
size = UIManager.GetSliderIntValue("k1_world_icon_size") or 16
if UIManager.GetCheckboxValue("k1_world_fade_distance") == true and range and range > 0 then
alpha = 1 - ((dist or 0) / range) * 0.78
end
end
if size < 10 then size = 10 end
if size > 48 then size = 48 end
if alpha < 0.18 then alpha = 0.18 end
if alpha > 1 then alpha = 1 end
return size, alpha
end
local function k1_draw_2d_box(x, y, w, h, r, g, b, a)
if w < 2 or h < 2 then return end
local len = math.min(18, math.max(6, math.min(w, h) * 0.28))
local th = 2
k1_draw_line(x, y, x + len, y, r, g, b, a, th)
k1_draw_line(x, y, x, y + len, r, g, b, a, th)
k1_draw_line(x + w, y, x + w - len, y, r, g, b, a, th)
k1_draw_line(x + w, y, x + w, y + len, r, g, b, a, th)
k1_draw_line(x, y + h, x + len, y + h, r, g, b, a, th)
k1_draw_line(x, y + h, x, y + h - len, r, g, b, a, th)
k1_draw_line(x + w, y + h, x + w - len, y + h, r, g, b, a, th)
k1_draw_line(x + w, y + h, x + w, y + h - len, r, g, b, a, th)
end
local function k1_base_screen_box_size(id, dist)
local base_w = 46
local base_h = 30
if id == "wooden_door" or id == "salvaged_door" or id == "metal_door" or id == "steel_door" then
base_w, base_h = 34, 58
elseif id == "wooden_double_door" or id == "metal_double_door" or id == "steel_double_door" or id == "garage_door" then
base_w, base_h = 58, 58
elseif id == "small_box" then
base_w, base_h = 32, 24
elseif id == "large_box" or id == "storage_cabinet" or id == "base_cabinet" then
base_w, base_h = 42, 34
elseif id == "sleeping_bag" then
base_w, base_h = 54, 20
elseif id == "shotgun_turret" or id == "auto_turret" then
base_w, base_h = 36, 36
elseif id == "solar_panel" then
base_w, base_h = 56, 24
elseif id == "windmill" then
base_w, base_h = 70, 90
end
local scale = 1.0
if dist > 0 then
scale = math.max(0.45, math.min(1.35, 42 / dist))
end
return base_w * scale, base_h * scale
end
local function k1_part_data(part)
if not part or not part.Position then return nil end
local sx, sy, sz = 2, 2, 2
if part.Size then
sx = part.Size.X or sx
sy = part.Size.Y or sy
sz = part.Size.Z or sz
end
return {
x = part.Position.X,
y = part.Position.Y,
z = part.Position.Z,
sx = sx,
sy = sy,
sz = sz
}
end
local function k1_collect_model_parts(model)
local parts = {}
local main = k1_find(model, "Main")
local data = k1_part_data(main)
if data then
parts[#parts + 1] = data
end
local children = k1_children(model)
if children then
for _, child in ipairs(children) do
if #parts >= 12 then break end
if child and child.Position and (child.ClassName == "Part" or child.ClassName == "MeshPart" or child.ClassName == "UnionOperation") then
data = k1_part_data(child)
if data then parts[#parts + 1] = data end
end
end
end
if #parts == 0 then
local pos = k1_part_pos(model)
if pos then
parts[1] = {
x = pos.X,
y = pos.Y,
z = pos.Z,
sx = 3,
sy = 3,
sz = 3
}
end
end
return parts
end
local function k1_project_bounds(parts)
if not parts or #parts == 0 then return nil end
local min_x, min_y = 999999, 999999
local max_x, max_y = -999999, -999999
local valid = false
for _, p in ipairs(parts) do
local hx = (p.sx or 2) * 0.5
local hy = (p.sy or 2) * 0.5
local hz = (p.sz or 2) * 0.5
local corners = {
{p.x - hx, p.y - hy, p.z - hz},
{p.x + hx, p.y - hy, p.z - hz},
{p.x - hx, p.y + hy, p.z - hz},
{p.x + hx, p.y + hy, p.z - hz},
{p.x - hx, p.y - hy, p.z + hz},
{p.x + hx, p.y - hy, p.z + hz},
{p.x - hx, p.y + hy, p.z + hz},
{p.x + hx, p.y + hy, p.z + hz}
}
for i = 1, 8 do
local c = corners[i]
local s = Drawing.WorldToScreen({ X = c[1], Y = c[2], Z = c[3] })
if s and s.X and s.X ~= -1 then
valid = true
if s.X < min_x then min_x = s.X end
if s.X > max_x then max_x = s.X end
if s.Y < min_y then min_y = s.Y end
if s.Y > max_y then max_y = s.Y end
end
end
end
if not valid then return nil end
local w = max_x - min_x
local h = max_y - min_y
if w <= 1 or h <= 1 then return nil end
if w > 900 or h > 700 then return nil end
return min_x, min_y, w, h
end
local function k1_refresh_folders()
local now = tick()
if now - k1.workspace_folders.last < 6 and k1.workspace_folders.bases then return end
k1.workspace_folders.last = now
k1.workspace_folders.nodes = k1_find("Workspace", "Nodes")
k1.workspace_folders.plants = k1_find("Workspace", "Plants")
k1.workspace_folders.animals = k1_find("Workspace", "Animals")
k1.workspace_folders.drops = k1_find("Workspace", "Drops")
k1.workspace_folders.bases = k1_find("Workspace", "Bases")
k1.workspace_folders.loners = k1.workspace_folders.bases and k1_find(k1.workspace_folders.bases, "Loners") or nil
end
local function k1_any(list)
for _, cfg in ipairs(list) do
if k1_enabled(cfg.id) then return true end
end
return false
end
function k1_norm_name_for_match(v)
v = tostring(v or "")
v = string.lower(v)
v = string.gsub(v, "%s+", "")
v = string.gsub(v, "_", "")
v = string.gsub(v, "%-", "")
v = string.gsub(v, "%(%s*clone%s*%)", "")
return v
end
function k1_cfg_name_match(cfg, objName)
if not cfg then return false end
if not cfg.names then return true end
if cfg.names[objName] then return true end
local n = k1_norm_name_for_match(objName)
for k, _ in pairs(cfg.names) do
if n == k1_norm_name_for_match(k) then return true end
end
return false
end
local function k1_signature(list)
local sig = ""
for _, cfg in ipairs(list) do
if k1_enabled(cfg.id) then
sig = sig .. cfg.id .. ";"
end
end
return sig
end
local function k1_draw(pos, label, id, color, range, my, box, sx, sy, sz, is_base)
if not pos then return end
local dist = k1_dist(pos, my)
if dist > range then return end
local s = k1_screen(pos)
if not s then return end
local r, g, b, a = k1_color_value(id, color)
local iconSize, fadeAlpha = k1_icon_visuals(id, dist, range)
a = a * fadeAlpha
if box and ((not is_base) or UIManager.GetCheckboxValue("k1_base_outline")) then
k1_draw_box3d(pos, sx or 4, sy or 4, sz or 4, r, g, b, a, 2)
end
local dropShowIcon = k1_should_show_icon(id)
if dropShowIcon then
k1_draw_icon_circle(label, id, s.X, s.Y - 18, iconSize, fadeAlpha)
end
if (not is_base) or UIManager.GetCheckboxValue("k1_base_text") then
local textY = s.Y
if dropShowIcon then textY = textY + 2 end
Drawing.DrawTextWithOutline(s.X, textY, label, r, g, b, a, 0, 0, 0, fadeAlpha)
if UIManager.GetCheckboxValue("k1_show_distance") then
Drawing.DrawTextWithOutline(s.X, textY + 14, string.format("%.0fm", dist), r, g, b, a, 0, 0, 0, fadeAlpha)
end
end
end
local function k1_draw_world(my)
if not k1_any(K1_WORLD_ITEMS) then return end
k1_refresh_folders()
local range = UIManager.GetSliderIntValue("k1_world_range") or 500
for _, cfg in ipairs(K1_WORLD_ITEMS) do
if k1_enabled(cfg.id) then
local folder = k1.workspace_folders[cfg.folder]
local children = k1_children(folder)
if children then
for i = 1, #children do
local model = children[i]
if model and model.Name and k1_cfg_name_match(cfg, model.Name) then
local pos = k1_part_pos(model)
local label = cfg.id == "dropped_item" and (model.Name or cfg.label) or cfg.label
k1_draw(pos, label, cfg.id, cfg.color, range, my, false)
end
end
end
end
end
end
local function k1_rescan_loot()
k1.loot_folder_cache = {}
if not k1_any(K1_LOOT_ITEMS) then return end
k1_refresh_folders()
local loners = k1.workspace_folders.loners
local type_folders = k1_children(loners)
if not type_folders then return end
for _, type_folder in ipairs(type_folders) do
if #k1.loot_folder_cache >= 120 then break end
if type_folder and type_folder.Name then
for _, cfg in ipairs(K1_LOOT_ITEMS) do
if k1_enabled(cfg.id) and k1_cfg_name_match(cfg, type_folder.Name) then
local models = k1_children(type_folder)
if models then
for _, model in ipairs(models) do
if #k1.loot_folder_cache >= 120 then break end
local pos = nil
local main = k1_find(model, "Main")
if main and main.Position then pos = main.Position end
if not pos then
local inner = k1_find(model, type_folder.Name)
local inner_main = inner and k1_find(inner, "Main")
if inner_main and inner_main.Position then pos = inner_main.Position end
end
if not pos then
pos = k1_part_pos(model)
end
if pos then
table.insert(k1.loot_folder_cache, {
pos = pos,
cfg = cfg,
model = model
})
end
end
end
break
end
end
end
end
end
local function k1_draw_loot(my)
if not k1_any(K1_LOOT_ITEMS) then
k1.loot_folder_cache = {}
k1.last_loot_signature = ""
return
end
local now = tick()
local sig = k1_signature(K1_LOOT_ITEMS)
if sig ~= k1.last_loot_signature then
k1.last_loot_signature = sig
k1.last_loot_cache = now
pcall(function()
k1_rescan_loot()
end)
end
local range = UIManager.GetSliderIntValue("k1_loot_range") or 350
for _, entry in ipairs(k1.loot_folder_cache) do
if entry and entry.cfg and entry.pos and k1_enabled(entry.cfg.id) then
k1_draw(entry.pos, entry.cfg.label, entry.cfg.id, entry.cfg.color, range, my, false)
end
end
end
local function k1_rescan_base()
k1.base_folder_cache = {}
k1_refresh_folders()
local bases = k1.workspace_folders.bases
local bases_children = k1_children(bases)
if not bases_children then return end
for _, base_folder in ipairs(bases_children) do
if #k1.base_folder_cache >= 180 then break end
if base_folder and base_folder.Name ~= "Loners" then
local base_children = k1_children(base_folder)
if base_children then
for _, type_folder in ipairs(base_children) do
if #k1.base_folder_cache >= 180 then break end
if type_folder and type_folder.Name then
for _, cfg in ipairs(K1_BASE_ITEMS) do
if k1_enabled(cfg.id) and k1_cfg_name_match(cfg, type_folder.Name) then
local children = k1_children(type_folder)
if children then
for _, model in ipairs(children) do
if #k1.base_folder_cache >= 180 then break end
if model and model.ClassName == "Model" then
local pos = k1_part_pos(model)
if pos then
table.insert(k1.base_folder_cache, {
pos = pos,
cfg = cfg
})
end
end
end
else
local pos = k1_part_pos(type_folder)
if pos then
table.insert(k1.base_folder_cache, {
pos = pos,
cfg = cfg
})
end
end
break
end
end
end
end
end
end
end
end
local function k1_draw_base(my)
if not k1_any(K1_BASE_ITEMS) then
k1.base_folder_cache = {}
k1.last_base_signature = ""
return
end
local now = tick()
local sig = k1_signature(K1_BASE_ITEMS)
if sig ~= k1.last_base_signature then
k1.last_base_signature = sig
k1.last_base_cache = now
pcall(function()
k1_rescan_base()
end)
end
local range = UIManager.GetSliderIntValue("k1_base_range") or 220
for _, entry in ipairs(k1.base_folder_cache) do
if entry and entry.cfg and k1_enabled(entry.cfg.id) and entry.pos then
local dist = k1_dist(entry.pos, my)
if dist <= range then
local screen = k1_screen(entry.pos)
if screen then
local r, g, b, a = k1_color_value(entry.cfg.id, entry.cfg.color)
if true then
Drawing.DrawTextWithOutline(screen.X, screen.Y, entry.cfg.label, r, g, b, a, 0, 0, 0, 1)
if UIManager.GetCheckboxValue("k1_show_distance") then
Drawing.DrawTextWithOutline(screen.X, screen.Y + 14, string.format("%.0fm", dist), r, g, b, a, 0, 0, 0, 1)
end
end
end
end
end
end
end
local function k1_create_item(cfg)
UIManager.CreateCheckbox("k1_" .. cfg.id, cfg.title, false)
UIManager.SetElementParent("k1_" .. cfg.id, K1_TAB)
UIManager.CreateColorPicker("k1_" .. cfg.id .. "_color", "", cfg.color.r, cfg.color.g, cfg.color.b, cfg.color.a)
UIManager.SetElementParent("k1_" .. cfg.id .. "_color", K1_TAB)
UIManager.SetElementSameLine("k1_" .. cfg.id .. "_color", true)
end
UIManager.CreateSeparator("fallen_sep_esp")
UIManager.SetElementParent("fallen_sep_esp", TAB_ID)
UIManager.CreateText("k1_world_title", "World")
UIManager.SetElementParent("k1_world_title", K1_TAB)
UIManager.CreateSliderInt("k1_world_range", "World Range", 25, 2000, 500)
UIManager.SetElementParent("k1_world_range", K1_TAB)
UIManager.CreateSliderInt("k1_world_icon_size", "World Icon Size", 10, 48, 16)
UIManager.SetElementParent("k1_world_icon_size", K1_TAB)
UIManager.CreateCheckbox("k1_world_fade_distance", "Fade by Distance", false)
UIManager.SetElementParent("k1_world_fade_distance", K1_TAB)
for _, cfg in ipairs(K1_WORLD_ITEMS) do k1_create_item(cfg) end
UIManager.CreateCheckbox("k1_dropped_item_show_icon", "Show Icons", false)
UIManager.SetElementParent("k1_dropped_item_show_icon", K1_TAB)
UIManager.CreateCheckbox("k1_ore_show_icon", "Ore Icons", false)
UIManager.SetElementParent("k1_ore_show_icon", K1_TAB)
UIManager.CreateSeparator("k1_sep_loot")
UIManager.SetElementParent("k1_sep_loot", K1_TAB)
UIManager.CreateText("k1_loot_title", "Loot")
UIManager.SetElementParent("k1_loot_title", K1_TAB)
UIManager.CreateSliderInt("k1_loot_range", "Loot Range", 25, 2000, 350)
UIManager.SetElementParent("k1_loot_range", K1_TAB)
UIManager.CreateSliderInt("k1_loot_icon_size", "Loot Icon Size", 10, 48, 16)
UIManager.SetElementParent("k1_loot_icon_size", K1_TAB)
UIManager.CreateCheckbox("k1_loot_show_icon", "Show Icon", false)
UIManager.SetElementParent("k1_loot_show_icon", K1_TAB)
UIManager.CreateCheckbox("k1_loot_fade_distance", "Fade by Distance", false)
UIManager.SetElementParent("k1_loot_fade_distance", K1_TAB)
for _, cfg in ipairs(K1_LOOT_ITEMS) do k1_create_item(cfg) end
UIManager.CreateCheckbox("k1_flycopter_sit", "copter-sit", false, function(v)
ap_copter_sit_enabled = v == true
end)
UIManager.SetElementParent("k1_flycopter_sit", K1_TAB)
UIManager.CreateButton("k1_flycopter_sit_key", "c-sit Key: None", function()
ap_begin_tp_bind_capture("copter_sit")
end)
UIManager.SetElementParent("k1_flycopter_sit_key", K1_TAB)
UIManager.CreateText("k1_flycopter_sit_hint", "R3 S200 + E")
UIManager.SetElementParent("k1_flycopter_sit_hint", K1_TAB)
UIManager.CreateSeparator("k1_sep_base")
UIManager.SetElementParent("k1_sep_base", K1_TAB)
UIManager.CreateText("k1_base_title", "Base")
UIManager.SetElementParent("k1_base_title", K1_TAB)
UIManager.CreateSliderInt("k1_base_range", "Base Range", 25, 2000, 220)
UIManager.SetElementParent("k1_base_range", K1_TAB)
UIManager.CreateCheckbox("k1_base_text", "Base Text", true)
UIManager.SetElementParent("k1_base_text", K1_TAB)
for _, cfg in ipairs(K1_BASE_ITEMS) do k1_create_item(cfg) end
UIManager.CreateSeparator("k1_sep_misc")
UIManager.SetElementParent("k1_sep_misc", K1_TAB)
UIManager.CreateCheckbox("k1_show_distance", "Show Distance", true)
UIManager.SetElementParent("k1_show_distance", K1_TAB)
UIManager.CreateButton("k1_force_rescan", "Force Rescan", function()
k1.workspace_folders.last = 0
k1.last_base_cache = 0
k1.last_loot_cache = 0
k1.last_loot_signature = ""
k1.last_base_signature = ""
k1.base_folder_cache = {}
k1.loot_folder_cache = {}
notify("Fallen ESP rescan forced", "success")
end)
UIManager.SetElementParent("k1_force_rescan", K1_TAB)
hooks.on_render(function()
if not k1_any(K1_WORLD_ITEMS) and not k1_any(K1_LOOT_ITEMS) and not k1_any(K1_BASE_ITEMS) then
return
end
local my = GetMyPosition()
if not my then return end
k1_draw_world(my)
k1_draw_loot(my)
k1_draw_base(my)
end)
notify("Fallen ESP no periodic rescan loaded", "success")
local function draw_head_reticle(x, y, r, g, b, a)
local size = 4
local gap = size * 0.25
local arm = size * 0.35
local thick = 1.1
Drawing.DrawCircle(x, y, size, r, g, b, a, thick)
Drawing.DrawLine(x, y - size - arm, x, y - size + gap, r, g, b, a, thick)
Drawing.DrawLine(x, y + size - gap, x, y + size + arm, r, g, b, a, thick)
Drawing.DrawLine(x - size - arm, y, x - size + gap, y, r, g, b, a, thick)
Drawing.DrawLine(x + size - gap, y, x + size + arm, y, r, g, b, a, thick)
Drawing.DrawCircleFilled(x, y, 0.9, r, g, b, a)
end
local function fallen_get_turret_health(inst)
if not inst then
return nil
end
local hp = nil
pcall(function()
local h = inst:find_first_child("Health")
if h then
hp = h:get_value()
end
end)
if not hp then
pcall(function()
local h = inst:find_first_child("HP")
if h then
hp = h:get_value()
end
end)
end
if not hp then
pcall(function()
local h = inst:find_first_child("HitPoints")
if h then
hp = h:get_value()
end
end)
end
if not hp then
pcall(function()
hp = inst.health
end)
end
hp = tonumber(hp)
if not hp then
return nil
end
if hp < 0 then hp = 0 end
if hp > 250 then hp = 250 end
return hp
end
local function fallen_draw_turret_hp(x, y, hp)
if not hp then
return
end
local text = string.format("HP: %.0f/250", hp)
Drawing.DrawTextWithOutline(
x, y,
text,
0.3, 1.0, 0.3, 1.0,
0.0, 0.0, 0.0, 1.0
)
end
local ap_enabled      = false
local ap_tp_target_enabled = false
local ap_tp_last_time = 0
local ap_tp_cooldown = 0.012
local ap_tp_last_target = nil
local ap_tp_orbit_angle = 0
local ap_tp_last_orbit_tick = 0
local ap_target_strafe_enabled = false
local ap_target_strafe_angle = 0
local ap_target_strafe_radius = 4.0
local ap_target_strafe_speed = 280
local ap_target_strafe_last_tp = 0
local ap_target_strafe_last_tick = 0
local ap_target_strafe_cooldown = 0.016
local ap_tp_orbit_radius = 3
local ap_tp_orbit_speed = 275
local ap_team_check   = false
local ap_fov_px       = 250
local ap_max_dist     = 1200
local ap_power        = 0.54
local ap_prediction_enabled = false
local ap_target_players_enabled = true
local ap_drop_prediction_enabled = true
local ap_target_bone = 0 -- 0 Head, 1 UpperTorso/Torso, 2 LowerTorso/HRP
local function ap_is_projectile_weapon(name)
if not name then return false end
local n = string.lower(tostring(name))
return n == "wooden bow" or n == "bow" or n == "crossbow" or n == "nail gun" or n == "nailgun"
end
local AP_GRAVITY      = 196.2
local AP_BULLET_SPEED = 1000.0
local AP_MAX_SAMPLES  = 8
local ap_auto_weapon_stats = true
local ap_manual_bullet_speed = 1000.0
local ap_manual_gravity = 35.0
-- FALLEN projectile tuning
local AP_BOW_SPEED = 300.0
local AP_BOW_GRAVITY = 30.0
local AP_BOW_VELOCITY_BOOST = 1.00
local ap_current_weapon_name = nil
local ap_last_weapon_notify = nil
local ap_show_weapon_info = false
local ap_adv_prediction = true
local ap_ping_ms = 75
local ap_accel_power = 0.30
local ap_adaptive_lead = true
local ap_vel_ema = {}
local ap_last_vel = {}
local AP_MODEL_TEST_WEAPON_STATS = {
["Bruno's M4A1"] = { speed = 1000, gravity = 18 },
["Military Barret"] = { speed = 1500, gravity = 25 },
["Military Barrett"] = { speed = 1500, gravity = 25 },
["Military M4A1"] = { speed = 950, gravity = 18 },
["Military M39"] = { speed = 900, gravity = 18 },
["Military MP7"] = { speed = 750, gravity = 15 },
["Military PKM"] = { speed = 850, gravity = 18 },
["Military USP"] = { speed = 650, gravity = 12 },
["Military AA12"] = { speed = 700, gravity = 15 },
["Salvaged AK47"] = { speed = 800, gravity = 15 },
["Salvaged AK4"] = { speed = 800, gravity = 15 },
["Salvaged AK74u"] = { speed = 750, gravity = 15 },
["Salvaged Sniper"] = { speed = 1100, gravity = 20 },
["Salvaged M14"] = { speed = 850, gravity = 18 },
["Salvaged SMG"] = { speed = 700, gravity = 12 },
["Salvaged Skorpion"] = { speed = 650, gravity = 12 },
["Salvaged Python"] = { speed = 750, gravity = 15 },
["Salvaged P250"] = { speed = 650, gravity = 12 },
["Salvaged Pipe Rifle"] = { speed = 800, gravity = 20 },
["Salvaged Pump Action"] = { speed = 550, gravity = 15 },
["Salvaged Shotgun"] = { speed = 550, gravity = 15 },
["Salvaged Double Barrel"] = { speed = 550, gravity = 15 },
["Salvaged Break Action"] = { speed = 550, gravity = 15 },
["Crossbow"] = { speed = 400, gravity = 35 },
["Wooden Bow"] = { speed = 300, gravity = 30 },
["Nail Gun"] = { speed = 350, gravity = 20 },
["Nailgun"] = { speed = 350, gravity = 20 },
["Wooden Spear"] = { speed = 200, gravity = 45 },
["Stone Spear"] = { speed = 200, gravity = 45 },
["Pumpkin Launcher"] = { speed = 300, gravity = 50 },
["Salvaged RPG"] = { speed = 400, gravity = 60 },
}
local ap_smooth_power = 0.62
local ap_smoothed_pred = nil
local ap_last_aim_addr = nil
local AP_DIST_VEL_BOOST_MAX = 1.45
local AP_SPEED_VEL_BOOST_MAX = 1.58
local AP_SPEED_FOR_MAX_BOOST = 28.0
local ap_vel_hist = {}
local ap_aim_vk = 0x06

ap_side_tp_distance_default = 20
ap_side_tp_writes_per_frame = 60
ap_side_tp_lock_writes = 40
ap_side_tp_mouse_writes = 64
ap_copter_sit_enabled = false
ap_copter_sit_vk = 0
ap_copter_sit_angle = 0
ap_copter_sit_last_tick = 0
ap_copter_sit_last_tp = 0
ap_copter_sit_last_e = 0
ap_copter_sit_cooldown = 0.016
ap_copter_sit_radius = 3.0
ap_copter_sit_speed = 200
ap_copter_sit_lock_pos = nil
ap_copter_sit_locked_key = nil
ap_copter_sit_cache = {}
ap_copter_sit_cache_at = 0
ap_copter_sit_was_down = false
ap_copter_sit_active_entry = nil
ap_copter_sit_active_center = nil
ap_copter_sit_center_at = 0
ap_left_tp_vk = 0
ap_right_tp_vk = 0
ap_90_left_tp_vk = 0
ap_90_right_tp_vk = 0
ap_left_tp_enabled = false
ap_right_tp_enabled = false
ap_90_left_tp_enabled = false
ap_90_right_tp_enabled = false
ap_left_tp_active = false
ap_right_tp_active = false
ap_90_left_tp_active = false
ap_90_right_tp_active = false
ap_left_tp_target_pos = nil
ap_right_tp_target_pos = nil
ap_90_left_tp_target_pos = nil
ap_90_right_tp_target_pos = nil
ap_90_left_tp_dir = nil
ap_90_right_tp_dir = nil
ap_tp_bind_waiting = nil
ap_tp_bind_wait_release = false
local ap_bind_waiting = false
local ap_bind_wait_release = false
local ap_sticky_aim = false
local ap_locked_target_addr = nil
local function ap_vk_name(vk)
local names = {
[0x01] = "Mouse1",
[0x02] = "Mouse2",
[0x04] = "Mouse3",
[0x05] = "Mouse4",
[0x06] = "Mouse5",
[0x08] = "Backspace",
[0x09] = "Tab",
[0x0D] = "Enter",
[0x10] = "Shift",
[0x11] = "Ctrl",
[0x12] = "Alt",
[0x1B] = "Esc",
[0x20] = "Space",
[0x25] = "Left",
[0x26] = "Up",
[0x27] = "Right",
[0x28] = "Down"
}
if names[vk] then return names[vk] end
if vk >= 0x30 and vk <= 0x39 then return string.char(vk) end
if vk >= 0x41 and vk <= 0x5A then return string.char(vk) end
if vk >= 0x70 and vk <= 0x7B then return "F" .. tostring(vk - 0x6F) end
return "VK " .. tostring(vk)
end

function ap_tp_vk_name(vk)
vk = tonumber(vk or 0) or 0
if vk <= 0 then return "None" end
return ap_vk_name(vk)
end
function ap_tp_side_label(side)
if side == "left" then return "Left TP" end
if side == "right" then return "Right TP" end
if side == "90_left" then return "90 Left TP" end
if side == "90_right" then return "90 Right TP" end
if side == "copter_sit" then return "copter-sit" end
return "TP"
end
function ap_clear_same_tp_key(vk, keep_side)
vk = tonumber(vk or 0) or 0
if vk <= 0 then return end
if keep_side ~= "left" and ap_left_tp_vk == vk then ap_left_tp_vk = 0 end
if keep_side ~= "right" and ap_right_tp_vk == vk then ap_right_tp_vk = 0 end
if keep_side ~= "90_left" and ap_90_left_tp_vk == vk then ap_90_left_tp_vk = 0 end
if keep_side ~= "90_right" and ap_90_right_tp_vk == vk then ap_90_right_tp_vk = 0 end
if keep_side ~= "copter_sit" and ap_copter_sit_vk == vk then ap_copter_sit_vk = 0 end
end
function ap_begin_tp_bind_capture(side)
ap_tp_bind_waiting = side
ap_tp_bind_wait_release = true
notify("Press a key for " .. ap_tp_side_label(side) .. " bind. Esc cancels.", "warning")
end
function ap_finish_tp_bind_capture(vk)
local side = ap_tp_bind_waiting
if not side then return end
vk = tonumber(vk or 0) or 0
ap_clear_same_tp_key(vk, side)
if side == "left" then
ap_left_tp_vk = vk
notify("Left TP Key: " .. ap_tp_vk_name(ap_left_tp_vk), "success")
elseif side == "right" then
ap_right_tp_vk = vk
notify("Right TP Key: " .. ap_tp_vk_name(ap_right_tp_vk), "success")
elseif side == "90_left" then
ap_90_left_tp_vk = vk
notify("90 Left TP Key: " .. ap_tp_vk_name(ap_90_left_tp_vk), "success")
elseif side == "90_right" then
ap_90_right_tp_vk = vk
notify("90 Right TP Key: " .. ap_tp_vk_name(ap_90_right_tp_vk), "success")
elseif side == "copter_sit" then
ap_copter_sit_vk = vk
notify("c-sit Key: " .. ap_tp_vk_name(ap_copter_sit_vk), "success")
end
ap_tp_bind_waiting = nil
ap_tp_bind_wait_release = false
end
function ap_cancel_tp_bind_capture()
local side = ap_tp_bind_waiting
ap_tp_bind_waiting = nil
ap_tp_bind_wait_release = false
if side then notify(ap_tp_side_label(side) .. " keybind canceled", "warning") end
end

local function ap_begin_bind_capture()
ap_bind_waiting = true
ap_bind_wait_release = true
ap_set_bind_button_visible(0, true)
notify("Press a key for Aimbot bind. Esc cancels.", "warning")
end
function ap_set_bind_button_visible(vk, waiting)
pcall(function()
UIManager.SetElementVisible("ap_aim_bind_wait", waiting == true)
end)
for i = 1, 255 do
pcall(function()
UIManager.SetElementVisible("ap_aim_bind_vk_" .. tostring(i), (not waiting) and i == vk)
end)
end
end
local function ap_create_bind_buttons()
UIManager.CreateButton("ap_aim_bind_wait", "Aimbot Key: ...", function()
end)
UIManager.SetElementParent("ap_aim_bind_wait", TAB_ID)
UIManager.SetElementVisible("ap_aim_bind_wait", false)
for i = 1, 255 do
UIManager.CreateButton("ap_aim_bind_vk_" .. tostring(i), "Aimbot Key: " .. ap_vk_name(i), function()
ap_begin_bind_capture()
end)
UIManager.SetElementParent("ap_aim_bind_vk_" .. tostring(i), TAB_ID)
UIManager.SetElementVisible("ap_aim_bind_vk_" .. tostring(i), i == ap_aim_vk)
end
end
hooks.on_player_leave(function(addr)
ap_vel_hist[addr] = nil
ap_vel_ema[addr] = nil
ap_last_vel[addr] = nil
end)
local function ap_push_sample(addr, pos)
if not ap_vel_hist[addr] then
ap_vel_hist[addr] = {}
end
local t = tick()
table.insert(ap_vel_hist[addr], { pos = pos, t = t })
while #ap_vel_hist[addr] > AP_MAX_SAMPLES do
table.remove(ap_vel_hist[addr], 1)
end
end
local function ap_get_vel(addr)
local h = ap_vel_hist[addr]
if not h or #h < 2 then
return { X = 0, Y = 0, Z = 0 }
end
local a = h[1]
local b = h[#h]
local dt = b.t - a.t
if dt < 0.001 then
return { X = 0, Y = 0, Z = 0 }
end
return {
X = (b.pos.X - a.pos.X) / dt,
Y = (b.pos.Y - a.pos.Y) / dt,
Z = (b.pos.Z - a.pos.Z) / dt
}
end
local function ap_vec3_valid(v)
return v and v.X ~= nil and v.Y ~= nil and v.Z ~= nil
end

local function ap_read_assembly_velocity_from_addr(addr)
local out = nil
pcall(function()
if addr and addr ~= 0 and memory and memory.read_ptr and memory.read_vec3 and memory.offsets then
local inst = rbx and rbx.instance and rbx.instance(addr) or nil
local iaddr = (inst and inst.addr) or addr
local prim = memory.read_ptr(iaddr + memory.offsets.Primitive)
if prim and prim ~= 0 then
out = memory.read_vec3(prim + memory.offsets.AssemblyLinearVelocity)
end
end
end)
if ap_vec3_valid(out) then
return { X = out.X, Y = out.Y, Z = out.Z }
end
return nil
end

-- Velocity source:
-- Reads root AssemblyLinearVelocity first, then Velocity.
-- This port now reads raw AssemblyLinearVelocity from HRP through memory offsets,
-- then falls back to :get_velocity(). No extra p.velocity / sample-delta boost here.
local function ap_get_target_velocity(p)
local vel = nil
if p and p.hrp_addr and p.hrp_addr ~= 0 then
vel = ap_read_assembly_velocity_from_addr(p.hrp_addr)
if ap_vec3_valid(vel) then return vel end
pcall(function()
if rbx and rbx.instance then
local hrp = rbx.instance(p.hrp_addr)
if hrp and hrp.get_velocity then vel = hrp:get_velocity() end
end
end)
if ap_vec3_valid(vel) then return { X = vel.X, Y = vel.Y, Z = vel.Z } end
end
if p and p.head_addr and p.head_addr ~= 0 then
vel = ap_read_assembly_velocity_from_addr(p.head_addr)
if ap_vec3_valid(vel) then return vel end
pcall(function()
if rbx and rbx.instance then
local head = rbx.instance(p.head_addr)
if head and head.get_velocity then vel = head:get_velocity() end
end
end)
if ap_vec3_valid(vel) then return { X = vel.X, Y = vel.Y, Z = vel.Z } end
end
return { X = 0, Y = 0, Z = 0 }
end

-- Prediction math ported to your API:
-- time_to_hit = distance / bullet_speed
-- predicted = part_pos + velocity * time_to_hit
-- drop      = 0.5 * gravity * time_to_hit^2
local function ap_predict_pos(p, aim_pos, cam_pos)
if not aim_pos then return nil end
local px, py, pz = aim_pos.X, aim_pos.Y, aim_pos.Z
local aim_x, aim_y, aim_z = px, py, pz
local bullet_speed = AP_BULLET_SPEED or 1000
local gravity = AP_GRAVITY or 35
if bullet_speed < 1 then bullet_speed = 1000 end
local dist_to_target = 0
if cam_pos and cam_pos.X then
local dx = px - cam_pos.X
local dy = py - cam_pos.Y
local dz = pz - cam_pos.Z
dist_to_target = math.sqrt(dx * dx + dy * dy + dz * dz)
else
dist_to_target = p and p.distance or 0
end
local time_to_hit = dist_to_target / bullet_speed
if time_to_hit < 0 then time_to_hit = 0 end
if time_to_hit > 3.0 then time_to_hit = 3.0 end
if ap_prediction_enabled then
local vel = ap_get_target_velocity(p)
if vel then
local vx = vel.X or 0
local vy = vel.Y or 0
local vz = vel.Z or 0
local hspeed = math.sqrt(vx * vx + vz * vz)
local pred_scale = 1.0
local weapon_name = string.lower(tostring(ap_current_weapon_name or ""))
local is_bow_weapon = string.find(weapon_name, "bow", 1, true) ~= nil or string.find(weapon_name, "crossbow", 1, true) ~= nil

if is_bow_weapon then
    -- Bow / Crossbow keep strong prediction.
    -- Only cut impossible velocity spikes, but do not weaken normal running lead.
    if hspeed > 95 then
        pred_scale = 0.85
    elseif hspeed > 34 then
        pred_scale = 0.95
    else
        pred_scale = 1.00
    end
else
    -- Guns: overall prediction reduced, not only sprint.
    if hspeed > 34 then
        pred_scale = 0.14
    elseif hspeed > 24 then
        pred_scale = 0.20
    elseif hspeed > 16 then
        pred_scale = 0.32
    elseif hspeed > 8 then
        pred_scale = 0.48
    else
        pred_scale = 0.62
    end
end

-- Prevent rare network/physics spikes from throwing aim too far.
local max_hspeed = is_bow_weapon and 130 or 95
if hspeed > max_hspeed then
    local mul = max_hspeed / hspeed
    vx = vx * mul
    vz = vz * mul
end

local y_scale = is_bow_weapon and 0.20 or 0.04
if math.abs(vy) < 3 then y_scale = 0 end
aim_x = px + vx * time_to_hit * pred_scale
aim_y = py + vy * time_to_hit * y_scale
aim_z = pz + vz * time_to_hit * pred_scale
end
end
if ap_drop_prediction_enabled then
local drop = 0.5 * gravity * (time_to_hit * time_to_hit)
aim_y = aim_y + drop
end
return { X = aim_x, Y = aim_y, Z = aim_z, time = time_to_hit }
end
local AP_MODEL_BODY_NAMES = {
Head = true,
UpperTorso = true,
LowerTorso = true,
LeftHand = true,
RightHand = true,
LeftUpperArm = true,
RightUpperArm = true,
LeftLowerArm = true,
RightLowerArm = true,
LeftUpperLeg = true,
RightUpperLeg = true,
LeftLowerLeg = true,
RightLowerLeg = true,
LeftFoot = true,
RightFoot = true,
Humanoid = true,
HumanoidRootPart = true,
Hair = true,
Face = true,
BodyColors = true,
}
local function ap_vec_len(v)
return math.sqrt((v.X * v.X) + (v.Y * v.Y) + (v.Z * v.Z))
end
local function ap_clamp_vec(v, max_len)
local len = ap_vec_len(v)
if len <= max_len or len <= 0.001 then return v end
local k = max_len / len
return { X = v.X * k, Y = v.Y * k, Z = v.Z * k }
end
local function ap_get_filtered_vel(addr, raw)
if not addr then return raw end
raw = ap_clamp_vec(raw, 120)
local old = ap_vel_ema[addr]
if not old then
ap_vel_ema[addr] = { X = raw.X, Y = raw.Y, Z = raw.Z }
return ap_vel_ema[addr]
end
local k = 1.00
old.X = raw.X
old.Y = raw.Y
old.Z = raw.Z
return old
end
local function ap_get_accel(addr, vel)
if not addr then return { X = 0, Y = 0, Z = 0 } end
local last = ap_last_vel[addr]
ap_last_vel[addr] = { X = vel.X, Y = vel.Y, Z = vel.Z, t = tick() }
if not last or not last.t then
return { X = 0, Y = 0, Z = 0 }
end
local dt = tick() - last.t
if dt < 0.001 then dt = 0.001 end
if dt > 0.25 then dt = 0.25 end
return ap_clamp_vec({
X = (vel.X - last.X) / dt,
Y = (vel.Y - last.Y) / dt,
Z = (vel.Z - last.Z) / dt
}, 180)
end
local function ap_get_ping_seconds()
local ping_ms = ap_ping_ms or 0
pcall(function()
if stats and stats.ping then ping_ms = stats.ping end
end)
pcall(function()
if network and network.ping then ping_ms = network.ping() end
end)
if ping_ms < 0 then ping_ms = 0 end
if ping_ms > 300 then ping_ms = 300 end
return ping_ms / 1000.0
end
local function ap_distance_lead_scale(dist, max_dist)
if not ap_adaptive_lead then return 1.0 end
local f = dist / math.max(1, max_dist or 1200)
if f < 0 then f = 0 end
if f > 1 then f = 1 end
return 1.0 + f * 0.32
end
local function ap_dynamic_smooth(base, screen_dist, fov)
local s = base or 0.42
if not screen_dist or not fov or fov <= 0 then return s end
local f = screen_dist / fov
if f < 0 then f = 0 end
if f > 1 then f = 1 end
local dyn = s + f * 0.20
if dyn < 0.01 then dyn = 0.01 end
if dyn > 1.0 then dyn = 1.0 end
return dyn
end
local function ap_working_get_name(obj)
if not obj then return nil end
local n = nil
pcall(function() n = obj:get_name() end)
if n and n ~= "" then return n end
pcall(function() n = obj.Name end)
if n and n ~= "" then return n end
return nil
end
local function ap_working_get_class(obj)
if not obj then return nil end
local c = nil
pcall(function() c = obj:get_class() end)
if c and c ~= "" then return c end
pcall(function() c = obj.ClassName end)
if c and c ~= "" then return c end
return nil
end
local function ap_working_find_stats(name)
if not name then return nil, nil end
if AP_MODEL_TEST_WEAPON_STATS[name] then
return AP_MODEL_TEST_WEAPON_STATS[name], name
end
local lname = string.lower(name)
for k, v in pairs(AP_MODEL_TEST_WEAPON_STATS) do
local lk = string.lower(k)
if string.find(lname, lk, 1, true) or string.find(lk, lname, 1, true) then
return v, k
end
end
return nil, nil
end
local function ap_working_is_possible_weapon_model(name, class)
if not name or name == "" then return false end
if AP_MODEL_BODY_NAMES[name] then return false end
if class ~= "Model" then
return false
end
local stats = ap_working_find_stats(name)
if stats then return true end
local lname = string.lower(name)
local keys = {
"ak", "m4", "m39", "aa12", "mp7", "pkm", "usp", "barret",
"shotgun", "smg", "p250", "python", "rpg", "sniper", "bow",
"spear", "nail", "crossbow", "skorpion", "rifle", "launcher"
}
for _, k in ipairs(keys) do
if string.find(lname, k, 1, true) then
return true
end
end
return false
end
local function ap_working_detect_weapon_model()
local tool = nil
pcall(function()
if rbx and rbx.local_tool then
tool = rbx.local_tool()
end
end)
if tool then
local tn = ap_working_get_name(tool)
local tc = ap_working_get_class(tool)
if ap_working_find_stats(tn) or ap_working_is_possible_weapon_model(tn, tc) then
return tn, tool, "rbx.local_tool picked=" .. tostring(tn) .. " [" .. tostring(tc) .. "]"
end
end
local char = nil
pcall(function()
if rbx and rbx.local_character then
char = rbx.local_character()
end
end)
if not char then
return nil, nil, "rbx.local_character nil"
end
local ok, children = pcall(function()
return char:get_children()
end)
if not ok or not children then
return nil, nil, "get_children failed"
end
local info = "children=" .. tostring(#children)
for _, child in ipairs(children) do
local n = ap_working_get_name(child)
local c = ap_working_get_class(child)
if ap_working_is_possible_weapon_model(n, c) then
return n, child, info .. " | picked=" .. tostring(n) .. " [" .. tostring(c) .. "]"
end
end
for _, child in ipairs(children) do
local n = ap_working_get_name(child)
local c = ap_working_get_class(child)
if n and c == "Model" and not AP_MODEL_BODY_NAMES[n] then
return n, child, info .. " | fallback model=" .. tostring(n)
end
end
return nil, nil, info .. " | no weapon model"
end
local function ap_working_apply_weapon_stats()
local ok_speed, speed_val = pcall(function()
return UIManager.GetSliderIntValue("ap_bullet_speed_main")
end)
local ok_grav, grav_val = pcall(function()
return UIManager.GetSliderIntValue("ap_gravity_main")
end)
if ok_speed and speed_val and speed_val >= 100 then
ap_manual_bullet_speed = speed_val
end
if ok_grav and grav_val and grav_val > 0 then
ap_manual_gravity = grav_val
end
if not ap_manual_bullet_speed or ap_manual_bullet_speed < 100 then
ap_manual_bullet_speed = 1000
end
if not ap_manual_gravity or ap_manual_gravity <= 0 then
ap_manual_gravity = 35
end
local ok_auto, auto_val = pcall(function()
return UIManager.GetCheckboxValue("ap_auto_weapon_main")
end)
ap_auto_weapon_stats = ok_auto and auto_val == true
local weapon, obj, dbg = ap_working_detect_weapon_model()
local stats, matched = ap_working_find_stats(weapon)
if weapon and not stats then
local lname = string.lower(tostring(weapon))
if lname == "hair" or lname == "face" or lname == "bodycolors" then
weapon = nil
obj = nil
dbg = "ignored cosmetic model"
end
end
stats, matched = ap_working_find_stats(weapon)
ap_current_weapon_name = weapon
if weapon == "Bruno's M4A1" then
AP_BULLET_SPEED = 1000
AP_GRAVITY = 18
end
if ap_auto_weapon_stats and stats then
local spd = tonumber(stats.speed) or 0
local grv = tonumber(stats.gravity) or 0
if spd < 100 then
spd = ap_manual_bullet_speed
end
if grv <= 0 then
grv = ap_manual_gravity
end
AP_BULLET_SPEED = spd
AP_GRAVITY = grv
else
AP_BULLET_SPEED = ap_manual_bullet_speed
AP_GRAVITY = ap_manual_gravity
end
if weapon == "Wooden Bow" or weapon == "Bow" then
AP_BULLET_SPEED = AP_BOW_SPEED
AP_GRAVITY = AP_BOW_GRAVITY
elseif weapon == "Crossbow" then
AP_BULLET_SPEED = 400
AP_GRAVITY = 35
elseif weapon == "Nail Gun" or weapon == "Nailgun" then
AP_BULLET_SPEED = 350
AP_GRAVITY = 20
elseif weapon == "Wooden Spear" then
AP_BULLET_SPEED = 200
AP_GRAVITY = 45
elseif weapon == "Stone Spear" then
AP_BULLET_SPEED = 200
AP_GRAVITY = 45
elseif weapon == "Military Barret" or weapon == "Military Barrett" or weapon == "Barret" or weapon == "Barrett" then
AP_BULLET_SPEED = 1500
AP_GRAVITY = 25
elseif weapon == "Military M4A1" or weapon == "M4" or weapon == "M4A1" then
AP_BULLET_SPEED = 950
AP_GRAVITY = 18
elseif weapon == "Bruno's M4A1" then
AP_BULLET_SPEED = 1000
AP_GRAVITY = 18
elseif weapon == "Brunos M4A1" or weapon == "Bruno M4A1" then
AP_BULLET_SPEED = 1000
AP_GRAVITY = 18
elseif weapon == "Military M39" or weapon == "M39" then
AP_BULLET_SPEED = 900
AP_GRAVITY = 18
elseif weapon == "Military MP7" or weapon == "MP7" then
AP_BULLET_SPEED = 750
AP_GRAVITY = 15
elseif weapon == "Military PKM" or weapon == "PKM" then
AP_BULLET_SPEED = 850
AP_GRAVITY = 18
elseif weapon == "Military USP" or weapon == "USP" then
AP_BULLET_SPEED = 650
AP_GRAVITY = 12
elseif weapon == "Military AA12" or weapon == "AA12" then
AP_BULLET_SPEED = 700
AP_GRAVITY = 15
elseif weapon == "Military Grenade Launcher" then
AP_BULLET_SPEED = 350
AP_GRAVITY = 55
elseif weapon == "Salvaged AK47" or weapon == "AK47" then
AP_BULLET_SPEED = 800
AP_GRAVITY = 15
elseif weapon == "Salvaged AK4" or weapon == "AK4" then
AP_BULLET_SPEED = 800
AP_GRAVITY = 15
elseif weapon == "Salvaged AK74u" or weapon == "AK74u" or weapon == "AK74U" then
AP_BULLET_SPEED = 750
AP_GRAVITY = 15
elseif weapon == "Salvaged Sniper" or weapon == "Sniper" then
AP_BULLET_SPEED = 1100
AP_GRAVITY = 20
elseif weapon == "Salvaged M14" or weapon == "M14" then
AP_BULLET_SPEED = 850
AP_GRAVITY = 18
elseif weapon == "Salvaged SMG" or weapon == "SMG" then
AP_BULLET_SPEED = 700
AP_GRAVITY = 12
elseif weapon == "Salvaged Skorpion" or weapon == "Skorpion" then
AP_BULLET_SPEED = 650
AP_GRAVITY = 12
elseif weapon == "Salvaged Python" or weapon == "Python" then
AP_BULLET_SPEED = 750
AP_GRAVITY = 15
elseif weapon == "Salvaged P250" or weapon == "P250" then
AP_BULLET_SPEED = 650
AP_GRAVITY = 12
elseif weapon == "Salvaged Pipe Rifle" or weapon == "Pipe Rifle" then
AP_BULLET_SPEED = 800
AP_GRAVITY = 20
elseif weapon == "Salvaged Pump Action" or weapon == "Pump Action" then
AP_BULLET_SPEED = 550
AP_GRAVITY = 15
elseif weapon == "Salvaged Shotgun" or weapon == "Shotgun" then
AP_BULLET_SPEED = 550
AP_GRAVITY = 15
elseif weapon == "Salvaged Double Barrel" or weapon == "Double Barrel" then
AP_BULLET_SPEED = 550
AP_GRAVITY = 15
elseif weapon == "Salvaged Break Action" or weapon == "Break Action" then
AP_BULLET_SPEED = 550
AP_GRAVITY = 15
elseif weapon == "Salvaged RPG" or weapon == "RPG" then
AP_BULLET_SPEED = 400
AP_GRAVITY = 60
elseif weapon == "Salvaged Grenade Launcher" then
AP_BULLET_SPEED = 350
AP_GRAVITY = 55
elseif weapon == "Pumpkin Launcher" then
AP_BULLET_SPEED = 300
AP_GRAVITY = 50
end
if weapon and weapon ~= ap_last_weapon_notify then
ap_last_weapon_notify = weapon
end
return weapon, dbg
end






print("[EC_V141] rollback before broken closer-start experiment")
-- // ===== FALLEN VECTOR BULLET TRACERS =====
if EC_BT == nil then EC_BT = {} end
EC_BT.enabled = EC_BT.enabled or false
EC_BT.life = EC_BT.life or 4.0
EC_BT.thick = EC_BT.thick or 2.0
EC_BT.segments = EC_BT.segments or 24
EC_BT.delay = EC_BT.delay or 0.13
EC_BT.style = EC_BT.style or 0
EC_BT.hitfx = EC_BT.hitfx or false
EC_BT.hitSize = EC_BT.hitSize or 38
EC_BT.hitStyle = EC_BT.hitStyle or 12
EC_BT.realHitOnly = false
EC_BT.hitRadius = EC_BT.hitRadius or 35
EC_BT.hitHookStatus = EC_BT.hitHookStatus or "OFF"
EC_BT.last = 0
EC_BT.items = EC_BT.items or {}
EC_BT.hits = EC_BT.hits or {}

function EC_BT_NOW()
if os and os.clock then return os.clock() end
return tick()
end

function EC_BT_DOWN()
local down = false
pcall(function()
if input and input.is_key_down then
down = input.is_key_down(0x01) == true
end
end)
if down then return true end
pcall(function()
if Windows and Windows.IsKeyPressed then
down = Windows.IsKeyPressed(0x01) == true
end
end)
return down == true
end

function EC_BT_SCREEN(pos)
local s = nil
pcall(function()
if aim and aim.world_to_screen then
s = aim.world_to_screen(pos)
end
end)
if s and s.visible then return s.X, s.Y, true end
return nil,nil,false
end

function EC_BT_ADD(a,b,grav,flight)
if not a or not b then return end
local now = EC_BT_NOW()
EC_BT.shotHue = ((EC_BT.shotHue or 0.78) + 0.173) % 1.0
table.insert(EC_BT.items,{
ox=a.X,oy=a.Y,oz=a.Z,
tx=b.X,ty=b.Y,tz=b.Z,
gravity=grav or 20,
flight=flight or 0.1,
created=now,
seed=(#EC_BT.items+1)*19+math.floor(now*1000),
hue=EC_BT.shotHue
})
while #EC_BT.items > 40 do table.remove(EC_BT.items,1) end
end

function EC_BT_ADD_HIT(pos)
if not EC_BT.hitfx or not pos then return end
table.insert(EC_BT.hits,{
x=pos.X,y=pos.Y,z=pos.Z,
created=EC_BT_NOW(),
seed=(#EC_BT.hits+1)*31+math.floor(EC_BT_NOW()*1000)
})
while #EC_BT.hits > 25 do table.remove(EC_BT.hits,1) end
end

function EC_BT_DIST(a,b)
if not a or not b then return 999999 end
local dx = (a.X or 0) - (b.X or 0)
local dy = (a.Y or 0) - (b.Y or 0)
local dz = (a.Z or 0) - (b.Z or 0)
return math.sqrt(dx*dx + dy*dy + dz*dz)
end


function EC_BT_OBJ_CHILDREN(o)
if not o then return {} end
local ch = {}
pcall(function() if o.GetChildren then ch = o:GetChildren() end end)
pcall(function() if (#ch == 0) and o.get_children then ch = o:get_children() end end)
pcall(function() if (#ch == 0) and o.children then ch = o.children end end)
return ch or {}
end

function EC_BT_OBJ_NAME(o)
local n = ""
pcall(function() n = o.Name or o.name or "" end)
pcall(function() if n == "" and o.get_name then n = o:get_name() end end)
return tostring(n or "")
end

function EC_BT_OBJ_HEALTH(o)
if not o then return nil end
local hp = nil

pcall(function() if o.Health ~= nil then hp = o.Health end end)
pcall(function() if (not hp) and o.health ~= nil then hp = o.health end end)
pcall(function() if (not hp) and o.HP ~= nil then hp = o.HP end end)
pcall(function() if (not hp) and o.hp ~= nil then hp = o.hp end end)
pcall(function() if (not hp) and o.get_health then hp = o:get_health() end end)
pcall(function() if (not hp) and o.GetHealth then hp = o:GetHealth() end end)

if hp ~= nil then return tonumber(hp) end

-- character/model -> Humanoid
for _,c in ipairs(EC_BT_OBJ_CHILDREN(o)) do
local nm = string.lower(EC_BT_OBJ_NAME(c))
local cn = ""
pcall(function() cn = string.lower(tostring(c.ClassName or c.class_name or "")) end)
if nm == "humanoid" or string.find(cn, "humanoid", 1, true) then
local h = EC_BT_OBJ_HEALTH(c)
if h ~= nil then return h end
end
end

return nil
end

function EC_BT_IS_DEAD_TARGET(target)
if not target then return true end

-- common direct flags
local dead = nil
pcall(function() if target.dead ~= nil then dead = target.dead end end)
pcall(function() if target.is_dead ~= nil then dead = target.is_dead end end)
pcall(function() if target.IsDead ~= nil then dead = target.IsDead end end)
if dead == true then return true end

-- common health fields on target / character / model
local hp = EC_BT_OBJ_HEALTH(target)
if hp ~= nil and hp <= 0 then return true end

pcall(function()
if target.character then
local h = EC_BT_OBJ_HEALTH(target.character)
if h ~= nil and h <= 0 then dead = true end
end
end)
if dead == true then return true end

pcall(function()
if target.model then
local h = EC_BT_OBJ_HEALTH(target.model)
if h ~= nil and h <= 0 then dead = true end
end
end)
if dead == true then return true end

-- Some player tables have humanoid directly.
pcall(function()
if target.humanoid then
local h = EC_BT_OBJ_HEALTH(target.humanoid)
if h ~= nil and h <= 0 then dead = true end
end
end)
if dead == true then return true end

return false
end


function EC_BT_IS_HEADSHOT(target, aimPos, predPos)
if not target or not target.head_pos then return false, nil end
local head = target.head_pos
local p = predPos or aimPos
if not p then return false, nil end
local d = EC_BT_DIST(p, head)
if d <= 2.35 then return true, head end
if aimPos and EC_BT_DIST(aimPos, head) <= 1.85 then return true, head end
return false, nil
end



function EC_BT_WEAPON_NAME()
local n = nil
-- Do not call ap_working_apply_weapon_stats here; uploaded good prediction owns weapon stats.
if ap_current_weapon_name ~= nil then n = tostring(ap_current_weapon_name) end
pcall(function()
if (not n or n == "") and ap_working_detect_weapon_model then
local a = ap_working_detect_weapon_model()
if a then n = tostring(a) end
end
end)
pcall(function()
if (not n or n == "") and rbx and rbx.local_tool then
local t = rbx.local_tool()
if t then
if t.get_name then n = tostring(t:get_name())
elseif t.Name then n = tostring(t.Name)
elseif t.name then n = tostring(t.name) end
end
end
end)
return n
end

function EC_BT_HAS_WEAPON()
local n = EC_BT_WEAPON_NAME()
EC_BT.curWeapon = n or "None"
if not n or n == "" then return false end
local s = string.lower(tostring(n))
local bad = {
"rock","stone","hatchet","pickaxe","hammer","building","tool","torch","flashlight",
"bandage","medkit","syringe","food","water","map","key","sleeping","bag"
}
for i=1,#bad do
if string.find(s,bad[i],1,true) then return false end
end
local good = {
"bow","crossbow","ak","m4","mp7","m39","barret","barrett","rifle","pistol","revolver",
"smg","skorpion","shotgun","pump","pkm","bruno","military","salvaged","eoka","python"
}
for i=1,#good do
if string.find(s,good[i],1,true) then return true end
end
if AP_BULLET_SPEED and AP_BULLET_SPEED > 100 then return true end
return false
end



function EC_BT_TARGET_POINT(p)
if not p then return nil end
if p.head_pos then return p.head_pos end
if p.root_pos then return p.root_pos end
if p.root_position then return p.root_position end
if p.hrp_pos then return p.hrp_pos end
if p.position then return p.position end
if p.parts then
for _,pt in pairs(p.parts) do
local pos = nil
pcall(function()
if pt.pos then pos = pt.pos end
if (not pos) and pt.position then pos = pt.position end
if (not pos) and pt.part and pt.part.Position then pos = pt.part.Position end
end)
if pos and pos.X and pos.Y and pos.Z then return pos end
end
end
return nil
end

function EC_BT_VEC_POS(v)
if not v then return nil end
if v.X and v.Y and v.Z then return v end
if v.Position and v.Position.X then return v.Position end
if v.position and v.position.X then return v.position end
if v.pos and v.pos.X then return v.pos end
if type(v) == "table" then
for _,k in ipairs({"hit_pos","hitPosition","impact_pos","impactPosition","point","target_pos","targetPosition"}) do
local p = v[k]
if p and p.X and p.Y and p.Z then return p end
end
if v[1] and v[1].X and v[1].Y and v[1].Z then return v[1] end
end
return nil
end

function EC_BT_ORIGIN_POS(v)
if not v then return nil end
if type(v) == "table" then
for _,k in ipairs({"origin","from","start","start_pos","startPosition","camera","cam_pos","camPosition"}) do
local p = v[k]
if p and p.X and p.Y and p.Z then return p end
end
end
return nil
end

function EC_BT_CURRENT_CAMERA()
local cam = nil
pcall(function()
if aim and aim.get_camera_position then cam = aim.get_camera_position() end
end)
return cam
end


function EC_BT_WEAPON_ORIGIN(cam, hitPos)
if not cam or not hitPos then return cam end
if not EC_BT or EC_BT.weaponOrigin == false then return cam end

local dx = (hitPos.X or 0) - (traceOrigin.X or cam.X or 0)
local dy = (hitPos.Y or 0) - (traceOrigin.Y or cam.Y or 0)
local dz = (hitPos.Z or 0) - (traceOrigin.Z or cam.Z or 0)
local len = math.sqrt(dx*dx + dy*dy + dz*dz)
if len < 0.001 then return cam end

local fx,fy,fz = dx/len, dy/len, dz/len
-- right vector from forward x world-up. If looking almost straight up/down, fallback.
local rx,ry,rz = fz, 0, -fx
local rlen = math.sqrt(rx*rx + rz*rz)
if rlen < 0.001 then
rx,ry,rz = 1,0,0
else
rx,ry,rz = rx/rlen, 0, rz/rlen
end

local side = tonumber(EC_BT.weaponSide or 0.72) or 0.72
local down = tonumber(EC_BT.weaponDown or 0.45) or 0.45
local forward = tonumber(EC_BT.weaponForward or 0.55) or 0.55

-- weapon/muzzle-ish origin: right + down + a little forward from camera.
return {
X = (cam.X or 0) + rx*side + fx*forward,
Y = (cam.Y or 0) - down + fy*forward,
Z = (cam.Z or 0) + rz*side + fz*forward
}
end

function EC_BT_SPAWN_REAL_HIT(hitPos, originPos)
if not hitPos then return end
local cam = originPos or EC_BT_CURRENT_CAMERA()
if not cam then return end
local traceOrigin = cam
pcall(function()
if ap_working_apply_weapon_stats then ap_working_apply_weapon_stats() end
end)
local grav = AP_GRAVITY or 20
local spd = AP_BULLET_SPEED or 800
if spd < 1 then spd = 800 end
local dx = (hitPos.X or 0) - (cam.X or 0)
local dy = (hitPos.Y or 0) - (cam.Y or 0)
local dz = (hitPos.Z or 0) - (cam.Z or 0)
local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
local maxDist = tonumber(EC_BT.maxDist or 1000) or 1000
if maxDist > 0 and dist > maxDist then return end
local flight = dist / spd
if flight < 0.02 then flight = 0.02 end
if flight > 3.0 then flight = 3.0 end
if EC_BT.enabled then EC_BT_ADD(traceOrigin, hitPos, grav, flight) end
if EC_BT.hitfx then EC_BT_ADD_HIT(hitPos) end
end

function EC_BT_HIT_CALLBACK(...)
if not EC_BT then return end
if EC_BT.realHitOnly ~= true and EC_BT.onlyOnHit ~= true then return end
if EC_BT_HAS_WEAPON and EC_BT_HAS_WEAPON() ~= true then return end
local hitPos = nil
local originPos = nil
local args = {...}
for i=1,#args do
if not hitPos then hitPos = EC_BT_VEC_POS(args[i]) end
if not originPos then originPos = EC_BT_ORIGIN_POS(args[i]) end
end
if hitPos then
if not originPos and EC_BT_CURRENT_CAMERA then
originPos = EC_BT_CURRENT_CAMERA()
end
EC_BT_SPAWN_REAL_HIT(hitPos, originPos)
end
end

function EC_BT_REGISTER_HIT_HOOKS()
if EC_BT.hitHooksRegistered then return end
EC_BT.hitHooksRegistered = true
local okAny = false

pcall(function()
if hooks and hooks.on_hit then
hooks.on_hit(EC_BT_HIT_CALLBACK)
EC_BT.hitHookStatus = "hooks.on_hit"
okAny = true
end
end)

pcall(function()
if hooks and hooks.on_bullet_hit then
hooks.on_bullet_hit(EC_BT_HIT_CALLBACK)
EC_BT.hitHookStatus = "hooks.on_bullet_hit"
okAny = true
end
end)

pcall(function()
if hooks and hooks.on_projectile_hit then
hooks.on_projectile_hit(EC_BT_HIT_CALLBACK)
EC_BT.hitHookStatus = "hooks.on_projectile_hit"
okAny = true
end
end)

pcall(function()
if hooks and hooks.on_damage then
hooks.on_damage(EC_BT_HIT_CALLBACK)
EC_BT.hitHookStatus = "hooks.on_damage"
okAny = true
end
end)

pcall(function()
if combat and combat.on_hit then
combat.on_hit(EC_BT_HIT_CALLBACK)
EC_BT.hitHookStatus = "combat.on_hit"
okAny = true
end
end)

pcall(function()
if game and game.on_hit then
game.on_hit(EC_BT_HIT_CALLBACK)
EC_BT.hitHookStatus = "game.on_hit"
okAny = true
end
end)

if not okAny then
EC_BT.hitHookStatus = "NONE"
end
end

function EC_BT_PICK_HIT_TARGET()
local all = nil
pcall(function()
if players and players.get_all then all = players.get_all() end
end)
if not all then return nil,nil end

pcall(function()
if ap_max_dist == nil then ap_max_dist = 1200 end
end)

local cx,cy = nil,nil
pcall(function()
local c = crosshair_pos()
if c then cx=c.X cy=c.Y end
end)
if not cx or not cy then return nil,nil end

local radius = tonumber(EC_BT.hitRadius or 35) or 35
if radius < 4 then radius = 4 end
if radius > 120 then radius = 120 end

local bestTarget=nil
local bestHit=nil
local bestScore=999999999
local strictInside=false

for _,target in ipairs(all) do
if (not EC_BT_IS_DEAD_TARGET(target)) and ((not ap_valid_player_target) or ap_valid_player_target(target, ap_max_dist or 1200)) then
local candidates={}
if target.head_pos then table.insert(candidates,{pos=target.head_pos,rad=radius*0.75}) end
if target.root_pos then table.insert(candidates,{pos=target.root_pos,rad=radius*1.25}) end
if target.root_position then table.insert(candidates,{pos=target.root_position,rad=radius*1.25}) end
if target.hrp_pos then table.insert(candidates,{pos=target.hrp_pos,rad=radius*1.25}) end
if target.position then table.insert(candidates,{pos=target.position,rad=radius*1.40}) end
if target.parts then
for _,pt in pairs(target.parts) do
local pos=nil
pcall(function()
if pt.pos then pos=pt.pos end
if (not pos) and pt.position then pos=pt.position end
if (not pos) and pt.part and pt.part.Position then pos=pt.part.Position end
end)
if pos and pos.X and pos.Y and pos.Z then table.insert(candidates,{pos=pos,rad=radius}) end
end
end

for _,cnd in ipairs(candidates) do
local sx,sy,vis=EC_BT_SCREEN(cnd.pos)
if sx and sy and vis then
local dx=sx-cx
local dy=sy-cy
local score=math.sqrt(dx*dx+dy*dy)
if score < bestScore then
bestScore=score
bestTarget=target
bestHit=cnd.pos
strictInside = score <= (cnd.rad or radius)
end
end
end
end
end

if EC_BT.onlyOnHit == true and not strictInside then
return nil,nil
end

-- Non-strict working mode: don't fly to random nearest player; require it near crosshair.
if bestScore > 220 then return nil,nil end
return bestTarget,bestHit
end

function EC_BT_TRACK_HIT()
if EC_BT then
EC_BT.realHitOnly = false -- simple mode
EC_BT.onlyOnHit = false -- simple mode
EC_BT.life = EC_BT.life or 4.0
EC_BT.alpha = EC_BT.alpha or 1.0
EC_BT.maxDist = EC_BT.maxDist or 1000
if EC_BT.instant == nil then EC_BT.instant = true end
-- From Weapon 3D offset was unreliable in this API, so use stable screen-space lower offset.
EC_BT.weaponOrigin = false
EC_BT.screenStraight = true
EC_BT.revealTime = EC_BT.revealTime or 0.55
EC_BT.weaponSide = EC_BT.weaponSide or 0.72
EC_BT.weaponDown = EC_BT.weaponDown or 0.45
EC_BT.weaponForward = EC_BT.weaponForward or 0.55
EC_BT.thick = EC_BT.thick or 2.0
EC_BT.segments = EC_BT.segments or 24
EC_BT.delay = EC_BT.delay or 0.13
end
if not EC_BT then return end
if (not EC_BT.enabled) and (not EC_BT.hitfx) then return end
if EC_BT_HAS_WEAPON() ~= true then return end

-- Safe mode: do not touch prediction / real hit hooks.
-- Uses the same fallback targeting as before.
if EC_BT.realHitOnly == true then
EC_BT_REGISTER_HIT_HOOKS()
return
end

-- Working fallback: draw on your own LMB shot, independent from aimbot.
if EC_BT_DOWN() ~= true then return end
local now = EC_BT_NOW()
local delay = tonumber(EC_BT.delay or 0.13) or 0.13
if now - (EC_BT.last or 0) < delay then return end
EC_BT.last = now

local target, hitPos = EC_BT_PICK_HIT_TARGET()
if not target or not hitPos then return end
if EC_BT_IS_DEAD_TARGET(target) then return end
local camPos = EC_BT_CURRENT_CAMERA()
if not camPos then return end
local traceOrigin = camPos

local grav = AP_GRAVITY or 20
local spd = AP_BULLET_SPEED or 800
if spd < 1 then spd = 800 end
local dx = (hitPos.X or 0) - (traceOrigin.X or camPos.X or 0)
local dy = (hitPos.Y or 0) - (traceOrigin.Y or camPos.Y or 0)
local dz = (hitPos.Z or 0) - (traceOrigin.Z or camPos.Z or 0)
local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
local maxDist = tonumber(EC_BT.maxDist or 1000) or 1000
if maxDist > 0 and dist > maxDist then return end
local flight = dist / spd
if flight < 0.02 then flight = 0.02 end
if flight > 3.0 then flight = 3.0 end

if EC_BT.enabled then EC_BT_ADD(traceOrigin, hitPos, grav, flight) end
if EC_BT.hitfx then
local hp = target.head_pos or hitPos
EC_BT_ADD_HIT(hp)
end
end

function EC_BT_BASE_COLOR()
if __EC16 and __EC16.tracerColor then
return __EC16.tracerColor[1] or 0.55, __EC16.tracerColor[2] or 0.80, __EC16.tracerColor[3] or 1.00
end
local c = __ec16_hsv_to_rgb((__EC16 and __EC16.tracerHue) or 0.58)
if __EC16 then __EC16.tracerColor = c end
return c[1], c[2], c[3]
end

function EC_BT_HIT_COLOR()
if __EC16 and __EC16.hitFxColor then
return __EC16.hitFxColor[1] or 0.55, __EC16.hitFxColor[2] or 0.80, __EC16.hitFxColor[3] or 1.00
end
local c = __ec16_hsv_to_rgb((__EC16 and __EC16.hitFxHue) or 0.58)
if __EC16 then __EC16.hitFxColor = c end
return c[1], c[2], c[3]
end

function EC_BT_FOOT_COLOR()
if __EC16 and __EC16.footFxColor then
return __EC16.footFxColor[1] or 1.00, __EC16.footFxColor[2] or 0.00, __EC16.footFxColor[3] or 0.58
end
local c = __ec16_hsv_to_rgb((__EC16 and __EC16.footFxHue) or 0.83)
if __EC16 then __EC16.footFxColor = c end
return c[1], c[2], c[3]
end

function EC_BT_COLOR(u,alpha)
local style = math.floor(tonumber(EC_BT.style or 0) or 0)
local br,bg,bb = EC_BT_BASE_COLOR()
if style <= 0 then
return br,bg,bb,alpha
elseif style == 1 then
local pulse = 0.88 + 0.12 * math.sin(EC_BT_NOW()*8 + u*5)
return br + (1-br)*pulse*0.18, bg + (1-bg)*pulse*0.12, bb + (1-bb)*0.08, alpha
elseif style == 3 then
return br,bg,bb,alpha
elseif style == 4 then
local pulse = 0.78 + 0.22 * math.sin(EC_BT_NOW()*15 + u*18)
return br + (1-br)*pulse*0.18, bg + (1-bg)*pulse*0.18, bb + (1-bb)*pulse*0.18, alpha
else
local flick = 0.55 + 0.45 * math.sin(EC_BT_NOW()*24 + u*34)
return br + (1-br)*flick*0.35, bg + (1-bg)*flick*0.45, bb, alpha
end
end


function EC_BT_DRAW_STRAIGHT_SCREEN(tr, age, alpha, style, segs, thick, instantTracer, revealTime, tracerAlphaMul)
-- Smooth reveal v139:
-- no floor(renderSegs), no rounded segment jump.
-- The visible end moves linearly and continuously from start to target.
local sx1,sy1,v1 = EC_BT_SCREEN({X=tr.tx,Y=tr.ty,Z=tr.tz})
if not sx1 or not sy1 or not v1 then return end

local arc = 0.5 * (tr.gravity or 20) * (tr.flight or 0.1) * (tr.flight or 0.1)
local sx0,sy0 = nil,nil
local firstX,firstY,firstU = nil,nil,nil
local secondX,secondY,secondU = nil,nil,nil

for k=1,12 do
local u0 = k / 12
local arcY = arc * u0 * (1-u0)
local pos0 = {
X = tr.ox + (tr.tx-tr.ox)*u0,
Y = tr.oy + (tr.ty-tr.oy)*u0 + arcY,
Z = tr.oz + (tr.tz-tr.oz)*u0
}
local x0,y0,v0 = EC_BT_SCREEN(pos0)
if x0 and y0 and v0 then
if not firstX then
firstX,firstY,firstU = x0,y0,u0
elseif not secondX then
secondX,secondY,secondU = x0,y0,u0
break
end
end
end

if firstX and secondX and firstU and secondU and secondU ~= firstU then
local t = firstU / (secondU - firstU)
sx0 = firstX - (secondX - firstX) * t
sy0 = firstY - (secondY - firstY) * t
elseif firstX then
sx0,sy0 = firstX,firstY
else
return
end

-- only down, not forward
local startLowerOffset = 42
sy0 = sy0 + startLowerOffset

local reveal = 1.0
if not instantTracer then
reveal = age / revealTime
if reveal < 0 then reveal = 0 end
if reveal > 1 then reveal = 1 end
end

-- more segments so reveal head does not jump
local drawSegs = segs
if drawSegs < 72 then drawSegs = 72 end

local baseThick = (tonumber(thick or 2.0) or 2.0) * 1.55

local function point_at(u)
local x = sx0 + (sx1 - sx0) * u
local y = sy0 + (sy1 - sy0) * u
return x,y
end

for si=1,drawSegs do
local u0 = (si - 1) / drawSegs
local u1 = si / drawSegs

if not instantTracer then
if u0 >= reveal then break end
if u1 > reveal then u1 = reveal end
end

local px,py = point_at(u0)
local sx,sy = point_at(u1)
local u = u1

local r,g,b,ca = EC_BT_COLOR(u,alpha)

-- soft head fade only near the currently appearing tip
if not instantTracer then
local headDist = reveal - u
if headDist < (1.0 / drawSegs) * 2.5 then
local edgeAlpha = headDist / ((1.0 / drawSegs) * 2.5)
if edgeAlpha < 0.38 then edgeAlpha = 0.38 end
if edgeAlpha > 1 then edgeAlpha = 1 end
ca = ca * edgeAlpha
end
end

if style == 3 then
-- Gradient Laser restored, continuous reveal.
local h1 = (tr.hue or 0.78)
local h2 = (h1 + 0.20 + 0.05 * math.sin((tr.seed or 1) + u*4)) % 1.0
local c1 = __ec16_hsv_to_rgb((h1 + u*0.18) % 1.0)
local c2 = __ec16_hsv_to_rgb((h2 + u*0.18) % 1.0)
local gr = (c1[1] * (1-u)) + (c2[1] * u)
local gg = (c1[2] * (1-u)) + (c2[2] * u)
local gb = (c1[3] * (1-u)) + (c2[3] * u)
Drawing.DrawLine(px,py,sx,sy,gr,gg,gb,ca*0.13,baseThick+18)
Drawing.DrawLine(px,py,sx,sy,gr,gg,gb,ca*0.25,baseThick+11)
Drawing.DrawLine(px,py,sx,sy,gr,gg,gb,ca*0.45,baseThick+6)
Drawing.DrawLine(px,py,sx,sy,gr,gg,gb,ca*0.95,baseThick+2)
Drawing.DrawLine(px,py,sx,sy,1,1,1,ca*0.34,math.max(1,baseThick-0.4))

elseif style == 4 then
-- Wave Lightning: thin, with small zigzag, continuous reveal.
local dxl = sx1 - sx0
local dyl = sy1 - sy0
local len2 = math.sqrt(dxl*dxl + dyl*dyl)
local nx,ny = 0,0
if len2 > 0.01 then
nx = -dyl / len2
ny = dxl / len2
end

local seed = (tr.seed or 1) * 0.011
local wig0 = math.sin(u0*54 + seed + EC_BT_NOW()*4.0) * 2.6 + math.sin(u0*117 + seed*2.3) * 0.9
local wig1 = math.sin(u1*54 + seed + EC_BT_NOW()*4.0) * 2.6 + math.sin(u1*117 + seed*2.3) * 0.9
local x0 = px + nx*wig0
local y0 = py + ny*wig0
local x1 = sx + nx*wig1
local y1 = sy + ny*wig1

Drawing.DrawLine(x0,y0,x1,y1,r,g,b,ca*0.16,math.max(1,thick+5))
Drawing.DrawLine(x0,y0,x1,y1,r,g,b,ca*0.34,math.max(1,thick+2))
Drawing.DrawLine(x0,y0,x1,y1,r,g,b,ca*0.90,math.max(1,thick))
Drawing.DrawLine(x0,y0,x1,y1,1,1,1,ca*0.48,1)

elseif style == 2 then
-- Normal Lightning: jagged bolt, continuous reveal.
local dxl = sx1 - sx0
local dyl = sy1 - sy0
local len2 = math.sqrt(dxl*dxl + dyl*dyl)
local nx,ny = 0,0
if len2 > 0.01 then
nx = -dyl / len2
ny = dxl / len2
end

local seed = (tr.seed or 1) * 0.021
local j0 = math.sin(si*2.77 + seed*11.0) * 4.6 + math.sin(si*5.31 + seed*7.0) * 1.4
local j1 = math.sin((si+1)*2.77 + seed*11.0) * 4.6 + math.sin((si+1)*5.31 + seed*7.0) * 1.4
local x0 = px + nx*j0
local y0 = py + ny*j0
local x1 = sx + nx*j1
local y1 = sy + ny*j1

Drawing.DrawLine(x0,y0,x1,y1,r,g,b,ca*0.22,math.max(1,thick+7))
Drawing.DrawLine(x0,y0,x1,y1,r,g,b,ca*0.46,math.max(1,thick+3))
Drawing.DrawLine(x0,y0,x1,y1,r,g,b,ca*0.95,math.max(1,thick+0.6))
Drawing.DrawLine(x0,y0,x1,y1,1,1,1,ca*0.46,1)

if si > 2 and si < drawSegs-1 and (si % 7 == 0) and (instantTracer or u1 < reveal - 0.02) then
local brLen = 10 + 9 * math.abs(math.sin((tr.seed or 1) + si*1.77))
local brDir = (math.sin(si*3.1 + seed) > 0) and 1 or -1
Drawing.DrawLine(x1,y1,x1+nx*brLen*brDir,y1+ny*brLen*brDir,r,g,b,ca*0.34,1)
end

elseif style == 5 then
Drawing.DrawLine(px,py,sx,sy,r,g,b,ca*0.22,baseThick+12)
Drawing.DrawLine(px,py,sx,sy,r,g,b,ca*0.60,baseThick+5)
Drawing.DrawLine(px,py,sx,sy,1,1,1,ca*0.46,math.max(1,baseThick))
if si % 5 == 0 or (not instantTracer and u1 >= reveal) then
local imSize = 18 + 10 * math.abs(math.sin((tr.seed or 1)+si*1.41))
EC_TRACEIMG_DRAW(5,sx,sy,imSize,ca,r,g,b,(tr.seed or 1)+si)
end

elseif style == 6 then
Drawing.DrawLine(px,py,sx,sy,r,g,b,ca*0.22,baseThick+9)
Drawing.DrawLine(px,py,sx,sy,r,g,b,ca*0.82,baseThick+2)
if si % 4 == 0 or (not instantTracer and u1 >= reveal) then
local imSize = 14 + 14 * math.abs(math.sin((tr.seed or 1)+si*2.17))
EC_TRACEIMG_DRAW(6,sx,sy,imSize,ca,r,g,b,(tr.seed or 1)+si)
end

else
Drawing.DrawLine(px,py,sx,sy,r,g,b,ca*0.20,baseThick+9)
Drawing.DrawLine(px,py,sx,sy,r,g,b,ca*0.52,baseThick+4)
Drawing.DrawLine(px,py,sx,sy,r,g,b,ca*0.95,baseThick)
if style == 1 then
Drawing.DrawLine(px,py,sx,sy,1,1,1,ca*0.36,math.max(1,baseThick-0.4))
end
end

if not instantTracer and u1 >= reveal then break end
end
end






function EC_BT_DRAW()
if not EC_BT.enabled then
if #EC_BT.items > 0 then EC_BT.items = {} end
return
end

local now = EC_BT_NOW()
local life = tonumber(EC_BT.life or 0.55) or 0.55
if life < 0.05 then life = 0.05 end

local i=1
while i <= #EC_BT.items do
local tr = EC_BT.items[i]
if now - tr.created > life then table.remove(EC_BT.items,i) else i=i+1 end
end

local segs = math.floor(tonumber(EC_BT.segments or 15) or 15)
if segs < 5 then segs = 5 end
if segs > 35 then segs = 35 end

local thick = tonumber(EC_BT.thick or 2) or 2
if thick < 1 then thick = 1 end
if thick > 6 then thick = 6 end

local style = math.floor(tonumber(EC_BT.style or 0) or 0)
local tracerAlphaMul = tonumber(EC_BT.alpha or 1.0) or 1.0
if tracerAlphaMul < 0.05 then tracerAlphaMul = 0.05 end
if tracerAlphaMul > 1.0 then tracerAlphaMul = 1.0 end

local instantTracer = EC_BT.instant ~= false
local revealTime = tonumber(EC_BT.revealTime or 0.55) or 0.22
if revealTime < 0.03 then revealTime = 0.03 end
if revealTime > 2.50 then revealTime = 2.50 end

for _,tr in ipairs(EC_BT.items) do
local age = now - tr.created
local styleForAlpha = math.floor(tonumber(EC_BT.style or 0) or 0)
local alpha = 1.0 - (age / life)
if styleForAlpha == 1 then
local hold = 3.0
if age <= hold then
alpha = 1.0
else
local fadeTime = life - hold
if fadeTime < 0.15 then fadeTime = 0.15 end
alpha = 1.0 - ((age - hold) / fadeTime)
end
end
alpha = alpha * tracerAlphaMul
if alpha > 0 then
if true then
EC_BT_DRAW_STRAIGHT_SCREEN(tr, age, alpha, style, segs, thick, instantTracer, revealTime, tracerAlphaMul)
else
local px0,py0,pvis = nil,nil,false
local arc = 0.5 * (tr.gravity or 20) * (tr.flight or 0.1) * (tr.flight or 0.1)

local renderSegs = segs
local reveal = 1.0
if not instantTracer then
reveal = age / revealTime
if reveal < 0 then reveal = 0 end
if reveal > 1 then reveal = 1 end
renderSegs = math.floor(segs * reveal + 0.5)
if reveal > 0 and renderSegs < 1 then renderSegs = 1 end
end

for si=0,renderSegs do
local u = si / segs
local jitterX,jitterY,jitterZ = 0,0,0
if style == 2 and si > 0 and si < segs then
local zz = math.sin((tr.seed or 1) + si*12.9898) * 43758.5453
local rnd = zz - math.floor(zz)
local amp = 1.0 + 2.0 * (1.0 - alpha)
jitterX = (rnd - 0.5) * amp
jitterY = (math.sin(si*2.37 + (tr.seed or 1)) * 0.5) * amp
jitterZ = (math.cos(si*1.91 + (tr.seed or 1)) * 0.5) * amp
end

local arcY = arc*u*(1-u)
if style == 3 or style == 4 then arcY = 0 end
local pos = {
X = tr.ox + (tr.tx-tr.ox)*u + jitterX,
Y = tr.oy + (tr.ty-tr.oy)*u + arcY + jitterY,
Z = tr.oz + (tr.tz-tr.oz)*u + jitterZ
}
local sx,sy,vis = EC_BT_SCREEN(pos)
if sx and sy then
local yoff = tonumber(EC_BT.screenYOffset or 34) or 34
if yoff < 0 then yoff = 0 end
if yoff > 220 then yoff = 220 end
-- lower start only; fade offset to 0 at target
sy = sy + yoff * (1 - u)
end
if si > 0 and vis and pvis then
local a = (0.30 + 0.70*u) * alpha
local r,g,b,ca = EC_BT_COLOR(u,a)
if not instantTracer and renderSegs < segs and si >= renderSegs - 1 then
local edgeAlpha = 0.65 + 0.35 * reveal
ca = ca * edgeAlpha
end

if style == 1 then
-- Real Neon
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.12,thick+12)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.20,thick+8)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.38,thick+5)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.78,thick+2)
Drawing.DrawLine(px0,py0,sx,sy,1,1,1,ca*0.62,math.max(1,thick-0.35))

elseif style == 2 then
-- Old Lightning
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.24,thick+5)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.46,thick+2)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca,thick)

elseif style == 3 then
-- Gradient Laser: straight video-style beam, smooth gradient, new color each shot.
local h1 = (tr.hue or 0.78)
local h2 = (h1 + 0.20 + 0.05 * math.sin((tr.seed or 1) + u*4)) % 1.0
local c1 = __ec16_hsv_to_rgb((h1 + u*0.18) % 1.0)
local c2 = __ec16_hsv_to_rgb((h2 + u*0.18) % 1.0)
local gr = (c1[1] * (1-u)) + (c2[1] * u)
local gg = (c1[2] * (1-u)) + (c2[2] * u)
local gb = (c1[3] * (1-u)) + (c2[3] * u)
Drawing.DrawLine(px0,py0,sx,sy,gr,gg,gb,ca*0.10,thick+18)
Drawing.DrawLine(px0,py0,sx,sy,gr,gg,gb,ca*0.18,thick+12)
Drawing.DrawLine(px0,py0,sx,sy,gr,gg,gb,ca*0.32,thick+7)
Drawing.DrawLine(px0,py0,sx,sy,gr,gg,gb,ca*0.95,thick+2)
Drawing.DrawLine(px0,py0,sx,sy,1,1,1,ca*0.32,math.max(1,thick-0.4))

elseif style == 4 then
-- Wave Lightning: bent zigzag / wavy line like the clip.
local dxl = sx - px0
local dyl = sy - py0
local len2 = math.sqrt(dxl*dxl + dyl*dyl)
local nx,ny = 0,0
if len2 > 0.01 then
nx = -dyl / len2
ny = dxl / len2
end

local prevU = (si - 1) / segs
local seed = (tr.seed or 1) * 0.011
local amp = 3.8 + 2.2 * math.sin(EC_BT_NOW()*2.2 + seed)
local z1 = math.sin(prevU*58 + seed) * amp + math.sin(prevU*121 + seed*2.7) * 1.1
local z2 = math.sin(u*58 + seed) * amp + math.sin(u*121 + seed*2.7) * 1.1

local x1 = px0 + nx*z1
local y1 = py0 + ny*z1
local x2 = sx + nx*z2
local y2 = sy + ny*z2

-- faint glow behind the zigzag, using selected tracer color
Drawing.DrawLine(x1,y1,x2,y2,r,g,b,ca*0.18,math.max(1,thick+7))
Drawing.DrawLine(x1,y1,x2,y2,r,g,b,ca*0.34,math.max(1,thick+4))

-- main colored zigzag
Drawing.DrawLine(x1,y1,x2,y2,r,g,b,ca*0.92,math.max(1,thick+0.4))
Drawing.DrawLine(x1,y1,x2,y2,1,1,1,ca*0.50,1)

-- tiny second close wave to make it look electric but still one curved tracer
local z1b = z1 * 0.55 + math.sin(prevU*97 + seed*3.1) * 1.2
local z2b = z2 * 0.55 + math.sin(u*97 + seed*3.1) * 1.2
Drawing.DrawLine(px0+nx*z1b,py0+ny*z1b,sx+nx*z2b,sy+ny*z2b,r,g,b,ca*0.46,1)

elseif style == 5 then
-- Image Lightning: normal electric line plus PNG spark nodes, using selected tracer color.
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.18,thick+9)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.54,thick+3)
Drawing.DrawLine(px0,py0,sx,sy,1,1,1,ca*0.42,math.max(1,thick-0.2))
if si % 3 == 0 or si == segs then
local imSize = 14 + 8 * math.abs(math.sin((tr.seed or 1)+si*1.41))
EC_TRACEIMG_DRAW(5,sx,sy,imSize,ca,r,g,b,(tr.seed or 1)+si)
end

elseif style == 6 then
-- Image Spark Trail: lots of small PNG spark particles following the tracer.
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.16,thick+5)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.72,thick)
if si % 2 == 0 or si == segs then
local imSize = 10 + 12 * math.abs(math.sin((tr.seed or 1)+si*2.17))
EC_TRACEIMG_DRAW(6,sx,sy,imSize,ca,r,g,b,(tr.seed or 1)+si)
end

else
-- Beam
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca*0.16,thick+4)
Drawing.DrawLine(px0,py0,sx,sy,r,g,b,ca,thick)
end

if style == 2 and si > 2 and si < segs-1 and (si % 5 == 0 or si % 7 == 0) then
local ang = math.sin((tr.seed or 1) + si*2.13) * 6.283
local len = 18 + 18 * math.abs(math.sin((tr.seed or 1) + si*1.77))
local bx = sx + math.cos(ang) * len
local by = sy + math.sin(ang) * len
Drawing.DrawLine(sx,sy,bx,by,r,g,b,ca*0.55,math.max(1,thick-0.5))
if si % 6 == 0 then
Drawing.DrawLine(bx,by,bx + math.cos(ang+0.8)*len*0.35,by + math.sin(ang+0.8)*len*0.35,r,g,b,ca*0.30,1)
end
end
end
px0,py0,pvis = sx,sy,vis
end
end -- screenStraight old renderer
end
end
end




-- // ===== AIM + LMB + HP DROP GATE FOR HITFX/TRACERS =====
-- Идея:
-- эффект/трасер появляется только если:
-- 1) нажата ЛКМ,
-- 2) аимбот сейчас целится/есть target,
-- 3) у target снялось HP.
--
-- Если у твоего скрипта другое имя target-переменной, добавь его в EC_HITFX_GET_AIM_TARGET().
if EC_HITFX_GATE == nil then
EC_HITFX_GATE = {
enabled = true,
require_lmb = true,
require_aim = true,
require_hp_drop = true,
hp_window = 0.35,
last_hp_drop_time = 0,
last_hp_drop_target = nil,
hp_cache = {},
scan_delay = 0.06,
last_scan = 0
}
end

function EC_HITFX_LMB_DOWN()
local down = false
pcall(function()
if aim and aim.is_firing then down = aim.is_firing() == true end
end)
pcall(function()
if (not down) and input and input.is_key_down then
down = input.is_key_down(0x01) == true
end
end)
pcall(function()
if (not down) and Input and Input.IsKeyDown then
down = Input.IsKeyDown(0x01) == true
end
end)
return down
end

function EC_HITFX_GET_AIM_TARGET()
-- Самые частые варианты из наших/чужих скриптов.
local t = nil

pcall(function() if Targeting and Targeting.Target then t = Targeting.Target end end)
pcall(function() if (not t) and Targeting and Targeting.TargetPlayer then t = Targeting.TargetPlayer end end)
pcall(function() if (not t) and Targeting and Targeting.CurrentTarget then t = Targeting.CurrentTarget end end)
pcall(function() if (not t) and Targeting and Targeting.TargetPart then t = Targeting.TargetPart end end)

pcall(function() if (not t) and Aimbot and Aimbot.Target then t = Aimbot.Target end end)
pcall(function() if (not t) and Aimbot and Aimbot.CurrentTarget then t = Aimbot.CurrentTarget end end)
pcall(function() if (not t) and EC_AIM and EC_AIM.target then t = EC_AIM.target end end)
pcall(function() if (not t) and __EC16 and __EC16.aimTarget then t = __EC16.aimTarget end end)
pcall(function() if (not t) and _G and _G.AimbotTarget then t = _G.AimbotTarget end end)

return t
end

function EC_HITFX_OBJ_NAME(o)
local n = ""
pcall(function() n = o.Name or o.name or "" end)
pcall(function() if n == "" and o.get_name then n = o:get_name() end end)
return tostring(n or "")
end

function EC_HITFX_OBJ_CHILDREN(o)
if not o then return {} end
local ch = {}
pcall(function() if o.GetChildren then ch = o:GetChildren() end end)
pcall(function() if (#ch == 0) and o.get_children then ch = o:get_children() end end)
pcall(function() if (#ch == 0) and o.children then ch = o.children end end)
return ch or {}
end

function EC_HITFX_OBJ_HEALTH(o)
if not o then return nil end
local hp = nil

pcall(function() if o.Health ~= nil then hp = o.Health end end)
pcall(function() if (not hp) and o.health ~= nil then hp = o.health end end)
pcall(function() if (not hp) and o.get_health then hp = o:get_health() end end)

if hp then return tonumber(hp) end

-- character/model -> Humanoid
for _,c in ipairs(EC_HITFX_OBJ_CHILDREN(o)) do
local nm = string.lower(EC_HITFX_OBJ_NAME(c))
local cn = ""
pcall(function() cn = string.lower(tostring(c.ClassName or c.class_name or "")) end)
if nm == "humanoid" or string.find(cn, "humanoid", 1, true) then
local h = EC_HITFX_OBJ_HEALTH(c)
if h then return h end
end
end

return nil
end

function EC_HITFX_SCAN_HP()
local tnow = os.clock and os.clock() or tick()
if tnow - (EC_HITFX_GATE.last_scan or 0) < EC_HITFX_GATE.scan_delay then return end
EC_HITFX_GATE.last_scan = tnow

local target = EC_HITFX_GET_AIM_TARGET()
if not target then return end

-- если target это part, попробуем parent как character
local obj = target
pcall(function()
if target.Parent then obj = target.Parent end
end)

local hp = EC_HITFX_OBJ_HEALTH(obj) or EC_HITFX_OBJ_HEALTH(target)
if not hp then return end

local key = obj or target
local old = EC_HITFX_GATE.hp_cache[key]

if old and hp < old - 0.01 then
EC_HITFX_GATE.last_hp_drop_time = tnow
EC_HITFX_GATE.last_hp_drop_target = key
end

EC_HITFX_GATE.hp_cache[key] = hp
end

function EC_HITFX_CAN_SPAWN()
return true
end
-- // ===== END AIM + LMB + HP DROP GATE =====

-- // ===== FALLEN IMAGE HITFX HELPERS =====
-- Image-based replacement for the old drawn Video Burst.
-- Uses the same idea/textures as Fallen Ultimate ParticleEmitter effects,
-- but renders them through Drawing.DrawImage for the external API.
if EC_HITIMG == nil then EC_HITIMG = {} end
EC_HITIMG.flashAsset = EC_HITIMG.flashAsset or "https://raw.githubusercontent.com/twitter/twemoji/master/assets/72x72/1f4a5.png"
EC_HITIMG.ringAsset  = EC_HITIMG.ringAsset  or "https://raw.githubusercontent.com/twitter/twemoji/master/assets/72x72/1f4ab.png"
EC_HITIMG.sparkAsset = EC_HITIMG.sparkAsset or "https://raw.githubusercontent.com/twitter/twemoji/master/assets/72x72/2728.png"
EC_HITIMG.smokeAsset = EC_HITIMG.smokeAsset or "https://raw.githubusercontent.com/twitter/twemoji/master/assets/72x72/1f4a8.png"
EC_HITIMG.starAsset  = EC_HITIMG.starAsset  or "https://raw.githubusercontent.com/twitter/twemoji/master/assets/72x72/2b50.png"
EC_HITIMG.loaded = EC_HITIMG.loaded or false

function EC_HITIMG_LOAD()
if EC_HITIMG.loaded then return true end
if not Drawing or not Drawing.LoadImage or not Drawing.DrawImage then return false end
local ok1, ok2, ok3 = false, false, false

pcall(function()
EC_HITIMG.flash = Drawing.LoadImage(EC_HITIMG.flashAsset)
ok1 = EC_HITIMG.flash ~= nil
end)
pcall(function()
EC_HITIMG.ring = Drawing.LoadImage(EC_HITIMG.ringAsset)
ok2 = EC_HITIMG.ring ~= nil
end)
pcall(function()
EC_HITIMG.spark = Drawing.LoadImage(EC_HITIMG.sparkAsset)
ok3 = EC_HITIMG.spark ~= nil
end)
pcall(function()
EC_HITIMG.smoke = Drawing.LoadImage(EC_HITIMG.smokeAsset)
end)
pcall(function()
EC_HITIMG.star = Drawing.LoadImage(EC_HITIMG.starAsset)
end)

-- fallback: some builds accept rbxassetid://, some accept only URLs
if not ok1 then pcall(function() EC_HITIMG.flash = Drawing.LoadImage("rbxassetid://10198439352") ok1 = EC_HITIMG.flash ~= nil end) end
if not ok2 then pcall(function() EC_HITIMG.ring  = Drawing.LoadImage("rbxassetid://12906276200") ok2 = EC_HITIMG.ring ~= nil end) end
if not ok3 then pcall(function() EC_HITIMG.spark = Drawing.LoadImage("rbxassetid://14354336687") ok3 = EC_HITIMG.spark ~= nil end) end

EC_HITIMG.loaded = true
print("[EC_HITFX_GATE] disabled: hitfx works like before")
print("[EC_HITIMG] Direct PNG textures loading handles=" .. tostring(ok1) .. "," .. tostring(ok2) .. "," .. tostring(ok3))
return true
end

function EC_HITIMG_READY(handle)
if not handle then return false end
local ok = true
pcall(function()
if Drawing.IsImageReady then ok = Drawing.IsImageReady(handle) == true end
end)
return ok
end

function EC_HITIMG_DRAW_IMAGE(handle,x,y,w,h,r,g,b,a)
if not handle or not Drawing or not Drawing.DrawImage then return end
if not a or a <= 0.01 then return end
if not EC_HITIMG_READY(handle) then return end
pcall(function()
Drawing.DrawImage(handle,x,y,w,h,r,g,b,a)
end)
end

function EC_HITIMG_RAND(seed)
local x = math.sin(seed * 12.9898) * 43758.5453
return x - math.floor(x)
end

function EC_HITIMG_DRAW(sx,sy,size,t,alpha,br,bg,bb,seed)
if (not EC_HITIMG_LOAD()) or (not EC_HITIMG_READY(EC_HITIMG.flash)) or (not EC_HITIMG_READY(EC_HITIMG.ring)) or (not EC_HITIMG_READY(EC_HITIMG.spark)) then
-- fallback while PNGs are loading or if DrawImage failed
Drawing.DrawCircle(sx,sy,size*(0.22+0.95*t),br,bg,bb,alpha*0.42,2.0)
for k=1,18 do
local a=(k/18)*6.283+math.sin((seed or 1)+k)*0.25
local l=size*(0.45+1.45*t)
Drawing.DrawLine(sx,sy,sx+math.cos(a)*l,sy+math.sin(a)*l,br,bg,bb,alpha*0.55,2)
end
return
end

local out = 1 - (1 - t) * (1 - t)
local fade = 1 - (t * t)
if fade < 0 then fade = 0 end

local cr,cg,cb = br,bg,bb
if cr < 0.40 and cb < 0.70 then cr,cg,cb = 0.62,0.92,1.0 end

-- white flash core
do
local s = size * (0.65 + 2.25 * out)
local a = alpha * math.max(0, 1 - t * 4.7)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.flash, sx-s/2, sy-s/2, s, s, 1, 1, 1, a)
end

-- big cyan ring
do
local s = size * (0.55 + 3.35 * out)
local a = alpha * 0.82 * fade
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.ring, sx-s/2, sy-s/2, s, s, cr, cg, cb, a)
end

-- pink secondary ring, like the video colors
do
local s = size * (0.34 + 2.45 * out)
local a = alpha * 0.55 * fade
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.ring, sx-s/2, sy-s/2, s, s, 1.0, 0.12, 0.88, a)
end

-- small center glow
do
local s = size * (0.38 + 0.95 * (1 - t))
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.spark, sx-s/2, sy-s/2, s, s, 1, 1, 1, alpha * 0.65 * fade)
end

-- image sparks/shards
for k=1,12 do
local sd=(seed or 1)+k*13.37
local ang=(k/12)*6.283 + math.sin(sd)*0.28
local spread=size*(0.35 + 2.15*out)*(0.55+EC_HITIMG_RAND(sd+2)*0.95)
local x=sx+math.cos(ang)*spread
local y=sy+math.sin(ang)*spread
local s=size*(0.26+EC_HITIMG_RAND(sd+4)*0.52)
local a=alpha*(0.42+0.38*EC_HITIMG_RAND(sd+6))*fade
local rr,gg,bb2
if k%2==0 then
rr,gg,bb2=cr,cg,cb
else
rr,gg,bb2=1.0,0.22,0.86
end
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.spark,x-s/2,y-s/2,s,s,rr,gg,bb2,a)
end
end

function EC_HITIMG_DRAW_FALLEN_STYLE(kind,sx,sy,size,t,alpha,br,bg,bb,seed)
-- kind 1 = Spark, 2 = SmokeRing, 3 = particles.js, 4 = Combo
if (not EC_HITIMG_LOAD()) or (not EC_HITIMG_READY(EC_HITIMG.flash)) or (not EC_HITIMG_READY(EC_HITIMG.ring)) or (not EC_HITIMG_READY(EC_HITIMG.spark)) then
EC_HITIMG_DRAW(sx,sy,size,t,alpha,br,bg,bb,seed)
return
end

local out = 1 - (1 - t) * (1 - t)
local fade = 1 - (t * t)
if fade < 0 then fade = 0 end

local cr,cg,cb = br,bg,bb
if cr < 0.40 and cb < 0.70 then cr,cg,cb = 0.62,0.92,1.0 end

if kind == 1 then
-- Fallen Ultimate Spark imitation:
-- one huge bright flipbook flash, brightness-like white core, very short lifetime.
local s = size * (1.25 + 2.35 * out)
local a = alpha * math.max(0, 1 - t * 2.6)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.flash, sx-s/2, sy-s/2, s, s, 1, 1, 1, a)
local s2 = size * (0.90 + 1.55 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.spark, sx-s2/2, sy-s2/2, s2, s2, cr, cg, cb, alpha * 0.78 * fade)

elseif kind == 2 then
-- Fallen Ultimate SmokeRing imitation:
-- one rotating/fading smoke ring; softer and bigger.
local s = size * (0.95 + 3.55 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.ring, sx-s/2, sy-s/2, s, s, cr, cg, cb, alpha * 0.88 * fade)
local s2 = size * (1.15 + 4.10 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.smoke or EC_HITIMG.ring, sx-s2/2, sy-s2/2, s2, s2, 0.86, 0.92, 1.0, alpha * 0.28 * fade)

elseif kind == 3 then
-- Fallen Ultimate particles.js imitation:
-- emits 6-ish larger particles, spread around hit.
for k=1,6 do
local sd=(seed or 1)+k*19.73
local ang=(k/6)*6.283+math.sin(sd)*0.45
local spread=size*(0.40+2.25*out)*(0.70+EC_HITIMG_RAND(sd+2)*0.75)
local x=sx+math.cos(ang)*spread
local y=sy+math.sin(ang)*spread
local s=size*(0.65+EC_HITIMG_RAND(sd+4)*0.65)
local rr,gg,bb2=cr,cg,cb
if k%2==1 then rr,gg,bb2=1.0,0.22,0.86 end
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.spark,x-s/2,y-s/2,s,s,rr,gg,bb2,alpha*0.92*fade)
end
local s = size * (0.45 + 1.30 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.star or EC_HITIMG.spark, sx-s/2, sy-s/2, s, s, 1, 1, 1, alpha * 0.62 * fade)

else
-- Combo: Spark + SmokeRing + particles.js together, closest to a pretty edit.
local s = size * (0.75 + 2.35 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.flash, sx-s/2, sy-s/2, s, s, 1, 1, 1, alpha * math.max(0, 1 - t * 4.5))

s = size * (0.62 + 3.25 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.ring, sx-s/2, sy-s/2, s, s, cr, cg, cb, alpha * 0.82 * fade)

s = size * (0.45 + 2.35 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.ring, sx-s/2, sy-s/2, s, s, 1.0, 0.12, 0.88, alpha * 0.52 * fade)

s = size * (1.05 + 3.95 * out)
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.smoke or EC_HITIMG.ring, sx-s/2, sy-s/2, s, s, 0.74, 0.90, 1.0, alpha * 0.16 * fade)

for k=1,10 do
local sd=(seed or 1)+k*13.37
local ang=(k/10)*6.283 + math.sin(sd)*0.30
local spread=size*(0.35 + 2.20*out)*(0.55+EC_HITIMG_RAND(sd+2)*0.95)
local x=sx+math.cos(ang)*spread
local y=sy+math.sin(ang)*spread
local ss=size*(0.28+EC_HITIMG_RAND(sd+4)*0.62)
local a=alpha*(0.42+0.38*EC_HITIMG_RAND(sd+6))*fade
local rr,gg,bb2
if k%2==0 then rr,gg,bb2=cr,cg,cb else rr,gg,bb2=1.0,0.22,0.86 end
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.spark,x-ss/2,y-ss/2,ss,ss,rr,gg,bb2,a)
end
end
end


function EC_TRACEIMG_DRAW(kind,x,y,size,alpha,r,g,b,seed)
-- kind 5 = Image Lightning, kind 6 = Image Sparks
if not EC_HITIMG_LOAD() then return false end
if not EC_HITIMG_READY(EC_HITIMG.spark) then return false end
local flick = 0.65 + 0.35 * math.sin(EC_BT_NOW()*36 + (seed or 1))
local s = size * (0.70 + 0.35 * flick)
if kind == 6 then
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.spark,x-s/2,y-s/2,s,s,r,g,b,alpha*0.78)
if EC_HITIMG.star then
local s2 = size * 0.42
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.star,x-s2/2,y-s2/2,s2,s2,1,1,1,alpha*0.28)
end
else
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.spark,x-s/2,y-s/2,s,s,0.72,0.94,1.0,alpha*0.90)
local s2 = size * 0.42
EC_HITIMG_DRAW_IMAGE(EC_HITIMG.flash,x-s2/2,y-s2/2,s2,s2,1,1,1,alpha*0.22)
end
return true
end

-- // ===== END FALLEN IMAGE HITFX HELPERS =====

function EC_BT_DRAW_HITS()
if not EC_BT.hitfx then
if EC_BT.hits and #EC_BT.hits > 0 then EC_BT.hits = {} end
return
end
local now=EC_BT_NOW()
local life=0.74
local i=1
while i <= #EC_BT.hits do
local h=EC_BT.hits[i]
if now - h.created > life then table.remove(EC_BT.hits,i) else i=i+1 end
end
local br,bg,bb=EC_BT_HIT_COLOR()
-- Fixed screen-space hit effect size. No scale-with-distance.
local size=tonumber(EC_BT.hitSize or 38) or 38
if size < 18 then size=18 end
if size > 96 then size=96 end
local style=math.floor(tonumber(EC_BT.hitStyle or 0) or 0)

for _,h in ipairs(EC_BT.hits) do
local age=now-h.created
local t=age/life
local alpha=1-t
if alpha > 0 then
local sx,sy,vis=EC_BT_SCREEN({X=h.x,Y=h.y,Z=h.z})
if sx and sy and vis then

if style == 0 then
for k=1,8 do
local ang=((k/8)*6.283)+math.sin((h.seed or 1)+k*1.7)*0.28
local len=size*(0.35+0.55*math.abs(math.sin((h.seed or 1)+k*2.11)))
local ex=sx+math.cos(ang)*len
local ey=sy+math.sin(ang)*len
Drawing.DrawLine(sx,sy,ex,ey,br,bg,bb,alpha*0.62,2)
if k%2==0 then Drawing.DrawLine(ex,ey,ex+math.cos(ang+0.55)*len*0.30,ey+math.sin(ang+0.55)*len*0.30,br,bg,bb,alpha*0.32,1) end
end
Drawing.DrawCircle(sx,sy,3+size*0.04,br,bg,bb,alpha*0.85,1.5)

elseif style == 1 then
local radius=size*0.65
Drawing.DrawCircle(sx,sy,radius,br,bg,bb,alpha*0.80,2.0)
Drawing.DrawCircle(sx,sy,radius*0.55,br,bg,bb,alpha*0.55,1.3)
Drawing.DrawCircle(sx,sy,radius*1.25,br,bg,bb,alpha*0.28,1.0)

elseif style == 2 then
for k=1,6 do
local ang=(k/6)*6.283+0.52
local len=size*0.90
local ex=sx+math.cos(ang)*len
local ey=sy+math.sin(ang)*len
Drawing.DrawLine(sx,sy,ex,ey,br,bg,bb,alpha*0.75,2)
Drawing.DrawLine(sx,sy,sx+math.cos(ang+0.9)*len*0.35,sy+math.sin(ang+0.9)*len*0.35,br,bg,bb,alpha*0.45,1)
end
Drawing.DrawBox(sx-size*0.12,sy-size*0.12,sx+size*0.12,sy+size*0.12,br,bg,bb,alpha*0.85,1)

elseif style == 3 then
for k=1,12 do
local ang=((k/12)*6.283)+math.sin(now*14+k)*0.16
local len=size*(0.18+0.55*math.abs(math.sin((h.seed or 1)+k*1.33)))
local midx=sx+math.cos(ang)*len*0.55+math.sin(k*2.1+h.seed)*2
local midy=sy+math.sin(ang)*len*0.55+math.cos(k*1.7+h.seed)*2
local ex=sx+math.cos(ang)*len
local ey=sy+math.sin(ang)*len
Drawing.DrawLine(sx,sy,midx,midy,br,bg,bb,alpha*0.50,2.2)
Drawing.DrawLine(midx,midy,ex,ey,br,bg,bb,alpha*0.78,1.2)
end
Drawing.DrawCircle(sx,sy,2+size*0.03,br,bg,bb,alpha*0.92,1.4)

elseif style == 4 then
local flash = math.max(0,1-t*2.2)
Drawing.DrawCircle(sx,sy,size*0.18 + flash*size*0.18,1,1,1,alpha*0.90,2.0)
Drawing.DrawCircle(sx,sy,size*(0.25+t*0.65),br,bg,bb,alpha*0.40,1.5)
for k=1,16 do
local seed=(h.seed or 1)+k*12.989
local ang=(k/16)*6.283 + math.sin(seed)*0.22
local spd=0.42+0.58*math.abs(math.sin(seed*1.71))
local len=size*(0.18 + t*1.05)*spd
local tail=size*(0.08+0.14*(1-t))*spd
Drawing.DrawLine(sx+math.cos(ang)*(len-tail),sy+math.sin(ang)*(len-tail),sx+math.cos(ang)*len,sy+math.sin(ang)*len,br,bg,bb,alpha*(0.35+0.40*spd),1.2)
end

elseif style == 5 then
local ring=size*(0.20+t*1.05)
Drawing.DrawCircle(sx,sy,ring,br,bg,bb,alpha*0.35,1.2)
for k=1,22 do
local seed=(h.seed or 1)+k*7.17
local ang=(k/22)*6.283 + math.sin(seed)*0.16
local len=size*(0.25 + t*1.00)*(0.65+0.35*math.abs(math.cos(seed)))
local x=sx+math.cos(ang)*len
local y=sy+math.sin(ang)*len
Drawing.DrawCircle(x,y,1.2+1.2*math.abs(math.sin(seed*1.3)),br,bg,bb,alpha*0.68,1)
if k%3==0 then Drawing.DrawLine(sx+math.cos(ang)*len*0.45,sy+math.sin(ang)*len*0.45,x,y,br,bg,bb,alpha*0.28,1) end
end
Drawing.DrawCircle(sx,sy,size*0.12,1,1,1,alpha*0.75,1.3)

elseif style == 6 then
local flash=math.max(0,1-t*3.0)
Drawing.DrawCircle(sx,sy,size*(0.18+0.90*t),br,bg,bb,alpha*0.55,2.2)
Drawing.DrawCircle(sx,sy,size*(0.08+0.25*flash),1,1,1,alpha*0.92,2)
Drawing.DrawLine(sx-size*0.55,sy,sx+size*0.55,sy,br,bg,bb,alpha*0.70,2)
Drawing.DrawLine(sx,sy-size*0.55,sx,sy+size*0.55,br,bg,bb,alpha*0.70,2)

elseif style == 7 then
-- Blue Rail Hit - brighter and bigger
local cr,cg,cb = br,bg,bb
if cr < 0.45 and cb < 0.75 then cr,cg,cb = 0.55,0.90,1.0 end
local pulse = math.max(0,1-t*1.5)
Drawing.DrawCircle(sx,sy,size*(0.18+0.70*t),cr,cg,cb,alpha*0.70,3.0)
Drawing.DrawCircle(sx,sy,size*(0.09+0.22*pulse),1,1,1,alpha*0.98,2.6)
Drawing.DrawCircle(sx,sy,size*(0.32+1.10*t),cr,cg,cb,alpha*0.22,5.0)
for k=1,18 do
local seed=(h.seed or 1)+k*4.91
local ang=(k/18)*6.283 + math.sin(seed)*0.22
local len=size*(0.45 + 1.85*t)*(0.70+0.45*math.abs(math.sin(seed)))
local bend=math.sin(seed*2.0+t*8)*size*0.12
local x1=sx+math.cos(ang)*(len*0.15)-math.sin(ang)*bend
local y1=sy+math.sin(ang)*(len*0.15)+math.cos(ang)*bend
local x2=sx+math.cos(ang)*len
local y2=sy+math.sin(ang)*len
Drawing.DrawLine(sx,sy,x2,y2,cr,cg,cb,alpha*0.22,6)
Drawing.DrawLine(x1,y1,x2,y2,0.84,0.96,1.0,alpha*0.82,2.2)
if k%3==0 then
Drawing.DrawLine(x2,y2,x2+math.cos(ang+0.45)*size*0.24,y2+math.sin(ang+0.45)*size*0.24,0.96,1,1,alpha*0.52,1.5)
end
end

elseif style == 8 then
-- Glass Shatter - brighter shards + heavier glow
local cr,cg,cb = br,bg,bb
if cb < 0.75 then cr,cg,cb = 0.62,0.92,1.0 end
Drawing.DrawCircle(sx,sy,size*(0.22+0.95*t),cr,cg,cb,alpha*0.34,2.0)
Drawing.DrawCircle(sx,sy,size*(0.10+0.20*(1-t)),1,1,1,alpha*0.84,1.6)
for k=1,22 do
local seed=(h.seed or 1)+k*8.33
local ang=(k/22)*6.283 + math.sin(seed)*0.26
local len=size*(0.28+1.20*t)*(0.55+0.55*math.abs(math.cos(seed)))
local x=sx+math.cos(ang)*len
local y=sy+math.sin(ang)*len
local shard=2.0+2.8*math.abs(math.sin(seed*1.2))
Drawing.DrawLine(x-shard,y,x+shard*0.7,y+shard*0.45,cr,cg,cb,alpha*0.78,1.2)
Drawing.DrawLine(sx+math.cos(ang)*len*0.35,sy+math.sin(ang)*len*0.35,x,y,cr,cg,cb,alpha*0.30,1.0)
end

elseif style == 9 then
-- Fallen Ultimate: Spark
EC_HITIMG_DRAW_FALLEN_STYLE(1,sx,sy,size,t,alpha,br,bg,bb,h.seed)

elseif style == 10 then
-- Fallen Ultimate: SmokeRing
EC_HITIMG_DRAW_FALLEN_STYLE(2,sx,sy,size,t,alpha,br,bg,bb,h.seed)

elseif style == 11 then
-- Fallen Ultimate: particles.js
EC_HITIMG_DRAW_FALLEN_STYLE(3,sx,sy,size,t,alpha,br,bg,bb,h.seed)

else
-- Fallen Combo: all three together
EC_HITIMG_DRAW_FALLEN_STYLE(4,sx,sy,size,t,alpha,br,bg,bb,h.seed)
end

end
end
end
end







function EC_SAURA_COLOR()
local c = __EC16 and __EC16.selfAuraColor
if c then return c[1] or 0.55, c[2] or 0.75, c[3] or 1.0 end
return 0.55,0.75,1.0
end

function EC_SAURA_POS()
local p = nil
pcall(function()
if GetMyPosition then p = GetMyPosition() end
end)
if p and p.X and p.Y and p.Z then return p end
pcall(function()
if players and players.local_player then
local lp = players.local_player()
if lp then p = lp.position or lp.root_pos or lp.root_position or lp.hrp_pos end
end
end)
if p and p.X and p.Y and p.Z then return p end
pcall(function()
if rbx and rbx.local_player then
local lp = rbx.local_player()
if lp then p = lp.position or lp.root_pos or lp.root_position or lp.hrp_pos end
end
end)
if p and p.X and p.Y and p.Z then return p end
return nil
end

function EC_SAURA_W2S(pos)
if not pos then return nil,nil,false end
local s = nil
pcall(function()
if aim and aim.world_to_screen then s = aim.world_to_screen(pos) end
end)
if s then return s.X, s.Y, s.visible == true end
return nil,nil,false
end

function EC_SAURA_DRAW_SEG(x1,y1,x2,y2,r,g,b,a,thick)
Drawing.DrawLine(x1,y1,x2,y2,r,g,b,a*0.20,thick*3.0)
Drawing.DrawLine(x1,y1,x2,y2,r,g,b,a,thick)
Drawing.DrawLine(x1,y1,x2,y2,1,1,1,a*0.18,1.0)
end

function EC_SAURA_DRAW_CIRCLE(center, radius, yoff, r,g,b, a, thick)
local lastx,lasty,lastv = nil,nil,false
local steps = 144
for i=0,steps do
local t = (i / steps) * 6.283185
local pos = {
X = center.X + math.cos(t) * radius,
Y = center.Y + yoff,
Z = center.Z + math.sin(t) * radius
}
local sx,sy,vis = EC_SAURA_W2S(pos)
if sx and sy and vis and lastx and lasty and lastv then
EC_SAURA_DRAW_SEG(lastx,lasty,sx,sy,r,g,b,a,thick)
end
lastx,lasty,lastv = sx,sy,vis
end
end

function EC_SAURA_DASH_POS(center, radius, yoff, ang)
return {
X = center.X + math.cos(ang) * radius,
Y = center.Y + yoff,
Z = center.Z + math.sin(ang) * radius
}
end

function EC_SAURA_DRAW_TAPER_DASH(center, radius, yoff, ang, arcLen, r,g,b, alpha, thick, yJit)
local segs = 12
local prevx,prevy,prevv = nil,nil,false
for j=0,segs do
local u = j / segs
local au = (u - 0.5) * 2
local profile = 1 - math.abs(au)

-- bigger dash: thin sharp tips, thick middle
local width = thick * (0.10 + profile * 1.92)
local a = alpha * (0.26 + profile * 0.74)

-- clean fast wave: dash keeps its length, only the wave motion is faster
local waveTime = (EC_BT_NOW and EC_BT_NOW() or (tick and tick() or 0)) * 8.0
local t = ang + (u - 0.5) * arcLen
local waveShape = math.sin(u * 6.283185 * 1.15 + waveTime)
local rr = radius + waveShape * (arcLen * 0.18)
local y = yoff + math.sin(u * 3.14159) * yJit + waveShape * yJit * 0.55

local pos = EC_SAURA_DASH_POS(center, rr, y, t)
local sx,sy,vis = EC_SAURA_W2S(pos)
if sx and sy and vis and prevx and prevy and prevv then
EC_SAURA_DRAW_SEG(prevx,prevy,sx,sy,r,g,b,a,width)
end
prevx,prevy,prevv = sx,sy,vis
end
end

function EC_SAURA_DRAW_DASHES(center, radius, yoff, r,g,b, alpha, thick, count, arcLen, offset, sizeJit, yJit)
for i=0,(count-1) do
local a = offset + (i / count) * 6.283185
local scale = 1 + math.sin(i * 1.917 + offset * 0.7) * sizeJit
local yy = math.sin(i * 1.371 + offset * 0.9) * yJit
local rr = math.sin(i * 2.113 + offset * 0.5) * 0.10

-- main bigger smooth-wave strip
EC_SAURA_DRAW_TAPER_DASH(center, radius + rr, yoff, a, arcLen * 1.92 * scale, r,g,b, alpha, thick * 1.22 * scale, yy)

-- extra strip above / slightly offset
local scale2 = scale * (0.84 + 0.22 * math.sin(i * 1.13 + 0.8))
EC_SAURA_DRAW_TAPER_DASH(center, radius + rr + 0.10, yoff + yy + yJit * 1.28, a + 0.026, arcLen * 1.18 * scale2, r,g,b, alpha * 0.90, thick * 0.88 * scale2, yJit * 0.42)

-- extra strip below / slightly opposite offset
local scale3 = scale * (0.76 + 0.22 * math.cos(i * 1.47 + 0.3))
EC_SAURA_DRAW_TAPER_DASH(center, radius + rr - 0.07, yoff + yy - yJit * 1.15, a - 0.022, arcLen * 0.96 * scale3, r,g,b, alpha * 0.80, thick * 0.78 * scale3, yJit * 0.38)
end
end

function EC_SAURA_COLOR_TOP()
local c = __EC16 and (__EC16.selfAuraTopColor or __EC16.selfAuraColor)
if c then return c[1] or 0.55, c[2] or 0.90, c[3] or 1.0 end
return 0.55,0.90,1.0
end

function EC_SAURA_COLOR_BOTTOM()
local c = __EC16 and (__EC16.selfAuraBottomColor or __EC16.selfAuraColor2)
if c then return c[1] or 1.00, c[2] or 0.45, c[3] or 0.75 end
return 1.00,0.45,0.75
end

function EC_SAURA_DRAW_ORB(center, radius, yoff, ang, size, r,g,b,a)
local pos = EC_SAURA_DASH_POS(center, radius, yoff, ang)
local sx,sy,vis = EC_SAURA_W2S(pos)
if sx and sy and vis then
Drawing.DrawCircle(sx,sy,size,r,g,b,a*0.35,size*0.55)
Drawing.DrawCircle(sx,sy,size*0.55,r,g,b,a,2.0)
Drawing.DrawCircle(sx,sy,size*0.22,1,1,1,a*0.65,1.3)
end
end

function EC_SAURA_DRAW_HELIX(center, radius, baseY, r1,g1,b1,r2,g2,b2, alpha, thick)
local now = EC_BT_NOW and EC_BT_NOW() or (tick and tick() or 0)
local steps = 96
local prev1x,prev1y,prev1v = nil,nil,false
local prev2x,prev2y,prev2v = nil,nil,false
for i=0,steps do
local u = i / steps
local a = u * 6.283185 * 1.35 + now * 1.30
local y1 = baseY + math.sin(u*6.283185*2 + now*3.4) * 1.15
local y2 = baseY + math.sin(u*6.283185*2 + now*3.4 + 3.14159) * 1.15
local p1 = EC_SAURA_DASH_POS(center, radius, y1, a)
local p2 = EC_SAURA_DASH_POS(center, radius, y2, a + 3.14159)
local x1,y1s,v1 = EC_SAURA_W2S(p1)
local x2,y2s,v2 = EC_SAURA_W2S(p2)
if x1 and y1s and v1 and prev1x and prev1v then EC_SAURA_DRAW_SEG(prev1x,prev1y,x1,y1s,r1,g1,b1,alpha,thick) end
if x2 and y2s and v2 and prev2x and prev2v then EC_SAURA_DRAW_SEG(prev2x,prev2y,x2,y2s,r2,g2,b2,alpha,thick) end
if i % 12 == 0 and x1 and x2 and v1 and v2 then Drawing.DrawLine(x1,y1s,x2,y2s,1,1,1,alpha*0.15,1) end
prev1x,prev1y,prev1v = x1,y1s,v1
prev2x,prev2y,prev2v = x2,y2s,v2
end
end

function EC_SAURA_DRAW()
if not __EC16 or not __EC16.selfAura then return end
local center = EC_SAURA_POS()
if not center then return end

local style = math.floor(tonumber(__EC16.selfAuraStyle or 0) or 0)
if style < 0 then style = 0 end
if style > 8 then style = 8 end
-- Old removed aura styles 1-4 are now hidden; keep them as default if loaded from old config.
if style >= 1 and style <= 4 then style = 0 end

local now = EC_BT_NOW and EC_BT_NOW() or (tick and tick() or 0)
local radius = 8.0
local baseY = -2.65

local blueR,blueG,blueB = EC_SAURA_COLOR_TOP()
local pinkR,pinkG,pinkB = EC_SAURA_COLOR_BOTTOM()

if style == 5 then
-- Double Helix
EC_SAURA_DRAW_HELIX(center, radius*1.03, baseY, blueR,blueG,blueB, pinkR,pinkG,pinkB, 0.68, 1.7)
return
elseif style == 6 then
-- Pulse Rings
for k=0,2 do
local pulse = (math.sin(now*2.0 + k*2.1) + 1) * 0.5
local rr = radius * (0.70 + k*0.23 + pulse*0.12)
local yy = baseY + (k-1)*0.58
local a = 0.34 + pulse*0.26
if k % 2 == 0 then
EC_SAURA_DRAW_CIRCLE(center, rr, yy, blueR,blueG,blueB, a, 1.65)
else
EC_SAURA_DRAW_CIRCLE(center, rr, yy, pinkR,pinkG,pinkB, a, 1.65)
end
end
return
elseif style == 7 then
-- Orbit Sparks / Orbs
EC_SAURA_DRAW_CIRCLE(center, radius*1.05, baseY, blueR,blueG,blueB, 0.34, 1.35)
EC_SAURA_DRAW_CIRCLE(center, radius*1.23, baseY+0.12, pinkR,pinkG,pinkB, 0.30, 1.35)
for i=0,11 do
local a = now*1.8 + (i/12)*6.283185
local rr = radius * (1.02 + math.sin(i*1.7 + now*2.5)*0.10)
local y = baseY + math.sin(i*1.33 + now*3.0) * 0.55
if i % 2 == 0 then
EC_SAURA_DRAW_ORB(center, rr, y, a, 3.5, blueR,blueG,blueB, 0.78)
else
EC_SAURA_DRAW_ORB(center, rr*1.12, y+0.08, -a, 3.0, pinkR,pinkG,pinkB, 0.72)
end
end
return
elseif style == 8 then
-- Halo + Floor
EC_SAURA_DRAW_CIRCLE(center, radius*0.82, baseY+1.25, blueR,blueG,blueB, 0.60, 1.9)
EC_SAURA_DRAW_CIRCLE(center, radius*1.32, baseY-1.10, pinkR,pinkG,pinkB, 0.52, 2.1)
EC_SAURA_DRAW_DASHES(center, radius*1.32, baseY-1.10, pinkR,pinkG,pinkB, 0.62, 1.12, 10, 0.22, now*-1.2, 0.20, 0.12)
EC_SAURA_DRAW_DASHES(center, radius*0.82, baseY+1.25, blueR,blueG,blueB, 0.58, 1.02, 8, 0.18, now*1.3, 0.18, 0.10)
return
end

local outerMul1, outerMul2 = 0.92, 1.18
local thick1, thick2 = 1.8, 1.8
local alpha1, alpha2 = 0.60, 0.60
local dashCount = 8
local dashLen = 0.27
local dashAlpha, dashThick = 0.62, 1.12
local speed1, speed2 = 0.82, -0.98
local sizeJit, yJit = 0.32, 0.28

if style == 1 then
outerMul1, outerMul2 = 0.95, 1.10
thick1, thick2 = 1.75, 1.72
alpha1, alpha2 = 0.62, 0.60
dashCount = 7
dashLen = 0.25
dashAlpha, dashThick = 0.65, 1.15
speed1, speed2 = 0.90, -1.06
sizeJit, yJit = 0.34, 0.30
elseif style == 2 then
outerMul1, outerMul2 = 0.88, 1.25
thick1, thick2 = 1.95, 1.95
alpha1, alpha2 = 0.58, 0.58
dashCount = 8
dashLen = 0.23
dashAlpha, dashThick = 0.60, 1.16
speed1, speed2 = 0.76, -0.92
sizeJit, yJit = 0.28, 0.22
elseif style == 3 then
outerMul1, outerMul2 = 0.92, 1.18
thick1, thick2 = 1.82, 1.82
alpha1, alpha2 = 0.60, 0.60
dashCount = 12
dashLen = 0.22
dashAlpha, dashThick = 0.66, 1.18
speed1, speed2 = 1.02, -1.18
sizeJit, yJit = 0.38, 0.32
elseif style == 4 then
outerMul1, outerMul2 = 0.92, 1.18
thick1, thick2 = 1.45, 1.45
alpha1, alpha2 = 0.48, 0.48
dashCount = 8
dashLen = 0.13
dashAlpha, dashThick = 0.48, 0.98
speed1, speed2 = 0.70, -0.85
sizeJit, yJit = 0.26, 0.19
end

local offset1 = now * speed1
local offset2 = now * speed2 + 1.25

EC_SAURA_DRAW_CIRCLE(center, radius*outerMul1, baseY, blueR,blueG,blueB, alpha1, thick1)
EC_SAURA_DRAW_CIRCLE(center, radius*outerMul2, baseY+0.03, pinkR,pinkG,pinkB, alpha2, thick2)
EC_SAURA_DRAW_DASHES(center, radius*outerMul1, baseY, blueR,blueG,blueB, dashAlpha, dashThick, dashCount, dashLen, offset1, sizeJit, yJit)
EC_SAURA_DRAW_DASHES(center, radius*outerMul2, baseY+0.03, pinkR,pinkG,pinkB, dashAlpha, dashThick, dashCount, dashLen, offset2, sizeJit, yJit)
end

hooks.on_render(function()
EC_BT_TRACK_HIT()
EC_BT_DRAW()
EC_BT_DRAW_HITS()
EC_SAURA_DRAW()
end)
-- // ===== END FALLEN VECTOR BULLET TRACERS =====


UIManager.CreateSeparator("ap_sep_main")
UIManager.SetElementParent("ap_sep_main", TAB_ID)
UIManager.CreateText("ap_aim_title_main", "Aimbot")
UIManager.SetElementParent("ap_aim_title_main", TAB_ID)
UIManager.CreateCheckbox("ap_aim_enable_fixed_click", "Aimbot", false, function(v)
ap_enabled = v
notify("Aimbot " .. (v and "ON" or "OFF"), v and "success" or "warning")
end)
UIManager.SetElementParent("ap_aim_enable_fixed_click", TAB_ID)
ap_create_bind_buttons()
ap_team_check = false
ap_sticky_aim = false
UIManager.CreateCheckbox("ap_team_main", "Team Check", false, function(v)
ap_team_check = v == true
end)
UIManager.SetElementParent("ap_team_main", TAB_ID)
UIManager.CreateCheckbox("ap_sticky_main", "Sticky Aim", false, function(v)
ap_sticky_aim = v == true
end)
UIManager.SetElementParent("ap_sticky_main", TAB_ID)
ap_target_players_enabled = true
ap_drop_prediction_enabled = true
ap_auto_weapon_stats = true
ap_target_bone = 0
ap_show_weapon_info = false
UIManager.CreateCheckbox("ap_prediction_main", "Prediction", false, function(v)
ap_prediction_enabled = v
end)
UIManager.SetElementParent("ap_prediction_main", TAB_ID)
UIManager.CreateSliderInt("ap_maxdist_main", "Max Distance", 50, 3000, 1200)
UIManager.SetElementParent("ap_maxdist_main", TAB_ID)
UIManager.CreateCheckbox("ap_tp_target_main", "Teleport To Target", false, function(v)
ap_tp_target_enabled = v
end)
UIManager.SetElementParent("ap_tp_target_main", TAB_ID)
UIManager.CreateCheckbox("ap_target_strafe_main", "Target Strafe", false, function(v)
ap_target_strafe_enabled = v
end)
UIManager.SetElementParent("ap_target_strafe_main", TAB_ID)

UIManager.CreateCheckbox("ap_left_tp_enabled", "Left TP", true, function(v)
ap_left_tp_enabled = v == true
end)
UIManager.SetElementParent("ap_left_tp_enabled", TAB_ID)
UIManager.CreateCheckbox("ap_right_tp_enabled", "Right TP", true, function(v)
ap_right_tp_enabled = v == true
end)
UIManager.SetElementParent("ap_right_tp_enabled", TAB_ID)
UIManager.CreateCheckbox("ap_90_left_tp_enabled", "90 Left TP", true, function(v)
ap_90_left_tp_enabled = v == true
end)
UIManager.SetElementParent("ap_90_left_tp_enabled", TAB_ID)
UIManager.CreateCheckbox("ap_90_right_tp_enabled", "90 Right TP", true, function(v)
ap_90_right_tp_enabled = v == true
end)
UIManager.SetElementParent("ap_90_right_tp_enabled", TAB_ID)
UIManager.CreateSliderInt("ap_side_tp_distance", "TP Distance", 1, 80, ap_side_tp_distance_default)
UIManager.SetElementParent("ap_side_tp_distance", TAB_ID)
pcall(function()
UIManager.SetCheckboxValue("ap_left_tp_enabled", true)
UIManager.SetCheckboxValue("ap_right_tp_enabled", true)
UIManager.SetCheckboxValue("ap_90_left_tp_enabled", true)
UIManager.SetCheckboxValue("ap_90_right_tp_enabled", true)
end)
ap_adv_prediction = true
ap_adaptive_lead = true
ap_ping_ms = 60
ap_accel_power = 0.35
UIManager.CreateText("ap_fov_title_main", "Aimbot FOV")
UIManager.SetElementParent("ap_fov_title_main", TAB_ID)
UIManager.CreateCheckbox("ap_fov_show_main", "FOV Enabled", true, function(v)
end)
UIManager.SetElementParent("ap_fov_show_main", TAB_ID)
UIManager.CreateColorPicker("ap_fov_color_main", "Color", 1.0, 0.8, 0.1, 1.0)
UIManager.SetElementParent("ap_fov_color_main", TAB_ID)
UIManager.SetElementSameLine("ap_fov_color_main", true)
UIManager.CreateSliderInt("ap_fov_alpha_main", "FOV Transparency", 0, 100, 50)
UIManager.SetElementParent("ap_fov_alpha_main", TAB_ID)
UIManager.CreateSliderInt("ap_fov_style_main", "FOV Style", 0, 2, 0)
UIManager.SetElementParent("ap_fov_style_main", TAB_ID)
UIManager.CreateText("ap_fov_style_hint_main", "0 Default | 1 Breathing | 2 Rotating Gradient")
UIManager.SetElementParent("ap_fov_style_hint_main", TAB_ID)
UIManager.CreateSliderInt("ap_fov_main", "FOV Size", 50, 600, 250)
UIManager.SetElementParent("ap_fov_main", TAB_ID)
local function ap_tp_enabled_now()
local ok, enabled = pcall(function()
return UIManager.GetCheckboxValue("ap_tp_target_main")
end)
return ok and enabled == true
end
local function ap_vec3(x, y, z)
return { X = x, Y = y, Z = z }
end
local function ap_get_my_root()
local direct = nil
pcall(function()
if rbx and rbx.local_hrp then
direct = rbx.local_hrp()
end
end)
if direct then return direct end
local char = nil
pcall(function()
if rbx and rbx.local_character then
char = rbx.local_character()
end
end)
if not char then return nil end
local hrp = nil
pcall(function()
hrp = char:find_first_child("HumanoidRootPart")
end)
if hrp then return hrp end
pcall(function()
hrp = char:find_first_child("LowerTorso")
end)
if hrp then return hrp end
pcall(function()
hrp = char:find_first_child("Torso")
end)
return hrp
end
local function ap_set_part_position(part, pos)
if not part or not pos then return false end
local ok = false
pcall(function()
if part.set_position then
part:set_position(pos)
ok = true
end
end)
if ok then return true end
pcall(function()
part.Position = pos
ok = true
end)
if ok then return true end
pcall(function()
if part.set_cframe then
part:set_cframe({ Position = pos })
ok = true
end
end)
return ok
end

ec_noclip_vk = 0x42
ec_noclip_bind_waiting = false
ec_noclip_bind_wait_release = false
ec_noclip_active = false
ec_noclip_start_x = nil
ec_noclip_start_y = nil
ec_noclip_start_z = nil
ec_noclip_last_swap = 0
ec_noclip_use_offset = false
ec_noclip_swap_delay = 0.10

function ec_noclip_key_name()
return ap_tp_vk_name(ec_noclip_vk or 0x42)
end

function ec_noclip_begin_bind_capture()
ec_noclip_bind_waiting = true
ec_noclip_bind_wait_release = true
notify("Press a key for Noclip bind. Esc cancels.", "warning")
end

function ec_noclip_finish_bind_capture(vk)
vk = tonumber(vk or 0) or 0
if vk <= 0 then vk = 0x42 end
ec_noclip_vk = vk
ec_noclip_bind_waiting = false
ec_noclip_bind_wait_release = false
notify("Noclip Key: " .. ec_noclip_key_name(), "success")
end

function ec_noclip_cancel_bind_capture()
ec_noclip_bind_waiting = false
ec_noclip_bind_wait_release = false
notify("Noclip keybind canceled", "warning")
end

function ec_noclip_capture_tick()
if not ec_noclip_bind_waiting then return false end
if not Windows or not Windows.IsKeyPressed then return true end
if ec_noclip_bind_wait_release then
if not Windows.IsKeyPressed(0x01) then ec_noclip_bind_wait_release = false end
return true
end
for vk = 1, 255 do
if Windows.IsKeyPressed(vk) then
if vk == 0x1B then ec_noclip_cancel_bind_capture() else ec_noclip_finish_bind_capture(vk) end
return true
end
end
return true
end

function ec_noclip_root()
root = nil
pcall(function()
if rbx and rbx.local_hrp then root = rbx.local_hrp() end
end)
if root then return root end
pcall(function()
if ap_get_my_root then root = ap_get_my_root() end
end)
return root
end

function ec_noclip_primitive(root)
prim = nil
pcall(function()
if root and root.addr and memory and memory.read_ptr and memory.offsets and memory.offsets.Primitive then
prim = memory.read_ptr(root.addr + memory.offsets.Primitive)
end
end)
if prim and prim ~= 0 then return prim end
return nil
end

-- Synced to the updated source Roof Clip behavior:
-- active: save start X/Y/Z once, alternate Y between startY-2 and startY-5 every 0.10s,
-- release: leave Y at startY-5. No sliders, no CanCollide, no set_position fallback.
function ec_noclip_pos_offset()
if memory and memory.offsets and memory.offsets.BasePartPosition then return memory.offsets.BasePartPosition end
if memory and memory.offsets and memory.offsets.CFrame then return memory.offsets.CFrame + 36 end
return 0xEC
end

function ec_noclip_read_f32(addr)
r = nil
pcall(function()
if memory and memory.read_f32 then r = memory.read_f32(addr) end
end)
return r
end

function ec_noclip_write_f32(addr, v)
ok = false
pcall(function()
if memory and memory.write_f32 then memory.write_f32(addr, v) ok = true end
end)
return ok
end

function ec_noclip_read_prim_x(prim)
off = ec_noclip_pos_offset()
return ec_noclip_read_f32(prim + off)
end

function ec_noclip_read_prim_y(prim)
off = ec_noclip_pos_offset()
return ec_noclip_read_f32(prim + off + 4)
end

function ec_noclip_read_prim_z(prim)
off = ec_noclip_pos_offset()
return ec_noclip_read_f32(prim + off + 8)
end

function ec_noclip_write_prim_xyz(prim, x, y, z)
if not prim or prim == 0 then return false end
off = ec_noclip_pos_offset()
ok1 = ec_noclip_write_f32(prim + off, x)
ok2 = ec_noclip_write_f32(prim + off + 4, y)
ok3 = ec_noclip_write_f32(prim + off + 8, z)
return ok1 and ok2 and ok3
end

function ec_noclip_write_prim_y(prim, y)
if not prim or prim == 0 then return false end
off = ec_noclip_pos_offset()
return ec_noclip_write_f32(prim + off + 4, y)
end

function ec_noclip_camera_yaw()
yaw = 0
pcall(function()
if aim and aim.get_camera_rotation then
rot = aim.get_camera_rotation()
if rot then
bx = rot[7] or 0
bz = rot[9] or 1
if math.atan2 then yaw = math.atan2(-bx, -bz) else yaw = math.atan(-bx, -bz) end
end
end
end)
return yaw
end

function ec_noclip_write_roof_rot(prim)
if not prim or prim == 0 or not memory or not memory.offsets or not memory.offsets.CFrame then return false end
yaw = ec_noclip_camera_yaw()
cy = math.cos(yaw)
sy = math.sin(yaw)
mat = {cy, 0, -sy, sy, 0, cy, 0, -1, 0}
ok = false
pcall(function()
if memory.write_matrix3 then
memory.write_matrix3(prim + memory.offsets.CFrame, mat)
ok = true
elseif memory.write_f32 then
base = prim + memory.offsets.CFrame
for i = 1, 9 do
memory.write_f32(base + ((i - 1) * 4), mat[i])
end
ok = true
end
end)
return ok
end

function ec_noclip_tick()
if ec_noclip_capture_tick() then return end
if not Windows or not Windows.IsKeyPressed then return end
key = tonumber(ec_noclip_vk or 0x42) or 0x42
held = key > 0 and Windows.IsKeyPressed(key)
if held then
root = ec_noclip_root()
if not root then return end
prim = ec_noclip_primitive(root)
if not prim or prim == 0 then return end
if not ec_noclip_active then
ec_noclip_active = true
ec_noclip_start_x = ec_noclip_read_prim_x(prim)
ec_noclip_start_y = ec_noclip_read_prim_y(prim)
ec_noclip_start_z = ec_noclip_read_prim_z(prim)
ec_noclip_last_swap = tick()
ec_noclip_use_offset = true
end
if not ec_noclip_start_x or not ec_noclip_start_y or not ec_noclip_start_z then return end
if tick() - (ec_noclip_last_swap or 0) >= (ec_noclip_swap_delay or 0.10) then
ec_noclip_last_swap = tick()
ec_noclip_use_offset = not ec_noclip_use_offset
end
pcall(function() ec_noclip_write_roof_rot(prim) end)
if ec_noclip_use_offset then target_y = ec_noclip_start_y - 2 else target_y = ec_noclip_start_y - 5 end
ec_noclip_write_prim_xyz(prim, ec_noclip_start_x, target_y, ec_noclip_start_z)
else
if ec_noclip_active then
root = ec_noclip_root()
if root and ec_noclip_start_y then
prim = ec_noclip_primitive(root)
if prim and prim ~= 0 then pcall(function() ec_noclip_write_prim_y(prim, ec_noclip_start_y - 5) end) end
end
end
ec_noclip_active = false
ec_noclip_start_x = nil
ec_noclip_start_y = nil
ec_noclip_start_z = nil
ec_noclip_last_swap = 0
ec_noclip_use_offset = false
end
end

hooks.on_render(function()
pcall(ec_noclip_tick)
end)

function ap_side_tp_distance_now()
local dist = ap_side_tp_distance_default or 20
pcall(function()
local v = UIManager.GetSliderIntValue("ap_side_tp_distance")
if v and v > 0 then dist = v end
end)
dist = tonumber(dist or 20) or 20
if dist < 1 then dist = 1 end
if dist > 80 then dist = 80 end
return dist
end
function ap_side_tp_reset()
ap_left_tp_active = false
ap_right_tp_active = false
ap_90_left_tp_active = false
ap_90_right_tp_active = false
ap_left_tp_target_pos = nil
ap_right_tp_target_pos = nil
ap_90_left_tp_target_pos = nil
ap_90_right_tp_target_pos = nil
ap_90_left_tp_dir = nil
ap_90_right_tp_dir = nil
end
function ap_side_tp_get_root_pos()
local root = ap_get_my_root()
local pos = nil
pcall(function()
if root and root.get_position then pos = root:get_position() elseif root and root.Position then pos = root.Position end
end)
return root, pos
end
function ap_side_tp_get_head_pos()
local pos = nil
pcall(function()
local h = nil
if rbx and rbx.local_head then h = rbx.local_head() end
if h and h.get_position then pos = h:get_position() elseif h and h.Position then pos = h.Position end
end)
return pos
end
function ap_side_tp_target_head_pos(target)
if not target then return nil end
return target.head_pos or target.head_position or target.camera_pos or target.position or target.root_pos or target.hrp_pos or target.body_pos
end
function ap_side_tp_target_body_pos(target)
if not target then return nil end
return target.position or target.root_pos or target.root_position or target.hrp_pos or target.body_pos or target.head_pos
end
function ap_side_tp_norm_xz(x, z)
x = tonumber(x or 0) or 0
z = tonumber(z or 0) or 0
local len = math.sqrt(x * x + z * z)
if len > 0.001 then return x / len, z / len end
return nil, nil
end
function ap_side_tp_right_from_lock(target, my_pos)
local from = ap_side_tp_get_head_pos() or my_pos
local to = ap_side_tp_target_head_pos(target)
if not from or not to or not from.X or not from.Z or not to.X or not to.Z then return nil, nil end
local fx, fz = ap_side_tp_norm_xz(to.X - from.X, to.Z - from.Z)
if not fx or not fz then return nil, nil end
return ap_side_tp_norm_xz(-fz, fx)
end
function ap_side_tp_make_target_from_best(target, side)
local root, my = ap_side_tp_get_root_pos()
if not root or not my or not my.X or not my.Y or not my.Z then return nil end
local rx, rz = ap_side_tp_right_from_lock(target, my)
if not rx or not rz then return nil end
local step = ap_side_tp_distance_now() * (side or 1)
return ap_vec3(my.X + rx * step, my.Y, my.Z + rz * step)
end
function ap_side_tp_make_90_dir_from_best(target, side)
local root, my = ap_side_tp_get_root_pos()
if not root or not my or not my.X or not my.Z then return nil end
local center = ap_side_tp_target_body_pos(target)
if not center or not center.X or not center.Z then return nil end
local vx = my.X - center.X
local vz = my.Z - center.Z
local nx, nz = ap_side_tp_norm_xz(vx, vz)
if not nx or not nz then
local rx, rz = ap_side_tp_right_from_lock(target, my)
if not rx or not rz then return nil end
nx = rx
nz = rz
end
local px = 0
local pz = 0
if (side or 1) < 0 then
px = -nz
pz = nx
else
px = nz
pz = -nx
end
return { X = px, Z = pz }
end
function ap_side_tp_make_90_target_from_best(target, dir)
local root, my = ap_side_tp_get_root_pos()
if not root or not my then return nil end
local center = ap_side_tp_target_body_pos(target)
if not center or not center.X or not center.Z then return nil end
if not dir or not dir.X or not dir.Z then return nil end
local dist = ap_side_tp_distance_now()
local y = center.Y or my.Y or 0
return ap_vec3(center.X + dir.X * dist, y + 0.10, center.Z + dir.Z * dist)
end
function ap_side_tp_spam_to(wanted)
if not wanted then return false end
local root = ap_get_my_root()
if not root then return false end
pcall(function()
if root.set_velocity then root:set_velocity(ap_vec3(0, 0, 0)) end
end)
local ok = false
local writes = tonumber(ap_side_tp_writes_per_frame or 35) or 35
if writes < 1 then writes = 1 end
if writes > 60 then writes = 60 end
for i = 1, writes do
if ap_set_part_position(root, wanted) then ok = true end
end
return ok
end
function ap_side_tp_strong_lock(target, writes)
if not target or not target.head_pos or not aim then return false end
if not aim.get_camera_position or not aim.look_at_matrix or not aim.set_camera_rotation then return false end
local cam_pos = nil
pcall(function() cam_pos = aim.get_camera_position() end)
if not cam_pos then return false end
local head = target.head_pos
local mat = nil
pcall(function() mat = aim.look_at_matrix(cam_pos, head) end)
if not mat then return false end
writes = tonumber(writes or ap_side_tp_lock_writes or 40) or 40
if writes < 1 then writes = 1 end
if writes > 40 then writes = 40 end
for i = 1, writes do
pcall(function() aim.set_camera_rotation(mat) end)
end
if aim.world_to_screen and aim.write_mouse then
local screen = nil
pcall(function() screen = aim.world_to_screen(head) end)
if screen and screen.visible then
pcall(function() aim.write_mouse(screen, tonumber(ap_side_tp_mouse_writes or 32) or 32) end)
if aim.prime_mouse then pcall(function() aim.prime_mouse(screen) end) end
end
end
if target.address then ap_locked_target_addr = target.address end
ap_last_aim_addr = target.address or ap_last_aim_addr
ap_smoothed_pred = { X = head.X, Y = head.Y, Z = head.Z }
return true
end

function ap_side_tp_refresh_ui_values()
pcall(function() ap_left_tp_enabled = UIManager.GetCheckboxValue("ap_left_tp_enabled") == true end)
pcall(function() ap_right_tp_enabled = UIManager.GetCheckboxValue("ap_right_tp_enabled") == true end)
pcall(function() ap_90_left_tp_enabled = UIManager.GetCheckboxValue("ap_90_left_tp_enabled") == true end)
pcall(function() ap_90_right_tp_enabled = UIManager.GetCheckboxValue("ap_90_right_tp_enabled") == true end)
end
function ap_side_tp_any_key_down()
if not Windows or not Windows.IsKeyPressed then return false end
ap_side_tp_refresh_ui_values()
if ap_left_tp_enabled and ap_left_tp_vk and ap_left_tp_vk > 0 and Windows.IsKeyPressed(ap_left_tp_vk) then return true end
if ap_right_tp_enabled and ap_right_tp_vk and ap_right_tp_vk > 0 and Windows.IsKeyPressed(ap_right_tp_vk) then return true end
if ap_90_left_tp_enabled and ap_90_left_tp_vk and ap_90_left_tp_vk > 0 and Windows.IsKeyPressed(ap_90_left_tp_vk) then return true end
if ap_90_right_tp_enabled and ap_90_right_tp_vk and ap_90_right_tp_vk > 0 and Windows.IsKeyPressed(ap_90_right_tp_vk) then return true end
return false
end
function ap_process_side_tp_keys_for_target(target)
if not target or not Windows or not Windows.IsKeyPressed then ap_side_tp_reset(); return end
ap_side_tp_refresh_ui_values()
local ld = ap_left_tp_enabled and ap_left_tp_vk and ap_left_tp_vk > 0 and Windows.IsKeyPressed(ap_left_tp_vk)
local rd = ap_right_tp_enabled and ap_right_tp_vk and ap_right_tp_vk > 0 and Windows.IsKeyPressed(ap_right_tp_vk)
local l90 = ap_90_left_tp_enabled and ap_90_left_tp_vk and ap_90_left_tp_vk > 0 and Windows.IsKeyPressed(ap_90_left_tp_vk)
local r90 = ap_90_right_tp_enabled and ap_90_right_tp_vk and ap_90_right_tp_vk > 0 and Windows.IsKeyPressed(ap_90_right_tp_vk)
if ld or rd or l90 or r90 then
ap_side_tp_strong_lock(target, ap_side_tp_lock_writes)
end
if ld then
if not ap_left_tp_active then ap_left_tp_active = true; ap_left_tp_target_pos = ap_side_tp_make_target_from_best(target, -1) end
ap_side_tp_spam_to(ap_left_tp_target_pos)
else
ap_left_tp_active = false
ap_left_tp_target_pos = nil
end
if rd then
if not ap_right_tp_active then ap_right_tp_active = true; ap_right_tp_target_pos = ap_side_tp_make_target_from_best(target, 1) end
ap_side_tp_spam_to(ap_right_tp_target_pos)
else
ap_right_tp_active = false
ap_right_tp_target_pos = nil
end
if l90 then
if not ap_90_left_tp_active then
ap_90_left_tp_active = true
ap_90_left_tp_dir = ap_side_tp_make_90_dir_from_best(target, -1)
end
ap_90_left_tp_target_pos = ap_side_tp_make_90_target_from_best(target, ap_90_left_tp_dir)
ap_side_tp_spam_to(ap_90_left_tp_target_pos)
else
ap_90_left_tp_active = false
ap_90_left_tp_target_pos = nil
ap_90_left_tp_dir = nil
end
if r90 then
if not ap_90_right_tp_active then
ap_90_right_tp_active = true
ap_90_right_tp_dir = ap_side_tp_make_90_dir_from_best(target, 1)
end
ap_90_right_tp_target_pos = ap_side_tp_make_90_target_from_best(target, ap_90_right_tp_dir)
ap_side_tp_spam_to(ap_90_right_tp_target_pos)
else
ap_90_right_tp_active = false
ap_90_right_tp_target_pos = nil
ap_90_right_tp_dir = nil
end
if ld or rd or l90 or r90 then
ap_side_tp_strong_lock(target, ap_side_tp_lock_writes)
end
end

local function ap_target_behind_position(target, dist)
if not target or not target.position then return nil end
dist = dist or 3
local tx = target.position.X
local ty = target.position.Y
local tz = target.position.Z
local back_x, back_z = 0, -1
local my = GetMyPosition and GetMyPosition() or nil
if my and my.X and my.Z then
local dx = my.X - tx
local dz = my.Z - tz
local len = math.sqrt(dx * dx + dz * dz)
if len > 0.05 then
back_x = dx / len
back_z = dz / len
end
end
return ap_vec3(tx + back_x * dist, ty + 1.5, tz + back_z * dist)
end
local function ap_target_orbit_position(target, radius)
if not target or not target.position then return nil end
radius = radius or 4
local tx = target.position.X
local ty = target.position.Y
local tz = target.position.Z
local rad = math.rad(ap_tp_orbit_angle or 0)
local ox = math.cos(rad) * radius
local oz = math.sin(rad) * radius
return ap_vec3(tx + ox, ty + 1.5, tz + oz)
end
local function ap_teleport_to_target_once(target)
if not target or not target.address then return false end
local ok_enabled, enabled = pcall(function()
return UIManager.GetCheckboxValue("ap_tp_target_main")
end)
ap_tp_target_enabled = ok_enabled and enabled == true
if not ap_tp_target_enabled then return false end
ap_tp_cooldown = 0.012
ap_tp_orbit_radius = 3
ap_tp_orbit_speed = 275
local now = tick()
if now - (ap_tp_last_time or 0) < ap_tp_cooldown then
return false
end
local root = ap_get_my_root()
if not root then return false end
local dt = now - (ap_tp_last_orbit_tick or 0)
if dt < 0.001 or dt > 0.08 then
dt = 1 / 60
end
ap_tp_last_orbit_tick = now
ap_tp_orbit_angle = (ap_tp_orbit_angle + ap_tp_orbit_speed * dt) % 360
local pos = ap_target_orbit_position(target, ap_tp_orbit_radius)
if not pos then return false end
if ap_set_part_position(root, pos) then
ap_tp_last_time = now
ap_tp_last_target = target.address or target.name
return true
end
return false
end
local function ap_target_strafe_tp_1ms(target)
if not target then return false end
pcall(function()
ap_target_strafe_enabled = UIManager.GetCheckboxValue("ap_target_strafe_main") == true
end)
if not ap_target_strafe_enabled then return false end
local now = tick()
local cooldown = ap_target_strafe_cooldown or 0.016
if now - (ap_target_strafe_last_tp or 0) < cooldown then
return false
end
local root = ap_get_my_root()
if not root then return false end
local dt = now - (ap_target_strafe_last_tick or 0)
if dt < 0.001 or dt > 0.10 then
dt = 1 / 60
end
ap_target_strafe_last_tick = now
ap_target_strafe_last_tp = now
local center = nil
if target.root_pos then center = target.root_pos end
if (not center) and target.root_position then center = target.root_position end
if (not center) and target.hrp_pos then center = target.hrp_pos end
if (not center) and target.body_pos then center = target.body_pos end
if (not center) and target.position then center = target.position end
if not center then return false end
local target_key = target.address or target.name or tostring(center.X) .. ":" .. tostring(center.Z)
if ap_target_strafe_last_target ~= target_key then
ap_target_strafe_last_target = target_key
ap_target_strafe_last_tick = now
dt = 1 / 60
end
local speed = ap_target_strafe_speed or 150
local radius = ap_target_strafe_radius or 4.0
if radius < 1 then radius = 1 end
if radius > 50 then radius = 50 end
if radius < 1 then radius = 1 end
if radius > 50 then radius = 50 end
ap_target_strafe_angle = (ap_target_strafe_angle + speed * dt) % 360
local rad = math.rad(ap_target_strafe_angle)
local wanted = ap_vec3(
center.X + math.cos(rad) * radius,
center.Y + 0.10,
center.Z + math.sin(rad) * radius
)
local pos = wanted
pcall(function()
local current = nil
if root.get_position then
current = root:get_position()
elseif root.Position then
current = root.Position
end
if current and current.X and current.Y and current.Z then
local dx = wanted.X - current.X
local dy = wanted.Y - current.Y
local dz = wanted.Z - current.Z
local dist2 = dx*dx + dy*dy + dz*dz
if dist2 < 144 then
local alpha = math.max(0.38, math.min(0.75, dt * 22))
pos = ap_vec3(
current.X + (wanted.X - current.X) * alpha,
current.Y + (wanted.Y - current.Y) * alpha,
current.Z + (wanted.Z - current.Z) * alpha
)
end
end
end)
pcall(function()
if root.set_velocity then
root:set_velocity(ap_vec3(0,0,0))
end
end)
return ap_set_part_position(root, pos)
end

function ap_copter_sit_vec_len_xz(dx, dz)
    dx = tonumber(dx or 0) or 0
    dz = tonumber(dz or 0) or 0
    return math.sqrt(dx * dx + dz * dz)
end

function ap_copter_sit_enabled_now()
    local v = false
    pcall(function() v = UIManager.GetCheckboxValue("k1_flycopter_sit") == true end)
    ap_copter_sit_enabled = v == true
    return ap_copter_sit_enabled == true
end
function ap_copter_sit_key_name()
    return ap_tp_vk_name(ap_copter_sit_vk or 0)
end

function ap_copter_sit_key_down()
    local vk = tonumber(ap_copter_sit_vk or 0) or 0
    if vk <= 0 then return false end
    local down = false
    pcall(function() down = Windows.IsKeyPressed(vk) == true end)
    return down == true
end

function ap_copter_sit_spam_e()
    local now = tick()
    if now - (ap_copter_sit_last_e or 0) < 0.045 then
        return false
    end
    ap_copter_sit_last_e = now

    pcall(function()
        if Windows and Windows.KeyPress then
            Windows.KeyPress(VK.E)
        elseif Windows and Windows.KeyDown and Windows.KeyUp then
            Windows.KeyDown(VK.E)
            Windows.KeyUp(VK.E)
        end
    end)

    return true
end

function ap_copter_sit_get_pos_from_entry(entry)
    if not entry then return nil end
    local pos = nil
    pcall(function()
        if entry.model then
            pos = k1_part_pos(entry.model)
        end
    end)
    if pos and pos.X and pos.Y and pos.Z then
        entry.pos = pos
        return pos
    end
    pos = entry.pos
    if pos and pos.X and pos.Y and pos.Z then return pos end
    return nil
end

function ap_copter_sit_refresh_cache(force)
    -- NO-LAG MODE:
    -- Не сканим Workspace при нажатии бинда. Берём только уже готовый ESP cache.
    local now = tick()
    if (not force) and ap_copter_sit_cache and (now - (ap_copter_sit_cache_at or 0) < 2.50) then
        return ap_copter_sit_cache
    end

    ap_copter_sit_cache_at = now
    ap_copter_sit_cache = {}

    if k1 and k1.loot_folder_cache then
        local added = 0
        for _, entry in ipairs(k1.loot_folder_cache) do
            if added >= 8 then break end
            if entry and entry.cfg and entry.cfg.id == "flycopter" then
                local pos = entry.pos or entry.Position
                if (not pos) and entry.model then
                    pcall(function() pos = k1_part_pos(entry.model) end)
                end
                if pos and pos.X and pos.Y and pos.Z then
                    added = added + 1
                    table.insert(ap_copter_sit_cache, { pos = pos, model = entry.model, name = "Flycopter" })
                end
            end
        end
    end

    return ap_copter_sit_cache
end

function ap_copter_sit_pick_target(cross, fov_px, max_dist)
    local list = ap_copter_sit_refresh_cache(false)
    if not list then return nil, nil end

    -- Максимально дешёвый выбор: если есть crosshair — один world_to_screen на entry.
    -- Если crosshair нет, берём первый коптер.
    local best = nil
    local best_score = math.huge
    local fov = tonumber(fov_px or 250) or 250

    for _, entry in ipairs(list) do
        local pos = entry.pos
        if pos and pos.X and pos.Y and pos.Z then
            if cross then
                local s2 = nil
                pcall(function() s2 = aim.world_to_screen(ap_vec3(pos.X, pos.Y + 2.0, pos.Z)) end)
                if s2 and s2.visible then
                    local dx = (s2.X or 0) - (cross.X or 0)
                    local dy = (s2.Y or 0) - (cross.Y or 0)
                    local score = dx * dx + dy * dy
                    if score <= (fov * fov) and score < best_score then
                        best_score = score
                        best = entry
                    end
                end
            else
                best = entry
                best_score = 0
                break
            end
        end
    end

    return best, best_score
end


function ap_copter_sit_force_aim(center)
    if not center or not center.X or not center.Y or not center.Z then return false end
    if not aim or not aim.get_camera_position or not aim.look_at_matrix or not aim.set_camera_rotation then return false end

    local cam = nil
    pcall(function() cam = aim.get_camera_position() end)
    if not cam then return false end

    local target = ap_vec3(center.X, center.Y + 2.6, center.Z)
    local mat = nil
    pcall(function() mat = aim.look_at_matrix(cam, target) end)
    if not mat then return false end

    -- Лёгкий, но постоянный lock: только camera rotation, без mouse/write spam.
    pcall(function()
        for i = 1, 6 do
            aim.set_camera_rotation(mat)
        end
    end)

    return true
end

function ap_copter_sit_target_key(entry)
    if not entry then return nil end
    if entry.model and entry.model._instance then return tostring(entry.model._instance) end
    if entry.model and entry.model.Name then return tostring(entry.model.Name) end
    if entry.name then return tostring(entry.name) end
    if entry.pos then return tostring(math.floor(entry.pos.X or 0)) .. ":" .. tostring(math.floor(entry.pos.Z or 0)) end
    return nil
end

function ap_copter_sit_orbit_and_aim(entry)
    if not entry then return false end

    local now = tick()
    local center = ap_copter_sit_active_center or entry.pos

    -- Позицию коптера обновляем не каждый frame, чтобы не возвращать лютые лаги.
    if (not center) or (now - (ap_copter_sit_center_at or 0) > 0.18) then
        center = entry.pos
        if entry.model then
            pcall(function()
                local p = k1_part_pos(entry.model)
                if p and p.X and p.Y and p.Z then center = p end
            end)
        end
        ap_copter_sit_active_center = center
        ap_copter_sit_center_at = now
    end
    if not center or not center.X or not center.Y or not center.Z then return false end

    -- Aim-lock каждый frame, без mouse/write spam.
    ap_copter_sit_force_aim(center)

    -- E spam вернул, но с cooldown, чтобы не убивало FPS.
    ap_copter_sit_spam_e()

    local cooldown = tonumber(ap_copter_sit_cooldown or 0.016) or 0.016
    if now - (ap_copter_sit_last_tp or 0) < cooldown then
        return true
    end

    local root = ap_get_my_root()
    if not root then return true end

    local dt = now - (ap_copter_sit_last_tick or 0)
    if dt < 0.001 or dt > 0.10 then
        dt = 1 / 60
    end
    ap_copter_sit_last_tick = now
    ap_copter_sit_last_tp = now

    local key = ap_copter_sit_target_key(entry)
    if ap_copter_sit_locked_key ~= key then
        ap_copter_sit_locked_key = key
        ap_copter_sit_angle = 0
        dt = 1 / 60
    end

    -- Как target strafe: fixed radius/speed, 1 set_position за frame, плавное добирание до wanted.
    local radius = 3.0
    local speed = 200
    ap_copter_sit_angle = (ap_copter_sit_angle + speed * dt) % 360
    local rad = math.rad(ap_copter_sit_angle)

    local wanted = ap_vec3(
        center.X + math.cos(rad) * radius,
        center.Y + 0.10,
        center.Z + math.sin(rad) * radius
    )

    local pos = wanted
    pcall(function()
        local current = nil
        if root.get_position then
            current = root:get_position()
        elseif root.Position then
            current = root.Position
        end

        if current and current.X and current.Y and current.Z then
            local dx = wanted.X - current.X
            local dy = wanted.Y - current.Y
            local dz = wanted.Z - current.Z
            local dist2 = dx * dx + dy * dy + dz * dz

            -- Та же идея, что в target strafe: если рядом, не телепаем резко, а сглаживаем.
            if dist2 < 144 then
                local alpha = math.max(0.38, math.min(0.75, dt * 22))
                pos = ap_vec3(
                    current.X + (wanted.X - current.X) * alpha,
                    current.Y + (wanted.Y - current.Y) * alpha,
                    current.Z + (wanted.Z - current.Z) * alpha
                )
            end
        end
    end)

    pcall(function()
        if root.set_velocity then
            root:set_velocity(ap_vec3(0, 0, 0))
        end
    end)

    ap_set_part_position(root, pos)
    return true
end

function ap_copter_sit_tick(cross, fov_px, max_dist)
    if not ap_copter_sit_enabled_now() then
        ap_copter_sit_locked_key = nil
        ap_copter_sit_active_entry = nil
        ap_copter_sit_active_center = nil
        ap_copter_sit_was_down = false
        return false
    end

    local down = ap_copter_sit_key_down()
    if not down then
        ap_copter_sit_locked_key = nil
        ap_copter_sit_active_entry = nil
        ap_copter_sit_active_center = nil
        ap_copter_sit_was_down = false
        return false
    end

    -- На первом нажатии выбираем коптер один раз.
    if down and not ap_copter_sit_was_down then
        ap_copter_sit_active_entry = ap_copter_sit_pick_target(cross, fov_px, max_dist)
        ap_copter_sit_active_center = ap_copter_sit_active_entry and ap_copter_sit_active_entry.pos or nil
        ap_copter_sit_center_at = tick()
        ap_copter_sit_angle = 0
        ap_copter_sit_last_tp = 0
        ap_copter_sit_last_tick = tick()
    end
    ap_copter_sit_was_down = true

    local entry = ap_copter_sit_active_entry
    if not entry then return false end

    return ap_copter_sit_orbit_and_aim(entry)
end

local function ap_is_key_down()
return Windows.IsKeyPressed(ap_aim_vk)
end
local function ap_get_bone_from_cache(p, names)
if not p or not p.bones then return nil end
for _, bone in ipairs(p.bones) do
local bn = bone.name or bone.Name or bone[1]
if bn then
for _, want in ipairs(names) do
if tostring(bn) == want then
local bp = bone.position or bone.Position or bone.pos or bone[3]
if bp and bp.X and bp.Y and bp.Z then return bp end
end
end
end
end
return nil
end

local function ap_get_target_bone_pos(p)
if not p then return nil end
local bone = ap_target_bone or 0
if bone <= 0 then
return p.head_pos
elseif bone == 1 then
local b = ap_get_bone_from_cache(p, {"UpperTorso", "Torso", "LowerTorso", "HumanoidRootPart"})
if b then return b end
if p.position and p.position.X and p.position.Y and p.position.Z then
return { X = p.position.X, Y = p.position.Y + 1.35, Z = p.position.Z }
end
return p.head_pos
else
local b = ap_get_bone_from_cache(p, {"LowerTorso", "HumanoidRootPart", "Torso"})
if b then return b end
return p.position or p.head_pos
end
end

local function ap_valid_player_target(p, max_dist)
if not p or p.is_self then return false end
if p.is_knocked or p.is_dead then return false end
if ap_team_check and p.is_teammate then return false end
if p.health ~= nil and (tonumber(p.health) or 0) <= 1 then return false end
if p.max_health ~= nil and (tonumber(p.max_health) or 100) <= 0 then return false end
if p.address ~= nil and p.address == 0 then return false end
if p.player_addr ~= nil and p.player_addr == 0 then return false end
if p.character_addr ~= nil and p.character_addr == 0 then return false end
if p.humanoid_addr ~= nil and p.humanoid_addr == 0 then return false end
local bp = ap_get_target_bone_pos(p)
if not bp or not bp.X or not bp.Y or not bp.Z then return false end
if bp.X == 0 and bp.Y == 0 and bp.Z == 0 then return false end
if p.distance and (p.distance <= 1 or p.distance > max_dist) then return false end
return true
end

hooks.on_render(function()

if ap_tp_bind_waiting then
if ap_tp_bind_wait_release then
if not Windows.IsKeyPressed(0x01) then
ap_tp_bind_wait_release = false
end
return
end
for vk = 1, 255 do
if Windows.IsKeyPressed(vk) then
if vk == 0x1B then
ap_cancel_tp_bind_capture()
return
end
ap_finish_tp_bind_capture(vk)
return
end
end
return
end
if ap_bind_waiting then
ap_set_bind_button_visible(0, true)
if ap_bind_wait_release then
if not Windows.IsKeyPressed(0x01) then
ap_bind_wait_release = false
end
return
end
for vk = 1, 255 do
if Windows.IsKeyPressed(vk) then
if vk == 0x1B then
ap_bind_waiting = false
ap_set_bind_button_visible(ap_aim_vk, false)
notify("Aimbot keybind canceled", "warning")
return
end
ap_aim_vk = vk
ap_bind_waiting = false
ap_set_bind_button_visible(ap_aim_vk, false)
notify("Aimbot Key: " .. ap_vk_name(ap_aim_vk), "success")
return
end
end
return
end
if (not ap_is_key_down()) and (not ap_copter_sit_key_down()) then
ap_locked_target_addr = nil
ap_side_tp_reset()
ap_copter_sit_locked_key = nil
end
local ok_enabled, ui_enabled = pcall(function()
return UIManager.GetCheckboxValue("ap_aim_enable_fixed_click")
end)
if ok_enabled then
ap_enabled = ui_enabled
end
ap_power = 0.54
ap_smooth_power = 1.00
pcall(function()
ap_prediction_enabled = UIManager.GetCheckboxValue("ap_prediction_main") == true
end)
pcall(function()
ap_team_check = UIManager.GetCheckboxValue("ap_team_main") == true
end)
pcall(function()
ap_sticky_aim = UIManager.GetCheckboxValue("ap_sticky_main") == true
end)
pcall(function()
ap_target_strafe_enabled = UIManager.GetCheckboxValue("ap_target_strafe_main") == true
end)
if (not ap_sticky_aim) and (not ap_target_strafe_enabled) then ap_locked_target_addr = nil end
ap_target_players_enabled = true
ap_drop_prediction_enabled = true
ap_auto_weapon_stats = true
ap_target_bone = 0
ap_show_weapon_info = false
ap_fov_px  = UIManager.GetSliderIntValue("ap_fov_main")
ap_max_dist = UIManager.GetSliderIntValue("ap_maxdist_main")
local ap_weapon_name = ap_working_apply_weapon_stats()
local c = crosshair_pos()
if not c then return end
if ap_enabled and UIManager.GetCheckboxValue("ap_fov_show_main") then
local col = UIManager.GetColorPickerValue("ap_fov_color_main") or {}
local r = col.r or col.R or col[1] or 1.0
local g = col.g or col.G or col[2] or 0.8
local b = col.b or col.B or col[3] or 0.1
local a = UIManager.GetSliderIntValue("ap_fov_alpha_main") / 100.0
local style = UIManager.GetSliderIntValue("ap_fov_style_main") or 0
local tm = tick()
if style == 0 then
Drawing.DrawCircle(c.X, c.Y, ap_fov_px, r, g, b, a, 1.0)
elseif style == 1 then
local scale = 1.0 + math.sin(tm * 2.2) * 0.045
local alpha = a * (0.65 + (math.sin(tm * 2.2) + 1.0) * 0.175)
Drawing.DrawCircle(c.X, c.Y, ap_fov_px * scale, r, g, b, alpha, 2.0)
else
local segments = 40
local rot = tm * 1.8
for i = 1, segments do
local p1 = ((i - 1) / segments) * math.pi * 2
local p2 = (i / segments) * math.pi * 2
local a1 = p1 + rot
local a2 = p2 + rot
local glow = (math.sin(tm * 2.0 + i * 0.28) + 1.0) * 0.5
local rr = r * (0.45 + glow * 0.55)
local gg = g * (0.45 + glow * 0.55)
local bb = b * (0.45 + glow * 0.55)
local x1 = c.X + math.cos(a1) * ap_fov_px
local y1 = c.Y + math.sin(a1) * ap_fov_px
local x2 = c.X + math.cos(a2) * ap_fov_px
local y2 = c.Y + math.sin(a2) * ap_fov_px
Drawing.DrawLine(x1, y1, x2, y2, rr, gg, bb, a, 2.0)
end
end
end
if not ap_enabled then
if ap_copter_sit_tick(c, ap_fov_px or 250, ap_max_dist or 1200) then
ap_side_tp_reset()
ap_smoothed_pred = nil
ap_last_aim_addr = nil
ap_locked_target_addr = nil
return
end
ap_side_tp_reset()
ap_smoothed_pred = nil
ap_last_aim_addr = nil
return
end
pcall(function()
if cheat and cheat.aimbot then
cheat.aimbot.smoothness_enabled = false
cheat.aimbot.smooth_factor = 1
cheat.aimbot.smooth_x = 1
cheat.aimbot.smooth_y = 1
end
end)
if ap_copter_sit_tick(c, ap_fov_px, ap_max_dist) then
ap_side_tp_reset()
ap_smoothed_pred = nil
ap_last_aim_addr = nil
ap_locked_target_addr = nil
return
end
if not ap_is_key_down() then
ap_side_tp_reset()
ap_smoothed_pred = nil
ap_last_aim_addr = nil
ap_locked_target_addr = nil
if not ap_copter_sit_key_down() then ap_copter_sit_locked_key = nil end
return
end
local all = players.get_all()
local best = nil
local best_sd = math.huge
if not ap_target_players_enabled then
ap_side_tp_reset()
ap_locked_target_addr = nil
ap_smoothed_pred = nil
ap_last_aim_addr = nil
return
end
if (ap_sticky_aim or ap_target_strafe_enabled or ap_side_tp_any_key_down()) and ap_locked_target_addr then
for _, lp in ipairs(all) do
if lp.address == ap_locked_target_addr then
if ap_valid_player_target(lp, ap_max_dist) then
best = lp
best_sd = 0
else
ap_locked_target_addr = nil
end
break
end
end
end
for _, p in ipairs(all) do
if not ap_valid_player_target(p, ap_max_dist) then goto ap_skip end
local bp = ap_get_target_bone_pos(p)
if not bp then goto ap_skip end
ap_push_sample(p.address, bp)
local preview_pos = ap_predict_pos(p, bp, aim.get_camera_position()) or bp
local s = aim.world_to_screen(preview_pos)
if not s or not s.visible then goto ap_skip end
local dx = s.X - c.X
local dy = s.Y - c.Y
local sd = math.sqrt(dx * dx + dy * dy)
if sd <= ap_fov_px and sd < best_sd then
best_sd = sd
best = p
end
::ap_skip::
end
if not best then
ap_side_tp_reset()
ap_locked_target_addr = nil
ap_smoothed_pred = nil
ap_last_aim_addr = nil
return
end
if ap_sticky_aim or ap_target_strafe_enabled or ap_side_tp_any_key_down() then
ap_locked_target_addr = best.address
end
ap_process_side_tp_keys_for_target(best)
if ap_tp_enabled_now() and ap_last_aim_addr ~= best.address then
ap_smoothed_pred = nil
ap_last_aim_addr = nil
end
local ap_did_tp = ap_teleport_to_target_once(best)
if not ap_tp_target_enabled then
ap_target_strafe_tp_1ms(best)
end
if (not ap_target_strafe_enabled) and (not ap_valid_player_target(best, ap_max_dist)) then return end
local aim_pos = ap_get_target_bone_pos(best)
if not aim_pos then return end
local ap_tp_active_now = ap_tp_enabled_now()
ap_side_tp_active_now_loop = ap_side_tp_any_key_down()
if (ap_tp_active_now or ap_side_tp_active_now_loop) and best.head_pos then
aim_pos = best.head_pos
end
ap_push_sample(best.address, aim_pos)
local cam_pos = aim.get_camera_position()
if not cam_pos then return end
local dist = best.distance or 0
local bullet_speed = AP_BULLET_SPEED
if not bullet_speed or bullet_speed < 1 then bullet_speed = 1000 end
local flight_t = dist / bullet_speed
if flight_t < 0 then flight_t = 0 end
if flight_t > 3.0 then flight_t = 3.0 end
local drop_studs = 0.84 * AP_GRAVITY * flight_t * flight_t * ap_power
if ap_current_weapon_name == "Wooden Bow" or ap_current_weapon_name == "Bow" then
drop_studs = drop_studs * 1.00
end
if not ap_drop_prediction_enabled then
drop_studs = 0
end
if not ap_prediction_enabled then
flight_t = 0
end
if ap_tp_active_now or ap_side_tp_active_now_loop then
drop_studs = drop_studs * 0.25
end
-- Prediction: no extra boost, no ping boost, no accel boost, no adaptive lead.
local pred = ap_predict_pos(best, aim_pos, cam_pos)
if not pred then return end
if (ap_tp_active_now or ap_side_tp_active_now_loop) and best.head_pos then
pred = {
X = best.head_pos.X,
Y = best.head_pos.Y,
Z = best.head_pos.Z
}
end
local pred_screen_check = aim.world_to_screen(pred)
if (not ap_tp_active_now) and (not ap_side_tp_active_now_loop) and (not ap_target_strafe_enabled) and (not pred_screen_check or not pred_screen_check.visible) then
return
end

if (ap_tp_active_now or ap_side_tp_active_now_loop) then
ap_smoothed_pred = {
X = pred.X,
Y = pred.Y,
Z = pred.Z
}
ap_last_aim_addr = best.address
elseif ap_last_aim_addr ~= best.address then
ap_smoothed_pred = {
X = pred.X,
Y = pred.Y,
Z = pred.Z
}
ap_last_aim_addr = best.address
elseif ap_smoothed_pred then
-- Instant aim: no camera/prediction smoothing, snap to predicted point each frame.
ap_smoothed_pred.X = pred.X
ap_smoothed_pred.Y = pred.Y
ap_smoothed_pred.Z = pred.Z
else
ap_smoothed_pred = {
X = pred.X,
Y = pred.Y,
Z = pred.Z
}
end
local target_mat = aim.look_at_matrix(cam_pos, ap_smoothed_pred)
if not target_mat then return end
if ap_tp_active_now or ap_side_tp_active_now_loop then
for i = 1, (ap_side_tp_lock_writes or 40) do
aim.set_camera_rotation(target_mat)
end
if aim.write_mouse and best.head_pos then
local tp_hs = aim.world_to_screen(best.head_pos)
if tp_hs and tp_hs.visible then
aim.write_mouse(tp_hs, ap_side_tp_mouse_writes or 32)
if aim.prime_mouse then aim.prime_mouse(tp_hs) end
end
end
else
aim.set_camera_rotation(target_mat)
end
local reticle_pos = {
X = best.head_pos.X,
Y = best.head_pos.Y + 1.05,
Z = best.head_pos.Z
}
local hs = aim.world_to_screen(reticle_pos)
if hs and hs.visible then
draw_head_reticle(hs.X, hs.Y, 1.0, 0.25, 0.15, 1.0)
end
end)
notify("Fallen: Armor + ESP + API Aim loaded", "success")
pcall(function()
UIManager.SetColorPickerValue("armoriso_border_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("armoriso_glow_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("theme_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("theme_accent", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("menu_highlight_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("menu_accent_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetSliderIntValue("menu_highlight_intensity", 100)
UIManager.SetSliderIntValue("theme_highlight_intensity", 100)
end)
function __ec16_install()
__EC16 = {
phase = "loader",
loadStart = 0,
introStart = 0,
lastClick = false,
rshiftDown = false,
menuBindWaiting = false,
menuBindKey = 0xA1,
nativeColorWindowMade = false,
colorPopup = false,
colorPopupTarget = "armor_border",
colorPopupX = 0,
colorPopupY = 0,
colorPopupOpenedAt = 0,
open = true,
wantOpen = true,
animDir = 1,
anim = 1,
paletteOpen = false,
paletteTarget = "armor",
x = 95,
y = 70,
w = 960,
h = 640,
tab = "Armor",
dragging = false,
dragX = 0,
dragY = 0,
armorColor = {__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1},
armorBorderColor = {__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1},
armorGlowColor = {__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1},
fovColor = {__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1},
armorBorderHue = 0.90,
armorGlowHue = 0.90,
fovHue = 0.13,
rainbowFov = false,
rainbowFovSpeed = 2,
armorEspPlayers = false,
armorEspPlayerIcon = true,
armorEspSize = 18,
armorEspMaxDist = 1200,
armorEspSmooth = 18,
armorEspCacheRate = 0.001,
armorEspPlayerCacheAt = 0,
armorEspPlayerCache = {},
armorEspScreenSmooth = {},
aimKey = 0x02,
hudLogo = nil,
hudX = 18,
hudY = 14,
hudDragging = false,
hudDragX = 0,
hudDragY = 0,
keybindsX = 18,
keybindsY = 62,
keybindsDragging = false,
keybindsDragX = 0,
keybindsDragY = 0,
moderatorPanel = false,
moderatorPanelX = 18,
moderatorPanelY = 122,
moderatorDragging = false,
moderatorDragX = 0,
moderatorDragY = 0,
hitboxYOffset = 0
}
__EC16_WORLD = {
{id="stone_node", title="Stone Node"}, {id="metal_node", title="Metal Node"}, {id="phosphate_node", title="Phosphate Node"},
{id="corn_plant", title="Corn Plant"}, {id="tomato_plant", title="Tomato Plant"}, {id="lemon_plant", title="Lemon Plant"},
{id="raspberry_plant", title="Raspberry Plant"}, {id="blueberry_plant", title="Blueberry Plant"}, {id="wool_plant", title="Wool Plant"},
{id="pumpkin_plant", title="Pumpkin Plant"}, {id="deer", title="Deer"}, {id="boar", title="Wild Boar"}, {id="wolf", title="Wolf"},
{id="dropped_item", title="Dropped Items"}
}
__EC16_LOOT = {
{id="wooden_crate", title="Wooden Crate"}, {id="metal_crate", title="Metal Crate"}, {id="steel_crate", title="Steel Crate"},
{id="food_crate", title="Food Crate"}, {id="timed_crate", title="Timed Crate"}, {id="care_package", title="Care Package"},
{id="trash_can", title="Trash Can"}, {id="oil_barrel", title="Oil Barrel"}, {id="body_bag", title="Body Bag"}, {id="sleeper", title="Sleeper"},
{id="wooden_boat", title="Wooden Boat"}, {id="military_boat", title="Military Boat"}, {id="flycopter", title="Salvaged Flycopter"}
}
__EC16_BASE = {
{id="base_cabinet", title="Base Cabinet"}, {id="storage_cabinet", title="Storage Cabinet"}, {id="small_box", title="Small Storage Box"},
{id="large_box", title="Large Storage Box"}, {id="wooden_door", title="Wooden Door"}, {id="wooden_double_door", title="Wooden Double Door"},
{id="salvaged_door", title="Salvaged Metal Door"}, {id="metal_door", title="Metal Door"}, {id="metal_double_door", title="Metal Double Door"},
{id="steel_door", title="Steel Door"}, {id="steel_double_door", title="Steel Double Door"}, {id="trap_door", title="Trap Door"},
{id="garage_door", title="Garage Door"}, {id="sleeping_bag", title="Sleeping Bag"}, {id="shotgun_turret", title="Shotgun Turret"},
{id="auto_turret", title="Auto Turret"}, {id="small_battery", title="Small Battery"}, {id="medium_battery", title="Medium Battery"},
{id="large_battery", title="Large Battery"}, {id="solar_panel", title="Solar Panel"}, {id="windmill", title="Windmill"}
}
__EC16_MOD_ORDER = {81993536,3122439095,1127954045,1004214871,991290934,399754916,1478885961,372791101,2732967856,1193091081,1528346843,1058831985,3034930770}
__EC16_MOD_IDS = {}
for _, __uid in ipairs(__EC16_MOD_ORDER) do __EC16_MOD_IDS[__uid] = true end
function __ec16_c(v,a,b) if v<a then return a end if v>b then return b end return v end
function __ec16_sm(t) t=__ec16_c(t,0,1) return t*t*(3-2*t) end
function __ec16_mouse()
local m = Windows and Windows.GetMousePos and Windows.GetMousePos()
if m then
return m.X or 0, m.Y or 0
end
return 0,0
end
function __ec16_click()
if Windows and Windows.IsKeyPressed and Windows.IsKeyPressed(0x01) then return true end
return aim and aim.is_firing and aim.is_firing()
end
function __ec16_in(mx,my,x1,y1,x2,y2)
if x2 < x1 then local t=x1; x1=x2; x2=t end
if y2 < y1 then local t=y1; y1=y2; y2=t end
return mx >= x1 and mx <= x2 and my >= y1 and my <= y2
end
function __ec16_rect(x1,y1,x2,y2,r,g,b,a) Drawing.DrawBoxFilled(x1,y1,x2,y2,r,g,b,a) end
function __ec16_out(x1,y1,x2,y2,r,g,b,a,t) Drawing.DrawBox(x1,y1,x2,y2,r,g,b,a,t or 1) end
function __ec16_txt(x,y,t,a) Drawing.DrawTextWithOutline(x,y,t,1,1,1,a or 1,0,0,0,a or 1) end
function __ec16_dim(x,y,t,a) Drawing.DrawTextWithOutline(x,y,t,0.72,0.72,0.76,a or 1,0,0,0,a or 1) end
function __ec16_text_w(t)
t = tostring(t or "")
return #t * 6
end
function __ec16_ltxt(x,y,t,a)
t = tostring(t or "")
Drawing.DrawTextWithOutline(x + __ec16_text_w(t) * 0.5, y, t, 1, 1, 1, a or 1, 0, 0, 0, a or 1)
end
function __ec16_ldim(x,y,t,a)
t = tostring(t or "")
Drawing.DrawTextWithOutline(x + __ec16_text_w(t) * 0.5, y, t, 0.72, 0.72, 0.76, a or 1, 0, 0, 0, a or 1)
end
function __ec16_vk_name(vk)
if vk == 0x01 then return "Mouse1" end
if vk == 0x02 then return "Mouse2" end
if vk == 0x04 then return "Mouse3" end
if vk == 0x05 then return "Mouse4" end
if vk == 0x06 then return "Mouse5" end
if vk == 0x08 then return "Backspace" end
if vk == 0x09 then return "Tab" end
if vk == 0x10 then return "Shift" end
if vk == 0x11 then return "Ctrl" end
if vk == 0x12 then return "Alt" end
if vk == 0x14 then return "Caps" end
if vk == 0x1B then return "Esc" end
if vk == 0x20 then return "Space" end
if vk == 0xA0 then return "Left Shift" end
if vk == 0xA1 then return "Right Shift" end
if vk >= 0x30 and vk <= 0x39 then return string.char(vk) end
if vk >= 0x41 and vk <= 0x5A then return string.char(vk) end
return "VK " .. tostring(vk)
end
function __ec16_poll_menu_bind_key()
local keys = {0x01,0x02,0x04,0x05,0x06,0x08,0x09,0xA0,0xA1,0x10,0x11,0x12,0x14,0x1B,0x20}
for _,vk in ipairs(keys) do
if Windows and Windows.IsKeyPressed and Windows.IsKeyPressed(vk) then return vk end
end
for vk=0x30,0x5A do
if Windows and Windows.IsKeyPressed and Windows.IsKeyPressed(vk) then return vk end
end
return nil
end
function __ec16_menu_bind_button(mx,my,cl,x,y)
local text = __EC16.menuBindWaiting and "Menu Key: ..." or ("Menu Key: " .. __ec16_vk_name(__EC16.menuBindKey or 0xA1))
local bw, bh = 190, 28
local h = __ec16_in(mx,my,x,y,x+bw,y+bh)
__ec16_rect(x,y,x+bw,y+bh,h and 0.105 or 0.075,h and 0.105 or 0.075,h and 0.115 or 0.085,0.96)
__ec16_out(x,y,x+bw,y+bh,h and 1 or 0.18,h and 0 or 0.18,h and 0.55 or 0.20,0.85,1)
__ec16_txt(x+bw/2,y+7,text,0.78)
if h and cl and not __EC16.lastClick then
__EC16.menuBindWaiting = true
notify("Press menu bind key...", "success")
end
end
function __ec16_name()
local name = "Player"
pcall(function()
local lp = rbx and rbx.local_player and rbx.local_player()
if lp and lp.get_name then local n=lp:get_name(); if n and n~="" then name=n end end
end)
pcall(function()
if name=="Player" and GetLocalPlayer then local lp=GetLocalPlayer(); if lp and lp.Name then name=lp.Name end end
end)
return name
end
function __ec16_make_native_color_window()
return
end
function __ec16_get_native_color(id, fallback)
return UIManager.GetColorPickerValue(id) or fallback
end
function __ec16_apply_colors()
if not __EC16.armorBorderColor then __EC16.armorBorderColor = __ec16_hsv_to_rgb(__EC16.armorBorderHue or 0.90) end
if not __EC16.armorGlowColor then __EC16.armorGlowColor = __ec16_hsv_to_rgb(__EC16.armorGlowHue or 0.90) end
if not __EC16.fovColor then __EC16.fovColor = {__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1} end
UIManager.SetColorPickerValue("armoriso_border_color", __EC16.armorBorderColor[1], __EC16.armorBorderColor[2], __EC16.armorBorderColor[3], 1)
UIManager.SetColorPickerValue("armoriso_glow_color", __EC16.armorGlowColor[1], __EC16.armorGlowColor[2], __EC16.armorGlowColor[3], 1)
UIManager.SetColorPickerValue("ap_fov_color_main", __EC16.fovColor[1], __EC16.fovColor[2], __EC16.fovColor[3], 1)
UIManager.SetColorPickerValue("theme_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("theme_accent", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("menu_highlight_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("menu_accent_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("esp_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("esp_box_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("esp_name_color", __EC_PINK_SOFT_R, __EC_PINK_SOFT_G, __EC_PINK_SOFT_B, 1)
end
function __ec16_apply_full_pink_theme()
pcall(function()
UIManager.SetColorPickerValue("armoriso_border_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("armoriso_glow_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("theme_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("theme_accent", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("menu_highlight_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("menu_accent_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_stone_node_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_stone_node_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_node_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_node_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_phosphate_node_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_phosphate_node_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_corn_plant_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_corn_plant_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_tomato_plant_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_tomato_plant_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_lemon_plant_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_lemon_plant_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_raspberry_plant_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_raspberry_plant_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_blueberry_plant_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_blueberry_plant_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wool_plant_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wool_plant_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_pumpkin_plant_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_pumpkin_plant_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_deer_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_deer_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_boar_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_boar_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wolf_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wolf_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_dropped_item_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_dropped_item_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_crate_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_crate_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_crate_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_crate_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_steel_crate_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_steel_crate_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_food_crate_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_food_crate_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_timed_crate_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_timed_crate_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_care_package_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_care_package_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_trash_can_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_trash_can_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_oil_barrel_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_oil_barrel_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_body_bag_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_body_bag_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_sleeper_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_sleeper_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_boat_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_boat_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_military_boat_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_military_boat_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_flycopter_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_flycopter_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_base_cabinet_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_base_cabinet_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_storage_cabinet_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_storage_cabinet_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_small_box_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_small_box_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_large_box_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_large_box_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_double_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_wooden_double_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_salvaged_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_salvaged_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_double_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_metal_double_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_steel_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_steel_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_steel_double_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_steel_double_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_trap_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_trap_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_triangle_trap_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_triangle_trap_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_garage_door_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_garage_door_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_sleeping_bag_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_sleeping_bag_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_shotgun_turret_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_shotgun_turret_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_auto_turret_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_auto_turret_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_small_battery_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_small_battery_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_medium_battery_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_medium_battery_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_large_battery_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_large_battery_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_solar_panel_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_solar_panel_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_windmill_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
UIManager.SetColorPickerValue("k1_windmill_text_color", __EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1)
if cheat then
cheat.theme_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.accent_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.box_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.name_color = {__EC_PINK_SOFT_R, __EC_PINK_SOFT_G, __EC_PINK_SOFT_B, 1}
cheat.tracer_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.skeleton_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
if cheat.esp then
cheat.esp.color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp.box_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp.name_color = {__EC_PINK_SOFT_R, __EC_PINK_SOFT_G, __EC_PINK_SOFT_B, 1}
cheat.esp.tracer_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp.skeleton_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp.chams_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp.highlight_color = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
end
if cheat.esp_colors then
cheat.esp_colors.box = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp_colors.name = {__EC_PINK_SOFT_R, __EC_PINK_SOFT_G, __EC_PINK_SOFT_B, 1}
cheat.esp_colors.distance = {__EC_PINK_SOFT_R, __EC_PINK_SOFT_G, __EC_PINK_SOFT_B, 1}
cheat.esp_colors.tracers = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp_colors.skeleton = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp_colors.aim_line = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.esp_colors.fov = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
end
if cheat.colors then
cheat.colors.accent = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.colors.theme = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.colors.esp = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.colors.box = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
cheat.colors.fov = {__EC_PINK_R, __EC_PINK_G, __EC_PINK_B, 1}
end
end
end)
end
function __ec16_bg(w,h,a)
__ec16_rect(0,0,w,h,0.003,0.003,0.006,0.68*a)
__ec16_rect(0,0,w,h,0.050,0.000,0.045,0.08*a)
end
function __ec16_loader(mx,my,cl,w,h,cx,cy)
__ec16_bg(w,h,1)
local function rr(a,b,c,d,r,g,bb,aa,rad)
__ec16_rect(a,b,c,d,r,g,bb,aa)
end
local function neon_frame(a,b,c,d,rad)
rr(a-1,b-1,c+1,d+1,1.00,0.00,0.58,0.032,rad+1)
rr(a,b,c,d,0.090,0.075,0.165,0.98,rad)
rr(a+1,b+1,c-1,d-1,0.020,0.020,0.030,0.98,rad-1)
end
local ww = math.min(w*0.34, 560)
local wh = math.min(h*0.31, 300)
local x1 = cx-ww*0.5
local y1 = cy-wh*0.5
local x2 = cx+ww*0.5
local y2 = cy+wh*0.5
neon_frame(x1,y1,x2,y2,14)
rr(x1+8,y1+8,x2-8,y1+40,0.070,0.055,0.145,1,10)
__ec16_rect(x1+10,y1+38,x2-10,y1+40,1.00,0.00,0.58,0.70)
__ec16_txt(x1+58,y1+13,"FALLEN",0.96)
__ec16_dim(x2-92,y1+14,__ec16_name(),0.76)
local pad = 22
local leftX1 = x1 + pad
local leftY1 = y1 + 56
local leftX2 = x1 + ww*0.52
local leftY2 = y2 - 56
rr(leftX1,leftY1,leftX2,leftY2,0.045,0.045,0.060,0.95,10)
rr(leftX1+1,leftY1+1,leftX2-1,leftY2-1,0.012,0.012,0.018,0.95,9)
local targetGameId = 3747388906
local currentGameId = 0
pcall(function()
if game_id then currentGameId = tonumber(game_id()) or 0 end
end)
local gameMatch = currentGameId == targetGameId
local itemY = leftY1 + 24
local itemH = 76
local itemHov = __ec16_in(mx,my,leftX1+10,itemY,leftX2-10,itemY+itemH)
if itemHov and cl and not __EC16.lastClick then
__EC16.loaderSelectedGame = targetGameId
end
__EC16.loaderSelectedGame = __EC16.loaderSelectedGame or targetGameId
rr(leftX1+10,itemY,leftX2-10,itemY+itemH, itemHov and 0.040 or 0.032, itemHov and 0.036 or 0.032, itemHov and 0.052 or 0.044,1,8)
rr(leftX1+11,itemY+1,leftX2-11,itemY+itemH-1,0.012,0.012,0.018,0.92,7)
__ec16_rect(leftX1+18,itemY+13,leftX1+22,itemY+52,1,0,0.58,1)
__ec16_txt(leftX1+82,itemY+10,"Eclipze.Lua",0.92)
__ec16_dim(leftX1+91,itemY+29,"Game ID: 3747388906",0.76)
if gameMatch then
Drawing.DrawTextWithOutline(leftX1+76,itemY+49,"Status: Ready",0.72,1,0.48,0.96,0,0,0,0.9)
else
Drawing.DrawTextWithOutline(leftX1+82,itemY+49,"Status: Unready",1.00,0.34,0.50,0.96,0,0,0,0.90)
end
local rightX1 = x1 + ww*0.56
local rightY1 = leftY1
local rightX2 = x2 - pad
local rightY2 = y2 - 84
rr(rightX1,rightY1,rightX2,rightY2,0.045,0.045,0.060,0.95,10)
rr(rightX1+1,rightY1+1,rightX2-1,rightY2-1,0.012,0.012,0.018,0.95,9)
__ec16_txt(rightX1+62,rightY1+16,"Changelog",0.92)
__ec16_dim(rightX1+76,rightY1+44,"- polished rounded neon UI",0.60)
__ec16_dim(rightX1+76,rightY1+64,"- cleaner menu borders",0.60)
__ec16_dim(rightX1+76,rightY1+84,"- improved loader visuals",0.60)
local btnH = 34
local btnGap = 14
local btnW = (x2 - rightX1 - pad - btnGap) / 2
local exitX1 = rightX1
local exitY1 = y2 - 50
local exitX2 = exitX1 + btnW
local exitY2 = exitY1 + btnH
local loadX1 = exitX2 + btnGap
local loadY1 = exitY1
local loadX2 = loadX1 + btnW
local loadY2 = exitY2
local exitH = __ec16_in(mx,my,exitX1,exitY1,exitX2,exitY2)
local loadH = __ec16_in(mx,my,loadX1,loadY1,loadX2,loadY2)
rr(exitX1-1,exitY1-1,exitX2+1,exitY2+1,1.00,0.00,0.58,0.032,9)
rr(exitX1,exitY1,exitX2,exitY2,0.080,0.080,0.095,exitH and 1 or 0.88,8)
rr(exitX1+1,exitY1+1,exitX2-1,exitY2-1,0.020,0.020,0.028,0.96,7)
__ec16_txt((exitX1+exitX2)/2,exitY1+10,"Exit",0.78)
rr(loadX1-1,loadY1-1,loadX2+1,loadY2+1,1.00,0.00,0.58,0.032,9)
rr(loadX1,loadY1,loadX2,loadY2,0.120,0.070,0.180,0.98,8)
rr(loadX1+1,loadY1+1,loadX2-1,loadY2-1,0.030,0.020,0.040,0.98,7)
__ec16_txt((loadX1+loadX2)/2,loadY1+10,"Load",0.94)
if cl and not __EC16.lastClick then
if loadH then
if gameMatch then
__EC16.phase="loading"; __EC16.loadStart=tick()
else
notify("Wrong game ID: " .. tostring(currentGameId) .. " / need 3747388906", "warning")
end
end
if exitH then __EC16.phase="hidden" end
end
end
function __ec16_loading(w,h,cx,cy)
__ec16_bg(w,h,1)
local now=tick()
for i=1,16 do
local ang=now*6.0+i*(math.pi*2/16)
Drawing.DrawCircleFilled(cx+math.cos(ang)*38,cy+math.sin(ang)*38,4.5,1,0,0.58,i/16)
end
__ec16_txt(cx,cy+66,"loading",0.72)
if now-__EC16.loadStart > 1.3 then
__EC16.phase="intro"; __EC16.introStart=tick()
end
end
function __ec16_font(ch)
local f = {
E={"11111","10000","10000","11110","10000","10000","11111"},
C={"01111","10000","10000","10000","10000","10000","01111"},
L={"10000","10000","10000","10000","10000","10000","11111"},
I={"111","010","010","010","010","010","111"},
P={"11110","10001","10001","11110","10000","10000","10000"},
Z={"11111","00001","00010","00100","01000","10000","11111"},
U={"10001","10001","10001","10001","10001","10001","01110"},
A={"01110","10001","10001","11111","10001","10001","10001"},
DOT={"0","0","0","0","0","0","1"}
}
if ch=="." then return f.DOT end
return f[ch]
end
function __ec16_text_width(text,cell,gap,letterGap)
local total=0
for i=1,#text do
local glyph=__ec16_font(string.sub(text,i,i))
if glyph then total=total+#glyph[1]*(cell+gap)+letterGap end
end
return math.max(0,total-letterGap)
end
function __ec16_draw_text(text,x,y,cell,alpha,reveal,off,total)
local gap=math.max(1,cell*0.05); local lg=cell*0.32
local tw=__ec16_text_width(text,cell,gap,lg); local rx=x+tw*reveal
off=off or 0; total=total or tw
for i=1,#text do
local glyph=__ec16_font(string.sub(text,i,i))
if glyph then
local gw=#glyph[1]*(cell+gap)
for row=1,#glyph do
local line=glyph[row]
for col=1,#line do
if string.sub(line,col,col)=="1" then
local px=x+(col-1)*(cell+gap); local py=y+(row-1)*(cell+gap)
if px<=rx then
local gt=__ec16_c((off+(px-x))/math.max(total,1),0,1)
local b=0.45+0.35*gt
__ec16_rect(px-5,py-5,px+cell+5,py+cell+5,1,0,b,0.07*alpha)
__ec16_rect(px-2,py-2,px+cell+2,py+cell+2,1,0,b,0.13*alpha)
__ec16_rect(px,py,px+cell,py+cell*0.34,1.00,0.34,0.74,alpha)
__ec16_rect(px,py+cell*0.34,px+cell,py+cell*0.72,0.95,0.00,0.48,alpha)
__ec16_rect(px,py+cell*0.72,px+cell,py+cell,0.58,0.00,0.20,alpha)
end
end
end
end
x=x+gw+lg
end
end
end
function __ec16_intro(w,h,cx,cy)
local t=tick()-__EC16.introStart
local a=__ec16_sm(t/0.22)
if t>4.70 then a=a*(1-__ec16_sm((t-4.70)/0.62)) end
__ec16_bg(w,h,a)
local cell=math.max(9,math.min(w/86,h/47))
local gap=math.max(1,cell*0.05); local lg=cell*0.32
local fullW=__ec16_text_width("FALLEN",cell,gap,lg); local eW=__ec16_text_width("E",cell,gap,lg)
local wordX=cx-fullW*0.5; local mainH=7*(cell+gap); local wordY=cy-mainH*0.57
local lineIn=__ec16_sm((t-0.14)/0.48); local topY=wordY-mainH*0.18; local botY=wordY+mainH+mainH*0.15
local lineW=(fullW+cell*5.8)*lineIn; local lh=math.max(5,h*0.0065)
__ec16_rect(cx-lineW/2,topY,cx+lineW/2,topY+lh,1,0,0.58,0.98*a)
__ec16_rect(cx-lineW/2,botY,cx+lineW/2,botY+lh,1,0,0.58,0.98*a)
__ec16_rect(cx-lineW/2,topY-8,cx+lineW/2,topY+lh+8,1,0,0.58,0.10*a)
__ec16_rect(cx-lineW/2,botY-8,cx+lineW/2,botY+lh+8,1,0,0.58,0.10*a)
local eFade=__ec16_sm((t-0.36)/0.68)
local eMove=__ec16_sm((t-0.78)/0.36)
local rest=__ec16_sm((t-1.28)/0.78)
local lua=__ec16_sm((t-2.05)/0.42)
local eX=(cx-eW*0.5)+(wordX-(cx-eW*0.5))*eMove
__ec16_draw_text("E",eX,wordY,cell,a*eFade,1,0,fullW)
if rest>0.01 then __ec16_draw_text("CLIPZE",wordX+eW+lg,wordY,cell,a,rest,eW+lg,fullW) end
local lc=cell*0.42; local lcg=math.max(1,lc*0.05); local lclg=lc*0.32; local lw=__ec16_text_width(".LUA",lc,lcg,lclg)
__ec16_draw_text(".LUA",cx-lw*0.5,botY+h*0.030,lc,a*lua,lua,0,lw)
if t>5.15 then __EC16.phase="menu"; __EC16_MENU_ALLOWED=true; __EC16.open=true; __EC16.wantOpen=true; __EC16.animDir=1; __EC16.anim=0 end
end
function __ec16_nav(mx,my,cl,x1,y1,x2,y2,label,active)
local h=__ec16_in(mx,my,x1,y1,x2,y2)
__ec16_rect(x1,y1,x2,y2,h and 0.105 or 0.075,h and 0.105 or 0.075,h and 0.115 or 0.085,0.96)
if active then __ec16_rect(x1,y1,x1+4,y2,__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1); __ec16_out(x1,y1,x2,y2,__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,0.72,1)
else __ec16_out(x1,y1,x2,y2,0.18,0.18,0.20,0.78,1) end
__ec16_txt((x1+x2)/2,y1+13,label,active and 1 or 0.74)
return h and cl and not __EC16.lastClick
end
function __ec16_check(mx,my,cl,x,y,label,id)
local v=UIManager.GetCheckboxValue(id); local size=17
local labelW = __ec16_text_w(label)
local h=__ec16_in(mx,my,x,y,x+32+labelW,y+23)
__ec16_rect(x,y,x+size,y+size,0.055,0.055,0.065,1)
__ec16_out(x,y,x+size,y+size,h and 1 or 0.24,h and 0 or 0.24,h and 0.55 or 0.27,1,1)
if v then __ec16_rect(x+4,y+4,x+size-4,y+size-4,__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1) end
__ec16_ldim(x+28,y+1,label,h and 0.95 or 0.76)
if h and cl and not __EC16.lastClick then UIManager.SetCheckboxValue(id,not v) end
end
function __ec16_bool_check(mx,my,cl,x,y,label,value)
local size=17
local labelW = __ec16_text_w(label)
local h=__ec16_in(mx,my,x,y,x+32+labelW,y+23)
__ec16_rect(x,y,x+size,y+size,0.055,0.055,0.065,1)
__ec16_out(x,y,x+size,y+size,h and 1 or 0.24,h and 0 or 0.24,h and 0.55 or 0.27,1,1)
if value then __ec16_rect(x+4,y+4,x+size-4,y+size-4,__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1) end
__ec16_ldim(x+28,y+1,label,h and 0.95 or 0.76)
if h and cl and not __EC16.lastClick then return not value end
return value
end
function __ec16_float_slider(mx,my,cl,x,y,w,label,value,minv,maxv)
local h=__ec16_in(mx,my,x,y+24,x+w,y+40)
local pct=__ec16_c((value-minv)/(maxv-minv),0,1)
__ec16_ldim(x,y,label..": "..tostring(math.floor(value*10)/10),0.80)
__ec16_rect(x,y+31,x+w,y+37,0.050,0.050,0.058,1)
__ec16_rect(x,y+31,x+w*pct,y+37,__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1)
__ec16_out(x,y+29,x+w,y+39,0.18,0.18,0.20,0.80,1)
if h and cl then return minv+(maxv-minv)*__ec16_c((mx-x)/w,0,1) end
return value
end
function __ec16_slider(mx,my,cl,x,y,w,label,id,minv,maxv)
local val=UIManager.GetSliderIntValue(id) or minv
local h=__ec16_in(mx,my,x,y+24,x+w,y+40)
local pct=__ec16_c((val-minv)/(maxv-minv),0,1)
__ec16_ldim(x,y,label..": "..tostring(math.floor(val)),0.80)
__ec16_rect(x,y+31,x+w,y+37,0.050,0.050,0.058,1)
__ec16_rect(x,y+31,x+w*pct,y+37,__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,1)
__ec16_out(x,y+29,x+w,y+39,0.18,0.18,0.20,0.80,1)
if h and cl then UIManager.SetSliderIntValue(id,math.floor(minv+(maxv-minv)*__ec16_c((mx-x)/w,0,1))) end
end
function __ec16_color(mx,my,cl,x,y,label,which)
local target = which=="armor" and "armor_border" or "fov"
__ec16_rainbow_slider(mx,my,cl,x,y,310,label,target)
end
function __ec16_keybind(mx,my,cl,x,y,label)
local currentText = "Aimbot Key: Unknown"
pcall(function()
if ap_bind_waiting then
currentText = "Aimbot Key: ..."
else
currentText = "Aimbot Key: " .. ap_vk_name(ap_aim_vk)
end
end)
local bw = 176
local h = __ec16_in(mx,my,x,y+24,x+bw,y+54)
__ec16_ldim(x,y,label,0.84)
__ec16_rect(x,y+25,x+bw,y+51,h and 0.105 or 0.080,h and 0.105 or 0.080,h and 0.115 or 0.090,0.96)
__ec16_out(x,y+25,x+bw,y+51,h and 1 or 0.20,h and 0 or 0.20,h and 0.55 or 0.22,0.95,1)
__ec16_txt(x+bw/2,y+31,currentText,0.82)
if h and cl and not __EC16.lastClick then
local cb = nil
pcall(function()
cb = __EC16_UI.buttons["ap_aim_bind_vk_" .. tostring(ap_aim_vk)]
end)
cb = cb or __EC16_UI.buttons["ap_aim_bind_vk_6"] or __EC16_UI.buttons["ap_aim_bind_wait"]
if cb then
pcall(cb)
else
notify("Aimbot bind callback not found", "warning")
end
end
end

function __ec16_tp_keybind(mx,my,cl,x,y,label,side)
local key = 0
local prefix = "TP Key"
pcall(function()
if side == "left" then key = ap_left_tp_vk or 0; prefix = "Left TP Key" end
if side == "right" then key = ap_right_tp_vk or 0; prefix = "Right TP Key" end
if side == "90_left" then key = ap_90_left_tp_vk or 0; prefix = "90 Left TP Key" end
if side == "90_right" then key = ap_90_right_tp_vk or 0; prefix = "90 Right TP Key" end
if side == "copter_sit" then key = ap_copter_sit_vk or 0; prefix = "c-sit" end
end)
local currentText = prefix .. ": " .. ap_tp_vk_name(key)
pcall(function()
if ap_tp_bind_waiting == side then currentText = prefix .. ": ..." end
end)
local compact = (side == "copter_sit" and (label == nil or label == ""))
local bw = compact and 104 or 176
local top = compact and 18 or 25
local bottom = compact and 40 or 51
local textY = compact and 23 or 31
local hitTop = compact and 17 or 24
local hitBottom = compact and 42 or 54
local h = __ec16_in(mx,my,x,y+hitTop,x+bw,y+hitBottom)
if label and label ~= "" then __ec16_ldim(x,y,label,0.84) end
__ec16_rect(x,y+top,x+bw,y+bottom,h and 0.105 or 0.080,h and 0.105 or 0.080,h and 0.115 or 0.090,0.96)
__ec16_out(x,y+top,x+bw,y+bottom,h and 1 or 0.20,h and 0 or 0.20,h and 0.55 or 0.22,0.95,1)
__ec16_txt(x+bw/2,y+textY,currentText,0.82)
if h and cl and not __EC16.lastClick then ap_begin_tp_bind_capture(side) end
end

function __ec16_noclip_keybind(mx,my,cl,x,y,label)
local currentText = "Noclip Key: " .. ec_noclip_key_name()
pcall(function()
if ec_noclip_bind_waiting then currentText = "Noclip Key: ..." end
end)
local bw = 176
local h = __ec16_in(mx,my,x,y+24,x+bw,y+54)
__ec16_ldim(x,y,label,0.84)
__ec16_rect(x,y+25,x+bw,y+51,h and 0.105 or 0.080,h and 0.105 or 0.080,h and 0.115 or 0.090,0.96)
__ec16_out(x,y+25,x+bw,y+51,h and 1 or 0.20,h and 0 or 0.20,h and 0.55 or 0.22,0.95,1)
__ec16_txt(x+bw/2,y+31,currentText,0.82)
if h and cl and not __EC16.lastClick then ec_noclip_begin_bind_capture() end
end

function __ec16_hsv_to_rgb(h)
h = h % 1
local i = math.floor(h * 6)
local f = h * 6 - i
local q = 1 - f
local r,g,b = 1,0,0
i = i % 6
if i == 0 then r,g,b = 1,f,0 end
if i == 1 then r,g,b = q,1,0 end
if i == 2 then r,g,b = 0,1,f end
if i == 3 then r,g,b = 0,q,1 end
if i == 4 then r,g,b = f,0,1 end
if i == 5 then r,g,b = 1,0,q end
return {r,g,b,1}
end
function __ec16_rainbow_slider(mx,my,cl,x,y,w,label,target)
local hue = 0
if target == "armor_border" then hue = __EC16.armorBorderHue or 0.90 end
if target == "armor_glow" then hue = __EC16.armorGlowHue or 0.90 end
if target == "fov" then hue = __EC16.fovHue or 0.13 end
if target == "tracer" then hue = __EC16.tracerHue or 0.58 end
if target == "hitfx" then hue = __EC16.hitFxHue or 0.58 end
if target == "footfx" then hue = __EC16.footFxHue or 0.83 end
if target == "aura_top" then hue = __EC16.selfAuraTopHue or 0.55 end
if target == "aura_bottom" then hue = __EC16.selfAuraBottomHue or 0.92 end
if target == "tracer" then hue = __EC16.tracerHue or 0.58 end
if target == "hitfx" then hue = __EC16.hitFxHue or 0.58 end
local c = __ec16_hsv_to_rgb(hue)
__ec16_ldim(x,y,label,0.84)
__ec16_rect(x,y+25,x+34,y+51,c[1],c[2],c[3],1)
__ec16_out(x,y+25,x+34,y+51,1,1,1,0.35,1)
local sx = x + 48
local sy = y + 33
local sw = math.min(w - 48, 230)
local sh = 8
local parts = 48
for i=0,parts-1 do
local h1 = i / parts
local cc = __ec16_hsv_to_rgb(h1)
local x1 = sx + sw * (i / parts)
local x2 = sx + sw * ((i+1) / parts)
__ec16_rect(x1,sy,x2,sy+sh,cc[1],cc[2],cc[3],1)
end
__ec16_out(sx,sy-2,sx+sw,sy+sh+2,0.18,0.18,0.20,0.90,1)
local knobX = sx + sw * hue
__ec16_rect(knobX-3,sy-6,knobX+3,sy+sh+6,1,1,1,1)
__ec16_out(knobX-5,sy-8,knobX+5,sy+sh+8,0,0,0,0.8,1)
if __ec16_in(mx,my,sx,sy-12,sx+sw,sy+sh+8) and cl then
hue = __ec16_c((mx - sx) / sw, 0, 1)
local nc = __ec16_hsv_to_rgb(hue)
if target == "armor_border" then
__EC16.armorBorderHue = hue
__EC16.armorBorderColor = nc
elseif target == "armor_glow" then
__EC16.armorGlowHue = hue
__EC16.armorGlowColor = nc
elseif target == "tracer" then
__EC16.tracerHue = hue
__EC16.tracerColor = nc
elseif target == "hitfx" then
__EC16.hitFxHue = hue
__EC16.hitFxColor = nc
elseif target == "aura_top" then
__EC16.selfAuraTopHue = hue
__EC16.selfAuraTopColor = nc
elseif target == "aura_bottom" then
__EC16.selfAuraBottomHue = hue
__EC16.selfAuraBottomColor = nc
else
__EC16.fovHue = hue
__EC16.fovColor = nc
end
__ec16_apply_colors()
end
__ec16_apply_colors()
end
function __ec16_button(mx,my,cl,x1,y1,x2,y2,label,id)
local h=__ec16_in(mx,my,x1,y1,x2,y2)
__ec16_rect(x1,y1,x2,y2,h and 0.105 or 0.080,h and 0.105 or 0.080,h and 0.115 or 0.090,0.96)
__ec16_out(x1,y1,x2,y2,h and 1 or 0.20,h and 0 or 0.20,h and 0.55 or 0.22,0.95,1)
__ec16_txt((x1+x2)/2,y1+12,label,0.90)
if h and cl and not __EC16.lastClick and __EC16_UI.buttons[id] then pcall(__EC16_UI.buttons[id]) end
end
function __ec16_list(mx,my,cl,x,y,items,prefix,perCol,dy)
for i,it in ipairs(items) do
local col=math.floor((i-1)/perCol); local row=(i-1)%perCol
local bx = x+col*330
local by = y+row*dy
__ec16_check(mx,my,cl,bx,by,it.title,prefix..it.id)
if it.id == "dropped_item" then
__ec16_check(mx,my,cl,bx+170,by,"Show Icons","k1_dropped_item_show_icon")
elseif it.id == "stone_node" then
__ec16_check(mx,my,cl,bx+170,by,"Ore Icons","k1_ore_show_icon")
elseif it.id == "flycopter" then
__ec16_check(mx,my,cl,bx+170,by,"copter-sit","k1_flycopter_sit")
__ec16_tp_keybind(mx,my,cl,bx+258,by-18,"","copter_sit")
end
end
end
function __ec16_title(x,y,label) __ec16_txt(x+4,y,label,0.96); __ec16_rect(x,y+25,x+280,y+27,__EC_PINK_R,__EC_PINK_G,__EC_PINK_B,0.95) end
function __ec16_update_rainbow_fov()
if not __EC16.rainbowFov then return end
local spd = (__EC16.rainbowFovSpeed or 2)
local hue = (tick() * spd * 0.12) % 1
__EC16.fovHue = hue
__EC16.fovColor = __ec16_hsv_to_rgb(hue)
UIManager.SetColorPickerValue("ap_fov_color_main", __EC16.fovColor[1], __EC16.fovColor[2], __EC16.fovColor[3], 1)
pcall(function()
if cheat and cheat.esp_colors then
cheat.esp_colors.fov = {__EC16.fovColor[1], __EC16.fovColor[2], __EC16.fovColor[3], 1}
cheat.esp_colors.aim_line = {__EC16.fovColor[1], __EC16.fovColor[2], __EC16.fovColor[3], 1}
end
end)
end
function __ec16_world_to_screen(pos)
if not pos then return nil, nil, false end
local ok, sx, sy, on = pcall(function()
if rbx and rbx.world_to_screen then
local r = rbx.world_to_screen(pos)
if r then return r.X or r.x or r[1], r.Y or r.y or r[2], r.visible ~= false end
end
if Drawing and Drawing.WorldToScreen then
local r = Drawing.WorldToScreen(pos)
if r then
local x = r.X or r.x or r[1]
local y = r.Y or r.y or r[2]
return x, y, x ~= nil and y ~= nil and x >= 0 and y >= 0
end
end
if aim and aim.world_to_screen then
local r = aim.world_to_screen(pos)
if r then return r.X or r.x or r[1], r.Y or r.y or r[2], r.visible ~= false end
end
end)
if ok and sx and sy then return sx, sy, on ~= false end
return nil, nil, false
end
function __ec16_get_players()
local list = nil
pcall(function()
if players and players.get_all then list = players.get_all() end
end)
pcall(function()
if (not list or #list == 0) and GetAllPlayers then list = GetAllPlayers() end
end)
pcall(function()
if (not list or #list == 0) and game and game.Players and game.Players.GetPlayers then list = game.Players.GetPlayers() end
end)
return list
end
function __ec16_armor_cache_rate()
return 0.25
end
function __ec16_get_players_cached(rate)
if not __EC16 then return __ec16_get_players() end
local now = tick()
rate = rate or __ec16_armor_cache_rate()
if __EC16.armorEspPlayerCache and (now - (__EC16.armorEspPlayerCacheAt or 0)) < rate then
return __EC16.armorEspPlayerCache
end
local list = __ec16_get_players() or {}
__EC16.armorEspPlayerCache = list
__EC16.armorEspPlayerCacheAt = now
return list
end
function __ec16_player_pos(p)
local pos = nil
pcall(function()
if p and p.head_pos then pos = p.head_pos end
end)
pcall(function()
if not pos and p and p.head_addr and p.head_addr ~= 0 and rbx and rbx.instance then
local h = rbx.instance(p.head_addr)
if h then pos = h:get_position() end
end
end)
pcall(function()
if not pos and p and p.Character and p.Character.Head then pos = p.Character.Head.Position end
end)
pcall(function()
if not pos and p and p.position then pos = p.position end
end)
return pos
end
function __ec16_num(v)
local n = tonumber(v)
return n
end
function __ec16_vec_distance(a, b)
if not a or not b then return nil end
local ax = __ec16_num(a.X or a.x or a[1])
local ay = __ec16_num(a.Y or a.y or a[2])
local az = __ec16_num(a.Z or a.z or a[3])
local bx = __ec16_num(b.X or b.x or b[1])
local by = __ec16_num(b.Y or b.y or b[2])
local bz = __ec16_num(b.Z or b.z or b[3])
if not ax or not ay or not az or not bx or not by or not bz then return nil end
local dx = ax - bx
local dy = ay - by
local dz = az - bz
return math.sqrt(dx * dx + dy * dy + dz * dz)
end
function __ec16_local_player_pos()
local pos = nil
pcall(function()
if players and players.get_local then
local me = players.get_local()
if me then pos = me.position or me.head_pos end
end
end)
pcall(function()
if not pos and GetMyPosition then pos = GetMyPosition() end
end)
pcall(function()
if not pos and rbx and rbx.local_hrp then
local hrp = rbx.local_hrp()
if hrp then pos = hrp:get_position() end
end
end)
return pos
end
function __ec16_addr_alive(addr)
if addr == nil then return true end
if addr == 0 then return false end
local ok = true
pcall(function()
if rbx and rbx.instance then
local inst = rbx.instance(addr)
if not inst then ok = false return end
if inst.is_valid and not inst:is_valid() then ok = false end
end
end)
return ok
end
function __ec16_player_exists_for_armor(p)
if not p then return false end
if p.is_self == true then return false end
if p.player_addr == 0 then return false end
if p.character_addr == 0 then return false end
if p.hrp_addr == 0 then return false end
if p.head_addr == 0 then return false end
if p.humanoid_addr == 0 then return false end
if not __ec16_addr_alive(p.player_addr) then return false end
if not __ec16_addr_alive(p.character_addr) then return false end
if not __ec16_addr_alive(p.hrp_addr) then return false end
if not __ec16_addr_alive(p.head_addr) then return false end
if not __ec16_addr_alive(p.humanoid_addr) then return false end
if not p.head_pos and not p.position and not p.head_addr and p.Character == nil and p.character_addr == nil then
return false
end
return true
end
function __ec16_player_dead_for_armor(p)
if not p then return true end
if p.is_knocked == true then return true end
local hp = nil
local mhp = nil
pcall(function() hp = p.health end)
pcall(function() mhp = p.max_health end)
pcall(function()
if p.Character then
if hp == nil then hp = p.Character.Health end
if mhp == nil then mhp = p.Character.MaxHealth end
end
end)
hp = __ec16_num(hp)
mhp = __ec16_num(mhp)
if hp ~= nil and hp <= 0 then return true end
if mhp ~= nil and mhp <= 0 then return true end
return false
end
function __ec16_player_in_armor_range(p, headPos, maxDist)
maxDist = __ec16_num(maxDist) or 0
if maxDist <= 0 then return true end
local d = __ec16_num(p and p.distance)
if not d then
local my = __ec16_local_player_pos()
d = __ec16_vec_distance(headPos, my)
end
if d and d > maxDist then return false end
return true
end
function __ec16_player_name(p)
local n = "Player"
pcall(function() if p.get_name then n = p:get_name() end end)
pcall(function() if p.Name then n = p.Name end end)
return tostring(n or "Player")
end
function __ec16_player_items(p)
local items = {}
pcall(function()
if p.get_armor then
local a = p:get_armor()
if a then for _,v in pairs(a) do table.insert(items, tostring(v)) end end
end
end)
pcall(function()
if #items == 0 and p.armor then
for _,v in pairs(p.armor) do table.insert(items, tostring(v)) end
end
end)
pcall(function()
if p.get_tool then
local t = p:get_tool()
if t then table.insert(items, tostring(t)) end
end
end)
pcall(function()
if p.tool then table.insert(items, tostring(p.tool)) end
end)
return items
end
function __ec16_get_cached_icon_handle(display_name, is_weapon)
if not __EC16 then __EC16 = {} end
if not __EC16.allIconCache then __EC16.allIconCache = {} end
local key = (is_weapon and "w|" or "i|") .. tostring(display_name or "")
local now = tick()
local rec = __EC16.allIconCache[key]
if rec and rec.handle and Drawing and Drawing.IsImageReady and Drawing.IsImageReady(rec.handle) then
return rec.handle
end
if rec and rec.handle and Drawing and Drawing.IsImageFailed and Drawing.IsImageFailed(rec.handle) then
__EC16.allIconCache[key] = { t = now, fail = true, retry = now + 2.0 }
return nil
end
if rec and rec.retry and now < rec.retry then
return nil
end
if rec and (now - (rec.t or 0)) < 0.50 then
return nil
end
local handle = nil
pcall(function()
if is_weapon and get_weapon_icon then
handle = get_weapon_icon(display_name)
elseif get_icon then
handle = get_icon(display_name)
end
end)
if (not handle) and k1_resolve_icon_handle then
pcall(function()
handle = k1_resolve_icon_handle(display_name, nil)
end)
end
if handle then
__EC16.allIconCache[key] = { t = now, handle = handle, retry = now + 0.50 }
return handle
end
__EC16.allIconCache[key] = { t = now, fail = false, retry = now + 0.75 }
return nil
end
function __ec16_draw_plain_armor_icon(itemName, x, y, icon, alpha)
local is_weapon = false
local display_name = itemName
if type(itemName) == "string" and string.sub(itemName, 1, 10) == "__weapon__" then
is_weapon = true
display_name = string.sub(itemName, 11)
end
local handle = __ec16_get_cached_icon_handle(display_name, is_weapon)
if handle and Drawing.IsImageReady(handle) then
Drawing.DrawImage(handle, x, y, icon, icon, 1, 1, 1, alpha, math.max(2, icon * 0.15))
else
local txt = is_weapon and "W" or short_name(display_name)
Drawing.DrawTextWithOutline(
x + icon * 0.5,
y + icon * 0.5 - 6,
txt,
1, 1, 1, alpha,
0, 0, 0, alpha
)
end
end
function __ec16_get_player_items_cached(p)
if not __EC16 then return {} end
if not __EC16.armorEspItemsCache then __EC16.armorEspItemsCache = {} end
local key = nil
pcall(function() key = p and (p.address or p.player_addr or p.character_addr or p.name) end)
if not key then key = tostring(p) end
local now = tick()
local rec = __EC16.armorEspItemsCache[key]
if rec and (now - (rec.t or 0)) < 0.75 then return rec.items or {} end
local items = {}
pcall(function()
if get_items then items = get_items(p) or {} end
end)
__EC16.armorEspItemsCache[key] = { t = now, items = items or {} }
return items or {}
end

function __ec16_armor_player_key(p)
local key = nil
pcall(function() key = p and (p.address or p.player_addr or p.character_addr or p.hrp_addr or p.head_addr or p.name or p.Name) end)
if key == nil then key = tostring(p) end
return tostring(key)
end
function __ec16_armor_smooth_screen(p, targetX, targetY)
if not __EC16 then return targetX, targetY end
if not __EC16.armorEspScreenSmooth then __EC16.armorEspScreenSmooth = {} end
local key = __ec16_armor_player_key(p)
local now = tick()
local rec = __EC16.armorEspScreenSmooth[key]
local smooth = __ec16_num(__EC16.armorEspSmooth or 18) or 18
if smooth <= 0 or not rec then
__EC16.armorEspScreenSmooth[key] = { x = targetX, y = targetY, t = now, seen = now }
return targetX, targetY
end
local dt = now - (rec.t or now)
if dt < 0 then dt = 0 end
if dt > 0.08 then dt = 0.08 end
local alpha = 1 / (1 + smooth * 0.16)
-- Keep it responsive on high FPS, but stable on low FPS.
alpha = alpha * math.max(1, dt * 60)
if alpha > 1 then alpha = 1 end
if alpha < 0.035 then alpha = 0.035 end
rec.x = (rec.x or targetX) + (targetX - (rec.x or targetX)) * alpha
rec.y = (rec.y or targetY) + (targetY - (rec.y or targetY)) * alpha
rec.t = now
rec.seen = now
return rec.x, rec.y
end
function __ec16_armor_smooth_cleanup()
if not __EC16 or not __EC16.armorEspScreenSmooth then return end
local now = tick()
for k, rec in pairs(__EC16.armorEspScreenSmooth) do
if (now - (rec.seen or 0)) > 3.0 then
__EC16.armorEspScreenSmooth[k] = nil
end
end
end
function __ec16_player_userid(p)
local uid = nil
pcall(function() uid = p and (p.user_id or p.UserId or p.userid or p.userId) end)
if uid then return uid end
pcall(function()
if p and p.player_addr and p.player_addr ~= 0 and rbx and rbx.instance then
local inst = rbx.instance(p.player_addr)
if inst and inst.user_id then uid = inst:user_id() end
end
end)
pcall(function()
if not uid and p and p.name and rbx and rbx.players_service then
local ps = rbx.players_service()
local plr = ps and ps:find_first_child(p.name)
if plr and plr.user_id then uid = plr:user_id() end
end
end)
return uid
end

function __ec16_player_avatar_cache_path(uid)
return "C:\\blueberry\\scripts\\ec16_avatar_player_" .. tostring(uid) .. ".txt"
end

function __ec16_get_player_avatar_handle(p)
if not __EC16 then __EC16 = {} end
if not __EC16.playerAvatarCache then __EC16.playerAvatarCache = {} end
local uid = __ec16_player_userid(p)
if not uid then return nil end
local key = tostring(uid)
local now = tick()
local rec = __EC16.playerAvatarCache[key]
if not rec then
rec = { t = 0, handle = nil, url = nil, fail = false, next = 0 }
__EC16.playerAvatarCache[key] = rec
end
if rec.handle and Drawing and Drawing.IsImageReady and Drawing.IsImageReady(rec.handle) then
return rec.handle
end
if rec.handle and Drawing and Drawing.IsImageFailed and Drawing.IsImageFailed(rec.handle) then
rec.handle = nil
rec.fail = true
rec.next = now + 60
end
if rec.next and now < rec.next then
return rec.handle
end
if rec.url and rec.url ~= "" and Drawing and Drawing.LoadImage then
rec.handle = Drawing.LoadImage(rec.url)
rec.next = now + 5
return rec.handle
end
pcall(function()
local path = __ec16_player_avatar_cache_path(uid)
local cached = nil
if read_file then cached = read_file(path) end
if cached then
cached = tostring(cached)
cached = string.gsub(cached, "^%s+", "")
cached = string.gsub(cached, "%s+$", "")
if string.find(cached, "^https?://") then
rec.url = cached
rec.handle = Drawing.LoadImage(cached)
rec.next = now + 5
end
end
end)
if rec.handle then return rec.handle end
if not (__EC16.nextPlayerAvatarHttpAt) then __EC16.nextPlayerAvatarHttpAt = 0 end
if now < __EC16.nextPlayerAvatarHttpAt then
rec.next = now + 0.25
return nil
end
if not (Http and Http.get and Json and Json.decode and Drawing and Drawing.LoadImage) then
rec.fail = true
rec.next = now + 60
return nil
end
__EC16.nextPlayerAvatarHttpAt = now + 0.85
pcall(function()
local metaUrl = nil
if Http.roblox_avatar_headshot_url then
metaUrl = Http.roblox_avatar_headshot_url(uid, "150x150", "Png", false)
else
metaUrl = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. tostring(uid) .. "&size=150x150&format=Png&isCircular=false"
end
local ok, status, body = Http.get(metaUrl, { timeout_ms = 3500 })
if (not ok) or status ~= 200 or not body then
rec.fail = true
rec.next = now + 30
return
end
local j = Json.decode(body)
local row = j and j.data and j.data[1]
local imageUrl = row and row.imageUrl
if type(imageUrl) ~= "string" or imageUrl == "" then
rec.fail = true
rec.next = now + 30
return
end
rec.url = imageUrl
if write_file then write_file(__ec16_player_avatar_cache_path(uid), imageUrl) end
rec.handle = Drawing.LoadImage(imageUrl)
rec.next = now + 5
end)
return rec.handle
end

function __ec16_player_initials(p)
local n = tostring((p and (p.display_name or p.name or p.Name)) or "P")
local a = string.sub(n, 1, 1)
local b = string.match(n, "%s+(%w)") or ""
return string.upper(a .. b)
end

function __ec16_draw_player_avatar_icon(p, x, y, icon, alpha)
if not Drawing then return end
local handle = __ec16_get_player_avatar_handle(p)
if handle and Drawing.IsImageReady and Drawing.IsImageReady(handle) then
-- No border/background for Armor ESP on Players: image only.
Drawing.DrawImage(handle, x, y, icon, icon, 1, 1, 1, alpha, 0)
else
-- Fallback without outline so it does not look like a boxed icon.
Drawing.DrawText(x + 2, y + icon * 0.5 - 6, __ec16_player_initials(p), 1, 1, 1, alpha)
end
end

function __ec16_draw_player_armor_esp()
if not __EC16.armorEspPlayers then return end
__ec16_armor_smooth_cleanup()
-- Use fresh player snapshots for position each frame; keep only armor/items cached.
local plist = __ec16_get_players() or __ec16_get_players_cached(__ec16_armor_cache_rate())
if not plist or #plist == 0 then return end
local icon = math.floor(__EC16.armorEspSize or 18)
if icon < 10 then icon = 10 end
if icon > 32 then icon = 32 end
local gap = 2
local yOffset = icon + 10
local maxDist = __ec16_num(__EC16.armorEspMaxDist or 1200) or 1200
for _,p in pairs(plist) do
if __ec16_player_exists_for_armor(p) and not __ec16_player_dead_for_armor(p) then
local headPos = __ec16_player_pos(p)
if headPos and __ec16_player_in_armor_range(p, headPos, maxDist) then
local sx, sy, on = __ec16_world_to_screen(headPos)
if sx and sy and on then
sx, sy = __ec16_armor_smooth_screen(p, sx, sy)
local items = __ec16_get_player_items_cached(p)
local itemCount = 0
if items then itemCount = #items end
if itemCount > 0 then
if __EC16.armorEspAllSlots == false and itemCount > 6 then itemCount = 6 end
local totalW = itemCount * icon + (itemCount - 1) * gap
local startX = sx - totalW * 0.5
local y = sy - yOffset
for i = 1, itemCount do
local x = startX + (i - 1) * (icon + gap)
__ec16_draw_plain_armor_icon(items[i], x, y, icon, 1)
end
end
end
end
end
end
end
function __ec16_fov_style_dropdown(mx,my,cl,x,y,w)
local names = {
[0] = "Default",
[1] = "Breathing",
[2] = "Rotating Gradient"
}
local val = UIManager.GetSliderIntValue("ap_fov_style_main") or 0
if val < 0 then val = 0 end
if val > 2 then val = 2 end
__EC16.fovStyleAnim = __EC16.fovStyleAnim or 0
local target = (__EC16.fovStyleOpen == true) and 1 or 0
local speed = target == 1 and 0.16 or 0.12
if __EC16.fovStyleAnim < target then
__EC16.fovStyleAnim = math.min(target, __EC16.fovStyleAnim + speed)
elseif __EC16.fovStyleAnim > target then
__EC16.fovStyleAnim = math.max(target, __EC16.fovStyleAnim - speed)
end
local anim = __ec16_sm(__EC16.fovStyleAnim)
local bx1 = x
local by1 = y + 25
local bx2 = x + w
local by2 = y + 51
local hovMain = __ec16_in(mx,my,bx1,by1,bx2,by2)
__ec16_ldim(x,y,"FOV Style",0.84)
__ec16_rect(bx1,by1,bx2,by2,hovMain and 0.075 or 0.050,hovMain and 0.055 or 0.040,hovMain and 0.120 or 0.085,0.96)
__ec16_out(bx1,by1,bx2,by2,hovMain and 1 or 0.20,hovMain and 0 or 0.20,hovMain and 0.55 or 0.25,0.88,1)
local current = names[val] or names[0]
Drawing.DrawTextWithOutline(bx1+10+__ec16_text_w(current)*0.5,by1+8,current,0.90,0.86,1,0.95,0,0,0,0.9)
local arrow = (__EC16.fovStyleOpen == true) and "^" or "v"
Drawing.DrawTextWithOutline(bx2-18+__ec16_text_w(arrow)*0.5,by1+8,arrow,1,0.45,0.85,0.95,0,0,0,0.9)
if hovMain and cl and not __EC16.lastClick then
__EC16.fovStyleOpen = not (__EC16.fovStyleOpen == true)
end
local optH = 26
local padTop = 4
local padBot = 8
local fullListH = padTop + optH * 3 + padBot
local extra = math.floor(fullListH * anim + 0.5)
if anim > 0.01 then
local oy = by2 + 5
local listH = fullListH * anim
__ec16_rect(bx1,oy,bx2,oy+listH,0.020,0.016,0.040,0.98)
__ec16_out(bx1,oy,bx2,oy+listH,1,0,0.58,0.42 * anim,1)
for i=0,2 do
local y1 = oy + padTop + i * optH
local y2 = y1 + optH
if y1 < oy + listH - 2 then
local visiblePart = math.min(1, math.max(0, ((oy + listH) - y1) / optH))
local alpha = anim * visiblePart
local hov = (__EC16.fovStyleOpen == true) and __ec16_in(mx,my,bx1,y1,bx2,y2)
local active = val == i
if active then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.090,0.050,0.130,0.88 * alpha)
__ec16_rect(bx1+6,y1+6,bx1+12,y2-6,1,0,0.58,0.95 * alpha)
elseif hov then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.060,0.045,0.095,0.78 * alpha)
end
local label = names[i]
Drawing.DrawTextWithOutline(
bx1+18+__ec16_text_w(label)*0.5,
y1+8,
label,
active and 1 or 0.72,
active and 0.82 or 0.68,
active and 0.96 or 0.86,
0.95 * alpha,
0,0,0,0.9 * alpha
)
if hov and cl and not __EC16.lastClick then
UIManager.SetSliderIntValue("ap_fov_style_main", i)
__EC16.fovStyleOpen = false
end
end
end
end
if (__EC16.fovStyleOpen == true) and cl and not __EC16.lastClick then
local listBottom = by2 + 5 + fullListH
local insideDrop = __ec16_in(mx,my,bx1,by1,bx2,listBottom)
if not insideDrop then
__EC16.fovStyleOpen = false -- outside fov style
end
end
return extra
end

function __ec16_tracer_style_dropdown(mx,my,cl,x,y,w)
local names = {
[0] = "Beam",
[1] = "Real Neon",
[2] = "Lightning",
[3] = "Gradient Laser",
[4] = "Wave Lightning",
[5] = "Image Lightning",
[6] = "Image Spark Trail"
}
EC_BT = EC_BT or {}
local val = math.floor(tonumber(EC_BT.style or 0) or 0)
if val < 0 then val = 0 end
if val > 6 then val = 6 end
EC_BT.style = val

__EC16.tracerStyleAnim = __EC16.tracerStyleAnim or 0
local target = (__EC16.tracerStyleOpen == true) and 1 or 0
local speed = target == 1 and 0.16 or 0.12
if __EC16.tracerStyleAnim < target then
__EC16.tracerStyleAnim = math.min(target, __EC16.tracerStyleAnim + speed)
elseif __EC16.tracerStyleAnim > target then
__EC16.tracerStyleAnim = math.max(target, __EC16.tracerStyleAnim - speed)
end

local anim = __ec16_sm(__EC16.tracerStyleAnim)
local bx1 = x
local by1 = y + 25
local bx2 = x + w
local by2 = y + 51
local hovMain = __ec16_in(mx,my,bx1,by1,bx2,by2)

__ec16_ldim(x,y,"Tracer Style",0.84)
__ec16_rect(bx1,by1,bx2,by2,hovMain and 0.075 or 0.050,hovMain and 0.055 or 0.040,hovMain and 0.120 or 0.085,0.96)
__ec16_out(bx1,by1,bx2,by2,hovMain and 1 or 0.20,hovMain and 0 or 0.20,hovMain and 0.55 or 0.25,0.88,1)

local current = names[val] or names[0]
Drawing.DrawTextWithOutline(bx1+10+__ec16_text_w(current)*0.5,by1+8,current,0.90,0.86,1,0.95,0,0,0,0.9)
local arrow = (__EC16.tracerStyleOpen == true) and "^" or "v"
Drawing.DrawTextWithOutline(bx2-18+__ec16_text_w(arrow)*0.5,by1+8,arrow,1,0.45,0.85,0.95,0,0,0,0.9)

if hovMain and cl and not __EC16.lastClick then
__EC16.tracerStyleOpen = not (__EC16.tracerStyleOpen == true)
__EC16.hitFxStyleOpen = false
__EC16.auraStyleOpen = false
end

local optH = 26
local padTop = 4
local padBot = 8
local fullListH = padTop + optH * 7 + padBot
local extra = math.floor(fullListH * anim + 0.5)

if anim > 0.01 then
local oy = by2 + 5
local listH = fullListH * anim
__ec16_rect(bx1,oy,bx2,oy+listH,0.020,0.016,0.040,0.98)
__ec16_out(bx1,oy,bx2,oy+listH,1,0,0.58,0.42 * anim,1)

for i=0,6 do
local y1 = oy + padTop + i * optH
local y2 = y1 + optH
if y1 < oy + listH - 2 then
local visiblePart = math.min(1, math.max(0, ((oy + listH) - y1) / optH))
local alpha = anim * visiblePart
local hov = (__EC16.tracerStyleOpen == true) and __ec16_in(mx,my,bx1,y1,bx2,y2)
local active = val == i

if active then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.090,0.050,0.130,0.88 * alpha)
__ec16_rect(bx1+6,y1+6,bx1+12,y2-6,1,0,0.58,0.95 * alpha)
elseif hov then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.060,0.045,0.095,0.78 * alpha)
end

local label = names[i] or ("Style " .. tostring(i))
Drawing.DrawTextWithOutline(bx1+18+__ec16_text_w(label)*0.5,y1+8,label,active and 1 or 0.72,active and 0.82 or 0.68,active and 0.96 or 0.86,0.95 * alpha,0,0,0,0.9 * alpha)

if hov and cl and not __EC16.lastClick then
EC_BT.style = i
__EC16.tracerStyleOpen = false
end
end
end
end

return extra
end



function __ec16_hitfx_style_dropdown(mx,my,cl,x,y,w)
local names = {
[0] = "Tesla Boom",
[1] = "Fallen Spark",
[2] = "Fallen SmokeRing",
[3] = "Fallen particles.js",
[4] = "Fallen Combo"
}
local map = {
[0] = 3,
[1] = 9,
[2] = 10,
[3] = 11,
[4] = 12
}
local rev = { [3]=0, [9]=1, [10]=2, [11]=3, [12]=4 }

EC_BT = EC_BT or {}
local currentStyle = math.floor(tonumber(EC_BT.hitStyle or 12) or 12)
local val = rev[currentStyle] or 4
EC_BT.hitStyle = map[val] or 12

__EC16.hitFxStyleAnim = __EC16.hitFxStyleAnim or 0
local target = (__EC16.hitFxStyleOpen == true) and 1 or 0
local speed = target == 1 and 0.16 or 0.12
if __EC16.hitFxStyleAnim < target then
__EC16.hitFxStyleAnim = math.min(target, __EC16.hitFxStyleAnim + speed)
elseif __EC16.hitFxStyleAnim > target then
__EC16.hitFxStyleAnim = math.max(target, __EC16.hitFxStyleAnim - speed)
end

local anim = __ec16_sm(__EC16.hitFxStyleAnim)
local bx1 = x
local by1 = y + 25
local bx2 = x + w
local by2 = y + 51
local hovMain = __ec16_in(mx,my,bx1,by1,bx2,by2)

__ec16_ldim(x,y,"Hit Effect Style",0.84)
__ec16_rect(bx1,by1,bx2,by2,hovMain and 0.075 or 0.050,hovMain and 0.055 or 0.040,hovMain and 0.120 or 0.085,0.96)
__ec16_out(bx1,by1,bx2,by2,hovMain and 1 or 0.20,hovMain and 0 or 0.20,hovMain and 0.55 or 0.25,0.88,1)

local current = names[val] or names[4]
Drawing.DrawTextWithOutline(bx1+10+__ec16_text_w(current)*0.5,by1+8,current,0.90,0.86,1,0.95,0,0,0,0.9)
local arrow = (__EC16.hitFxStyleOpen == true) and "^" or "v"
Drawing.DrawTextWithOutline(bx2-18+__ec16_text_w(arrow)*0.5,by1+8,arrow,1,0.45,0.85,0.95,0,0,0,0.9)

if hovMain and cl and not __EC16.lastClick then
__EC16.hitFxStyleOpen = not (__EC16.hitFxStyleOpen == true)
__EC16.tracerStyleOpen = false
__EC16.auraStyleOpen = false
end

local optH = 26
local padTop = 4
local padBot = 8
local fullListH = padTop + optH * 5 + padBot
local extra = math.floor(fullListH * anim + 0.5)

if anim > 0.01 then
local oy = by2 + 5
local listH = fullListH * anim
__ec16_rect(bx1,oy,bx2,oy+listH,0.020,0.016,0.040,0.98)
__ec16_out(bx1,oy,bx2,oy+listH,1,0,0.58,0.42 * anim,1)

for i=0,4 do
local y1 = oy + padTop + i * optH
local y2 = y1 + optH
if y1 < oy + listH - 2 then
local visiblePart = math.min(1, math.max(0, ((oy + listH) - y1) / optH))
local alpha = anim * visiblePart
local hov = (__EC16.hitFxStyleOpen == true) and __ec16_in(mx,my,bx1,y1,bx2,y2)
local active = val == i

if active then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.090,0.050,0.130,0.88 * alpha)
__ec16_rect(bx1+6,y1+6,bx1+12,y2-6,1,0,0.58,0.95 * alpha)
elseif hov then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.060,0.045,0.095,0.78 * alpha)
end

local label = names[i] or ("Style " .. tostring(i))
Drawing.DrawTextWithOutline(bx1+18+__ec16_text_w(label)*0.5,y1+8,label,active and 1 or 0.72,active and 0.82 or 0.68,active and 0.96 or 0.86,0.95 * alpha,0,0,0,0.9 * alpha)

if hov and cl and not __EC16.lastClick then
EC_BT.hitStyle = map[i] or 12
__EC16.hitFxStyleOpen = false
end
end
end
end

return extra
end


function __ec16_aura_style_dropdown(mx,my,cl,x,y,w)
local names = {
[0] = "Default Neon",
[1] = "Double Helix",
[2] = "Pulse Rings",
[3] = "Orbit Sparks",
[4] = "Halo + Floor"
}
local map = {
[0] = 0,
[1] = 5,
[2] = 6,
[3] = 7,
[4] = 8
}
local rev = { [0]=0, [5]=1, [6]=2, [7]=3, [8]=4 }

local currentInternal = math.floor(tonumber(__EC16.selfAuraStyle or 0) or 0)
local val = rev[currentInternal] or 0
__EC16.selfAuraStyle = map[val] or 0

__EC16.auraStyleAnim = __EC16.auraStyleAnim or 0
local target = (__EC16.auraStyleOpen == true) and 1 or 0
local speed = target == 1 and 0.16 or 0.12
if __EC16.auraStyleAnim < target then
__EC16.auraStyleAnim = math.min(target, __EC16.auraStyleAnim + speed)
elseif __EC16.auraStyleAnim > target then
__EC16.auraStyleAnim = math.max(target, __EC16.auraStyleAnim - speed)
end

local anim = __ec16_sm(__EC16.auraStyleAnim)
local bx1 = x
local by1 = y + 25
local bx2 = x + w
local by2 = y + 51
local hovMain = __ec16_in(mx,my,bx1,by1,bx2,by2)

__ec16_ldim(x,y,"Aura Style",0.84)
__ec16_rect(bx1,by1,bx2,by2,hovMain and 0.075 or 0.050,hovMain and 0.055 or 0.040,hovMain and 0.120 or 0.085,0.96)
__ec16_out(bx1,by1,bx2,by2,hovMain and 1 or 0.20,hovMain and 0 or 0.20,hovMain and 0.55 or 0.25,0.88,1)

local current = names[val] or names[0]
Drawing.DrawTextWithOutline(bx1+10+__ec16_text_w(current)*0.5,by1+8,current,0.90,0.86,1,0.95,0,0,0,0.9)
local arrow = (__EC16.auraStyleOpen == true) and "^" or "v"
Drawing.DrawTextWithOutline(bx2-18+__ec16_text_w(arrow)*0.5,by1+8,arrow,1,0.45,0.85,0.95,0,0,0,0.9)

if hovMain and cl and not __EC16.lastClick then
__EC16.auraStyleOpen = not (__EC16.auraStyleOpen == true)
__EC16.tracerStyleOpen = false
__EC16.hitFxStyleOpen = false
end

local optH = 26
local padTop = 4
local padBot = 8
local fullListH = padTop + optH * 5 + padBot
local extra = math.floor(fullListH * anim + 0.5)

if anim > 0.01 then
local oy = by2 + 5
local listH = fullListH * anim
__ec16_rect(bx1,oy,bx2,oy+listH,0.020,0.016,0.040,0.98)
__ec16_out(bx1,oy,bx2,oy+listH,1,0,0.58,0.42 * anim,1)

for i=0,4 do
local y1 = oy + padTop + i * optH
local y2 = y1 + optH
if y1 < oy + listH - 2 then
local visiblePart = math.min(1, math.max(0, ((oy + listH) - y1) / optH))
local alpha = anim * visiblePart
local hov = (__EC16.auraStyleOpen == true) and __ec16_in(mx,my,bx1,y1,bx2,y2)
local active = val == i

if active then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.090,0.050,0.130,0.88 * alpha)
__ec16_rect(bx1+6,y1+6,bx1+12,y2-6,1,0,0.58,0.95 * alpha)
elseif hov then
__ec16_rect(bx1+2,y1+2,bx2-2,y2-2,0.060,0.045,0.095,0.78 * alpha)
end

local label = names[i] or ("Style " .. tostring(i))
Drawing.DrawTextWithOutline(bx1+18+__ec16_text_w(label)*0.5,y1+8,label,active and 1 or 0.72,active and 0.82 or 0.68,active and 0.96 or 0.86,0.95 * alpha,0,0,0,0.9 * alpha)

if hov and cl and not __EC16.lastClick then
__EC16.selfAuraStyle = map[i] or 0
__EC16.auraStyleOpen = false
end
end
end
end

return extra
end



function __ec16_menu(mx,my,cl,w,h)
if not __EC16.open then return end
__EC16.mainTab = __EC16.mainTab or "aim"
__EC16.aimSection = __EC16.aimSection or "General"
__EC16.espSection = __EC16.espSection or "Armor"
__EC16.noclipSection = __EC16.noclipSection or "Noclip"
local speed = 0.075
if __EC16.animDir == -1 then
__EC16.anim = __ec16_c((__EC16.anim or 1) - speed, 0, 1)
if __EC16.anim <= 0.01 then
__EC16.open = false
__EC16.anim = 0
return
end
else
__EC16.anim = __ec16_c((__EC16.anim or 0) + speed, 0, 1)
end
local reveal = __ec16_sm(__EC16.anim)
local x = __EC16.x
local y = __EC16.y
local ww = __EC16.w
local hh = __EC16.h * reveal
local x2 = x + ww
local y2 = y + hh
if hh < 90 then return end
if __ec16_in(mx,my,x,y,x+ww,y+36) and cl and not __EC16.lastClick then
__EC16.dragging = true
__EC16.dragX = mx - __EC16.x
__EC16.dragY = my - __EC16.y
end
if not cl then __EC16.dragging = false end
if __EC16.dragging then
__EC16.x = mx - __EC16.dragX
__EC16.y = my - __EC16.dragY
x = __EC16.x
y = __EC16.y
x2 = x + ww
y2 = y + hh
end
local bgR,bgG,bgB = 0.030,0.025,0.070
local paneR,paneG,paneB = 0.058,0.047,0.118
local boxR,boxG,boxB = 0.080,0.064,0.155
local edgeR,edgeG,edgeB = 0.150,0.115,0.255
local accR,accG,accB = 1.00,0.00,0.55
local softR,softG,softB = 0.74,0.69,0.88
local dimR,dimG,dimB = 0.48,0.43,0.64
local function rect(a,b,c,d,r,g,bb,aa) __ec16_rect(a,b,c,d,r,g,bb,aa or 1) end
local function out(a,b,c,d,r,g,bb,aa,t) __ec16_out(a,b,c,d,r,g,bb,aa or 1,t or 1) end
local function round_rect(a,b,c,d,r,g,bb,aa,rad)
rect(a,b,c,d,r,g,bb,aa)
end
local function text_left(tx,ty,msg,a)
msg = tostring(msg or "")
Drawing.DrawTextWithOutline(tx + __ec16_text_w(msg) * 0.5, ty, msg, 0.92,0.89,1.00,a or 1,0,0,0,0.95)
end
local function dim_left(tx,ty,msg,a)
msg = tostring(msg or "")
Drawing.DrawTextWithOutline(tx + __ec16_text_w(msg) * 0.5, ty, msg, dimR,dimG,dimB,a or 0.95,0,0,0,0.9)
end
local function group(gx,gy,gw,gh,title)
round_rect(gx-1,gy-1,gx+gw+1,gy+gh+1,1.00,0.00,0.58,0.032,8)
round_rect(gx,gy,gx+gw,gy+gh,boxR,boxG,boxB,0.94,8)
round_rect(gx+1,gy+1,gx+gw-1,gy+gh-1,0.022,0.020,0.040,0.92,7)
round_rect(gx+1,gy+1,gx+gw-1,gy+24,0.100,0.072,0.190,0.98,7)
rect(gx+10,gy+22,gx+gw-10,gy+24,1.00,0.00,0.58,0.36)
Drawing.DrawTextWithOutline(gx+12 + __ec16_text_w(title) * 0.5, gy+7, title, 0.94,0.89,1.00,0.98,0,0,0,0.9)
end
local function get_username()
local name = "Player"
pcall(function()
local lp = rbx and rbx.local_player and rbx.local_player()
if lp and lp.get_name then
local n = lp:get_name()
if n and n ~= "" then name = n end
end
end)
pcall(function()
if name == "Player" and GetLocalPlayer then
local lp = GetLocalPlayer()
if lp and lp.Name then name = lp.Name end
end
end)
return tostring(name)
end
local function get_userid()
local uid = nil
pcall(function()
if GetLocalPlayer then
local lp = GetLocalPlayer()
if lp and lp.UserId then uid = lp.UserId end
end
end)
pcall(function()
if not uid and rbx and rbx.local_player then
local lp = rbx.local_player()
if lp and lp.user_id then uid = lp:user_id() end
end
end)
return uid
end
local function get_avatar_handle()
local uid = get_userid()
if not uid then return nil end
if __EC16.avatarUid ~= uid then
__EC16.avatarUid = uid
__EC16.avatarUrl = nil
__EC16.avatarHandle = nil
__EC16.avatarFailed = false
__EC16.avatarRequested = false
__EC16.avatarRequestAt = nil
__EC16.avatarNextRetry = nil
end
if __EC16.avatarHandle then
return __EC16.avatarHandle
end
if __EC16.avatarFailed and __EC16.avatarNextRetry and tick and tick() < __EC16.avatarNextRetry then
return nil
end
if (not __EC16.avatarRequested) then
__EC16.avatarRequested = true
pcall(function()
local cachePath = "C:\\blueberry\\scripts\\ec16_avatar_" .. tostring(uid) .. ".txt"
local cached = nil
if read_file then cached = read_file(cachePath) end
if cached then
cached = tostring(cached)
cached = string.gsub(cached, "^%s+", "")
cached = string.gsub(cached, "%s+$", "")
if string.find(cached, "^https?://") then
__EC16.avatarUrl = cached
__EC16.avatarHandle = Drawing.LoadImage(cached)
return
end
end
if not (Http and Http.get and Json and Json.decode and Drawing and Drawing.LoadImage) then
__EC16.avatarFailed = true
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
return
end
local metaUrl = nil
if Http.roblox_avatar_headshot_url then
metaUrl = Http.roblox_avatar_headshot_url(uid, "150x150", "Png", false)
else
metaUrl = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. tostring(uid) .. "&size=150x150&format=Png&isCircular=false"
end
local ok, status, body = Http.get(metaUrl, { timeout_ms = 4500 })
if (not ok) or status ~= 200 or not body then
__EC16.avatarFailed = true
__EC16.avatarRequested = false
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
return
end
local j = Json.decode(body)
local row = j and j.data and j.data[1]
local imageUrl = row and row.imageUrl
if type(imageUrl) ~= "string" or imageUrl == "" then
__EC16.avatarFailed = true
__EC16.avatarRequested = false
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
return
end
__EC16.avatarUrl = imageUrl
if write_file then write_file(cachePath, imageUrl) end
__EC16.avatarHandle = Drawing.LoadImage(imageUrl)
end)
end
if __EC16.avatarHandle and Drawing.IsImageFailed and Drawing.IsImageFailed(__EC16.avatarHandle) then
__EC16.avatarHandle = nil
__EC16.avatarFailed = true
__EC16.avatarRequested = false
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
end
return __EC16.avatarHandle
end

local function neon_shell(a,b,c,d,rad)
round_rect(a-1,b-1,c+1,d+1,1.00,0.00,0.58,0.032,rad+1)
round_rect(a,b,c,d,0.090,0.068,0.165,0.84,rad)
round_rect(a+1,b+1,c-1,d-1,bgR,bgG,bgB,0.74,rad-1)
end
neon_shell(x,y,x2,y2,14)
round_rect(x+7,y+7,x2-7,y+37,0.070,0.050,0.145,0.86,10)
rect(x+10,y+35,x2-10,y+37,accR,accG,accB,0.76)
-- v18: removed duplicated header logo text
local tabs = {
{id="aim", label="AIM", w=88},
{id="esp", label="FALLEN ESP", w=132},
{id="noclip", label="NOCLIP", w=102}
}
local tx = x + 18
local ty = y + 45
for _,tb in ipairs(tabs) do
local active = (__EC16.mainTab == tb.id)
local hov = __ec16_in(mx,my,tx,ty,tx+tb.w,ty+25)
if hov and cl and not __EC16.lastClick then __EC16.mainTab = tb.id end
if active then
round_rect(tx-1,ty-1,tx+tb.w+1,ty+26,1.00,0.00,0.58,0.08,7)
round_rect(tx,ty,tx+tb.w,ty+25,0.125,0.083,0.225,1,6)
rect(tx+8,ty+22,tx+tb.w-8,ty+24,accR,accG,accB,1)
Drawing.DrawTextWithOutline(tx+10 + __ec16_text_w(tb.label) * 0.5, ty+7, tb.label, 1,0.82,0.96,1,0,0,0,1)
else
round_rect(tx,ty,tx+tb.w,ty+25,0.050,0.040,0.100,hov and 0.98 or 0.76,6)
Drawing.DrawTextWithOutline(tx+10 + __ec16_text_w(tb.label) * 0.5, ty+7, tb.label, 0.60,0.54,0.76,hov and 0.95 or 0.78,0,0,0,0.95)
end
tx = tx + tb.w + 6
end
local paneX = x + 14
local paneY = y + 78
local paneX2 = x2 - 14
local paneY2 = y2 - 14
round_rect(paneX,paneY,paneX2,paneY2,0.070,0.055,0.135,0.82,12)
round_rect(paneX+1,paneY+1,paneX2-1,paneY2-1,paneR,paneG,paneB,0.78,11)
local sideW = 178
local sideX = paneX + 12
local sideY = paneY + 12
local sideY2 = paneY2 - 12
round_rect(sideX,sideY,sideX+sideW,sideY2,0.060,0.046,0.118,0.80,10)
round_rect(sideX+1,sideY+1,sideX+sideW-1,sideY2-1,0.024,0.022,0.048,0.76,9)
local avatarX = sideX + 12
local avatarY = sideY + 12
local avatarS = 34
round_rect(avatarX,avatarY,sideX+sideW-12,avatarY+48,0.064,0.050,0.125,0.82,7)
out(avatarX,avatarY,sideX+sideW-12,avatarY+48,0.22,0.16,0.36,0.65,1)
round_rect(avatarX+8,avatarY+7,avatarX+8+avatarS,avatarY+7+avatarS,0.110,0.090,0.180,1,6)
local avatar = get_avatar_handle()
if avatar and Drawing.IsImageReady and Drawing.IsImageReady(avatar) then
Drawing.DrawImage(avatar, avatarX+8, avatarY+7, avatarS, avatarS)
else
local uname = get_username()
local letter = string.sub(uname,1,1)
Drawing.DrawTextWithOutline(avatarX+18 + __ec16_text_w(letter) * 0.5, avatarY+15, letter, 1,1,1,1,0,0,0,1)
end
local uname = get_username()
Drawing.DrawTextWithOutline(avatarX+52 + __ec16_text_w(uname) * 0.5, avatarY+10, uname, 0.92,0.88,1,0.98,0,0,0,0.95)
Drawing.DrawTextWithOutline(avatarX+52 + __ec16_text_w("Local Player") * 0.5, avatarY+26, "Local Player", softR,softG,softB,0.90,0,0,0,0.9)
local sections = {}
if __EC16.mainTab == "aim" then
sections = {"General","Target","TP","Tracers","Aura"}
elseif __EC16.mainTab == "noclip" then
sections = {"Noclip"}
else
sections = {"Armor","World","Loot","Base","Misc","Moderator List","Info"}
end
local curSection = __EC16.espSection
if __EC16.mainTab == "aim" then curSection = __EC16.aimSection end
if __EC16.mainTab == "noclip" then curSection = __EC16.noclipSection end
local secY = avatarY + 62
for _,name in ipairs(sections) do
local active = (curSection == name)
local ix1 = sideX + 10
local ix2 = sideX + sideW - 10
local iy1 = secY
local iy2 = secY + 26
local hov = __ec16_in(mx,my,ix1,iy1,ix2,iy2)
if hov and cl and not __EC16.lastClick then
if __EC16.mainTab == "aim" then __EC16.aimSection = name elseif __EC16.mainTab == "noclip" then __EC16.noclipSection = name else __EC16.espSection = name end
curSection = name
end
if active then
round_rect(ix1-1,iy1-1,ix2+1,iy2+1,1.00,0.00,0.58,0.040,7)
round_rect(ix1,iy1,ix2,iy2,0.075,0.058,0.145,0.82,6)
rect(ix1,iy1,ix1+3,iy2,accR,accG,accB,1)
Drawing.DrawTextWithOutline(ix1+14 + __ec16_text_w(name) * 0.5, iy1+7, name, 0.92,0.88,1.00,0.98,0,0,0,0.95)
else
round_rect(ix1,iy1,ix2,iy2,hov and 0.060 or 0.048,hov and 0.046 or 0.038,hov and 0.110 or 0.092,hov and 0.82 or 0.60,6)
Drawing.DrawTextWithOutline(ix1+14 + __ec16_text_w(name) * 0.5, iy1+7, name, 0.58,0.52,0.74,hov and 0.94 or 0.80,0,0,0,0.9)
end
secY = secY + 31
end
local contentX = sideX + sideW + 14
local contentY = sideY
local contentX2 = paneX2 - 12
local contentY2 = sideY2
round_rect(contentX,contentY,contentX2,contentY2,0.040,0.032,0.085,0.76,8)
out(contentX,contentY,contentX2,contentY2,0.22,0.16,0.38,0.62,1)
local innerGap = 14
local contentW = contentX2 - contentX
local colW = math.floor((contentW - innerGap * 4) / 3)
local c1 = contentX + innerGap
local c2 = c1 + colW + innerGap
local c3 = c2 + colW + innerGap
local sy = contentY + 18
local function check(gx,gy,label,id) __ec16_check(mx,my,cl,gx,gy,label,id) end
local function slider(gx,gy,wid,label,id,minv,maxv) __ec16_slider(mx,my,cl,gx,gy,wid,label,id,minv,maxv) end
if __EC16.mainTab == "aim" then
if curSection == "General" then
group(c1,sy,colW,260,"Aimbot")
check(c1+18,sy+42,"Aimbot","ap_aim_enable_fixed_click")
check(c1+18,sy+72,"Prediction","ap_prediction_main")
check(c1+18,sy+102,"Team Check","ap_team_main")
check(c1+18,sy+132,"Sticky Aim","ap_sticky_main")
__EC16.keybindsPanel = __ec16_bool_check(mx,my,cl,c1+18,sy+162,"Keybind Panel",__EC16.keybindsPanel)
group(c3,sy,colW,495,"FOV")
check(c3+18,sy+42,"FOV Enabled","ap_fov_show_main")
__EC16.rainbowFov = __ec16_bool_check(mx,my,cl,c3+18,sy+72,"Rainbow FOV",__EC16.rainbowFov)
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+112,colW-36,"FOV Color","fov")
slider(c3+18,sy+190,colW-36,"FOV Size","ap_fov_main",50,600)
slider(c3+18,sy+247,colW-36,"FOV Transparency","ap_fov_alpha_main",0,100)
local fovStyleExtraGen = __ec16_fov_style_dropdown(mx,my,cl,c3+18,sy+304,colW-36) or 0
if fovStyleExtraGen > 50 then fovStyleExtraGen = 50 end
__EC16.rainbowFovSpeed = __ec16_float_slider(mx,my,cl,c3+18,sy+408+fovStyleExtraGen,colW-36,"Rainbow Speed",__EC16.rainbowFovSpeed,0.2,8)
elseif curSection == "Target" then
group(c1,sy,colW,310,"Target")
slider(c1+18,sy+42,colW-36,"Max Distance","ap_maxdist_main",50,3000)
check(c1+18,sy+104,"Target Strafe","ap_target_strafe_main")
ap_target_strafe_radius = __ec16_float_slider(mx,my,cl,c1+18,sy+145,colW-36,"Strafe Radius",ap_target_strafe_radius or 4.0,1.0,50.0)
ap_target_strafe_speed = __ec16_float_slider(mx,my,cl,c1+18,sy+205,colW-36,"Strafe Speed",ap_target_strafe_speed or 280,50,700)
group(c2,sy,colW,168,"Keybind")
__ec16_keybind(mx,my,cl,c2+18,sy+42,"Aimbot Keybind")
if __EC16.armorEspAllSlots == nil then __EC16.armorEspAllSlots = true end
elseif curSection == "TP" then
group(c1,sy,colW,430,"Aimlock TP")
check(c1+18,sy+38,"Left TP","ap_left_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+68,"Left TP Key","left")
check(c1+18,sy+122,"Right TP","ap_right_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+152,"Right TP Key","right")
check(c1+18,sy+206,"90 Left TP","ap_90_left_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+236,"90 Left Key","90_left")
check(c1+18,sy+290,"90 Right TP","ap_90_right_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+320,"90 Right Key","90_right")
slider(c1+18,sy+374,colW-36,"TP Distance","ap_side_tp_distance",1,80)
elseif curSection == "Tracers" then
if EC_BT == nil then EC_BT = {} end
EC_BT.life = EC_BT.life or 4.0
EC_BT.alpha = EC_BT.alpha or 1.0
EC_BT.maxDist = EC_BT.maxDist or 1000
if EC_BT.instant == nil then EC_BT.instant = true end
-- From Weapon 3D offset was unreliable in this API, so use stable screen-space lower offset.
EC_BT.weaponOrigin = false
EC_BT.screenStraight = true
EC_BT.revealTime = EC_BT.revealTime or 0.55
EC_BT.weaponSide = EC_BT.weaponSide or 0.72
EC_BT.weaponDown = EC_BT.weaponDown or 0.45
EC_BT.weaponForward = EC_BT.weaponForward or 0.55
EC_BT.thick = EC_BT.thick or 2.0
EC_BT.segments = EC_BT.segments or 24
EC_BT.delay = EC_BT.delay or 0.13
EC_BT.realHitOnly = false
EC_BT.onlyOnHit = false
EC_BT.hitRadius = 35

group(c1,sy,colW,485,"Bullet Tracers")
EC_BT.enabled = __ec16_bool_check(mx,my,cl,c1+18,sy+42,"Bullet Tracers",EC_BT.enabled == true)
EC_BT.instant = __ec16_bool_check(mx,my,cl,c1+18,sy+72,"Instant Tracer",EC_BT.instant ~= false)
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+112,colW-36,"Tracer Color","tracer")
EC_BT.alpha = __ec16_float_slider(mx,my,cl,c1+18,sy+190,colW-36,"Tracer Opacity",EC_BT.alpha or 1.0,0.05,1.0)
EC_BT.life = __ec16_float_slider(mx,my,cl,c1+18,sy+250,colW-36,"Tracer Life",EC_BT.life or 4.0,0.10,8.0)
EC_BT.revealTime = __ec16_float_slider(mx,my,cl,c1+18,sy+310,colW-36,"Reveal Time",EC_BT.revealTime or 0.55,0.05,2.50)
EC_BT.maxDist = __ec16_float_slider(mx,my,cl,c1+18,sy+370,colW-36,"Tracer/HitFX Max Dist",EC_BT.maxDist or 1000,100,3000)

group(c2,sy,colW,220,"Style")
local tracerStyleExtra = __ec16_tracer_style_dropdown(mx,my,cl,c2+18,sy+42,colW-36) or 0

group(c3,sy,colW,330,"Hit Effects")
EC_BT.hitfx = __ec16_bool_check(mx,my,cl,c3+18,sy+42,"Hit Effects",EC_BT.hitfx == true)
EC_BT.hitSize = __ec16_float_slider(mx,my,cl,c3+18,sy+82,colW-36,"Hit Effect Size",EC_BT.hitSize or 38,18,96)
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+142,colW-36,"Hit Effect Color","hitfx")
local hitFxStyleExtra = __ec16_hitfx_style_dropdown(mx,my,cl,c3+18,sy+202,colW-36) or 0
elseif curSection == "Aura" then
if __EC16.selfAura == nil then __EC16.selfAura = false end
if __EC16.selfAuraStyle == nil then __EC16.selfAuraStyle = 0 end
group(c1,sy,colW,300,"Self Aura")
__EC16.selfAura = __ec16_bool_check(mx,my,cl,c1+18,sy+42,"Self Aura",__EC16.selfAura == true)
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+92,colW-36,"Aura Upper Color","aura_bottom")
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+170,colW-36,"Aura Lower Color","aura_top")
group(c2,sy,colW,245,"Style")
local auraStyleExtra = __ec16_aura_style_dropdown(mx,my,cl,c2+18,sy+42,colW-36) or 0
elseif curSection == "FOV" then
group(c1,sy,colW,535,"FOV")
check(c1+18,sy+42,"FOV Enabled","ap_fov_show_main")
__EC16.rainbowFov = __ec16_bool_check(mx,my,cl,c1+18,sy+72,"Rainbow FOV",__EC16.rainbowFov)
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+112,colW-36,"FOV Color","fov")
slider(c1+18,sy+190,colW-36,"FOV Size","ap_fov_main",50,600)
slider(c1+18,sy+247,colW-36,"FOV Transparency","ap_fov_alpha_main",0,100)
local fovStyleExtra = __ec16_fov_style_dropdown(mx,my,cl,c1+18,sy+304,colW-36) or 0
if fovStyleExtra > 50 then fovStyleExtra = 50 end
__EC16.rainbowFovSpeed = __ec16_float_slider(mx,my,cl,c1+18,sy+382+fovStyleExtra,colW-36,"Rainbow Speed",__EC16.rainbowFovSpeed,0.2,8)
end
elseif __EC16.mainTab == "noclip" then
if curSection == "Noclip" then
group(c1,sy,colW,118,"Noclip")
__ec16_noclip_keybind(mx,my,cl,c1+18,sy+42,"Noclip Keybind")
end
else
if curSection == "Armor" then
group(c1,sy,colW,218,"Armor")
check(c1+18,sy+42,"Enabled","armoriso_target_enabled")
check(c1+18,sy+72,"Show Weapon Slot","armoriso_show_weapon")
check(c1+18,sy+102,"Rainbow Border","armoriso_rainbow_border")
__EC16.armorEspPlayers = __ec16_bool_check(mx,my,cl,c1+18,sy+132,"Armor ESP on Players",__EC16.armorEspPlayers)
__ec16_button(mx,my,cl,c1+18,sy+162,c1+198,sy+202,"Reload Icons","armoriso_reload_icons")
group(c2,sy,colW,392,"Settings")
slider(c2+18,sy+42,colW-36,"Size","armoriso_target_size",20,96)
slider(c2+18,sy+99,colW-36,"Max Distance","armoriso_max_distance",50,3000)
slider(c2+18,sy+156,colW-36,"Glow Power","armoriso_glow_power",0,100)
__EC16.armorEspSize = __ec16_float_slider(mx,my,cl,c2+18,sy+213,colW-36,"Armor ESP Size",__EC16.armorEspSize,10,32)
__EC16.armorEspMaxDist = __ec16_float_slider(mx,my,cl,c2+18,sy+270,colW-36,"Armor ESP Range",__EC16.armorEspMaxDist,100,3000)
__EC16.armorEspSmooth = __ec16_float_slider(mx,my,cl,c2+18,sy+327,colW-36,"Armor ESP Smooth",__EC16.armorEspSmooth,0,50)
__EC16.armorEspAllSlots = true
group(c3,sy,colW,196,"Colors")
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+44,colW-36,"Border Color","armor_border")
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+119,colW-36,"Glow Color","armor_glow")
elseif curSection == "World" then
group(c1,sy,(colW*2)+innerGap,contentY2-sy-14,"World ESP")
slider(c1+18,sy+42,(colW*2)+innerGap-36,"World Range","k1_world_range",25,2000)
__ec16_list(mx,my,cl,c1+18,sy+104,__EC16_WORLD,"k1_",14,22)
group(c3,sy,colW,285,"Options")
check(c3+18,sy+46,"Show Distance","k1_show_distance")
check(c3+18,sy+76,"Show Icons","k1_dropped_item_show_icon")
check(c3+18,sy+106,"Ore Icons","k1_ore_show_icon")
check(c3+18,sy+136,"Fade by Distance","k1_world_fade_distance")
slider(c3+18,sy+178,colW-36,"Icon Size","k1_world_icon_size",10,48)
elseif curSection == "Loot" then
group(c1,sy,(colW*2)+innerGap,contentY2-sy-14,"Loot ESP")
slider(c1+18,sy+42,(colW*2)+innerGap-36,"Loot Range","k1_loot_range",25,2000)
__ec16_list(mx,my,cl,c1+18,sy+104,__EC16_LOOT,"k1_",14,22)
group(c3,sy,colW,235,"Options")
check(c3+18,sy+46,"Show Distance","k1_show_distance")
check(c3+18,sy+76,"Show Icon","k1_loot_show_icon")
check(c3+18,sy+106,"Fade by Distance","k1_loot_fade_distance")
slider(c3+18,sy+148,colW-36,"Icon Size","k1_loot_icon_size",10,48)
elseif curSection == "Base" then
group(c1,sy,(colW*2)+innerGap,contentY2-sy-14,"Base ESP")
slider(c1+18,sy+42,(colW*2)+innerGap-36,"Base Range","k1_base_range",25,2000)
__ec16_list(mx,my,cl,c1+18,sy+112,__EC16_BASE,"k1_",13,22)
group(c3,sy,colW,220,"Options")
check(c3+18,sy+46,"Base Text","k1_base_text")
check(c3+18,sy+76,"Show Distance","k1_show_distance")
__ec16_button(mx,my,cl,c3+18,sy+136,c3+205,sy+178,"Force Rescan","k1_force_rescan")
elseif curSection == "Misc" then
group(c1,sy,colW,236,"Fullbright")
check(c1+18,sy+42,"Fullbright Overlay","ec_fullbright_enabled")
slider(c1+18,sy+85,colW-36,"Opacity","ec_fullbright_opacity",0,80)
group(c2,sy,colW,216,"Info")
elseif curSection == "Moderator List" then
group(c1,sy,colW*3+innerGap*2,contentY2-sy-14,"Moderator List")
text_left(c1+22,sy+42,"Loaded moderator IDs: " .. tostring(#__EC16_MOD_ORDER),0.96)
__EC16.moderatorPanel = __ec16_bool_check(mx,my,cl,c1+22,sy+74,"Floating Moderator Panel",__EC16.moderatorPanel)
local onlineMods = __ec16_get_online_moderators()
if #onlineMods == 0 then
dim_left(c1+22,sy+112,"Not found",0.84)
else
dim_left(c1+22,sy+112,"Detected on server:",0.90)
for i=1,math.min(#onlineMods,8) do
local m = onlineMods[i]
local yy = sy + 140 + (i-1) * 25
round_rect(c1+22,yy-3,c1+430,yy+19,0.035,0.026,0.065,0.90,6)
rect(c1+30,yy+4,c1+38,yy+12,accR,accG,accB,0.95)
text_left(c1+48,yy+1,tostring(m.name or "Player"),0.96)
dim_left(c1+245,yy+1,"ID: " .. tostring(m.uid or "?"),0.86)
end
end
group(c3,sy+118,colW,contentY2-sy-132,"All IDs")
for i=1,math.min(#__EC16_MOD_ORDER,13) do
dim_left(c3+18,sy+148+(i-1)*22,tostring(__EC16_MOD_ORDER[i]),0.78)
end
elseif curSection == "Info" then
group(c1,sy,colW*3+innerGap*2,238,"Info")
text_left(c1+22,sy+42,"",0.96)
dim_left(c1+22,sy+128,"Menu Open Bind",0.86)
__ec16_menu_bind_button(mx,my,cl,c1+22,sy+150)
end
end
end
function __ec16_safe_feature_state(label, enabled)
return { label = label, enabled = enabled == true }
end
function __ec16_get_online_moderators()
if __EC16 and __EC16.modCache and __EC16.modCacheAt and (tick() - __EC16.modCacheAt) < 1.00 then
return __EC16.modCache
end
local out, seen = {}, {}
local function add_player(name, uid, display)
uid = tonumber(uid or 0) or 0
if uid ~= 0 and __EC16_MOD_IDS and __EC16_MOD_IDS[uid] and not seen[uid] then
seen[uid] = true
out[#out+1] = { name = tostring(name or display or "Player"), display = tostring(display or name or ""), uid = uid }
end
end
pcall(function()
if GetAllPlayers then
for _, plr in ipairs(GetAllPlayers()) do
add_player(plr.Name or plr.name, plr.UserId or plr.user_id, plr.DisplayName or plr.display_name)
end
end
end)
pcall(function()
if players and players.get_all then
for _, p in ipairs(players.get_all()) do
local uid = p.user_id or p.UserId
if (not uid or uid == 0) and p.player_addr and p.player_addr ~= 0 and rbx and rbx.instance then
local inst = rbx.instance(p.player_addr)
if inst and inst.user_id then uid = inst:user_id() end
end
add_player(p.name or p.Name, uid, p.display_name or p.DisplayName)
end
end
end)
if __EC16 then __EC16.modCache = out; __EC16.modCacheAt = tick() end
return out
end
function __ec16_draw_moderator_panel(w,h,mx,my,cl)
if not (__EC16 and __EC16.moderatorPanel) then return end
if __EC16.phase ~= "menu" then return end
local mods = __ec16_get_online_moderators()
local visibleCount = math.min(#mods,6)
local width = 190
local baseH = 48
local rowH = 24
local height = baseH + ((visibleCount > 0 and visibleCount or 1) * rowH)
local x1 = __EC16.moderatorPanelX or 18
local y1 = __EC16.moderatorPanelY or 122
if __ec16_in(mx,my,x1,y1,x1+width,y1+height) and cl and not __EC16.lastClick then
__EC16.moderatorDragging = true
__EC16.moderatorDragX = mx - x1
__EC16.moderatorDragY = my - y1
end
if not cl then __EC16.moderatorDragging = false end
if __EC16.moderatorDragging then
__EC16.moderatorPanelX = mx - (__EC16.moderatorDragX or 0)
__EC16.moderatorPanelY = my - (__EC16.moderatorDragY or 0)
x1 = __EC16.moderatorPanelX
y1 = __EC16.moderatorPanelY
end
__ec16_draw_round_rect(x1-1,y1-1,x1+width+1,y1+height+1,1,0,0.58,0.032,11)
__ec16_draw_round_rect(x1,y1,x1+width,y1+height,0.010,0.009,0.022,0.92,10)
__ec16_draw_round_rect(x1+1,y1+1,x1+width-1,y1+height-1,0.022,0.016,0.040,0.72,9)
__ec16_draw_round_rect(x1+6,y1+6,x1+width-6,y1+28,0.055,0.037,0.110,0.92,7)
__ec16_rect(x1+12,y1+27,x1+width-12,y1+29,1,0,0.58,0.65)
Drawing.DrawTextWithOutline(x1+13+__ec16_text_w("Moderator List")*0.5,y1+11,"Moderator List",0.96,0.86,1,0.96,0,0,0,0.95)
if visibleCount == 0 then
Drawing.DrawTextWithOutline(x1+13+__ec16_text_w("Not found")*0.5,y1+34,"Not found",0.47,0.43,0.62,0.78,0,0,0,0.78)
return
end
for i=1,visibleCount do
local mod = mods[i]
local rowY = y1 + 35 + (i-1) * rowH
local name = tostring(mod.name or "Player")
if #name > 10 then name = string.sub(name,1,10) .. "..." end
local keyText = tostring(mod.uid or "?")
__ec16_draw_round_rect(x1+8,rowY-1,x1+width-8,rowY+21,0.025,0.020,0.048,0.90,7)
__ec16_rect(x1+15,rowY+5,x1+23,rowY+13,1,0,0.58,0.95)
Drawing.DrawTextWithOutline(x1+31+__ec16_text_w(name)*0.5,rowY+3,name,0.90,0.86,1,0.96,0,0,0,0.86)
Drawing.DrawTextWithOutline(x1+118+__ec16_text_w(keyText)*0.5,rowY+5,keyText,1,0.80,0.98,0.90,0,0,0,0.82)
end
end
function __ec16_draw_keybinds_panel(w,h,mx,my,cl)
if not (__EC16 and __EC16.keybindsPanel) then return end
if __EC16.phase ~= "menu" then return end
local activeItems = {}
local function add(label, keyName) activeItems[#activeItems+1] = { label = label, key = keyName or "" } end
pcall(function()
local aimEnabled = UIManager.GetCheckboxValue("ap_aim_enable_fixed_click") == true
local vk = ap_aim_vk or __EC16.aimKey or 0x02
local held = Windows and Windows.IsKeyPressed and Windows.IsKeyPressed(vk)
if aimEnabled and held then add("AIMBOT", __ec16_vk_name(vk)) end
end)
local target = (#activeItems > 0) and 1 or 0
__EC16.keybindsAnim = __EC16.keybindsAnim or 0
local speed = target == 1 and 0.09 or 0.07
if __EC16.keybindsAnim < target then
__EC16.keybindsAnim = math.min(target, __EC16.keybindsAnim + speed)
elseif __EC16.keybindsAnim > target then
__EC16.keybindsAnim = math.max(target, __EC16.keybindsAnim - speed)
end
local anim = __ec16_sm(__EC16.keybindsAnim)
local width = 190
local baseH = 48
local rowH = 24
local height = baseH + (rowH * anim)
local x1 = __EC16.keybindsX or 18
local y1 = __EC16.keybindsY or 62
if __ec16_in(mx,my,x1,y1,x1+width,y1+height) and cl and not __EC16.lastClick then
__EC16.keybindsDragging = true
__EC16.keybindsDragX = mx - x1
__EC16.keybindsDragY = my - y1
end
if not cl then __EC16.keybindsDragging = false end
if __EC16.keybindsDragging then
__EC16.keybindsX = mx - (__EC16.keybindsDragX or 0)
__EC16.keybindsY = my - (__EC16.keybindsDragY or 0)
x1 = __EC16.keybindsX
y1 = __EC16.keybindsY
end
__ec16_draw_round_rect(x1-1,y1-1,x1+width+1,y1+height+1,1,0,0.58,0.032,11)
__ec16_draw_round_rect(x1,y1,x1+width,y1+height,0.010,0.009,0.022,0.92,10)
__ec16_draw_round_rect(x1+1,y1+1,x1+width-1,y1+height-1,0.022,0.016,0.040,0.72,9)
__ec16_draw_round_rect(x1+6,y1+6,x1+width-6,y1+28,0.055,0.037,0.110,0.92,7)
__ec16_rect(x1+12,y1+27,x1+width-12,y1+29,1,0,0.58,0.65)
Drawing.DrawTextWithOutline(x1+13+__ec16_text_w("Keybinds")*0.5,y1+11,"Keybinds",0.96,0.86,1,0.96,0,0,0,0.95)
if #activeItems == 0 then
Drawing.DrawTextWithOutline(x1+13+__ec16_text_w("No active binds")*0.5,y1+34,"No active binds",0.47,0.43,0.62,0.78,0,0,0,0.78)
return
end
local it = activeItems[1]
local rowY = y1 + 35 + (1 - anim) * 10
local a = anim
__ec16_draw_round_rect(x1+8,rowY-1,x1+width-8,rowY+21,0.025,0.020,0.048,0.90*a,7)
__ec16_rect(x1+15,rowY+5,x1+23,rowY+13,1,0,0.58,0.95*a)
__ec16_rect(x1+14,rowY+4,x1+24,rowY+14,1,0,0.58,0.08*a)
Drawing.DrawTextWithOutline(x1+31+__ec16_text_w(it.label)*0.5,rowY+3,it.label,0.90,0.86,1,0.96*a,0,0,0,0.86*a)
local keyText = "[" .. tostring(it.key or "?") .. "]"
local keyW = __ec16_text_w(keyText) + 18
local kx2 = x1 + width - 13
local kx1 = kx2 - keyW
__ec16_draw_round_rect(kx1-2,rowY,kx2+2,rowY+21,1,0,0.58,0.10*a,7)
__ec16_draw_round_rect(kx1,rowY+2,kx2,rowY+19,0.035,0.026,0.058,0.98*a,5)
__ec16_draw_round_rect(kx1+1,rowY+3,kx2-1,rowY+18,0.018,0.014,0.030,0.96*a,4)
Drawing.DrawTextWithOutline(kx1+9+__ec16_text_w(keyText)*0.5,rowY+5,keyText,1,0.80,0.98,0.96*a,0,0,0,0.85*a)
end
function __ec16_apply_team_check_safe()
local enabled = false
local sticky = false
pcall(function() enabled = UIManager.GetCheckboxValue("ap_team_main") == true end)
pcall(function() sticky = UIManager.GetCheckboxValue("ap_sticky_main") == true end)
pcall(function() if cheat and cheat.aimbot then cheat.aimbot.team_check = enabled; cheat.aimbot.sticky_aim = sticky end end)
pcall(function() if cheat and cheat.silent_aim then cheat.silent_aim.team_check = enabled; cheat.silent_aim.sticky_aim = sticky end end)
pcall(function() if cheat and cheat.triggerbot then cheat.triggerbot.team_check = enabled end end)
end
function __ec16_draw_round_rect(a,b,c,d,r,g,bb,aa,rad)
if __ec16_rect then __ec16_rect(a,b,c,d,r,g,bb,aa or 1) end
end
function __ec16_draw_status_bars_icon(x,y)
for i=0,3 do
local h = 5 + i * 4
__ec16_rect(x + i*5, y + 18 - h, x + i*5 + 3, y + 18, 1, 0, 0.58, 0.95)
end
end
function __ec16_draw_wifi_icon(x,y)
Drawing.DrawCircle(x+10,y+14,10,1,0,0.58,0.85,2)
Drawing.DrawCircle(x+10,y+14,7,1,0,0.58,0.85,2)
Drawing.DrawCircle(x+10,y+14,4,1,0,0.58,0.85,2)
Drawing.DrawCircleFilled(x+10,y+18,2,1,0,0.58,0.95)
end
function __ec16_update_fps()
local now = tick()
__EC16.fpsLast = __EC16.fpsLast or now
__EC16.fpsFrames = (__EC16.fpsFrames or 0) + 1
__EC16.fpsValue = __EC16.fpsValue or 0
local dt = now - __EC16.fpsLast
if dt >= 0.45 then
__EC16.fpsValue = math.floor((__EC16.fpsFrames / dt) + 0.5)
__EC16.fpsFrames = 0
__EC16.fpsLast = now
end
end
function __ec16_draw_top_hud(mx,my,cl)
if not __EC16 then return end
__ec16_update_fps()
local x = __EC16.hudX or 18
local y = __EC16.hudY or 14
local w, h = 170, 38
if __ec16_in(mx,my,x,y,x+w,y+h) and cl and not __EC16.lastClick then
__EC16.hudDragging = true
__EC16.hudDragX = mx - x
__EC16.hudDragY = my - y
end
if not cl then __EC16.hudDragging = false end
if __EC16.hudDragging then
__EC16.hudX = mx - (__EC16.hudDragX or 0)
__EC16.hudY = my - (__EC16.hudDragY or 0)
x = __EC16.hudX
y = __EC16.hudY
end
__ec16_draw_round_rect(x-1,y-1,x+w+1,y+h+1,1,0,0.58,0.032,14)
__ec16_draw_round_rect(x,y,x+w,y+h,0.010,0.009,0.022,0.88,14)
__ec16_draw_round_rect(x+1,y+1,x+w-1,y+h-1,0.024,0.018,0.043,0.66,13)
-- v18: removed duplicated HUD logo text
__ec16_rect(x+78,y+7,x+80,y+h-7,1,0,0.58,0.78)
local fps = tostring(__EC16.fpsValue or 0) .. " FPS"
__ec16_draw_status_bars_icon(x+96,y+9)
Drawing.DrawTextWithOutline(x+120+__ec16_text_w(fps)*0.5,y+12,fps,0.92,0.90,1,0.95,0,0,0,0.95)
end

-- FALLEN additions: Fullbright Overlay
UIManager.CreateSeparator("ec_extra_sep")
UIManager.SetElementParent("ec_extra_sep", TAB_ID)
UIManager.CreateText("ec_fullbright_title", "Fullbright")
UIManager.SetElementParent("ec_fullbright_title", TAB_ID)
UIManager.CreateCheckbox("ec_fullbright_enabled", "Fullbright Overlay", false)
UIManager.SetElementParent("ec_fullbright_enabled", TAB_ID)
UIManager.CreateSliderInt("ec_fullbright_opacity", "Fullbright Opacity", 0, 80, 20)
UIManager.SetElementParent("ec_fullbright_opacity", TAB_ID)
UIManager.CreateColorPicker("ec_fullbright_color", "Fullbright Color", 1, 1, 1, 1)
UIManager.SetElementParent("ec_fullbright_color", TAB_ID)
function ec_fullbright_tick()
if UIManager.GetCheckboxValue("ec_fullbright_enabled") ~= true then return end
local s = ScreenSize()
if not s then return end
local w = s.Width or s.X or 1920
local h = s.Height or s.Y or 1080
local c = UIManager.GetColorPickerValue("ec_fullbright_color") or {r=1,g=1,b=1,a=1,[1]=1,[2]=1,[3]=1,[4]=1}
local r = c.r or c[1] or 1
local g = c.g or c[2] or 1
local b = c.b or c[3] or 1
local a = (UIManager.GetSliderIntValue("ec_fullbright_opacity") or 20) / 100
if a < 0 then a = 0 end
if a > 0.80 then a = 0.80 end
Drawing.DrawBoxFilled(0, 0, w, h, r, g, b, a)
end
hooks.on_render(function()
pcall(ec_fullbright_tick)
end)

hooks.on_render(function()
local mx,my=__ec16_mouse(); local cl=__ec16_click(); local s=ScreenSize()
if not s then return end
local menuKeyDown = false
local pressedVk = nil
pcall(function()
pressedVk = __ec16_poll_menu_bind_key()
if __EC16.menuBindWaiting and pressedVk and pressedVk ~= 0x01 then
__EC16.menuBindKey = pressedVk
__EC16.menuBindWaiting = false
notify("Menu bind: " .. __ec16_vk_name(pressedVk), "success")
end
menuKeyDown = Windows and Windows.IsKeyPressed and Windows.IsKeyPressed(__EC16.menuBindKey or 0xA1)
end)
if __EC16_MENU_ALLOWED and (not __EC16.menuBindWaiting) and menuKeyDown and not __EC16.rshiftDown then
if __EC16.wantOpen == nil then __EC16.wantOpen = __EC16.open end
__EC16.wantOpen = not __EC16.wantOpen
if __EC16.wantOpen then
__EC16.open = true
__EC16.animDir = 1
__EC16.anim = 0
else
__EC16.animDir = -1
__EC16.anim = 1
end
end
__EC16.rshiftDown = menuKeyDown
local w=s.Width or s.X or 1920; local h=s.Height or s.Y or 1080; local cx=w*0.5; local cy=h*0.5
if __EC16.phase=="hidden" then __EC16.lastClick=cl return end
if __EC16.phase=="loader" then __ec16_loader(mx,my,cl,w,h,cx,cy); __EC16.lastClick=cl return end
if __EC16.phase=="loading" then __ec16_loading(w,h,cx,cy); __EC16.lastClick=cl return end
if __EC16.phase=="intro" then __ec16_intro(w,h,cx,cy); __EC16.lastClick=cl return end
if __EC16.phase=="menu" then
__ec16_apply_team_check_safe()
__ec16_update_rainbow_fov()
__ec16_draw_player_armor_esp()
__ec16_draw_top_hud(mx,my,cl)
__ec16_menu(mx,my,cl,w,h)
__ec16_draw_keybinds_panel(w,h,mx,my,cl)
__ec16_draw_moderator_panel(w,h,mx,my,cl)
__EC16.lastClick=cl
return
end
__EC16.lastClick=cl
end)
notify("FALLEN Fallen menu v75 original UI + armor cache loaded","success")
end
__ec16_install()




--[[
Fallen visual patch v11
- Restores transparent glass menu using the uploaded file palette.
- Fixes local avatar card with better fallback silhouette.
- Keeps smooth toggles/sliders/FPS from v10 and improves HUD quality.
]]

do
    __EC_PINK_R = 1.00
    __EC_PINK_G = 0.00
    __EC_PINK_B = 0.55
    __EC_PINK_SOFT_R = 1.00
    __EC_PINK_SOFT_G = 0.18
    __EC_PINK_SOFT_B = 0.72

    local function ec11_c(v, lo, hi)
        if v < lo then return lo end
        if v > hi then return hi end
        return v
    end
    local function ec11_lerp(a,b,t)
        t = ec11_c(t or 0,0,1)
        return a + (b-a)*t
    end
    local function ec11_w(s)
        if __ec16_text_w then return __ec16_text_w(tostring(s or "")) end
        return #(tostring(s or ""))*7
    end
    local function ec11_txt_left(x,y,text,r,g,b,a)
        text = tostring(text or "")
        Drawing.DrawTextWithOutline(x + ec11_w(text)*0.5, y, text, r or 0.95,g or 0.92,b or 1,a or 1, 0,0,0,0.92*(a or 1))
    end
    local function ec11_rr(x1,y1,x2,y2,r,g,b,a,rad)
        if __ec16_draw_round_rect then
            __ec16_draw_round_rect(x1,y1,x2,y2,r,g,b,a,rad)
            return
        end
        rad = math.floor(math.min(rad or 8, (x2-x1)*0.5, (y2-y1)*0.5))
        if rad < 1 then __ec16_rect(x1,y1,x2,y2,r,g,b,a) return end
        __ec16_rect(x1+rad,y1,x2-rad,y2,r,g,b,a)
        __ec16_rect(x1,y1+rad,x2,y2-rad,r,g,b,a)
        Drawing.DrawCircleFilled(x1+rad,y1+rad,rad,r,g,b,a)
        Drawing.DrawCircleFilled(x2-rad,y1+rad,rad,r,g,b,a)
        Drawing.DrawCircleFilled(x1+rad,y2-rad,rad,r,g,b,a)
        Drawing.DrawCircleFilled(x2-rad,y2-rad,rad,r,g,b,a)
    end
    local function ec11_theme()
        return {
            bg={0.030,0.025,0.070}, pane={0.058,0.047,0.118}, card={0.080,0.064,0.155},
            accent={__EC_PINK_R or 1, __EC_PINK_G or 0, __EC_PINK_B or 0.55},
            soft={__EC_PINK_SOFT_R or 1, __EC_PINK_SOFT_G or 0.18, __EC_PINK_SOFT_B or 0.72},
            text={0.92,0.89,1.00}, dim={0.60,0.55,0.76}, stroke={0.15,0.115,0.255}
        }
    end
    local function ec11_state()
        __EC16 = __EC16 or {}
        __EC16.v11 = __EC16.v11 or { frames=0, last=tick and tick() or 0, rawFps=0, smoothFps=0, smoothMs=0, avatarIndex=1 }
        return __EC16.v11
    end
    local function ec11_update_fps()
        local st = ec11_state()
        local now = tick and tick() or 0
        st.frames = (st.frames or 0) + 1
        st.last = st.last or now
        local dt = now - st.last
        if dt >= 0.22 then
            st.rawFps = (st.frames or 0) / math.max(dt, 0.001)
            st.frames = 0
            st.last = now
        end
        if (st.smoothFps or 0) <= 1 then st.smoothFps = st.rawFps or 0 end
        st.smoothFps = ec11_lerp(st.smoothFps or 0, st.rawFps or 0, 0.055)
        st.smoothMs = ec11_lerp(st.smoothMs or 0, 1000 / math.max(st.smoothFps or 1, 1), 0.055)
        __EC16.fpsValue = math.floor((st.smoothFps or 0) + 0.5)
        __EC16.msValue = math.floor((st.smoothMs or 0) + 0.5)
    end
    local function ec11_username()
        local name = "Player"
        pcall(function()
            local lp = rbx and rbx.local_player and rbx.local_player()
            if lp and lp.get_name then
                local n = lp:get_name()
                if n and n ~= "" then name = tostring(n) end
            end
        end)
        pcall(function()
            if name == "Player" and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.Name then name = tostring(lp.Name) end
            end
        end)
        return name
    end
    local function ec11_userid()
        local uid=nil
        pcall(function()
            if GetLocalPlayer then
                local lp=GetLocalPlayer()
                if lp and lp.UserId then uid=tonumber(lp.UserId) end
            end
        end)
        pcall(function()
            if not uid and rbx and rbx.local_player then
                local lp=rbx.local_player()
                if lp and lp.user_id then uid=tonumber(lp:user_id()) end
            end
        end)
        return uid
    end
    local function ec11_avatar_handle()
        local st = ec11_state()
        local uid = ec11_userid()
        if not uid or uid == 0 then return nil end
        if st.avatarUid ~= uid then
            st.avatarUid = uid
            st.avatarHandle = nil
            st.avatarIndex = 1
            st.avatarRequestedMeta = false
            st.avatarRetry = 0
        end
        if st.avatarHandle and Drawing.IsImageReady and Drawing.IsImageReady(st.avatarHandle) then return st.avatarHandle end
        if st.avatarHandle and Drawing.IsImageFailed and Drawing.IsImageFailed(st.avatarHandle) then
            st.avatarHandle = nil
            st.avatarIndex = (st.avatarIndex or 1) + 1
            st.avatarRetry = (tick and tick() or 0) + 0.75
        end
        local now = tick and tick() or 0
        if st.avatarHandle or now < (st.avatarRetry or 0) then return st.avatarHandle end
        local directUrls = {
            "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(uid) .. "&width=150&height=150&format=png",
            "https://www.roblox.com/bust-thumbnail/image?userId=" .. tostring(uid) .. "&width=150&height=150&format=png"
        }
        -- Best route: fetch JSON once and use the real imageUrl CDN link.
        if (not st.avatarRequestedMeta) and Http and Http.get and Json and Json.decode then
            st.avatarRequestedMeta = true
            pcall(function()
                local meta = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. tostring(uid) .. "&size=150x150&format=Png&isCircular=false"
                local ok, status, body = Http.get(meta, { timeout_ms = 4500 })
                if ok and status == 200 and body then
                    local j = Json.decode(body)
                    local row = j and j.data and j.data[1]
                    if row and type(row.imageUrl) == "string" and row.imageUrl ~= "" then
                        st.avatarHandle = Drawing.LoadImage(row.imageUrl)
                        st.avatarRetry = now + 1.0
                    end
                end
            end)
            if st.avatarHandle then return st.avatarHandle end
        end
        local url = directUrls[math.min(st.avatarIndex or 1, #directUrls)]
        pcall(function() if Drawing and Drawing.LoadImage then st.avatarHandle = Drawing.LoadImage(url) end end)
        st.avatarRetry = now + 1.2
        return st.avatarHandle
    end
    local function ec11_fallback_avatar(x,y,s,name,theme)
        ec11_rr(x,y,x+s,y+s,0.080,0.064,0.155,0.80,8)
        ec11_rr(x+2,y+2,x+s-2,y+s-2,0.022,0.020,0.046,0.72,7)
        Drawing.DrawCircleFilled(x+s*0.50, y+s*0.34, s*0.16, theme.accent[1],theme.accent[2],theme.accent[3],0.90)
        Drawing.DrawCircleFilled(x+s*0.50, y+s*0.34, s*0.24, theme.accent[1],theme.accent[2],theme.accent[3],0.10)
        ec11_rr(x+s*0.25, y+s*0.58, x+s*0.75, y+s*0.82, theme.accent[1],theme.accent[2],theme.accent[3],0.55,8)
        local letter = string.upper(string.sub(tostring(name or "P"),1,1))
        ec11_txt_left(x+s*0.5-ec11_w(letter)*0.5, y+s*0.25, letter, 1,1,1,0.92)
    end
    local function ec11_draw_avatar_overlay()
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then return end
        local theme = ec11_theme()
        local reveal = __ec16_sm and __ec16_sm(__EC16.anim or 1) or (__EC16.anim or 1)
        local x = __EC16.x or 95
        local y = __EC16.y or 70
        local sideX = x + 26
        local sideY = y + 90
        local avatarX = sideX + 12
        local avatarY = sideY + 12
        local cardW, cardH = 154, 48
        local name = ec11_username()
        ec11_rr(avatarX-1, avatarY-1, avatarX+cardW+1, avatarY+cardH+1, theme.accent[1],theme.accent[2],theme.accent[3],0.06*reveal,8)
        ec11_rr(avatarX, avatarY, avatarX+cardW, avatarY+cardH, theme.card[1],theme.card[2],theme.card[3],0.72*reveal,7)
        ec11_rr(avatarX+1, avatarY+1, avatarX+cardW-1, avatarY+cardH-1, theme.bg[1],theme.bg[2],theme.bg[3],0.58*reveal,6)
        local avs = 34
        local handle = ec11_avatar_handle()
        if handle and Drawing.IsImageReady and Drawing.IsImageReady(handle) then
            ec11_rr(avatarX+7,avatarY+7,avatarX+7+avs,avatarY+7+avs,0.022,0.020,0.046,0.90,7)
            Drawing.DrawImage(handle, avatarX+7, avatarY+7, avs, avs)
        else
            ec11_fallback_avatar(avatarX+7, avatarY+7, avs, name, theme)
        end
        if #name > 14 then name = string.sub(name,1,14) .. "..." end
        ec11_txt_left(avatarX+50, avatarY+9, name, theme.text[1],theme.text[2],theme.text[3],0.98*reveal)
        ec11_txt_left(avatarX+50, avatarY+25, "Local player", theme.dim[1],theme.dim[2],theme.dim[3],0.86*reveal)
        __ec16_rect(avatarX+50, avatarY+41, avatarX+cardW-12, avatarY+43, theme.accent[1],theme.accent[2],theme.accent[3],0.94*reveal)
    end

    function __ec16_draw_top_hud(mx,my,cl)
        ec11_update_fps()
        if not (__EC16 and __EC16.phase == "menu") then return end
        local theme = ec11_theme()
        local x = __EC16.hudX or 18
        local y = __EC16.hudY or 14
        local w,h = 238,40
        if __ec16_in(mx,my,x,y,x+w,y+h) and cl and not (__EC16 and __EC16.lastClick) then
            __EC16.hudDragging=true; __EC16.hudDragX=mx-x; __EC16.hudDragY=my-y
        end
        if not cl then __EC16.hudDragging=false end
        if __EC16.hudDragging then x=mx-(__EC16.hudDragX or 0); y=my-(__EC16.hudDragY or 0); __EC16.hudX=x; __EC16.hudY=y end
        local fps = tostring(__EC16.fpsValue or 0) .. " fps"
        local ms = tostring(__EC16.msValue or 0) .. " ms"
        ec11_rr(x-1,y-1,x+w+1,y+h+1,theme.accent[1],theme.accent[2],theme.accent[3],0.055,13)
        ec11_rr(x,y,x+w,y+h,theme.pane[1],theme.pane[2],theme.pane[3],0.58,12)
        ec11_rr(x+1,y+1,x+w-1,y+h-1,theme.bg[1],theme.bg[2],theme.bg[3],0.48,11)
        Drawing.DrawCircleFilled(x+16,y+20,4,theme.accent[1],theme.accent[2],theme.accent[3],0.95)
        Drawing.DrawCircle(x+16,y+20,8,theme.accent[1],theme.accent[2],theme.accent[3],0.20,1.3)
        ec11_txt_left(x+28,y+12,"Eclipze",theme.text[1],theme.text[2],theme.text[3],0.98)
        __ec16_rect(x+116,y+9,x+118,y+h-9,theme.stroke[1],theme.stroke[2],theme.stroke[3],0.55)
        ec11_txt_left(x+130,y+12,fps,theme.text[1],theme.text[2],theme.text[3],0.94)
        ec11_txt_left(x+188,y+12,ms,theme.dim[1],theme.dim[2],theme.dim[3],0.88)
        __ec16_rect(x+13,y+h-7,x+w-13,y+h-5,theme.accent[1],theme.accent[2],theme.accent[3],0.48)
    end

    hooks.on_render(function()
        pcall(ec11_update_fps)
        pcall(ec11_draw_avatar_overlay)
    end)

    notify("Fallen v11 transparent glass fix loaded", "success")
end


function __ec16_menu(mx,my,cl,w,h) -- v11 transparent override
if not __EC16.open then return end
__EC16.mainTab = __EC16.mainTab or "aim"
__EC16.aimSection = __EC16.aimSection or "General"
__EC16.espSection = __EC16.espSection or "Armor"
__EC16.noclipSection = __EC16.noclipSection or "Noclip"
local speed = 0.075
if __EC16.animDir == -1 then
__EC16.anim = __ec16_c((__EC16.anim or 1) - speed, 0, 1)
if __EC16.anim <= 0.01 then
__EC16.open = false
__EC16.anim = 0
return
end
else
__EC16.anim = __ec16_c((__EC16.anim or 0) + speed, 0, 1)
end
local reveal = __ec16_sm(__EC16.anim)
local x = __EC16.x
local y = __EC16.y
local ww = __EC16.w
local hh = __EC16.h * reveal
local x2 = x + ww
local y2 = y + hh
if hh < 90 then return end
if __ec16_in(mx,my,x,y,x+ww,y+36) and cl and not __EC16.lastClick then
__EC16.dragging = true
__EC16.dragX = mx - __EC16.x
__EC16.dragY = my - __EC16.y
end
if not cl then __EC16.dragging = false end
if __EC16.dragging then
__EC16.x = mx - __EC16.dragX
__EC16.y = my - __EC16.dragY
x = __EC16.x
y = __EC16.y
x2 = x + ww
y2 = y + hh
end
local bgR,bgG,bgB = 0.026,0.022,0.060
local paneR,paneG,paneB = 0.050,0.040,0.105
local boxR,boxG,boxB = 0.068,0.052,0.135
local edgeR,edgeG,edgeB = 0.125,0.095,0.225
local accR,accG,accB = 1.00,0.00,0.55
local softR,softG,softB = 0.74,0.69,0.88
local dimR,dimG,dimB = 0.48,0.43,0.64
local function rect(a,b,c,d,r,g,bb,aa) __ec16_rect(a,b,c,d,r,g,bb,aa or 1) end
local function out(a,b,c,d,r,g,bb,aa,t) __ec16_out(a,b,c,d,r,g,bb,aa or 1,t or 1) end
local function round_rect(a,b,c,d,r,g,bb,aa,rad)
rect(a,b,c,d,r,g,bb,aa)
end
local function text_left(tx,ty,msg,a)
msg = tostring(msg or "")
Drawing.DrawTextWithOutline(tx + __ec16_text_w(msg) * 0.5, ty, msg, 0.92,0.89,1.00,a or 1,0,0,0,0.95)
end
local function dim_left(tx,ty,msg,a)
msg = tostring(msg or "")
Drawing.DrawTextWithOutline(tx + __ec16_text_w(msg) * 0.5, ty, msg, dimR,dimG,dimB,a or 0.95,0,0,0,0.9)
end
local function group(gx,gy,gw,gh,title)
round_rect(gx-1,gy-1,gx+gw+1,gy+gh+1,1.00,0.00,0.58,0.050,8)
round_rect(gx,gy,gx+gw,gy+gh,boxR,boxG,boxB,0.58,8)
round_rect(gx+1,gy+1,gx+gw-1,gy+gh-1,0.020,0.018,0.040,0.44,7)
round_rect(gx+1,gy+1,gx+gw-1,gy+24,0.090,0.060,0.175,0.64,7)
rect(gx+10,gy+22,gx+gw-10,gy+24,1.00,0.00,0.58,0.58)
Drawing.DrawTextWithOutline(gx+12 + __ec16_text_w(title) * 0.5, gy+7, title, 0.94,0.89,1.00,0.98,0,0,0,0.9)
end
local function get_username()
local name = "Player"
pcall(function()
local lp = rbx and rbx.local_player and rbx.local_player()
if lp and lp.get_name then
local n = lp:get_name()
if n and n ~= "" then name = n end
end
end)
pcall(function()
if name == "Player" and GetLocalPlayer then
local lp = GetLocalPlayer()
if lp and lp.Name then name = lp.Name end
end
end)
return tostring(name)
end
local function get_userid()
local uid = nil
pcall(function()
if GetLocalPlayer then
local lp = GetLocalPlayer()
if lp and lp.UserId then uid = lp.UserId end
end
end)
pcall(function()
if not uid and rbx and rbx.local_player then
local lp = rbx.local_player()
if lp and lp.user_id then uid = lp:user_id() end
end
end)
return uid
end
local function get_avatar_handle()
local uid = get_userid()
if not uid then return nil end
if __EC16.avatarUid ~= uid then
__EC16.avatarUid = uid
__EC16.avatarUrl = nil
__EC16.avatarHandle = nil
__EC16.avatarFailed = false
__EC16.avatarRequested = false
__EC16.avatarRequestAt = nil
__EC16.avatarNextRetry = nil
end
if __EC16.avatarHandle then
return __EC16.avatarHandle
end
if __EC16.avatarFailed and __EC16.avatarNextRetry and tick and tick() < __EC16.avatarNextRetry then
return nil
end
if (not __EC16.avatarRequested) then
__EC16.avatarRequested = true
pcall(function()
local cachePath = "C:\\blueberry\\scripts\\ec16_avatar_" .. tostring(uid) .. ".txt"
local cached = nil
if read_file then cached = read_file(cachePath) end
if cached then
cached = tostring(cached)
cached = string.gsub(cached, "^%s+", "")
cached = string.gsub(cached, "%s+$", "")
if string.find(cached, "^https?://") then
__EC16.avatarUrl = cached
__EC16.avatarHandle = Drawing.LoadImage(cached)
return
end
end
if not (Http and Http.get and Json and Json.decode and Drawing and Drawing.LoadImage) then
__EC16.avatarFailed = true
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
return
end
local metaUrl = nil
if Http.roblox_avatar_headshot_url then
metaUrl = Http.roblox_avatar_headshot_url(uid, "150x150", "Png", false)
else
metaUrl = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. tostring(uid) .. "&size=150x150&format=Png&isCircular=false"
end
local ok, status, body = Http.get(metaUrl, { timeout_ms = 4500 })
if (not ok) or status ~= 200 or not body then
__EC16.avatarFailed = true
__EC16.avatarRequested = false
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
return
end
local j = Json.decode(body)
local row = j and j.data and j.data[1]
local imageUrl = row and row.imageUrl
if type(imageUrl) ~= "string" or imageUrl == "" then
__EC16.avatarFailed = true
__EC16.avatarRequested = false
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
return
end
__EC16.avatarUrl = imageUrl
if write_file then write_file(cachePath, imageUrl) end
__EC16.avatarHandle = Drawing.LoadImage(imageUrl)
end)
end
if __EC16.avatarHandle and Drawing.IsImageFailed and Drawing.IsImageFailed(__EC16.avatarHandle) then
__EC16.avatarHandle = nil
__EC16.avatarFailed = true
__EC16.avatarRequested = false
__EC16.avatarNextRetry = (tick and tick() or 0) + 30
end
return __EC16.avatarHandle
end

local function neon_shell(a,b,c,d,rad)
round_rect(a-1,b-1,c+1,d+1,1.00,0.00,0.58,0.032,rad+1)
round_rect(a,b,c,d,0.090,0.068,0.165,0.56,rad)
round_rect(a+1,b+1,c-1,d-1,bgR,bgG,bgB,0.42,rad-1)
end
neon_shell(x,y,x2,y2,14)
-- v11 subtle glass shine
rect(x+2,y+2,x2-2,y+26,0.10,0.075,0.18,0.12 * reveal)
rect(x+18,y2-21,x2-18,y2-19,accR,accG,accB,0.32 * reveal)
round_rect(x+7,y+7,x2-7,y+37,0.070,0.050,0.145,0.54,10)
rect(x+10,y+35,x2-10,y+37,accR,accG,accB,0.88)
-- v18: removed duplicated header logo text
local tabs = {
{id="aim", label="AIM", w=88},
{id="esp", label="FALLEN ESP", w=132},
{id="noclip", label="NOCLIP", w=102}
}
local tx = x + 18
local ty = y + 45
for _,tb in ipairs(tabs) do
local active = (__EC16.mainTab == tb.id)
local hov = __ec16_in(mx,my,tx,ty,tx+tb.w,ty+25)
if hov and cl and not __EC16.lastClick then __EC16.mainTab = tb.id end
if active then
round_rect(tx-1,ty-1,tx+tb.w+1,ty+26,1.00,0.00,0.58,0.08,7)
round_rect(tx,ty,tx+tb.w,ty+25,0.125,0.083,0.225,0.72,6)
rect(tx+8,ty+22,tx+tb.w-8,ty+24,accR,accG,accB,1)
Drawing.DrawTextWithOutline(tx+10 + __ec16_text_w(tb.label) * 0.5, ty+7, tb.label, 1,0.82,0.96,1,0,0,0,1)
else
round_rect(tx,ty,tx+tb.w,ty+25,0.050,0.040,0.100,hov and 0.62 or 0.38,6)
Drawing.DrawTextWithOutline(tx+10 + __ec16_text_w(tb.label) * 0.5, ty+7, tb.label, 0.60,0.54,0.76,hov and 0.95 or 0.78,0,0,0,0.95)
end
tx = tx + tb.w + 6
end
local paneX = x + 14
local paneY = y + 78
local paneX2 = x2 - 14
local paneY2 = y2 - 14
round_rect(paneX,paneY,paneX2,paneY2,0.070,0.055,0.135,0.44,12)
round_rect(paneX+1,paneY+1,paneX2-1,paneY2-1,paneR,paneG,paneB,0.36,11)
local sideW = 178
local sideX = paneX + 12
local sideY = paneY + 12
local sideY2 = paneY2 - 12
round_rect(sideX,sideY,sideX+sideW,sideY2,0.060,0.046,0.118,0.38,10)
round_rect(sideX+1,sideY+1,sideX+sideW-1,sideY2-1,0.024,0.022,0.048,0.28,9)
local avatarX = sideX + 12
local avatarY = sideY + 12
local avatarS = 30
-- v16: transparent local-card, no heavy square behind avatar.
round_rect(avatarX,avatarY,sideX+sideW-12,avatarY+46,0.038,0.030,0.082,0.20,7)
rect(avatarX+52,avatarY+39,sideX+sideW-24,avatarY+41,accR,accG,accB,0.58)
local uname = get_username()
local avatar = get_avatar_handle()
Drawing.DrawCircleFilled(avatarX+22, avatarY+22, 16, accR, accG, accB, 0.11)
Drawing.DrawCircleFilled(avatarX+22, avatarY+19, 5, 0.94,0.90,1.00,0.82)
round_rect(avatarX+13, avatarY+27, avatarX+31, avatarY+35, 0.94,0.90,1.00,0.74,4)
if avatar then pcall(function() Drawing.DrawImage(avatar, avatarX+7, avatarY+7, avatarS, avatarS) end) end
Drawing.DrawTextWithOutline(avatarX+52 + __ec16_text_w(uname) * 0.5, avatarY+9, uname, 0.93,0.90,1.00,0.96,0,0,0,0.90)
Drawing.DrawTextWithOutline(avatarX+52 + __ec16_text_w("Local player") * 0.5, avatarY+25, "Local player", softR,softG,softB,0.82,0,0,0,0.82)
local sections = {}
if __EC16.mainTab == "aim" then
sections = {"General","Target","TP","Tracers","Aura"}
elseif __EC16.mainTab == "noclip" then
sections = {"Noclip"}
else
sections = {"Armor","World","Loot","Base","Misc","Moderator List","Info"}
end
local curSection = __EC16.espSection
if __EC16.mainTab == "aim" then curSection = __EC16.aimSection end
if __EC16.mainTab == "noclip" then curSection = __EC16.noclipSection end
local secY = avatarY + 62
for _,name in ipairs(sections) do
local active = (curSection == name)
local ix1 = sideX + 10
local ix2 = sideX + sideW - 10
local iy1 = secY
local iy2 = secY + 26
local hov = __ec16_in(mx,my,ix1,iy1,ix2,iy2)
if hov and cl and not __EC16.lastClick then
if __EC16.mainTab == "aim" then __EC16.aimSection = name elseif __EC16.mainTab == "noclip" then __EC16.noclipSection = name else __EC16.espSection = name end
curSection = name
end
if active then
round_rect(ix1-1,iy1-1,ix2+1,iy2+1,1.00,0.00,0.58,0.040,7)
round_rect(ix1,iy1,ix2,iy2,0.075,0.058,0.145,0.58,6)
rect(ix1,iy1,ix1+3,iy2,accR,accG,accB,1)
Drawing.DrawTextWithOutline(ix1+14 + __ec16_text_w(name) * 0.5, iy1+7, name, 0.92,0.88,1.00,0.98,0,0,0,0.95)
else
round_rect(ix1,iy1,ix2,iy2,hov and 0.060 or 0.048,hov and 0.046 or 0.038,hov and 0.110 or 0.092,hov and 0.50 or 0.30,6)
Drawing.DrawTextWithOutline(ix1+14 + __ec16_text_w(name) * 0.5, iy1+7, name, 0.58,0.52,0.74,hov and 0.94 or 0.80,0,0,0,0.9)
end
secY = secY + 31
end
local contentX = sideX + sideW + 14
local contentY = sideY
local contentX2 = paneX2 - 12
local contentY2 = sideY2
round_rect(contentX,contentY,contentX2,contentY2,0.040,0.032,0.085,0.32,8)
out(contentX,contentY,contentX2,contentY2,0.22,0.16,0.38,0.34,1)
local innerGap = 14
local contentW = contentX2 - contentX
local colW = math.floor((contentW - innerGap * 4) / 3)
local c1 = contentX + innerGap
local c2 = c1 + colW + innerGap
local c3 = c2 + colW + innerGap
local sy = contentY + 18
local function check(gx,gy,label,id) __ec16_check(mx,my,cl,gx,gy,label,id) end
local function slider(gx,gy,wid,label,id,minv,maxv) __ec16_slider(mx,my,cl,gx,gy,wid,label,id,minv,maxv) end
if __EC16.mainTab == "aim" then
if curSection == "General" then
group(c1,sy,colW,260,"Aimbot")
check(c1+18,sy+42,"Aimbot","ap_aim_enable_fixed_click")
check(c1+18,sy+72,"Prediction","ap_prediction_main")
check(c1+18,sy+102,"Team Check","ap_team_main")
check(c1+18,sy+132,"Sticky Aim","ap_sticky_main")
__EC16.keybindsPanel = __ec16_bool_check(mx,my,cl,c1+18,sy+162,"Keybind Panel",__EC16.keybindsPanel)
group(c3,sy,colW,495,"FOV")
check(c3+18,sy+42,"FOV Enabled","ap_fov_show_main")
__EC16.rainbowFov = __ec16_bool_check(mx,my,cl,c3+18,sy+72,"Rainbow FOV",__EC16.rainbowFov)
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+112,colW-36,"FOV Color","fov")
slider(c3+18,sy+190,colW-36,"FOV Size","ap_fov_main",50,600)
slider(c3+18,sy+247,colW-36,"FOV Transparency","ap_fov_alpha_main",0,100)
local fovStyleExtraGen = __ec16_fov_style_dropdown(mx,my,cl,c3+18,sy+304,colW-36) or 0
if fovStyleExtraGen > 50 then fovStyleExtraGen = 50 end
__EC16.rainbowFovSpeed = __ec16_float_slider(mx,my,cl,c3+18,sy+408+fovStyleExtraGen,colW-36,"Rainbow Speed",__EC16.rainbowFovSpeed,0.2,8)
elseif curSection == "Target" then
group(c1,sy,colW,310,"Target")
slider(c1+18,sy+42,colW-36,"Max Distance","ap_maxdist_main",50,3000)
check(c1+18,sy+104,"Target Strafe","ap_target_strafe_main")
ap_target_strafe_radius = __ec16_float_slider(mx,my,cl,c1+18,sy+145,colW-36,"Strafe Radius",ap_target_strafe_radius or 4.0,1.0,50.0)
ap_target_strafe_speed = __ec16_float_slider(mx,my,cl,c1+18,sy+205,colW-36,"Strafe Speed",ap_target_strafe_speed or 280,50,700)
group(c2,sy,colW,168,"Keybind")
__ec16_keybind(mx,my,cl,c2+18,sy+42,"Aimbot Keybind")
if __EC16.armorEspAllSlots == nil then __EC16.armorEspAllSlots = true end
elseif curSection == "TP" then
group(c1,sy,colW,430,"Aimlock TP")
check(c1+18,sy+38,"Left TP","ap_left_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+68,"Left TP Key","left")
check(c1+18,sy+122,"Right TP","ap_right_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+152,"Right TP Key","right")
check(c1+18,sy+206,"90 Left TP","ap_90_left_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+236,"90 Left Key","90_left")
check(c1+18,sy+290,"90 Right TP","ap_90_right_tp_enabled")
__ec16_tp_keybind(mx,my,cl,c1+18,sy+320,"90 Right Key","90_right")
slider(c1+18,sy+374,colW-36,"TP Distance","ap_side_tp_distance",1,80)
elseif curSection == "Tracers" then
if EC_BT == nil then EC_BT = {} end
EC_BT.life = EC_BT.life or 4.0
EC_BT.alpha = EC_BT.alpha or 1.0
EC_BT.maxDist = EC_BT.maxDist or 1000
if EC_BT.instant == nil then EC_BT.instant = true end
-- From Weapon 3D offset was unreliable in this API, so use stable screen-space lower offset.
EC_BT.weaponOrigin = false
EC_BT.screenStraight = true
EC_BT.revealTime = EC_BT.revealTime or 0.55
EC_BT.weaponSide = EC_BT.weaponSide or 0.72
EC_BT.weaponDown = EC_BT.weaponDown or 0.45
EC_BT.weaponForward = EC_BT.weaponForward or 0.55
EC_BT.thick = EC_BT.thick or 2.0
EC_BT.segments = EC_BT.segments or 24
EC_BT.delay = EC_BT.delay or 0.13
EC_BT.realHitOnly = false
EC_BT.onlyOnHit = false
EC_BT.hitRadius = 35

group(c1,sy,colW,485,"Bullet Tracers")
EC_BT.enabled = __ec16_bool_check(mx,my,cl,c1+18,sy+42,"Bullet Tracers",EC_BT.enabled == true)
EC_BT.instant = __ec16_bool_check(mx,my,cl,c1+18,sy+72,"Instant Tracer",EC_BT.instant ~= false)
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+112,colW-36,"Tracer Color","tracer")
EC_BT.alpha = __ec16_float_slider(mx,my,cl,c1+18,sy+190,colW-36,"Tracer Opacity",EC_BT.alpha or 1.0,0.05,1.0)
EC_BT.life = __ec16_float_slider(mx,my,cl,c1+18,sy+250,colW-36,"Tracer Life",EC_BT.life or 4.0,0.10,8.0)
EC_BT.revealTime = __ec16_float_slider(mx,my,cl,c1+18,sy+310,colW-36,"Reveal Time",EC_BT.revealTime or 0.55,0.05,2.50)
EC_BT.maxDist = __ec16_float_slider(mx,my,cl,c1+18,sy+370,colW-36,"Tracer/HitFX Max Dist",EC_BT.maxDist or 1000,100,3000)

group(c2,sy,colW,220,"Style")
local tracerStyleExtra = __ec16_tracer_style_dropdown(mx,my,cl,c2+18,sy+42,colW-36) or 0

group(c3,sy,colW,330,"Hit Effects")
EC_BT.hitfx = __ec16_bool_check(mx,my,cl,c3+18,sy+42,"Hit Effects",EC_BT.hitfx == true)
EC_BT.hitSize = __ec16_float_slider(mx,my,cl,c3+18,sy+82,colW-36,"Hit Effect Size",EC_BT.hitSize or 38,18,96)
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+142,colW-36,"Hit Effect Color","hitfx")
local hitFxStyleExtra = __ec16_hitfx_style_dropdown(mx,my,cl,c3+18,sy+202,colW-36) or 0
elseif curSection == "Aura" then
if __EC16.selfAura == nil then __EC16.selfAura = false end
if __EC16.selfAuraStyle == nil then __EC16.selfAuraStyle = 0 end
group(c1,sy,colW,300,"Self Aura")
__EC16.selfAura = __ec16_bool_check(mx,my,cl,c1+18,sy+42,"Self Aura",__EC16.selfAura == true)
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+92,colW-36,"Aura Upper Color","aura_bottom")
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+170,colW-36,"Aura Lower Color","aura_top")
group(c2,sy,colW,245,"Style")
local auraStyleExtra = __ec16_aura_style_dropdown(mx,my,cl,c2+18,sy+42,colW-36) or 0
elseif curSection == "FOV" then
group(c1,sy,colW,535,"FOV")
check(c1+18,sy+42,"FOV Enabled","ap_fov_show_main")
__EC16.rainbowFov = __ec16_bool_check(mx,my,cl,c1+18,sy+72,"Rainbow FOV",__EC16.rainbowFov)
__ec16_rainbow_slider(mx,my,cl,c1+18,sy+112,colW-36,"FOV Color","fov")
slider(c1+18,sy+190,colW-36,"FOV Size","ap_fov_main",50,600)
slider(c1+18,sy+247,colW-36,"FOV Transparency","ap_fov_alpha_main",0,100)
local fovStyleExtra = __ec16_fov_style_dropdown(mx,my,cl,c1+18,sy+304,colW-36) or 0
if fovStyleExtra > 50 then fovStyleExtra = 50 end
__EC16.rainbowFovSpeed = __ec16_float_slider(mx,my,cl,c1+18,sy+382+fovStyleExtra,colW-36,"Rainbow Speed",__EC16.rainbowFovSpeed,0.2,8)
end
elseif __EC16.mainTab == "noclip" then
if curSection == "Noclip" then
group(c1,sy,colW,118,"Noclip")
__ec16_noclip_keybind(mx,my,cl,c1+18,sy+42,"Noclip Keybind")
end
else
if curSection == "Armor" then
group(c1,sy,colW,252,"Armor")
check(c1+18,sy+42,"Enabled","armoriso_target_enabled")
check(c1+18,sy+72,"Show Weapon Slot","armoriso_show_weapon")
check(c1+18,sy+102,"Rainbow Border","armoriso_rainbow_border")
__EC16.armorEspPlayers = __ec16_bool_check(mx,my,cl,c1+18,sy+132,"Armor ESP on Players",__EC16.armorEspPlayers)
__EC16.playerInfoChecker = __ec16_bool_check(mx,my,cl,c1+18,sy+162,"Player Info Checker",__EC16.playerInfoChecker == true)
__ec16_button(mx,my,cl,c1+18,sy+194,c1+198,sy+234,"Reload Icons","armoriso_reload_icons")
group(c2,sy,colW,392,"Settings")
slider(c2+18,sy+42,colW-36,"Size","armoriso_target_size",20,96)
slider(c2+18,sy+99,colW-36,"Max Distance","armoriso_max_distance",50,3000)
slider(c2+18,sy+156,colW-36,"Glow Power","armoriso_glow_power",0,100)
__EC16.armorEspSize = __ec16_float_slider(mx,my,cl,c2+18,sy+213,colW-36,"Armor ESP Size",__EC16.armorEspSize,10,32)
__EC16.armorEspMaxDist = __ec16_float_slider(mx,my,cl,c2+18,sy+270,colW-36,"Armor ESP Range",__EC16.armorEspMaxDist,100,3000)
__EC16.armorEspSmooth = __ec16_float_slider(mx,my,cl,c2+18,sy+327,colW-36,"Armor ESP Smooth",__EC16.armorEspSmooth,0,50)
__EC16.armorEspAllSlots = true
group(c3,sy,colW,196,"Colors")
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+44,colW-36,"Border Color","armor_border")
__ec16_rainbow_slider(mx,my,cl,c3+18,sy+119,colW-36,"Glow Color","armor_glow")
elseif curSection == "World" then
group(c1,sy,(colW*2)+innerGap,contentY2-sy-14,"World ESP")
slider(c1+18,sy+42,(colW*2)+innerGap-36,"World Range","k1_world_range",25,2000)
__ec16_list(mx,my,cl,c1+18,sy+104,__EC16_WORLD,"k1_",14,22)
group(c3,sy,colW,285,"Options")
check(c3+18,sy+46,"Show Distance","k1_show_distance")
check(c3+18,sy+76,"Show Icons","k1_dropped_item_show_icon")
check(c3+18,sy+106,"Ore Icons","k1_ore_show_icon")
check(c3+18,sy+136,"Fade by Distance","k1_world_fade_distance")
slider(c3+18,sy+178,colW-36,"Icon Size","k1_world_icon_size",10,48)
elseif curSection == "Loot" then
group(c1,sy,(colW*2)+innerGap,contentY2-sy-14,"Loot ESP")
slider(c1+18,sy+42,(colW*2)+innerGap-36,"Loot Range","k1_loot_range",25,2000)
__ec16_list(mx,my,cl,c1+18,sy+104,__EC16_LOOT,"k1_",14,22)
group(c3,sy,colW,235,"Options")
check(c3+18,sy+46,"Show Distance","k1_show_distance")
check(c3+18,sy+76,"Show Icon","k1_loot_show_icon")
check(c3+18,sy+106,"Fade by Distance","k1_loot_fade_distance")
slider(c3+18,sy+148,colW-36,"Icon Size","k1_loot_icon_size",10,48)
elseif curSection == "Base" then
group(c1,sy,(colW*2)+innerGap,contentY2-sy-14,"Base ESP")
slider(c1+18,sy+42,(colW*2)+innerGap-36,"Base Range","k1_base_range",25,2000)
__ec16_list(mx,my,cl,c1+18,sy+112,__EC16_BASE,"k1_",13,22)
group(c3,sy,colW,220,"Options")
check(c3+18,sy+46,"Base Text","k1_base_text")
check(c3+18,sy+76,"Show Distance","k1_show_distance")
__ec16_button(mx,my,cl,c3+18,sy+136,c3+205,sy+178,"Force Rescan","k1_force_rescan")
elseif curSection == "Misc" then
group(c1,sy,colW,236,"Fullbright")
check(c1+18,sy+42,"Fullbright Overlay","ec_fullbright_enabled")
slider(c1+18,sy+85,colW-36,"Opacity","ec_fullbright_opacity",0,80)
group(c2,sy,colW,216,"Info")
elseif curSection == "Moderator List" then
group(c1,sy,colW*3+innerGap*2,contentY2-sy-14,"Moderator List")
text_left(c1+22,sy+42,"Loaded moderator IDs: " .. tostring(#__EC16_MOD_ORDER),0.96)
__EC16.moderatorPanel = __ec16_bool_check(mx,my,cl,c1+22,sy+74,"Floating Moderator Panel",__EC16.moderatorPanel)
local onlineMods = __ec16_get_online_moderators()
if #onlineMods == 0 then
dim_left(c1+22,sy+112,"Not found",0.84)
else
dim_left(c1+22,sy+112,"Detected on server:",0.90)
for i=1,math.min(#onlineMods,8) do
local m = onlineMods[i]
local yy = sy + 140 + (i-1) * 25
round_rect(c1+22,yy-3,c1+430,yy+19,0.035,0.026,0.065,0.90,6)
rect(c1+30,yy+4,c1+38,yy+12,accR,accG,accB,0.95)
text_left(c1+48,yy+1,tostring(m.name or "Player"),0.96)
dim_left(c1+245,yy+1,"ID: " .. tostring(m.uid or "?"),0.86)
end
end
group(c3,sy+118,colW,contentY2-sy-132,"All IDs")
for i=1,math.min(#__EC16_MOD_ORDER,13) do
dim_left(c3+18,sy+148+(i-1)*22,tostring(__EC16_MOD_ORDER[i]),0.78)
end
elseif curSection == "Info" then
group(c1,sy,colW*3+innerGap*2,238,"Info")
text_left(c1+22,sy+42,"",0.96)
dim_left(c1+22,sy+128,"Menu Open Bind",0.86)
__ec16_menu_bind_button(mx,my,cl,c1+22,sy+150)
end
end
end

--[[
Fallen visual patch v13
- Based on v11 transparent menu (no draw-list optimization / no hiding World/Loot/Base lists).
- Adds transparent Keybinds + Moderator List panels.
- Smooth FPS counter with slower interpolation.
- Better avatar overlay drawn after the menu so the local-player icon is always visible.
- Improved switch/slider/buttons visuals without removing features.
]]

do
    local function ec13_c(v, lo, hi)
        if v < lo then return lo end
        if v > hi then return hi end
        return v
    end

    local function ec13_lerp(a, b, t)
        return a + (b - a) * ec13_c(t or 0, 0, 1)
    end

    local function ec13_w(text)
        return __ec16_text_w(tostring(text or ""))
    end

    local function ec13_rect(x1,y1,x2,y2,r,g,b,a)
        __ec16_rect(x1,y1,x2,y2,r,g,b,a or 1)
    end

    local function ec13_rr(x1,y1,x2,y2,r,g,b,a,rad)
        if __ec16_draw_round_rect then
            __ec16_draw_round_rect(x1,y1,x2,y2,r,g,b,a or 1,rad or 8)
            return
        end
        rad = math.floor(math.min(rad or 8, (x2-x1)*0.5, (y2-y1)*0.5))
        if rad < 1 then ec13_rect(x1,y1,x2,y2,r,g,b,a) return end
        ec13_rect(x1+rad,y1,x2-rad,y2,r,g,b,a)
        ec13_rect(x1,y1+rad,x2,y2-rad,r,g,b,a)
        Drawing.DrawCircleFilled(x1+rad,y1+rad,rad,r,g,b,a)
        Drawing.DrawCircleFilled(x2-rad,y1+rad,rad,r,g,b,a)
        Drawing.DrawCircleFilled(x1+rad,y2-rad,rad,r,g,b,a)
        Drawing.DrawCircleFilled(x2-rad,y2-rad,rad,r,g,b,a)
    end

    local function ec13_txt_left(x,y,text,r,g,b,a)
        text = tostring(text or "")
        Drawing.DrawTextWithOutline(x + ec13_w(text) * 0.5, y, text, r or 1, g or 1, b or 1, a or 1, 0,0,0,0.92 * (a or 1))
    end

    local function ec13_txt_center(cx,y,text,r,g,b,a)
        text = tostring(text or "")
        Drawing.DrawTextWithOutline(cx, y, text, r or 1, g or 1, b or 1, a or 1, 0,0,0,0.92 * (a or 1))
    end

    local function ec13_theme()
        return {
            bg      = {0.018, 0.016, 0.040},
            bg2     = {0.026, 0.022, 0.060},
            pane    = {0.045, 0.037, 0.100},
            pane2   = {0.060, 0.046, 0.130},
            card    = {0.055, 0.044, 0.118},
            card2   = {0.030, 0.026, 0.065},
            hover   = {0.090, 0.065, 0.165},
            accent  = {__EC_PINK_R or 1.00, __EC_PINK_G or 0.00, __EC_PINK_B or 0.55},
            soft    = {__EC_PINK_SOFT_R or 1.00, __EC_PINK_SOFT_G or 0.18, __EC_PINK_SOFT_B or 0.72},
            line    = {0.40, 0.25, 0.78},
            text    = {0.93, 0.90, 1.00},
            dim     = {0.56, 0.51, 0.70},
            dim2    = {0.42, 0.38, 0.54}
        }
    end

    local function ec13_state()
        __EC13 = __EC13 or { anim = {}, click = {}, slider = {}, avatar = {}, fps = {} }
        __EC13.anim = __EC13.anim or {}
        __EC13.click = __EC13.click or {}
        __EC13.slider = __EC13.slider or {}
        __EC13.avatar = __EC13.avatar or {}
        __EC13.fps = __EC13.fps or {}
        return __EC13
    end

    local function ec13_pulse(id)
        local st = ec13_state()
        st.click[id] = tick and tick() or 0
    end

    local function ec13_pulse_alpha(id, dur)
        local st = ec13_state()
        local t0 = st.click[id]
        if not t0 then return 0 end
        local now = tick and tick() or 0
        local p = 1 - ((now - t0) / (dur or 0.35))
        if p <= 0 then st.click[id] = nil return 0 end
        return p * p
    end

    local function ec13_update_fps()
        local st = ec13_state().fps
        local now = tick and tick() or 0
        st.last = st.last or now
        st.frames = (st.frames or 0) + 1
        if now - st.last >= 0.45 then
            local dt = now - st.last
            if dt > 0 then st.raw = (st.frames or 0) / dt end
            st.frames = 0
            st.last = now
        end
        if not st.raw then st.raw = tonumber(__EC16 and __EC16.fpsValue) or 0 end
        st.smooth = st.smooth or st.raw or 0
        -- slow visible easing: integer counter walks smoothly instead of jumping.
        st.smooth = ec13_lerp(st.smooth, st.raw or st.smooth, 0.022)
        __EC16.fpsValue = math.floor((st.smooth or 0) + 0.5)
        return __EC16.fpsValue
    end

    local function ec13_ms()
        local f = math.max((ec13_state().fps.smooth or tonumber(__EC16 and __EC16.fpsValue) or 60), 1)
        return math.floor((1000 / f) + 0.5)
    end

    local function ec13_username()
        local name = "Player"
        pcall(function()
            if rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.get_name then
                    local n = lp:get_name()
                    if n and n ~= "" then name = tostring(n) end
                end
            end
        end)
        pcall(function()
            if name == "Player" and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.Name then name = tostring(lp.Name) end
            end
        end)
        return name
    end

    local function ec13_userid()
        local uid = nil
        pcall(function()
            if GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.UserId then uid = lp.UserId end
            end
        end)
        pcall(function()
            if not uid and rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.user_id then uid = lp:user_id() end
            end
        end)
        return uid
    end

    local function ec13_avatar_handle()
        local av = ec13_state().avatar
        local uid = ec13_userid()
        if not uid then return nil end
        if av.uid ~= uid then
            av.uid = uid
            av.handles = {}
            av.index = 1
            av.lastTry = 0
        end
        local now = tick and tick() or 0
        for _,h in ipairs(av.handles or {}) do
            if h and Drawing.IsImageReady and Drawing.IsImageReady(h) then return h end
        end
        if now - (av.lastTry or 0) < 4 then return nil end
        av.lastTry = now
        av.handles = av.handles or {}
        local urls = {
            "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(uid) .. "&width=150&height=150&format=png",
            "https://www.roblox.com/bust-thumbnail/image?userId=" .. tostring(uid) .. "&width=150&height=150&format=png"
        }
        -- If the environment exposes Http/Json, resolve the CDN URL too.
        pcall(function()
            if Http and Http.get and Json and Json.decode then
                local meta = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. tostring(uid) .. "&size=150x150&format=Png&isCircular=false"
                local ok, status, body = Http.get(meta, { timeout_ms = 2500 })
                if ok and status == 200 and body then
                    local j = Json.decode(body)
                    local row = j and j.data and j.data[1]
                    if row and row.imageUrl then urls[#urls+1] = tostring(row.imageUrl) end
                end
            end
        end)
        for _,url in ipairs(urls) do
            local exists = false
            for _,h in ipairs(av.handles) do if h and h.__ec13_url == url then exists = true end end
            if not exists then
                pcall(function()
                    local h = Drawing.LoadImage(url)
                    if h then h.__ec13_url = url; av.handles[#av.handles+1] = h end
                end)
            end
        end
        return nil
    end

    local function ec13_fallback_avatar(x,y,s,theme)
        ec13_rr(x,y,x+s,y+s,theme.pane2[1],theme.pane2[2],theme.pane2[3],0.92,8)
        ec13_rr(x+2,y+2,x+s-2,y+s-2,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.72,7)
        Drawing.DrawCircleFilled(x+s*0.50, y+s*0.36, s*0.15, theme.accent[1],theme.accent[2],theme.accent[3],0.82)
        ec13_rr(x+s*0.28, y+s*0.58, x+s*0.72, y+s*0.80, theme.soft[1],theme.soft[2],theme.soft[3],0.50,8)
        Drawing.DrawCircleFilled(x+s*0.50, y+s*0.36, s*0.28, theme.accent[1],theme.accent[2],theme.accent[3],0.08)
    end

    local function ec13_avatar_overlay()
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then return end
        local theme = ec13_theme()
        local x = __EC16.x or 95
        local y = __EC16.y or 70
        local paneX = x + 14
        local paneY = y + 78
        local sideX = paneX + 12
        local sideY = paneY + 12
        local avatarX = sideX + 12
        local avatarY = sideY + 12
        local avs = 34
        local cardW = 158
        local cardH = 48
        local reveal = __ec16_sm(__EC16.anim or 1)
        ec13_rr(avatarX-1,avatarY-1,avatarX+cardW+1,avatarY+cardH+1,theme.accent[1],theme.accent[2],theme.accent[3],0.045*reveal,8)
        ec13_rr(avatarX,avatarY,avatarX+cardW,avatarY+cardH,theme.card[1],theme.card[2],theme.card[3],0.50*reveal,7)
        ec13_rr(avatarX+1,avatarY+1,avatarX+cardW-1,avatarY+cardH-1,theme.bg[1],theme.bg[2],theme.bg[3],0.43*reveal,6)
        local h = ec13_avatar_handle()
        ec13_rr(avatarX+7,avatarY+7,avatarX+7+avs,avatarY+7+avs,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.72,7)
        if h and Drawing.IsImageReady and Drawing.IsImageReady(h) then
            Drawing.DrawImage(h, avatarX+7, avatarY+7, avs, avs, 1,1,1,0.96*reveal, 6)
        else
            ec13_fallback_avatar(avatarX+7, avatarY+7, avs, theme)
        end
        local name = ec13_username()
        ec13_txt_left(avatarX+50, avatarY+9, name, theme.text[1],theme.text[2],theme.text[3],0.98*reveal)
        ec13_txt_left(avatarX+50, avatarY+25, "Local player", theme.dim[1],theme.dim[2],theme.dim[3],0.86*reveal)
        ec13_rect(avatarX+50, avatarY+41, avatarX+cardW-12, avatarY+43, theme.accent[1],theme.accent[2],theme.accent[3],0.82*reveal)
    end

    -- Better animated switches. Replaces only the visual control; values stay in UIManager.
    function __ec16_check(mx,my,cl,x,y,label,id)
        local v = UIManager.GetCheckboxValue(id) == true
        local hit = __ec16_in(mx,my,x,y,x+235,y+22)
        if hit and cl and not __EC16.lastClick then
            v = not v
            UIManager.SetCheckboxValue(id, v)
            ec13_pulse("check_" .. tostring(id))
        end
        local theme = ec13_theme()
        local st = ec13_state()
        local key = "chk_" .. tostring(id)
        st.anim[key] = ec13_lerp(st.anim[key] or (v and 1 or 0), v and 1 or 0, 0.17)
        local t = st.anim[key]
        local a = hit and 0.95 or 0.82
        local tw, th = 31, 15
        local tx = x
        local ty = y + 3
        ec13_txt_left(x+42, y+3, label, theme.text[1],theme.text[2],theme.text[3], a)
        ec13_rr(tx,ty,tx+tw,ty+th, theme.pane[1],theme.pane[2],theme.pane[3],0.78,8)
        ec13_rr(tx+1,ty+1,tx+tw-1,ty+th-1, theme.bg2[1],theme.bg2[2],theme.bg2[3],0.70,7)
        if t > 0.02 then
            ec13_rr(tx+1,ty+1,tx+tw-1,ty+th-1, theme.accent[1],theme.accent[2],theme.accent[3],0.18 + 0.58*t,7)
            Drawing.DrawCircleFilled(tx+tw-7,ty+th*0.5,9*t,theme.accent[1],theme.accent[2],theme.accent[3],0.06*t)
        end
        local kx = tx + 8 + (tw - 16) * t
        Drawing.DrawCircleFilled(kx, ty + th*0.5, 5.1, 0.96,0.94,1.00,0.96)
        Drawing.DrawCircleFilled(kx, ty + th*0.5, 2.4, v and theme.accent[1] or theme.dim[1], v and theme.accent[2] or theme.dim[2], v and theme.accent[3] or theme.dim[3], 0.88)
        local p = ec13_pulse_alpha("check_" .. tostring(id), 0.38)
        if p > 0 then Drawing.DrawCircleFilled(kx, ty+th*0.5, 12 + 8*(1-p), theme.accent[1],theme.accent[2],theme.accent[3],0.09*p) end
    end

    function __ec16_bool_check(mx,my,cl,x,y,label,value)
        local v = value == true
        local hit = __ec16_in(mx,my,x,y,x+235,y+22)
        local id = "bool_" .. tostring(label)
        if hit and cl and not __EC16.lastClick then
            v = not v
            ec13_pulse(id)
        end
        local theme = ec13_theme()
        local st = ec13_state()
        local key = "boolanim_" .. tostring(label)
        st.anim[key] = ec13_lerp(st.anim[key] or (v and 1 or 0), v and 1 or 0, 0.17)
        local t = st.anim[key]
        local tw, th = 31, 15
        local tx = x
        local ty = y + 3
        ec13_txt_left(x+42, y+3, label, theme.text[1],theme.text[2],theme.text[3], hit and 0.95 or 0.82)
        ec13_rr(tx,ty,tx+tw,ty+th, theme.pane[1],theme.pane[2],theme.pane[3],0.78,8)
        ec13_rr(tx+1,ty+1,tx+tw-1,ty+th-1, theme.bg2[1],theme.bg2[2],theme.bg2[3],0.70,7)
        if t > 0.02 then ec13_rr(tx+1,ty+1,tx+tw-1,ty+th-1, theme.accent[1],theme.accent[2],theme.accent[3],0.18 + 0.58*t,7) end
        local kx = tx + 8 + (tw - 16) * t
        Drawing.DrawCircleFilled(kx, ty + th*0.5, 5.1, 0.96,0.94,1.00,0.96)
        Drawing.DrawCircleFilled(kx, ty + th*0.5, 2.4, v and theme.accent[1] or theme.dim[1], v and theme.accent[2] or theme.dim[2], v and theme.accent[3] or theme.dim[3], 0.88)
        local p = ec13_pulse_alpha(id, 0.38)
        if p > 0 then Drawing.DrawCircleFilled(kx, ty+th*0.5, 12 + 8*(1-p), theme.accent[1],theme.accent[2],theme.accent[3],0.09*p) end
        return v
    end

    function __ec16_slider(mx,my,cl,x,y,w,label,id,minv,maxv)
        minv = minv or 0; maxv = maxv or 100
        local val = UIManager.GetSliderIntValue(id) or minv
        local hit = __ec16_in(mx,my,x,y+18,x+w,y+42)
        if hit and cl then
            local f = ec13_c((mx - x) / math.max(w,1), 0, 1)
            val = math.floor(minv + (maxv-minv)*f + 0.5)
            UIManager.SetSliderIntValue(id,val)
        end
        local theme = ec13_theme()
        local st = ec13_state()
        local key = "sl_" .. tostring(id)
        local f = (val - minv) / math.max(maxv-minv,1)
        st.slider[key] = ec13_lerp(st.slider[key] or f, f, 0.16)
        local sf = st.slider[key]
        ec13_txt_left(x, y, label, theme.text[1],theme.text[2],theme.text[3],0.92)
        local tv = tostring(math.floor(val))
        ec13_txt_left(x+w-ec13_w(tv), y, tv, theme.dim[1],theme.dim[2],theme.dim[3],0.86)
        local by = y + 25
        ec13_rr(x,by,x+w,by+8,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.74,4)
        ec13_rr(x,by,x+w*sf,by+8,theme.accent[1],theme.accent[2],theme.accent[3],0.80,4)
        Drawing.DrawCircleFilled(x+w*sf, by+4, hit and 6.2 or 5.4, 0.96,0.94,1,0.95)
        Drawing.DrawCircleFilled(x+w*sf, by+4, 10, theme.accent[1],theme.accent[2],theme.accent[3], hit and 0.11 or 0.06)
    end

    function __ec16_float_slider(mx,my,cl,x,y,w,label,value,minv,maxv)
        minv = minv or 0; maxv = maxv or 1
        local val = tonumber(value or minv) or minv
        local hit = __ec16_in(mx,my,x,y+18,x+w,y+42)
        if hit and cl then
            local f = ec13_c((mx - x) / math.max(w,1), 0, 1)
            val = minv + (maxv-minv)*f
        end
        local theme = ec13_theme()
        local st = ec13_state()
        local key = "fl_" .. tostring(label)
        local f = (val - minv) / math.max(maxv-minv,0.0001)
        st.slider[key] = ec13_lerp(st.slider[key] or f, f, 0.16)
        local sf = st.slider[key]
        ec13_txt_left(x, y, label, theme.text[1],theme.text[2],theme.text[3],0.92)
        local tv = string.format("%.2f", val)
        ec13_txt_left(x+w-ec13_w(tv), y, tv, theme.dim[1],theme.dim[2],theme.dim[3],0.86)
        local by = y + 25
        ec13_rr(x,by,x+w,by+8,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.74,4)
        ec13_rr(x,by,x+w*sf,by+8,theme.accent[1],theme.accent[2],theme.accent[3],0.80,4)
        Drawing.DrawCircleFilled(x+w*sf, by+4, hit and 6.2 or 5.4, 0.96,0.94,1,0.95)
        Drawing.DrawCircleFilled(x+w*sf, by+4, 10, theme.accent[1],theme.accent[2],theme.accent[3], hit and 0.11 or 0.06)
        return val
    end

    function __ec16_button(mx,my,cl,x1,y1,x2,y2,label,id)
        local theme = ec13_theme()
        local hit = __ec16_in(mx,my,x1,y1,x2,y2)
        if hit and cl and not __EC16.lastClick then
            ec13_pulse("btn_" .. tostring(id))
            local cb = __EC16_UI and __EC16_UI.buttons and __EC16_UI.buttons[id]
            if cb then pcall(cb) end
        end
        ec13_rr(x1,y1,x2,y2, hit and theme.hover[1] or theme.pane[1], hit and theme.hover[2] or theme.pane[2], hit and theme.hover[3] or theme.pane[3], hit and 0.76 or 0.58, 7)
        ec13_rr(x1+1,y1+1,x2-1,y2-1,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.45,6)
        ec13_rect(x1+8,y2-4,x2-8,y2-2,theme.accent[1],theme.accent[2],theme.accent[3],hit and 0.82 or 0.46)
        ec13_txt_center((x1+x2)*0.5,y1+math.floor((y2-y1)*0.5)-4,label,theme.text[1],theme.text[2],theme.text[3],0.94)
        local p = ec13_pulse_alpha("btn_" .. tostring(id), 0.35)
        if p > 0 then ec13_rr(x1-2,y1-2,x2+2,y2+2,theme.accent[1],theme.accent[2],theme.accent[3],0.09*p,9) end
    end

    function __ec16_draw_top_hud(mx,my,cl)
        if not (__EC16 and __EC16.phase == "menu") then return end
        local fps = ec13_update_fps()
        local theme = ec13_theme()
        local x = __EC16.hudX or 18
        local y = __EC16.hudY or 14
        local w = 236
        local h = 38
        if __ec16_in(mx,my,x,y,x+w,y+h) and cl and not __EC16.lastClick then
            __EC16.hudDragging = true
            __EC16.hudDragX = mx - x
            __EC16.hudDragY = my - y
        end
        if not cl then __EC16.hudDragging = false end
        if __EC16.hudDragging then
            __EC16.hudX = mx - (__EC16.hudDragX or 0)
            __EC16.hudY = my - (__EC16.hudDragY or 0)
            x = __EC16.hudX
            y = __EC16.hudY
        end
        ec13_rr(x-1,y-1,x+w+1,y+h+1,theme.accent[1],theme.accent[2],theme.accent[3],0.040,13)
        ec13_rr(x,y,x+w,y+h,theme.pane[1],theme.pane[2],theme.pane[3],0.50,12)
        ec13_rr(x+1,y+1,x+w-1,y+h-1,theme.bg[1],theme.bg[2],theme.bg[3],0.40,11)
        Drawing.DrawCircleFilled(x+15,y+19,4,theme.accent[1],theme.accent[2],theme.accent[3],0.92)
        Drawing.DrawCircleFilled(x+15,y+19,9,theme.accent[1],theme.accent[2],theme.accent[3],0.08)
        ec13_txt_left(x+28,y+11,"Eclipze",theme.text[1],theme.text[2],theme.text[3],0.96)
        ec13_rect(x+114,y+8,x+116,y+h-8,theme.line[1],theme.line[2],theme.line[3],0.42)
        ec13_txt_left(x+128,y+11,tostring(fps) .. " FPS",theme.text[1],theme.text[2],theme.text[3],0.92)
        ec13_txt_left(x+188,y+11,tostring(ec13_ms()) .. " ms",theme.dim[1],theme.dim[2],theme.dim[3],0.86)
        ec13_rect(x+12,y+h-6,x+w-12,y+h-4,theme.accent[1],theme.accent[2],theme.accent[3],0.44)
    end

    function __ec16_draw_keybinds_panel(w,h,mx,my,cl)
        -- Draw avatar overlay after menu render through this hook; it always runs after __ec16_menu in the original render order.
        pcall(ec13_avatar_overlay)
        if not (__EC16 and __EC16.keybindsPanel and __EC16.phase == "menu") then return end
        local theme = ec13_theme()
        local activeItems = {}
        local function add(label, keyName) activeItems[#activeItems+1] = {label=label, key=keyName or ""} end
        pcall(function()
            local aimEnabled = UIManager.GetCheckboxValue("ap_aim_enable_fixed_click") == true
            local vk = ap_aim_vk or __EC16.aimKey or 0x02
            local held = Windows and Windows.IsKeyPressed and Windows.IsKeyPressed(vk)
            if aimEnabled and held then add("Aimbot", __ec16_vk_name(vk)) end
        end)
        local shown = math.max(#activeItems, 1)
        local width = 204
        local height = 48 + shown * 24
        local x1 = __EC16.keybindsX or 18
        local y1 = __EC16.keybindsY or 62
        if __ec16_in(mx,my,x1,y1,x1+width,y1+height) and cl and not __EC16.lastClick then
            __EC16.keybindsDragging = true
            __EC16.keybindsDragX = mx - x1
            __EC16.keybindsDragY = my - y1
        end
        if not cl then __EC16.keybindsDragging = false end
        if __EC16.keybindsDragging then
            __EC16.keybindsX = mx - (__EC16.keybindsDragX or 0)
            __EC16.keybindsY = my - (__EC16.keybindsDragY or 0)
            x1 = __EC16.keybindsX
            y1 = __EC16.keybindsY
        end
        ec13_rr(x1-1,y1-1,x1+width+1,y1+height+1,theme.accent[1],theme.accent[2],theme.accent[3],0.040,11)
        ec13_rr(x1,y1,x1+width,y1+height,theme.pane[1],theme.pane[2],theme.pane[3],0.48,10)
        ec13_rr(x1+1,y1+1,x1+width-1,y1+height-1,theme.bg[1],theme.bg[2],theme.bg[3],0.38,9)
        ec13_rr(x1+6,y1+6,x1+width-6,y1+28,theme.pane2[1],theme.pane2[2],theme.pane2[3],0.50,7)
        ec13_rect(x1+12,y1+27,x1+width-12,y1+29,theme.accent[1],theme.accent[2],theme.accent[3],0.54)
        ec13_txt_left(x1+13,y1+11,"Keybinds",theme.text[1],theme.text[2],theme.text[3],0.95)
        if #activeItems == 0 then
            ec13_txt_left(x1+13,y1+35,"No active binds",theme.dim[1],theme.dim[2],theme.dim[3],0.80)
            return
        end
        for i,it in ipairs(activeItems) do
            local rowY = y1 + 36 + (i-1)*24
            ec13_rr(x1+8,rowY-1,x1+width-8,rowY+21,theme.card[1],theme.card[2],theme.card[3],0.54,7)
            ec13_rect(x1+15,rowY+5,x1+19,rowY+13,theme.accent[1],theme.accent[2],theme.accent[3],0.92)
            ec13_txt_left(x1+28,rowY+3,it.label,theme.text[1],theme.text[2],theme.text[3],0.92)
            local key = "[" .. tostring(it.key or "?") .. "]"
            ec13_txt_left(x1+width-18-ec13_w(key),rowY+4,key,theme.dim[1],theme.dim[2],theme.dim[3],0.88)
        end
    end

    function __ec16_draw_moderator_panel(w,h,mx,my,cl)
        if not (__EC16 and __EC16.moderatorPanel and __EC16.phase == "menu") then return end
        local theme = ec13_theme()
        local mods = __ec16_get_online_moderators()
        local visibleCount = math.min(#mods, 6)
        local width = 214
        local height = 48 + math.max(visibleCount, 1) * 24
        local x1 = __EC16.moderatorPanelX or 18
        local y1 = __EC16.moderatorPanelY or 122
        if __ec16_in(mx,my,x1,y1,x1+width,y1+height) and cl and not __EC16.lastClick then
            __EC16.moderatorDragging = true
            __EC16.moderatorDragX = mx - x1
            __EC16.moderatorDragY = my - y1
        end
        if not cl then __EC16.moderatorDragging = false end
        if __EC16.moderatorDragging then
            __EC16.moderatorPanelX = mx - (__EC16.moderatorDragX or 0)
            __EC16.moderatorPanelY = my - (__EC16.moderatorDragY or 0)
            x1 = __EC16.moderatorPanelX
            y1 = __EC16.moderatorPanelY
        end
        ec13_rr(x1-1,y1-1,x1+width+1,y1+height+1,theme.accent[1],theme.accent[2],theme.accent[3],0.040,11)
        ec13_rr(x1,y1,x1+width,y1+height,theme.pane[1],theme.pane[2],theme.pane[3],0.48,10)
        ec13_rr(x1+1,y1+1,x1+width-1,y1+height-1,theme.bg[1],theme.bg[2],theme.bg[3],0.38,9)
        ec13_rr(x1+6,y1+6,x1+width-6,y1+28,theme.pane2[1],theme.pane2[2],theme.pane2[3],0.50,7)
        ec13_rect(x1+12,y1+27,x1+width-12,y1+29,theme.accent[1],theme.accent[2],theme.accent[3],0.54)
        ec13_txt_left(x1+13,y1+11,"Moderator List",theme.text[1],theme.text[2],theme.text[3],0.95)
        if visibleCount == 0 then
            ec13_txt_left(x1+13,y1+35,"Not found",theme.dim[1],theme.dim[2],theme.dim[3],0.80)
            return
        end
        for i=1,visibleCount do
            local mod = mods[i]
            local rowY = y1 + 36 + (i-1)*24
            local name = tostring(mod.name or "Player")
            if #name > 12 then name = string.sub(name,1,12) .. "..." end
            ec13_rr(x1+8,rowY-1,x1+width-8,rowY+21,theme.card[1],theme.card[2],theme.card[3],0.54,7)
            ec13_rect(x1+15,rowY+5,x1+19,rowY+13,theme.accent[1],theme.accent[2],theme.accent[3],0.92)
            ec13_txt_left(x1+28,rowY+3,name,theme.text[1],theme.text[2],theme.text[3],0.92)
            ec13_txt_left(x1+130,rowY+4,tostring(mod.uid or "?"),theme.dim[1],theme.dim[2],theme.dim[3],0.86)
        end
    end

    -- Soft open animation overlay; wraps current v11 menu without hiding content/lists.
    local prev_menu = __ec16_menu
    function __ec16_menu(mx,my,cl,w,h)
        if not (__EC16 and __EC16.open) then return end
        pcall(prev_menu, mx,my,cl,w,h)
        local a = __ec16_sm(__EC16.anim or 1)
        if a < 0.995 then
            local theme = ec13_theme()
            local x = __EC16.x or 95
            local y = __EC16.y or 70
            local ww = __EC16.w or 960
            local hh = (__EC16.h or 640) * a
            local sweep = y + 22 + (hh - 44) * a
            ec13_rect(x+18, sweep, x+ww-18, sweep+2, theme.accent[1],theme.accent[2],theme.accent[3],0.18*(1-a))
            ec13_rr(x-2,y-2,x+ww+2,y+hh+2,theme.accent[1],theme.accent[2],theme.accent[3],0.025*(1-a),15)
        end
    end

    -- Keep these values explicit so no v12-style draw optimization/limiter is used.
    __EC13.noDrawOptimization = true
    notify("Fallen v13 no-optimization transparent UI loaded", "success")
end


--[[
Fallen visual patch v16
- Transparent glass menu polish.
- No heavy square behind the local-player avatar.
- Small smooth Player Info Checker in FALLEN ESP -> Armor.
- Target info only appears for target within 20px FOV from crosshair.
]]

do
    __EC16 = __EC16 or {}
    __EC13 = __EC13 or { anim = {}, click = {}, slider = {}, avatar = {}, fps = {}, user = {}, target = {} }
    __EC13.anim = __EC13.anim or {}
    __EC13.click = __EC13.click or {}
    __EC13.slider = __EC13.slider or {}
    __EC13.avatar = __EC13.avatar or {}
    __EC13.fps = __EC13.fps or {}
    __EC13.user = __EC13.user or {}
    __EC13.target = __EC13.target or {}

    local function n() return (tick and tick()) or os.clock() or 0 end
    local function clamp(v,a,b) if v < a then return a elseif v > b then return b else return v end end
    local function lerp(a,b,t) return (a or b or 0) + ((b or 0) - (a or b or 0)) * clamp(t or 0,0,1) end
    local function smooth(t) t=clamp(t or 0,0,1); return t*t*(3-2*t) end
    local function tw(s) return (__ec16_text_w and __ec16_text_w(tostring(s or ""))) or (#tostring(s or "")*7) end
    local function rect(x1,y1,x2,y2,r,g,b,a) if __ec16_rect then __ec16_rect(x1,y1,x2,y2,r,g,b,a or 1) end end
    local function rr(x1,y1,x2,y2,r,g,b,a,rad)
        if __ec16_draw_round_rect then __ec16_draw_round_rect(x1,y1,x2,y2,r,g,b,a or 1,rad or 8); return end
        rad = math.floor(math.min(rad or 8,(x2-x1)*0.5,(y2-y1)*0.5))
        if rad < 1 then rect(x1,y1,x2,y2,r,g,b,a); return end
        rect(x1+rad,y1,x2-rad,y2,r,g,b,a); rect(x1,y1+rad,x2,y2-rad,r,g,b,a)
        Drawing.DrawCircleFilled(x1+rad,y1+rad,rad,r,g,b,a); Drawing.DrawCircleFilled(x2-rad,y1+rad,rad,r,g,b,a)
        Drawing.DrawCircleFilled(x1+rad,y2-rad,rad,r,g,b,a); Drawing.DrawCircleFilled(x2-rad,y2-rad,rad,r,g,b,a)
    end
    local function txt(x,y,s,r,g,b,a)
        s=tostring(s or "")
        Drawing.DrawTextWithOutline(x+tw(s)*0.5,y,s,r or 1,g or 1,b or 1,a or 1,0,0,0,(a or 1)*0.9)
    end
    local function theme()
        return {
            bg={0.018,0.016,0.040}, bg2={0.026,0.022,0.060}, pane={0.044,0.035,0.098}, pane2={0.058,0.045,0.128},
            card={0.054,0.042,0.112}, card2={0.030,0.026,0.064}, hover={0.090,0.065,0.165},
            acc={__EC_PINK_R or 1.00,__EC_PINK_G or 0.00,__EC_PINK_B or 0.55}, soft={__EC_PINK_SOFT_R or 1.00,__EC_PINK_SOFT_G or 0.18,__EC_PINK_SOFT_B or 0.72},
            line={0.40,0.25,0.78}, text={0.93,0.90,1.00}, dim={0.56,0.51,0.70}, dim2={0.42,0.38,0.54},
            good={0.25,1.00,0.50}, warn={1.00,0.76,0.18}, bad={1.00,0.25,0.42}
        }
    end

    local function uid_from(p)
        local uid = p and (p.user_id or p.UserId or p.userid or p.uid)
        uid = tonumber(uid or 0) or 0
        if uid ~= 0 then return uid end
        pcall(function()
            if p and p.player_addr and p.player_addr ~= 0 and rbx and rbx.instance then
                local inst = rbx.instance(p.player_addr)
                if inst and inst.user_id then uid = tonumber(inst:user_id() or 0) or 0 end
            end
        end)
        return uid ~= 0 and uid or nil
    end

    local function local_uid()
        local uid=nil
        pcall(function() if rbx and rbx.local_player then local lp=rbx.local_player(); if lp and lp.user_id then uid=tonumber(lp:user_id() or 0) or nil end end end)
        pcall(function() if (not uid) and GetLocalPlayer then local lp=GetLocalPlayer(); if lp and lp.UserId then uid=tonumber(lp.UserId or 0) or nil end end end)
        return uid
    end
    local function local_name()
        local name="Player"
        pcall(function() if rbx and rbx.local_player then local lp=rbx.local_player(); if lp and lp.get_name then local v=lp:get_name(); if v and v~="" then name=tostring(v) end end end end)
        pcall(function() if name=="Player" and GetLocalPlayer then local lp=GetLocalPlayer(); if lp and lp.Name then name=tostring(lp.Name) end end end)
        return name
    end

    local function avatar_handle(uid,name)
        uid=tonumber(uid or 0) or 0
        if uid==0 then return nil end
        local key=tostring(uid)
        local rec=__EC13.avatar[key]
        local t=n()
        if rec and rec.handle then return rec.handle end
        if rec and rec.nextRetry and t<rec.nextRetry then return nil end
        rec=rec or { tried=0 }
        __EC13.avatar[key]=rec
        pcall(function()
            if __ec16_get_player_avatar_handle then
                local pseudo={user_id=uid,UserId=uid,name=tostring(name or "Player"),Name=tostring(name or "Player")}
                local h=__ec16_get_player_avatar_handle(pseudo)
                if h then rec.handle=h end
            end
        end)
        if rec.handle then return rec.handle end
        if rec.loading then return nil end
        rec.loading=true; rec.tried=(rec.tried or 0)+1
        pcall(function()
            if Drawing and Drawing.LoadImage then
                local urls={
                    "https://www.roblox.com/headshot-thumbnail/image?userId="..key.."&width=150&height=150&format=png",
                    "https://www.roblox.com/bust-thumbnail/image?userId="..key.."&width=150&height=150&format=png"
                }
                for _,u in ipairs(urls) do if not rec.handle then local h=Drawing.LoadImage(u); if h then rec.handle=h; rec.url=u end end end
            end
            if (not rec.handle) and Http and Http.get and Json and Json.decode and Drawing and Drawing.LoadImage then
                local u="https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..key.."&size=150x150&format=Png&isCircular=false"
                local ok,st,body=Http.get(u,{timeout_ms=4200})
                if ok and st==200 and body then local j=Json.decode(body); local url=j and j.data and j.data[1] and j.data[1].imageUrl; if type(url)=="string" and url~="" then rec.handle=Drawing.LoadImage(url); rec.url=url end end
            end
        end)
        rec.loading=false
        if not rec.handle then rec.nextRetry=t+math.min(45,8+(rec.tried or 1)*6) end
        return rec.handle
    end

    local function draw_avatar(x,y,s,uid,name,th,a)
        a=a or 1
        -- no square background: soft circular fallback first, then image over it.
        Drawing.DrawCircleFilled(x+s*0.5,y+s*0.5,s*0.46,th.acc[1],th.acc[2],th.acc[3],0.10*a)
        Drawing.DrawCircleFilled(x+s*0.5,y+s*0.40,s*0.14,th.text[1],th.text[2],th.text[3],0.82*a)
        rr(x+s*0.28,y+s*0.58,x+s*0.72,y+s*0.78,th.text[1],th.text[2],th.text[3],0.74*a,4)
        local h=avatar_handle(uid,name)
        if h then pcall(function() Drawing.DrawImage(h,x,y,s,s) end) end
    end

    function __ec16_check(mx,my,cl,x,y,label,id)
        local th=theme()
        local v=UIManager.GetCheckboxValue(id)==true
        local hit=__ec16_in(mx,my,x,y,x+235,y+24)
        if hit and cl and not __EC16.lastClick then v=not v; UIManager.SetCheckboxValue(id,v); __EC13.click["chk"..tostring(id)]=n() end
        local k="chk_anim_"..tostring(id)
        __EC13.anim[k]=lerp(__EC13.anim[k] or (v and 1 or 0), v and 1 or 0, 0.16)
        local t=__EC13.anim[k]
        local sw,sh=37,18
        local sx,sy=x,y+3
        txt(x+45,y+4,label,th.text[1],th.text[2],th.text[3],hit and 0.98 or 0.84)
        rr(sx,sy,sx+sw,sy+sh,th.bg2[1],th.bg2[2],th.bg2[3],0.74,9)
        rr(sx+1,sy+1,sx+sw-1,sy+sh-1,lerp(th.pane2[1],th.acc[1],t),lerp(th.pane2[2],th.acc[2],t),lerp(th.pane2[3],th.acc[3],t),0.34+0.42*t,8)
        rect(sx+6,sy+sh-2,sx+sw-6,sy+sh-1,th.acc[1],th.acc[2],th.acc[3],0.18+0.45*t)
        local kx=sx+9+(sw-18)*t
        Drawing.DrawCircleFilled(kx,sy+sh*0.5,6.5,0.98,0.96,1,0.96)
        Drawing.DrawCircleFilled(kx,sy+sh*0.5,2.7,lerp(th.dim[1],th.acc[1],t),lerp(th.dim[2],th.acc[2],t),lerp(th.dim[3],th.acc[3],t),0.90)
        local ct=__EC13.click["chk"..tostring(id)]
        if ct then local p=1-(n()-ct)/0.36; if p>0 then Drawing.DrawCircleFilled(kx,sy+sh*0.5,11+8*(1-p),th.acc[1],th.acc[2],th.acc[3],0.10*p) else __EC13.click["chk"..tostring(id)]=nil end end
    end

    function __ec16_bool_check(mx,my,cl,x,y,label,value)
        local th=theme()
        local v=value==true
        local hit=__ec16_in(mx,my,x,y,x+235,y+24)
        local id="bool_"..tostring(label)
        if hit and cl and not __EC16.lastClick then v=not v; __EC13.click[id]=n() end
        local k="ba_"..tostring(label)
        __EC13.anim[k]=lerp(__EC13.anim[k] or (v and 1 or 0), v and 1 or 0, 0.16)
        local t=__EC13.anim[k]
        local sw,sh=37,18
        local sx,sy=x,y+3
        txt(x+45,y+4,label,th.text[1],th.text[2],th.text[3],hit and 0.98 or 0.84)
        rr(sx,sy,sx+sw,sy+sh,th.bg2[1],th.bg2[2],th.bg2[3],0.74,9)
        rr(sx+1,sy+1,sx+sw-1,sy+sh-1,lerp(th.pane2[1],th.acc[1],t),lerp(th.pane2[2],th.acc[2],t),lerp(th.pane2[3],th.acc[3],t),0.34+0.42*t,8)
        rect(sx+6,sy+sh-2,sx+sw-6,sy+sh-1,th.acc[1],th.acc[2],th.acc[3],0.18+0.45*t)
        local kx=sx+9+(sw-18)*t
        Drawing.DrawCircleFilled(kx,sy+sh*0.5,6.5,0.98,0.96,1,0.96)
        Drawing.DrawCircleFilled(kx,sy+sh*0.5,2.7,lerp(th.dim[1],th.acc[1],t),lerp(th.dim[2],th.acc[2],t),lerp(th.dim[3],th.acc[3],t),0.90)
        local ct=__EC13.click[id]
        if ct then local p=1-(n()-ct)/0.36; if p>0 then Drawing.DrawCircleFilled(kx,sy+sh*0.5,11+8*(1-p),th.acc[1],th.acc[2],th.acc[3],0.10*p) else __EC13.click[id]=nil end end
        return v
    end

    local function get_user_info(uid)
        uid=tonumber(uid or 0) or 0
        if uid==0 then return nil end
        local key=tostring(uid)
        local rec=__EC13.user[key]
        local t=n()
        if rec and rec.ready then return rec end
        if rec and rec.nextRetry and t<rec.nextRetry then return rec end
        rec=rec or { uid=uid }
        __EC13.user[key]=rec
        pcall(function()
            if Http and Http.get and Json and Json.decode then
                local ok,st,body=Http.get("https://users.roblox.com/v1/users/"..key,{timeout_ms=4200})
                if ok and st==200 and body then
                    local j=Json.decode(body)
                    if j then
                        rec.name=j.name or rec.name; rec.displayName=j.displayName or rec.displayName; rec.created=j.created or rec.created
                        local yy,mm,dd=tostring(rec.created or ""):match("^(%d+)%-(%d+)%-(%d+)")
                        if yy and os and os.time then
                            local ct=os.time({year=tonumber(yy),month=tonumber(mm),day=tonumber(dd),hour=0})
                            local days=math.floor(((os.time() or ct)-ct)/86400)
                            if days>=0 and days<25000 then rec.days=days end
                        end
                        rec.ready=true
                    end
                else rec.nextRetry=t+30 end
            else rec.nextRetry=t+30 end
        end)
        return rec
    end

    local function risk_score(p,days)
        local score=0; local reasons={}
        if days and days<30 then score=score+32; reasons[#reasons+1]="new" end
        local tool=tostring((p and (p.tool or p.weapon or p.current_weapon)) or ""):lower()
        if tool:find("barrett") or tool:find("m4") or tool:find("pkm") or tool:find("aa12") then score=score+12; reasons[#reasons+1]="gear" end
        local label="low"; local col="good"
        if score>=55 then label="high"; col="bad" elseif score>=28 then label="medium"; col="warn" end
        return score,label,col,table.concat(reasons,",")
    end

    local function screen_center()
        local ss=ScreenSize()
        if not ss then return 960,540 end
        local w=ss.Width or ss.X or 1920; local h=ss.Height or ss.Y or 1080
        return w*0.5,h*0.5
    end

    local function w2s(pos)
        local s=nil
        pcall(function() if __ec16_world_to_screen then local x,y,on=__ec16_world_to_screen(pos); if on then s={X=x,Y=y,visible=true} end end end)
        if not s then pcall(function() if aim and aim.world_to_screen then s=aim.world_to_screen(pos) end end) end
        return s
    end

    local function closest_20fov()
        local best,bestS,bestD=nil,nil,21
        local cx,cy=screen_center()
        pcall(function()
            if players and players.get_closest_to_crosshair then
                local p=players.get_closest_to_crosshair(20)
                if p and not p.is_self then
                    local pos=p.head_pos or p.position
                    local s=pos and w2s(pos)
                    if s and (s.visible==nil or s.visible==true) then
                        local dx=(s.X or cx)-cx; local dy=(s.Y or cy)-cy; local d=math.sqrt(dx*dx+dy*dy)
                        if d<=20 then best=p; bestS=s; bestD=d end
                    end
                end
            end
        end)
        if best then return best,bestS,bestD end
        pcall(function()
            if players and players.get_all then
                for _,p in ipairs(players.get_all()) do
                    if p and not p.is_self then
                        local pos=p.head_pos or p.position
                        local s=pos and w2s(pos)
                        if s and (s.visible==nil or s.visible==true) then
                            local dx=(s.X or cx)-cx; local dy=(s.Y or cy)-cy; local d=math.sqrt(dx*dx+dy*dy)
                            if d<bestD and d<=20 then best=p; bestS=s; bestD=d end
                        end
                    end
                end
            end
        end)
        return best,bestS,bestD
    end

    function __ec16_draw_player_info_checker_v16()
        if not (__EC16 and __EC16.playerInfoChecker == true) then
            __EC13.target.alpha=lerp(__EC13.target.alpha or 0,0,0.12)
            return
        end
        local p,s=closest_20fov()
        if p then __EC13.target.player=p; __EC13.target.screen=s; __EC13.target.last=n() end
        local active=(p~=nil) or (__EC13.target.last and (n()-__EC13.target.last)<0.25)
        __EC13.target.alpha=lerp(__EC13.target.alpha or 0, active and 1 or 0, 0.10)
        local a=smooth(__EC13.target.alpha or 0)
        if a<0.02 then return end
        p=__EC13.target.player; s=__EC13.target.screen
        if not p or not s then return end
        local th=theme()
        local uid=uid_from(p)
        local name=tostring(p.name or p.display_name or "Player")
        if #name>14 then name=string.sub(name,1,14).."..." end
        local info=uid and get_user_info(uid) or nil
        local days=info and info.days or nil
        local score,label,colKey,reasons=risk_score(p,days)
        local col=th[colKey] or th.good
        local cardW,cardH=182,54
        local x=(s.X or 0)-cardW*0.5
        local y=(s.Y or 0)-78-10*(1-a)
        rr(x-1,y-1,x+cardW+1,y+cardH+1,th.acc[1],th.acc[2],th.acc[3],0.055*a,9)
        rr(x,y,x+cardW,y+cardH,th.pane[1],th.pane[2],th.pane[3],0.36*a,8)
        rr(x+1,y+1,x+cardW-1,y+cardH-1,th.bg[1],th.bg[2],th.bg[3],0.30*a,7)
        draw_avatar(x+8,y+9,26,uid,name,th,a)
        txt(x+42,y+7,name,th.text[1],th.text[2],th.text[3],0.95*a)
        local age=days and (tostring(days).."d") or "?d"
        txt(x+42,y+22,"age: "..age,th.dim[1],th.dim[2],th.dim[3],0.84*a)
        txt(x+98,y+22,"check: "..label,col[1],col[2],col[3],0.88*a)
        rect(x+42,y+43,x+42+math.floor(106*clamp(score/100,0,1)),y+45,col[1],col[2],col[3],0.78*a)
        rect(x+42,y+45,x+148,y+46,th.line[1],th.line[2],th.line[3],0.28*a)
    end

    -- v16 overlay: redraw the local card with a clean transparent version after the menu.
    function __ec16_draw_local_card_v16()
        if not (__EC16 and __EC16.open and __EC16.phase=="menu") then return end
        local th=theme()
        local x=(__EC16.x or 95)+40
        local y=(__EC16.y or 70)+108
        local a=smooth(__EC16.anim or 1)
        local name=local_name()
        local uid=local_uid()
        -- cover the old heavy local card with a soft glass card matching the menu, then redraw cleanly.
        rr(x-3,y-3,x+160,y+50,th.bg[1],th.bg[2],th.bg[3],0.48*a,8)
        rr(x,y,x+157,y+47,th.card[1],th.card[2],th.card[3],0.24*a,7)
        draw_avatar(x+9,y+8,30,uid,name,th,a)
        txt(x+48,y+8,name,th.text[1],th.text[2],th.text[3],0.95*a)
        txt(x+48,y+24,"Local player",th.dim[1],th.dim[2],th.dim[3],0.80*a)
        rect(x+48,y+40,x+146,y+42,th.acc[1],th.acc[2],th.acc[3],0.72*a)
    end

    hooks.on_render(function()
        pcall(__ec16_draw_player_info_checker_v16)
        pcall(__ec16_draw_local_card_v16)
    end)

    notify("Fallen v16 transparent checker UI loaded", "success")
end


--[[
Fallen v18 cleanup patch
- Removes duplicated FALLEN header/HUD artifacts.
- Keeps Keybinds / Moderator List readable and non-transparent.
- Replaces player-check scan with throttled cached scan to prevent ESP lag.
- Cleans local-player card background and fallback avatar.
]]
do
    __EC13 = __EC13 or { anim = {}, click = {}, slider = {}, avatar = {}, fps = {}, user = {}, target = {}, cache = {} }
    _EC13 = _EC13 or __EC13
    __EC13.anim = __EC13.anim or {}
    __EC13.click = __EC13.click or {}
    __EC13.slider = __EC13.slider or {}
    __EC13.avatar = __EC13.avatar or {}
    __EC13.fps = __EC13.fps or {}
    __EC13.user = __EC13.user or {}
    __EC13.target = __EC13.target or {}
    __EC13.cache = __EC13.cache or {}

    local function now()
        return (tick and tick()) or os.clock() or 0
    end
    local function clamp(v,a,b)
        v = tonumber(v or 0) or 0
        if v < a then return a end
        if v > b then return b end
        return v
    end
    local function lerp(a,b,t)
        return (a or b or 0) + ((b or 0) - (a or b or 0)) * clamp(t or 0,0,1)
    end
    local function smooth(t)
        t = clamp(t or 0,0,1)
        return t*t*(3-2*t)
    end
    local function text_w(s)
        s = tostring(s or "")
        if __ec16_text_w then return __ec16_text_w(s) end
        return #s * 7
    end
    local function rect(x1,y1,x2,y2,r,g,b,a)
        if __ec16_rect then __ec16_rect(x1,y1,x2,y2,r,g,b,a or 1) end
    end
    local function rr(x1,y1,x2,y2,r,g,b,a,rad)
        if __ec16_draw_round_rect then
            __ec16_draw_round_rect(x1,y1,x2,y2,r,g,b,a or 1,rad or 8)
            return
        end
        rad = math.floor(math.min(rad or 8,(x2-x1)*0.5,(y2-y1)*0.5))
        if rad < 1 then rect(x1,y1,x2,y2,r,g,b,a) return end
        rect(x1+rad,y1,x2-rad,y2,r,g,b,a)
        rect(x1,y1+rad,x2,y2-rad,r,g,b,a)
        Drawing.DrawCircleFilled(x1+rad,y1+rad,rad,r,g,b,a or 1)
        Drawing.DrawCircleFilled(x2-rad,y1+rad,rad,r,g,b,a or 1)
        Drawing.DrawCircleFilled(x1+rad,y2-rad,rad,r,g,b,a or 1)
        Drawing.DrawCircleFilled(x2-rad,y2-rad,rad,r,g,b,a or 1)
    end
    local function txt_left(x,y,s,r,g,b,a)
        s = tostring(s or "")
        Drawing.DrawTextWithOutline(x + text_w(s)*0.5, y, s, r or 1, g or 1, b or 1, a or 1, 0,0,0,(a or 1)*0.92)
    end
    local function th()
        return {
            bg={0.018,0.016,0.040}, bg2={0.026,0.022,0.060},
            pane={0.050,0.040,0.105}, pane2={0.064,0.050,0.135},
            card={0.068,0.052,0.135}, card2={0.030,0.026,0.064},
            acc={__EC_PINK_R or 1.00,__EC_PINK_G or 0.00,__EC_PINK_B or 0.55},
            soft={__EC_PINK_SOFT_R or 1.00,__EC_PINK_SOFT_G or 0.18,__EC_PINK_SOFT_B or 0.72},
            line={0.40,0.25,0.78}, text={0.93,0.90,1.00}, dim={0.56,0.51,0.70},
            good={0.25,1.00,0.50}, warn={1.00,0.76,0.18}, bad={1.00,0.25,0.42}
        }
    end

    local function local_name()
        local name = "Player"
        pcall(function()
            if rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.get_name then
                    local v = lp:get_name()
                    if v and v ~= "" then name = tostring(v) end
                end
            end
        end)
        pcall(function()
            if name == "Player" and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.Name then name = tostring(lp.Name) end
            end
        end)
        return name
    end
    local function local_uid()
        local uid = nil
        pcall(function()
            if rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.user_id then uid = tonumber(lp:user_id() or 0) or nil end
            end
        end)
        pcall(function()
            if (not uid) and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.UserId then uid = tonumber(lp.UserId or 0) or nil end
            end
        end)
        return uid
    end
    local function uid_from_player(p)
        local uid = p and (p.user_id or p.UserId or p.userid or p.uid)
        uid = tonumber(uid or 0) or 0
        if uid ~= 0 then return uid end
        pcall(function()
            if p and p.player_addr and p.player_addr ~= 0 and rbx and rbx.instance then
                local inst = rbx.instance(p.player_addr)
                if inst and inst.user_id then uid = tonumber(inst:user_id() or 0) or 0 end
            end
        end)
        if uid ~= 0 then return uid end
        return nil
    end

    local function avatar_handle(uid, name)
        uid = tonumber(uid or 0) or 0
        if uid == 0 then return nil end
        local key = tostring(uid)
        local rec = __EC13.avatar[key]
        local t = now()
        if rec and rec.handle then return rec.handle end
        if rec and rec.retry and t < rec.retry then return nil end
        rec = rec or { tries = 0 }
        __EC13.avatar[key] = rec
        if rec.loading then return nil end
        rec.loading = true
        rec.tries = (rec.tries or 0) + 1
        pcall(function()
            if not (Drawing and Drawing.LoadImage) then return end
            local urls = {}
            if Http and Http.roblox_avatar_headshot_url then
                urls[#urls+1] = Http.roblox_avatar_headshot_url(uid, "150x150", "Png", false)
            end
            -- direct CDN thumbnail endpoint; works even when the JSON request is unavailable in some builds.
            urls[#urls+1] = "https://www.roblox.com/headshot-thumbnail/image?userId="..key.."&width=150&height=150&format=png"
            urls[#urls+1] = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..key.."&size=150x150&format=Png&isCircular=false"
            for _,url in ipairs(urls) do
                if type(url) == "string" and url ~= "" then
                    local handle = Drawing.LoadImage(url)
                    if handle then
                        rec.handle = handle
                        rec.url = url
                        break
                    end
                end
            end
        end)
        rec.loading = false
        if not rec.handle then rec.retry = t + 20 end
        return rec.handle
    end
    local function draw_fallback_avatar(x,y,s,name,theme,a)
        rr(x,y,x+s,y+s,theme.pane2[1],theme.pane2[2],theme.pane2[3],0.95*a,8)
        rr(x+1,y+1,x+s-1,y+s-1,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.92*a,7)
        Drawing.DrawCircleFilled(x+s*0.5,y+s*0.37,s*0.16,theme.acc[1],theme.acc[2],theme.acc[3],0.90*a)
        rr(x+s*0.24,y+s*0.56,x+s*0.76,y+s*0.78,theme.acc[1],theme.acc[2],theme.acc[3],0.82*a,7)
        local letter = string.upper(string.sub(tostring(name or "P"),1,1))
        txt_left(x+s*0.5-text_w(letter)*0.5,y+s*0.30,letter,theme.text[1],theme.text[2],theme.text[3],0.95*a)
    end
    local function draw_avatar(x,y,s,uid,name,theme,a)
        a = a or 1
        local handle = avatar_handle(uid, name)
        if handle then
            local ok = pcall(function() Drawing.DrawImage(handle,x,y,s,s) end)
            if ok then return end
        end
        draw_fallback_avatar(x,y,s,name,theme,a)
    end

    -- Clean HUD: no large left background artifact, no duplicated logo pill.
    function __ec16_draw_top_hud(mx,my,cl)
        if not (__EC16 and __EC16.phase == "menu") then return end
        local theme = th()
        local x = __EC16.hudX or 18
        local y = __EC16.hudY or 14
        local w,h = 216,34
        if __ec16_in(mx,my,x,y,x+w,y+h) and cl and not (__EC16 and __EC16.lastClick) then
            __EC16.hudDragging = true
            __EC16.hudDragX = mx - x
            __EC16.hudDragY = my - y
        end
        if not cl then __EC16.hudDragging = false end
        if __EC16.hudDragging then
            x = mx - (__EC16.hudDragX or 0)
            y = my - (__EC16.hudDragY or 0)
            __EC16.hudX = x
            __EC16.hudY = y
        end
        local fps = tostring(__EC16.fpsValue or 0) .. " FPS"
        local ms = tostring(__EC16.msValue or 0) .. " ms"
        rr(x,y,x+w,y+h,theme.bg[1],theme.bg[2],theme.bg[3],0.72,10)
        rr(x+1,y+1,x+w-1,y+h-1,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.52,9)
        rect(x+10,y+h-5,x+w-10,y+h-3,theme.acc[1],theme.acc[2],theme.acc[3],0.72)
        Drawing.DrawCircleFilled(x+15,y+17,3.6,theme.acc[1],theme.acc[2],theme.acc[3],0.95)
        txt_left(x+22,y+9,"Eclipze",theme.text[1],theme.text[2],theme.text[3],0.92)
        rect(x+110,y+8,x+112,y+h-8,theme.line[1],theme.line[2],theme.line[3],0.45)
        txt_left(x+124,y+9,fps,theme.text[1],theme.text[2],theme.text[3],0.88)
        txt_left(x+177,y+9,ms,theme.dim[1],theme.dim[2],theme.dim[3],0.80)
    end

    -- Opaque readable panels for keybinds/moderators as requested.
    function __ec16_draw_keybinds_panel(w,h,mx,my,cl)
        if not (__EC16 and __EC16.keybindsPanel and __EC16.phase == "menu") then return end
        local theme = th()
        local activeItems = {}
        local function add(label,key) activeItems[#activeItems+1] = {label=label,key=key or ""} end
        pcall(function()
            local aimEnabled = UIManager.GetCheckboxValue("ap_aim_enable_fixed_click") == true
            local vk = ap_aim_vk or __EC16.aimKey or 0x02
            local held = Windows and Windows.IsKeyPressed and Windows.IsKeyPressed(vk)
            if aimEnabled and held then add("Aimbot", __ec16_vk_name(vk)) end
        end)
        local count = math.max(#activeItems,1)
        local width,height = 204,48+count*24
        local x1,y1 = __EC16.keybindsX or 18, __EC16.keybindsY or 62
        if __ec16_in(mx,my,x1,y1,x1+width,y1+height) and cl and not __EC16.lastClick then
            __EC16.keybindsDragging=true; __EC16.keybindsDragX=mx-x1; __EC16.keybindsDragY=my-y1
        end
        if not cl then __EC16.keybindsDragging=false end
        if __EC16.keybindsDragging then
            x1=mx-(__EC16.keybindsDragX or 0); y1=my-(__EC16.keybindsDragY or 0); __EC16.keybindsX=x1; __EC16.keybindsY=y1
        end
        rr(x1-1,y1-1,x1+width+1,y1+height+1,theme.acc[1],theme.acc[2],theme.acc[3],0.055,11)
        rr(x1,y1,x1+width,y1+height,theme.pane[1],theme.pane[2],theme.pane[3],0.94,10)
        rr(x1+1,y1+1,x1+width-1,y1+height-1,theme.bg[1],theme.bg[2],theme.bg[3],0.92,9)
        rr(x1+6,y1+6,x1+width-6,y1+28,theme.pane2[1],theme.pane2[2],theme.pane2[3],0.98,7)
        rect(x1+12,y1+27,x1+width-12,y1+29,theme.acc[1],theme.acc[2],theme.acc[3],0.66)
        txt_left(x1+13,y1+11,"Keybinds",theme.text[1],theme.text[2],theme.text[3],0.95)
        if #activeItems == 0 then txt_left(x1+13,y1+35,"No active binds",theme.dim[1],theme.dim[2],theme.dim[3],0.82); return end
        for i,it in ipairs(activeItems) do
            local rowY = y1+36+(i-1)*24
            rr(x1+8,rowY-1,x1+width-8,rowY+21,theme.card[1],theme.card[2],theme.card[3],0.94,7)
            rect(x1+15,rowY+5,x1+19,rowY+13,theme.acc[1],theme.acc[2],theme.acc[3],0.92)
            txt_left(x1+28,rowY+3,it.label,theme.text[1],theme.text[2],theme.text[3],0.93)
            local key="["..tostring(it.key or "?").."]"
            txt_left(x1+width-18-text_w(key),rowY+4,key,theme.dim[1],theme.dim[2],theme.dim[3],0.87)
        end
    end

    function __ec16_draw_moderator_panel(w,h,mx,my,cl)
        if not (__EC16 and __EC16.moderatorPanel and __EC16.phase == "menu") then return end
        local theme = th()
        local mods = __ec16_get_online_moderators()
        local count = math.min(#mods,6)
        local width,height = 214,48+math.max(count,1)*24
        local x1,y1 = __EC16.moderatorPanelX or 18, __EC16.moderatorPanelY or 122
        if __ec16_in(mx,my,x1,y1,x1+width,y1+height) and cl and not __EC16.lastClick then
            __EC16.moderatorDragging=true; __EC16.moderatorDragX=mx-x1; __EC16.moderatorDragY=my-y1
        end
        if not cl then __EC16.moderatorDragging=false end
        if __EC16.moderatorDragging then
            x1=mx-(__EC16.moderatorDragX or 0); y1=my-(__EC16.moderatorDragY or 0); __EC16.moderatorPanelX=x1; __EC16.moderatorPanelY=y1
        end
        rr(x1-1,y1-1,x1+width+1,y1+height+1,theme.acc[1],theme.acc[2],theme.acc[3],0.055,11)
        rr(x1,y1,x1+width,y1+height,theme.pane[1],theme.pane[2],theme.pane[3],0.94,10)
        rr(x1+1,y1+1,x1+width-1,y1+height-1,theme.bg[1],theme.bg[2],theme.bg[3],0.92,9)
        rr(x1+6,y1+6,x1+width-6,y1+28,theme.pane2[1],theme.pane2[2],theme.pane2[3],0.98,7)
        rect(x1+12,y1+27,x1+width-12,y1+29,theme.acc[1],theme.acc[2],theme.acc[3],0.66)
        txt_left(x1+13,y1+11,"Moderator List",theme.text[1],theme.text[2],theme.text[3],0.95)
        if count == 0 then txt_left(x1+13,y1+35,"Not found",theme.dim[1],theme.dim[2],theme.dim[3],0.82); return end
        for i=1,count do
            local mod=mods[i]
            local rowY=y1+36+(i-1)*24
            local name=tostring(mod.name or "Player")
            if #name>12 then name=string.sub(name,1,12).."..." end
            rr(x1+8,rowY-1,x1+width-8,rowY+21,theme.card[1],theme.card[2],theme.card[3],0.94,7)
            rect(x1+15,rowY+5,x1+19,rowY+13,theme.acc[1],theme.acc[2],theme.acc[3],0.92)
            txt_left(x1+28,rowY+3,name,theme.text[1],theme.text[2],theme.text[3],0.93)
            txt_left(x1+130,rowY+4,tostring(mod.uid or "?"),theme.dim[1],theme.dim[2],theme.dim[3],0.86)
        end
    end

    -- Clean overlay over the duplicated old local card. This removes the black square/pill artifacts.
    function __ec16_draw_local_card_v18()
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then return end
        local theme = th()
        local a = smooth(__EC16.anim or 1)
        local mx = (__EC16.x or 95)
        local my = (__EC16.y or 70)
        local x = mx + 40
        local y = my + 108
        local name = local_name()
        local uid = local_uid()
        -- cover previous local-card artifact with matching menu background, then draw a clean card.
        rr(x-6,y-6,x+164,y+54,theme.bg[1],theme.bg[2],theme.bg[3],0.64*a,9)
        rr(x,y,x+157,y+47,theme.card[1],theme.card[2],theme.card[3],0.70*a,8)
        rr(x+1,y+1,x+156,y+46,theme.bg2[1],theme.bg2[2],theme.bg2[3],0.58*a,7)
        draw_avatar(x+9,y+8,30,uid,name,theme,a)
        if #name > 14 then name = string.sub(name,1,14).."..." end
        txt_left(x+48,y+8,name,theme.text[1],theme.text[2],theme.text[3],0.94*a)
        txt_left(x+48,y+24,"Local player",theme.dim[1],theme.dim[2],theme.dim[3],0.80*a)
        rect(x+48,y+40,x+146,y+42,theme.acc[1],theme.acc[2],theme.acc[3],0.72*a)
    end

    -- Cover only the old top-left logo text/pill, leaving tabs and menu content intact.
    local prev_menu_v18 = __ec16_menu
    function __ec16_menu(mx,my,cl,w,h)
        pcall(prev_menu_v18,mx,my,cl,w,h)
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then return end
        local theme = th()
        local x = __EC16.x or 95
        local y = __EC16.y or 70
        local ww = __EC16.w or 960
        local a = smooth(__EC16.anim or 1)
        -- erase the duplicated FALLEN black logo/pill at the top-left.
        rr(x+8,y+7,x+126,y+37,theme.bg[1],theme.bg[2],theme.bg[3],0.76*a,9)
        rect(x+10,y+35,x+ww-10,y+37,theme.acc[1],theme.acc[2],theme.acc[3],0.88*a)
    end

    -- Lightweight cached player checker. No HTTP/user-age calls in render, no full player scan every frame.
    local function screen_center()
        local ss = ScreenSize()
        if not ss then return 960,540 end
        return (ss.Width or ss.X or 1920)*0.5, (ss.Height or ss.Y or 1080)*0.5
    end
    local function w2s(pos)
        local s=nil
        pcall(function()
            if __ec16_world_to_screen then
                local x,y,on = __ec16_world_to_screen(pos)
                if on then s = {X=x,Y=y,visible=true} end
            end
        end)
        if not s then pcall(function() if aim and aim.world_to_screen then s=aim.world_to_screen(pos) end end) end
        return s
    end
    local function scan_target_20fov()
        local t = now()
        __EC13.cache.checkLast = __EC13.cache.checkLast or 0
        if (t - __EC13.cache.checkLast) < 0.11 then
            return __EC13.cache.checkPlayer, __EC13.cache.checkScreen, __EC13.cache.checkDist
        end
        __EC13.cache.checkLast = t
        local best,bestS,bestD=nil,nil,21
        local cx,cy = screen_center()
        -- Use fast API first.
        pcall(function()
            if players and players.get_closest_to_crosshair then
                local p = players.get_closest_to_crosshair(20)
                if p and not p.is_self then
                    local pos = p.head_pos or p.position
                    local s = pos and w2s(pos)
                    if s and (s.visible == nil or s.visible == true) then
                        local dx=(s.X or cx)-cx; local dy=(s.Y or cy)-cy; local d=math.sqrt(dx*dx+dy*dy)
                        if d <= 20 then best,bestS,bestD=p,s,d end
                    end
                end
            end
        end)
        -- Slow fallback, heavily throttled and limited.
        if not best and players and players.get_all then
            pcall(function()
                local checked=0
                for _,p in ipairs(players.get_all()) do
                    checked=checked+1
                    if checked>24 then break end
                    if p and not p.is_self then
                        local pos=p.head_pos or p.position
                        local s=pos and w2s(pos)
                        if s and (s.visible==nil or s.visible==true) then
                            local dx=(s.X or cx)-cx; local dy=(s.Y or cy)-cy; local d=math.sqrt(dx*dx+dy*dy)
                            if d<bestD and d<=20 then best,bestS,bestD=p,s,d end
                        end
                    end
                end
            end)
        end
        __EC13.cache.checkPlayer, __EC13.cache.checkScreen, __EC13.cache.checkDist = best,bestS,bestD
        return best,bestS,bestD
    end
    local function check_label(p)
        local score=0
        local tool = tostring((p and (p.tool or p.weapon or p.current_weapon)) or ""):lower()
        if tool:find("barrett") or tool:find("m4") or tool:find("pkm") or tool:find("aa12") then score=score+18 end
        local label="low"; local col="good"
        if score >= 45 then label="high"; col="bad" elseif score >= 18 then label="medium"; col="warn" end
        return score,label,col
    end
    function __ec16_draw_player_info_checker_v16()
        local target = (__EC16 and __EC16.playerInfoChecker == true)
        if not target then
            __EC13.target.alpha = lerp(__EC13.target.alpha or 0,0,0.08)
            return
        end
        local p,s = scan_target_20fov()
        if p then __EC13.target.player=p; __EC13.target.screen=s; __EC13.target.last=now() end
        local active = (p ~= nil) or (__EC13.target.last and (now()-__EC13.target.last)<0.18)
        __EC13.target.alpha = lerp(__EC13.target.alpha or 0, active and 1 or 0, 0.08)
        local a = smooth(__EC13.target.alpha or 0)
        if a < 0.025 then return end
        p = __EC13.target.player; s = __EC13.target.screen
        if not p or not s then return end
        local theme = th()
        local uid = uid_from_player(p)
        local name = tostring(p.name or p.display_name or "Player")
        if #name>13 then name=string.sub(name,1,13).."..." end
        local score,label,colKey = check_label(p)
        local col = theme[colKey] or theme.good
        local cardW,cardH = 164,48
        local x=(s.X or 0)-cardW*0.5
        local y=(s.Y or 0)-72-8*(1-a)
        rr(x-1,y-1,x+cardW+1,y+cardH+1,theme.acc[1],theme.acc[2],theme.acc[3],0.045*a,9)
        rr(x,y,x+cardW,y+cardH,theme.pane[1],theme.pane[2],theme.pane[3],0.56*a,8)
        rr(x+1,y+1,x+cardW-1,y+cardH-1,theme.bg[1],theme.bg[2],theme.bg[3],0.48*a,7)
        draw_avatar(x+8,y+8,24,uid,name,theme,a)
        txt_left(x+39,y+7,name,theme.text[1],theme.text[2],theme.text[3],0.93*a)
        txt_left(x+39,y+22,"check: "..label,col[1],col[2],col[3],0.86*a)
        rect(x+39,y+39,x+39+math.floor(98*clamp(score/100,0,1)),y+41,col[1],col[2],col[3],0.70*a)
        rect(x+39,y+41,x+137,y+42,theme.line[1],theme.line[2],theme.line[3],0.22*a)
    end

    hooks.on_render(function()
        pcall(__ec16_draw_local_card_v18)
        pcall(__ec16_draw_player_info_checker_v16)
    end)

    notify("Eclipze UI cleanup loaded", "success")
end


-- ============================================================
-- FINAL FIX: remove giant black Loading overlay / intro artifact
-- This is intentionally appended instead of deleting old code.
-- ============================================================
do
    __EC16 = __EC16 or {}
    __EC13 = __EC13 or { target = {}, cache = {} }
    __EC13.target = __EC13.target or {}

    local function ec_safe(fn, ...)
        if fn then
            local ok, res = pcall(fn, ...)
            if ok then return res end
        end
        return nil
    end

    local function ec_open_menu_now()
        __EC16.phase = "menu"
        __EC16_MENU_ALLOWED = true
        __EC16.open = true
        __EC16.wantOpen = true
        __EC16.animDir = 1
        if not __EC16.anim or __EC16.anim < 0.92 then
            __EC16.anim = 1
        end
    end

    -- Removes the big black rectangle from the screenshot.
    -- Old loading/intro functions stay in the file, but these override them at runtime.
    function __ec16_loading(w, h, cx, cy)
        ec_open_menu_now()
        return nil
    end

    function __ec16_intro(w, h, cx, cy)
        ec_open_menu_now()
        return nil
    end

    -- If the file was already stuck on the bad screen, force it out.
    if __EC16.phase == "loading" or __EC16.phase == "intro" or __EC16.phase == "loader" then
        ec_open_menu_now()
    end

    -- Keep checker code present, but clear stale artifact cache when it is off.
    local __prev_people_checker = __ec16_draw_player_info_checker_v16
    function __ec16_draw_player_info_checker_v16()
        if not (__EC16 and __EC16.playerInfoChecker == true) then
            if __EC13 and __EC13.target then
                __EC13.target.alpha = 0
                __EC13.target.player = nil
                __EC13.target.screen = nil
                __EC13.target.last = nil
            end
            return nil
        end

        if __prev_people_checker then
            local ok = pcall(__prev_people_checker)
            if not ok and __EC13 and __EC13.target then
                __EC13.target.alpha = 0
                __EC13.target.player = nil
                __EC13.target.screen = nil
                __EC13.target.last = nil
            end
        end
        return nil
    end

    -- Notification text cleanup, without breaking original notify.
    if notify and not __EC16.__no_black_notify_clean then
        __EC16.__no_black_notify_clean = true
        local old_notify = notify
        notify = function(message, level)
            local msg = tostring(message or "")
            msg = string.gsub(msg, "[Ee][Cc][Ll][Ii][Pp][Zz][Ee]%.?[Ll]?[Uu]?[Aa]?", "Eclipze.Lua")
            msg = string.gsub(msg, "%s+", " ")
            msg = string.gsub(msg, "^%s+", "")
            msg = string.gsub(msg, "%s+$", "")
            return old_notify(msg, level)
        end
    end

    ec_safe(function()
        if notify then notify("Eclipze UI fixed", "success") end
    end)
end

-- ============================================================
-- FINAL USER FIX v19: Eclipze branding + clean transparent UI
-- ============================================================
do
    __EC16 = __EC16 or {}
    __EC13 = __EC13 or { anim = {}, click = {}, slider = {}, avatar = {}, fps = {}, user = {}, target = {}, cache = {} }
    __EC13.anim = __EC13.anim or {}
    __EC13.avatar = __EC13.avatar or {}
    __EC13.user = __EC13.user or {}
    __EC13.target = __EC13.target or {}
    __EC13.cache = __EC13.cache or {}

    __EC16.brandTitle = "Eclipze.Lua"
    __EC16.brandShort = "Eclipze"

    local function now()
        return (tick and tick()) or os.clock() or 0
    end

    local function clamp(v,a,b)
        v = tonumber(v or 0) or 0
        if v < a then return a end
        if v > b then return b end
        return v
    end

    local function lerp(a,b,t)
        return (a or b or 0) + ((b or 0) - (a or b or 0)) * clamp(t or 0,0,1)
    end

    local function smooth(t)
        t = clamp(t or 0,0,1)
        return t*t*(3-2*t)
    end

    local function text_w(s)
        s = tostring(s or "")
        if __ec16_text_w then return __ec16_text_w(s) end
        return #s * 7
    end

    local function rect(x1,y1,x2,y2,r,g,b,a)
        if __ec16_rect then
            __ec16_rect(x1,y1,x2,y2,r,g,b,a or 1)
        elseif Drawing and Drawing.DrawBoxFilled then
            Drawing.DrawBoxFilled(x1,y1,x2,y2,r,g,b,a or 1)
        end
    end

    local function out(x1,y1,x2,y2,r,g,b,a,t)
        if __ec16_out then
            __ec16_out(x1,y1,x2,y2,r,g,b,a or 1,t or 1)
        elseif Drawing and Drawing.DrawBox then
            Drawing.DrawBox(x1,y1,x2,y2,r,g,b,a or 1,t or 1)
        end
    end

    -- No corner circles. This is the fix for the black round blobs on transparent UI edges.
    function __ec16_draw_round_rect(a,b,c,d,r,g,bb,aa,rad)
        rect(a,b,c,d,r,g,bb,aa or 1)
    end

    local function txt_left(x,y,s,r,g,b,a)
        s = tostring(s or "")
        if Drawing and Drawing.DrawTextWithOutline then
            Drawing.DrawTextWithOutline(x + text_w(s)*0.5, y, s, r or 1,g or 1,b or 1,a or 1, 0,0,0,(a or 1)*0.90)
        elseif Drawing and Drawing.DrawText then
            Drawing.DrawText(x,y,s,r or 1,g or 1,b or 1,a or 1)
        end
    end

    local function theme()
        return {
            bg={0.018,0.016,0.040}, bg2={0.026,0.022,0.060},
            pane={0.050,0.040,0.105}, pane2={0.064,0.050,0.135},
            card={0.068,0.052,0.135}, card2={0.030,0.026,0.064},
            acc={__EC_PINK_R or 1.00,__EC_PINK_G or 0.00,__EC_PINK_B or 0.55},
            soft={__EC_PINK_SOFT_R or 1.00,__EC_PINK_SOFT_G or 0.18,__EC_PINK_SOFT_B or 0.72},
            line={0.40,0.25,0.78}, text={0.93,0.90,1.00}, dim={0.56,0.51,0.70},
            good={0.25,1.00,0.50}, warn={1.00,0.76,0.18}, bad={1.00,0.25,0.42}
        }
    end

    local function screen_center()
        local ss = ScreenSize and ScreenSize() or nil
        if not ss then return 960,540 end
        return (ss.Width or ss.X or 1920)*0.5, (ss.Height or ss.Y or 1080)*0.5
    end

    local function local_name()
        local name = "Player"
        pcall(function()
            if rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.get_name then
                    local v = lp:get_name()
                    if v and v ~= "" then name = tostring(v) end
                end
            end
        end)
        pcall(function()
            if name == "Player" and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.Name then name = tostring(lp.Name) end
            end
        end)
        return name
    end

    local function local_uid()
        local uid = nil
        pcall(function()
            if rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.user_id then uid = tonumber(lp:user_id() or 0) or nil end
            end
        end)
        pcall(function()
            if (not uid) and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.UserId then uid = tonumber(lp.UserId or 0) or nil end
            end
        end)
        return uid
    end

    local function uid_from_player(p)
        local uid = p and (p.user_id or p.UserId or p.userid or p.uid)
        uid = tonumber(uid or 0) or 0
        if uid ~= 0 then return uid end
        pcall(function()
            if p and p.player_addr and p.player_addr ~= 0 and rbx and rbx.instance then
                local inst = rbx.instance(p.player_addr)
                if inst and inst.user_id then uid = tonumber(inst:user_id() or 0) or 0 end
            end
        end)
        if uid ~= 0 then return uid end
        return nil
    end

    local function roblox_days_from_created(created)
        local yy,mm,dd = tostring(created or ""):match("^(%d+)%-(%d+)%-(%d+)")
        if not (yy and mm and dd and os and os.time) then return nil end
        local ok, ct = pcall(os.time, {year=tonumber(yy), month=tonumber(mm), day=tonumber(dd), hour=0})
        if not ok or not ct then return nil end
        local days = math.floor(((os.time() or ct) - ct) / 86400)
        if days >= 0 and days < 50000 then return days end
        return nil
    end

    local function account_info(uid)
        uid = tonumber(uid or 0) or 0
        if uid == 0 then return nil end
        local key = tostring(uid)
        local rec = __EC13.user[key]
        local t = now()
        if rec and rec.ready then return rec end
        if rec and rec.retry and t < rec.retry then return rec end
        rec = rec or { uid = uid }
        __EC13.user[key] = rec

        pcall(function()
            if not (Http and Http.get and Json and Json.decode) then
                rec.retry = t + 20
                return
            end
            local ok, st, body = Http.get("https://users.roblox.com/v1/users/" .. key, {timeout_ms=4500})
            if ok and st == 200 and body then
                local j = Json.decode(body)
                if j then
                    rec.name = j.name or rec.name
                    rec.displayName = j.displayName or rec.displayName
                    rec.created = j.created or rec.created
                    rec.days = roblox_days_from_created(rec.created) or rec.days
                    rec.ready = true
                end
            else
                rec.retry = t + 35
            end
        end)
        return rec
    end

    local function avatar_handle(uid, name)
        uid = tonumber(uid or 0) or 0
        if uid == 0 then return nil end
        local key = tostring(uid)
        local rec = __EC13.avatar[key]
        local t = now()
        if rec and rec.handle then
            if Drawing and Drawing.IsImageFailed and Drawing.IsImageFailed(rec.handle) then
                rec.handle = nil
                rec.retry = t + 1.5
            else
                return rec.handle
            end
        end
        if rec and rec.retry and t < rec.retry then return nil end
        rec = rec or { tries = 0 }
        __EC13.avatar[key] = rec
        if rec.loading then return nil end
        rec.loading = true
        rec.tries = (rec.tries or 0) + 1

        pcall(function()
            if __ec16_get_player_avatar_handle then
                local pseudo = { user_id=uid, UserId=uid, name=tostring(name or "Player"), Name=tostring(name or "Player") }
                local h = __ec16_get_player_avatar_handle(pseudo)
                if h then rec.handle = h end
            end
        end)

        pcall(function()
            if (not rec.handle) and Drawing and Drawing.LoadImage then
                local url = nil
                if Http and Http.roblox_avatar_headshot_url then
                    url = Http.roblox_avatar_headshot_url(uid, "150x150", "Png", false)
                end
                if type(url) == "string" and url ~= "" then
                    rec.handle = Drawing.LoadImage(url)
                    rec.url = url
                end
            end
        end)

        pcall(function()
            if (not rec.handle) and Http and Http.get and Json and Json.decode and Drawing and Drawing.LoadImage then
                local meta = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. key .. "&size=150x150&format=Png&isCircular=false"
                local ok, st, body = Http.get(meta, {timeout_ms=4500})
                if ok and st == 200 and body then
                    local j = Json.decode(body)
                    local img = j and j.data and j.data[1] and j.data[1].imageUrl
                    if type(img) == "string" and img ~= "" then
                        rec.handle = Drawing.LoadImage(img)
                        rec.url = img
                        if write_file then write_file("C:\\blueberry\\scripts\\ec16_avatar_player_" .. key .. ".txt", img) end
                    end
                end
            end
        end)

        pcall(function()
            if (not rec.handle) and Drawing and Drawing.LoadImage then
                local direct = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. key .. "&width=150&height=150&format=png"
                rec.handle = Drawing.LoadImage(direct)
                rec.url = direct
            end
        end)

        rec.loading = false
        if not rec.handle then rec.retry = t + math.min(45, 7 + (rec.tries or 1) * 5) end
        return rec.handle
    end

    local function draw_square_avatar(x,y,s,uid,name,th,a)
        a = a or 1
        rect(x,y,x+s,y+s,th.bg2[1],th.bg2[2],th.bg2[3],0.92*a)
        out(x,y,x+s,y+s,th.acc[1],th.acc[2],th.acc[3],0.18*a,1)
        local h = avatar_handle(uid,name)
        local ready = false
        if h and Drawing and Drawing.IsImageReady then
            pcall(function() ready = Drawing.IsImageReady(h) == true end)
        elseif h then
            ready = true
        end
        if h and ready and Drawing and Drawing.DrawImage then
            local ok = pcall(function() Drawing.DrawImage(h,x+1,y+1,s-2,s-2) end)
            if ok then return end
        end
        local letter = string.upper(string.sub(tostring(name or "P"),1,1))
        txt_left(x + s*0.5 - text_w(letter)*0.5, y + s*0.31, letter, th.text[1],th.text[2],th.text[3],0.95*a)
    end

    local function w2s(pos)
        local s = nil
        pcall(function()
            if __ec16_world_to_screen then
                local x,y,on = __ec16_world_to_screen(pos)
                if on then s = {X=x,Y=y,visible=true} end
            end
        end)
        if not s then pcall(function() if aim and aim.world_to_screen then s = aim.world_to_screen(pos) end end) end
        if not s then pcall(function() if rbx and rbx.world_to_screen then s = rbx.world_to_screen(pos) end end) end
        return s
    end

    local function scan_target_20fov()
        local t = now()
        __EC13.cache.checkLast = __EC13.cache.checkLast or 0
        if (t - __EC13.cache.checkLast) < 0.10 then
            return __EC13.cache.checkPlayer, __EC13.cache.checkScreen, __EC13.cache.checkDist
        end
        __EC13.cache.checkLast = t
        local best,bestS,bestD = nil,nil,21
        local cx,cy = screen_center()
        pcall(function()
            if players and players.get_closest_to_crosshair then
                local p = players.get_closest_to_crosshair(20)
                if p and not p.is_self then
                    local pos = p.head_pos or p.position
                    local s = pos and w2s(pos)
                    if s and (s.visible == nil or s.visible == true) then
                        local dx=(s.X or cx)-cx; local dy=(s.Y or cy)-cy; local d=math.sqrt(dx*dx+dy*dy)
                        if d <= 20 then best,bestS,bestD = p,s,d end
                    end
                end
            end
        end)
        if (not best) and players and players.get_all then
            pcall(function()
                local checked = 0
                for _,p in ipairs(players.get_all()) do
                    checked = checked + 1
                    if checked > 32 then break end
                    if p and not p.is_self then
                        local pos = p.head_pos or p.position
                        local s = pos and w2s(pos)
                        if s and (s.visible == nil or s.visible == true) then
                            local dx=(s.X or cx)-cx; local dy=(s.Y or cy)-cy; local d=math.sqrt(dx*dx+dy*dy)
                            if d < bestD and d <= 20 then best,bestS,bestD = p,s,d end
                        end
                    end
                end
            end)
        end
        __EC13.cache.checkPlayer, __EC13.cache.checkScreen, __EC13.cache.checkDist = best,bestS,bestD
        return best,bestS,bestD
    end

    -- Clean top HUD: second screenshot says Eclipze, no pink dot/circle.
    function __ec16_draw_top_hud(mx,my,cl)
        if not (__EC16 and __EC16.phase == "menu") then return end
        local th = theme()
        local x = __EC16.hudX or 18
        local y = __EC16.hudY or 14
        local w,h = 218,34
        if __ec16_in and __ec16_in(mx,my,x,y,x+w,y+h) and cl and not (__EC16 and __EC16.lastClick) then
            __EC16.hudDragging = true
            __EC16.hudDragX = mx - x
            __EC16.hudDragY = my - y
        end
        if not cl then __EC16.hudDragging = false end
        if __EC16.hudDragging then
            x = mx - (__EC16.hudDragX or 0)
            y = my - (__EC16.hudDragY or 0)
            __EC16.hudX = x
            __EC16.hudY = y
        end
        rect(x,y,x+w,y+h,th.bg[1],th.bg[2],th.bg[3],0.66)
        rect(x+1,y+1,x+w-1,y+h-1,th.bg2[1],th.bg2[2],th.bg2[3],0.42)
        rect(x+10,y+h-5,x+w-10,y+h-3,th.acc[1],th.acc[2],th.acc[3],0.72)
        txt_left(x+14,y+9,__EC16.brandShort,th.text[1],th.text[2],th.text[3],0.93)
        local fps = tostring(__EC16.fpsValue or 0) .. " FPS"
        local ms = tostring(__EC16.msValue or 0) .. " ms"
        rect(x+100,y+11,x+143,y+23,0.05,0.04,0.095,0.52)
        txt_left(x+106,y+8,fps,th.dim[1],th.dim[2],th.dim[3],0.82)
        txt_left(x+158,y+8,ms,th.dim[1],th.dim[2],th.dim[3],0.82)
    end

    -- Menu header touch-up: first screenshot says Eclipze.Lua.
    local __prev_menu_v19 = __ec16_menu
    function __ec16_menu(mx,my,cl,w,h)
        if __prev_menu_v19 then pcall(__prev_menu_v19,mx,my,cl,w,h) end
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then return end
        local th = theme()
        local x = __EC16.x or 95
        local y = __EC16.y or 70
        local ww = __EC16.w or 960
        local a = smooth(__EC16.anim or 1)
        rect(x+8,y+7,x+148,y+37,th.bg[1],th.bg[2],th.bg[3],0.76*a)
        txt_left(x+22,y+13,__EC16.brandTitle,th.text[1],th.text[2],th.text[3],0.96*a)
        rect(x+10,y+35,x+ww-10,y+37,th.acc[1],th.acc[2],th.acc[3],0.88*a)
    end

    -- Clean, aligned local card. Fixes the uneven third screenshot.
    function __ec16_draw_local_card_v18()
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then return end
        local th = theme()
        local a = smooth(__EC16.anim or 1)
        local mx = __EC16.x or 95
        local my = __EC16.y or 70
        local x = mx + 38
        local y = my + 106
        local w,h = 168,54
        local name = local_name()
        local uid = local_uid()
        if #name > 15 then name = string.sub(name,1,15) .. "..." end
        rect(x-4,y-4,x+w+4,y+h+4,th.bg[1],th.bg[2],th.bg[3],0.62*a)
        rect(x,y,x+w,y+h,th.card[1],th.card[2],th.card[3],0.70*a)
        rect(x+1,y+1,x+w-1,y+h-1,th.bg2[1],th.bg2[2],th.bg2[3],0.52*a)
        draw_square_avatar(x+10,y+10,32,uid,name,th,a)
        txt_left(x+52,y+10,name,th.text[1],th.text[2],th.text[3],0.94*a)
        txt_left(x+52,y+27,"Local player",th.dim[1],th.dim[2],th.dim[3],0.80*a)
        rect(x+52,y+43,x+w-12,y+45,th.acc[1],th.acc[2],th.acc[3],0.74*a)
    end

    -- Player checker: square avatar + account days.
    function __ec16_draw_player_info_checker_v16()
        if not (__EC16 and __EC16.playerInfoChecker == true) then
            __EC13.target.alpha = lerp(__EC13.target.alpha or 0,0,0.11)
            if (__EC13.target.alpha or 0) < 0.025 then
                __EC13.target.player = nil
                __EC13.target.screen = nil
            end
            return
        end

        local p,s = scan_target_20fov()
        if p then
            __EC13.target.player = p
            __EC13.target.screen = s
            __EC13.target.last = now()
        end

        local active = (p ~= nil) or (__EC13.target.last and (now() - __EC13.target.last) < 0.22)
        __EC13.target.alpha = lerp(__EC13.target.alpha or 0, active and 1 or 0, 0.10)
        local a = smooth(__EC13.target.alpha or 0)
        if a < 0.025 then return end

        p = __EC13.target.player
        s = __EC13.target.screen
        if not p or not s then return end

        local th = theme()
        local uid = uid_from_player(p)
        local name = tostring(p.name or p.display_name or "Player")
        if #name > 15 then name = string.sub(name,1,15) .. "..." end
        local info = uid and account_info(uid) or nil
        local days = info and info.days or nil
        local ageText = days and (tostring(days) .. " days") or "? days"

        local cardW,cardH = 196,58
        local x = (s.X or 0) - cardW*0.5
        local y = (s.Y or 0) - 80 - 8*(1-a)
        rect(x-1,y-1,x+cardW+1,y+cardH+1,th.acc[1],th.acc[2],th.acc[3],0.050*a)
        rect(x,y,x+cardW,y+cardH,th.pane[1],th.pane[2],th.pane[3],0.58*a)
        rect(x+1,y+1,x+cardW-1,y+cardH-1,th.bg[1],th.bg[2],th.bg[3],0.50*a)
        draw_square_avatar(x+9,y+10,34,uid,name,th,a)
        txt_left(x+52,y+9,name,th.text[1],th.text[2],th.text[3],0.94*a)
        txt_left(x+52,y+26,"account: " .. ageText,th.dim[1],th.dim[2],th.dim[3],0.86*a)
        rect(x+52,y+45,x+cardW-12,y+47,th.acc[1],th.acc[2],th.acc[3],0.70*a)
    end

    -- Re-wrap notify so requested branding is not converted back.
    if notify and not __EC16.__v19_notify_brand then
        __EC16.__v19_notify_brand = true
        local old_notify = notify
        notify = function(message, level)
            local msg = tostring(message or "")
            msg = string.gsub(msg, "FALLEN", "ECLIPZE")
            msg = string.gsub(msg, "Fallen%.lua", "Eclipze.Lua")
            msg = string.gsub(msg, "Fallen", "Eclipze")
            return old_notify(msg, level)
        end
    end

    if __EC16.phase == "loading" or __EC16.phase == "intro" or __EC16.phase == "loader" then
        __EC16.phase = "menu"
        __EC16.open = true
        __EC16.wantOpen = true
        __EC16_MENU_ALLOWED = true
        __EC16.anim = 1
    end
end


-- ============================================================
-- FINAL USER FIX v20: loader back + Neverlose-style rounded skin
-- Cosmetic/UI patch only. Old code stays in the file.
-- ============================================================
do
    __EC16 = __EC16 or {}
    __EC13 = __EC13 or { anim = {}, click = {}, slider = {}, avatar = {}, fps = {}, user = {}, target = {}, cache = {} }
    __EC13.avatar = __EC13.avatar or {}
    __EC13.user = __EC13.user or {}
    __EC13.target = __EC13.target or {}
    __EC13.cache = __EC13.cache or {}

    __EC16.brandTitle = "Eclipze.Lua"
    __EC16.brandShort = "Eclipze"
    __EC16.bootShown = false

    local function now()
        return (tick and tick()) or os.clock() or 0
    end

    local function clamp(v,a,b)
        v = tonumber(v or 0) or 0
        if v < a then return a end
        if v > b then return b end
        return v
    end

    local function smooth(t)
        t = clamp(t or 0,0,1)
        return t*t*(3-2*t)
    end

    local function lerp(a,b,t)
        return (a or b or 0) + ((b or 0) - (a or b or 0)) * clamp(t or 0,0,1)
    end

    local function text_w(s)
        s = tostring(s or "")
        if __ec16_text_w then return __ec16_text_w(s) end
        return #s * 7
    end

    local function rect(x1,y1,x2,y2,r,g,b,a)
        if __ec16_rect then
            __ec16_rect(x1,y1,x2,y2,r,g,b,a or 1)
        elseif Drawing and Drawing.DrawBoxFilled then
            Drawing.DrawBoxFilled(x1,y1,x2,y2,r,g,b,a or 1)
        end
    end

    local function outline(x1,y1,x2,y2,r,g,b,a,t)
        if Drawing and Drawing.DrawBox then
            Drawing.DrawBox(x1,y1,x2,y2,r,g,b,a or 1,t or 1)
        end
    end

    local function rr(x1,y1,x2,y2,r,g,b,a,rad)
        rad = math.floor(math.min(rad or 9, math.abs(x2-x1)*0.5, math.abs(y2-y1)*0.5))
        if rad < 2 or not (Drawing and Drawing.DrawCircleFilled) then
            rect(x1,y1,x2,y2,r,g,b,a or 1)
            return
        end
        -- Rounded rectangle with matching circle caps. No random black blobs, because
        -- the old oversized cover panels are not used here.
        rect(x1+rad,y1,x2-rad,y2,r,g,b,a or 1)
        rect(x1,y1+rad,x2,y2-rad,r,g,b,a or 1)
        Drawing.DrawCircleFilled(x1+rad,y1+rad,rad,r,g,b,a or 1)
        Drawing.DrawCircleFilled(x2-rad,y1+rad,rad,r,g,b,a or 1)
        Drawing.DrawCircleFilled(x1+rad,y2-rad,rad,r,g,b,a or 1)
        Drawing.DrawCircleFilled(x2-rad,y2-rad,rad,r,g,b,a or 1)
    end

    local function txt_left(x,y,s,r,g,b,a)
        s = tostring(s or "")
        if Drawing and Drawing.DrawTextWithOutline then
            Drawing.DrawTextWithOutline(x + text_w(s)*0.5, y, s, r or 1,g or 1,b or 1,a or 1, 0,0,0,(a or 1)*0.92)
        elseif Drawing and Drawing.DrawText then
            Drawing.DrawText(x,y,s,r or 1,g or 1,b or 1,a or 1)
        end
    end

    local function txt_center(x,y,s,r,g,b,a)
        s = tostring(s or "")
        if Drawing and Drawing.DrawTextWithOutline then
            Drawing.DrawTextWithOutline(x,y,s,r or 1,g or 1,b or 1,a or 1,0,0,0,(a or 1)*0.92)
        elseif Drawing and Drawing.DrawText then
            Drawing.DrawText(x - text_w(s)*0.5,y,s,r or 1,g or 1,b or 1,a or 1)
        end
    end

    local function theme()
        return {
            bg      = {0.012,0.015,0.026},
            bg2     = {0.018,0.023,0.038},
            pane    = {0.030,0.036,0.058},
            pane2   = {0.042,0.050,0.078},
            card    = {0.050,0.058,0.088},
            card2   = {0.035,0.042,0.068},
            sidebar = {0.020,0.026,0.044},
            accent  = {0.22,0.55,1.00},
            accent2 = {0.47,0.70,1.00},
            text    = {0.90,0.94,1.00},
            dim     = {0.45,0.50,0.62},
            line    = {0.10,0.13,0.19},
            good    = {0.28,1.00,0.56},
            warn    = {1.00,0.75,0.22},
            bad     = {1.00,0.32,0.42}
        }
    end

    local function screen_size()
        local s = ScreenSize and ScreenSize() or nil
        if not s then return 1920,1080 end
        return (s.Width or s.X or 1920),(s.Height or s.Y or 1080)
    end

    local function screen_center()
        local w,h = screen_size()
        return w*0.5,h*0.5
    end

    local function local_name()
        local name = "Player"
        pcall(function()
            if rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.get_name then
                    local v = lp:get_name()
                    if v and v ~= "" then name = tostring(v) end
                end
            end
        end)
        pcall(function()
            if name == "Player" and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.Name then name = tostring(lp.Name) end
            end
        end)
        return name
    end

    local function local_uid()
        local uid = nil
        pcall(function()
            if rbx and rbx.local_player then
                local lp = rbx.local_player()
                if lp and lp.user_id then uid = tonumber(lp:user_id() or 0) or nil end
            end
        end)
        pcall(function()
            if (not uid) and GetLocalPlayer then
                local lp = GetLocalPlayer()
                if lp and lp.UserId then uid = tonumber(lp.UserId or 0) or nil end
            end
        end)
        return uid
    end

    local function uid_from_player(p)
        local uid = p and (p.user_id or p.UserId or p.userid or p.uid)
        uid = tonumber(uid or 0) or 0
        if uid ~= 0 then return uid end
        pcall(function()
            if p and p.player_addr and p.player_addr ~= 0 and rbx and rbx.instance then
                local inst = rbx.instance(p.player_addr)
                if inst and inst.user_id then uid = tonumber(inst:user_id() or 0) or 0 end
            end
        end)
        if uid ~= 0 then return uid end
        return nil
    end

    local function roblox_days_from_created(created)
        local yy,mm,dd = tostring(created or ""):match("^(%d+)%-(%d+)%-(%d+)")
        if not (yy and mm and dd and os and os.time) then return nil end
        local ok, createdTime = pcall(os.time, {year=tonumber(yy),month=tonumber(mm),day=tonumber(dd),hour=0,min=0,sec=0})
        if not ok or not createdTime then return nil end
        local d = math.floor(((os.time() or createdTime) - createdTime) / 86400)
        if d >= 0 and d < 50000 then return d end
        return nil
    end

    local function account_info(uid)
        uid = tonumber(uid or 0) or 0
        if uid == 0 then return nil end
        local key = tostring(uid)
        local rec = __EC13.user[key]
        local t = now()
        if rec and rec.ready then return rec end
        if rec and rec.retry and t < rec.retry then return rec end

        rec = rec or { uid = uid }
        __EC13.user[key] = rec
        rec.retry = t + 25

        pcall(function()
            if not (Http and Http.get and Json and Json.decode) then return end
            local ok, status, body = Http.get("https://users.roblox.com/v1/users/" .. key, {timeout_ms=4500})
            if ok and status == 200 and body then
                local j = Json.decode(body)
                if j then
                    rec.name = j.name or rec.name
                    rec.displayName = j.displayName or rec.displayName
                    rec.created = j.created or rec.created
                    rec.days = roblox_days_from_created(rec.created) or rec.days
                    rec.ready = true
                end
            end
        end)

        return rec
    end

    local function avatar_handle(uid,name)
        uid = tonumber(uid or 0) or 0
        if uid == 0 then return nil end
        local key = tostring(uid)
        local rec = __EC13.avatar[key]
        local t = now()

        if rec and rec.handle then
            local failed = false
            pcall(function()
                failed = Drawing and Drawing.IsImageFailed and Drawing.IsImageFailed(rec.handle) == true
            end)
            if failed then
                rec.handle = nil
                rec.retry = t + 1.0
            else
                return rec.handle
            end
        end

        if rec and rec.retry and t < rec.retry then return nil end
        rec = rec or { tries = 0 }
        __EC13.avatar[key] = rec
        if rec.loading then return nil end
        rec.loading = true
        rec.tries = (rec.tries or 0) + 1

        -- First try the existing API helper from the original file.
        pcall(function()
            if __ec16_get_player_avatar_handle then
                local pseudo = {user_id=uid,UserId=uid,name=tostring(name or "Player"),Name=tostring(name or "Player")}
                local h = __ec16_get_player_avatar_handle(pseudo)
                if h then rec.handle = h end
            end
        end)

        -- Then direct thumbnail endpoint.
        pcall(function()
            if (not rec.handle) and Http and Http.roblox_avatar_headshot_url and Drawing and Drawing.LoadImage then
                local url = Http.roblox_avatar_headshot_url(uid, "150x150", "Png", false)
                if type(url) == "string" and url ~= "" then
                    rec.handle = Drawing.LoadImage(url)
                    rec.url = url
                end
            end
        end)

        -- JSON endpoint to get real imageUrl.
        pcall(function()
            if (not rec.handle) and Http and Http.get and Json and Json.decode and Drawing and Drawing.LoadImage then
                local meta = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. key .. "&size=150x150&format=Png&isCircular=false"
                local ok, status, body = Http.get(meta, {timeout_ms=4500})
                if ok and status == 200 and body then
                    local j = Json.decode(body)
                    local img = j and j.data and j.data[1] and j.data[1].imageUrl
                    if type(img) == "string" and img ~= "" then
                        rec.handle = Drawing.LoadImage(img)
                        rec.url = img
                        if write_file then
                            write_file("C:\\blueberry\\scripts\\ec16_avatar_player_" .. key .. ".txt", img)
                        end
                    end
                end
            end
        end)

        -- Final old-style fallback.
        pcall(function()
            if (not rec.handle) and Drawing and Drawing.LoadImage then
                local url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. key .. "&width=150&height=150&format=png"
                rec.handle = Drawing.LoadImage(url)
                rec.url = url
            end
        end)

        rec.loading = false
        if not rec.handle then rec.retry = t + math.min(50, 8 + (rec.tries or 1) * 5) end
        return rec.handle
    end

    local function draw_avatar(x,y,s,uid,name,th,a)
        a = a or 1
        rr(x,y,x+s,y+s,th.card2[1],th.card2[2],th.card2[3],0.95*a,7)
        outline(x,y,x+s,y+s,th.accent[1],th.accent[2],th.accent[3],0.16*a,1)

        local h = avatar_handle(uid,name)
        local ready = false
        if h and Drawing and Drawing.IsImageReady then
            pcall(function() ready = Drawing.IsImageReady(h) == true end)
        elseif h then
            ready = true
        end

        if h and ready and Drawing and Drawing.DrawImage then
            local ok = pcall(function()
                Drawing.DrawImage(h, x+2, y+2, s-4, s-4, 1,1,1,0.98*a, 5)
            end)
            if ok then return end
        end

        local letter = string.upper(string.sub(tostring(name or "P"),1,1))
        txt_left(x + s*0.5 - text_w(letter)*0.5, y + s*0.30, letter, th.text[1],th.text[2],th.text[3],0.96*a)
    end

    -- Loading screen restored. It appears on injection and then opens the menu.
    function __ec16_loading(w,h,cx,cy)
        local th = theme()
        local t = now() - (__EC16.loadStart or now())
        local a = smooth(math.min(t/0.25,1))
        local p = clamp(t/1.65,0,1)

        rect(0,0,w,h,0,0,0,0.36*a)

        local pw,ph = 420,168
        local x1,y1 = cx-pw*0.5, cy-ph*0.5
        local x2,y2 = cx+pw*0.5, cy+ph*0.5
        rr(x1-1,y1-1,x2+1,y2+1,th.accent[1],th.accent[2],th.accent[3],0.10*a,16)
        rr(x1,y1,x2,y2,th.bg[1],th.bg[2],th.bg[3],0.96*a,15)
        rr(x1+10,y1+10,x2-10,y2-10,th.bg2[1],th.bg2[2],th.bg2[3],0.76*a,12)

        txt_center(cx,y1+34,__EC16.brandTitle,th.text[1],th.text[2],th.text[3],0.98*a)
        txt_center(cx,y1+57,"initializing interface",th.dim[1],th.dim[2],th.dim[3],0.86*a)

        local bx1,by1,bx2,by2 = x1+42,y2-55,x2-42,y2-43
        rr(bx1,by1,bx2,by2,th.pane[1],th.pane[2],th.pane[3],0.92*a,6)
        rr(bx1+1,by1+1,bx1+1+(bx2-bx1-2)*p,by2-1,th.accent[1],th.accent[2],th.accent[3],0.92*a,5)

        local dots = 3 + math.floor((t*3)%4)
        local dtext = "loading" .. string.rep(".", dots)
        txt_center(cx,y2-30,dtext,th.dim[1],th.dim[2],th.dim[3],0.86*a)

        if t > 1.70 then
            __EC16.phase = "intro"
            __EC16.introStart = now()
        end
    end

    function __ec16_intro(w,h,cx,cy)
        local th = theme()
        local t = now() - (__EC16.introStart or now())
        local fadeIn = smooth(t/0.28)
        local fadeOut = 1
        if t > 1.35 then fadeOut = 1 - smooth((t-1.35)/0.35) end
        local a = clamp(fadeIn * fadeOut,0,1)

        rect(0,0,w,h,0,0,0,0.30*a)
        txt_center(cx,cy-12,__EC16.brandTitle,th.text[1],th.text[2],th.text[3],0.98*a)
        rect(cx-86,cy+18,cx+86,cy+20,th.accent[1],th.accent[2],th.accent[3],0.90*a)
        txt_center(cx,cy+32,"ready",th.dim[1],th.dim[2],th.dim[3],0.80*a)

        if t > 1.75 then
            __EC16.phase = "menu"
            __EC16_MENU_ALLOWED = true
            __EC16.open = true
            __EC16.wantOpen = true
            __EC16.animDir = 1
            __EC16.anim = 0
            __EC16.bootShown = true
        end
    end

    -- Rounded shell behind the original menu, in the style of the screenshot.
    local prev_menu = __ec16_menu
    function __ec16_menu(mx,my,cl,w,h)
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then
            if prev_menu then pcall(prev_menu,mx,my,cl,w,h) end
            return
        end

        local th = theme()
        local x = __EC16.x or 95
        local y = __EC16.y or 70
        local ww = __EC16.w or 960
        local hh = __EC16.h or 610
        local a = smooth(__EC16.anim or 1)

        -- Fresh dark rounded shell first.
        rr(x-2,y-2,x+ww+2,y+hh+2,0,0,0,0.16*a,16)
        rr(x,y,x+ww,y+hh,th.bg[1],th.bg[2],th.bg[3],0.94*a,16)
        rr(x+8,y+8,x+ww-8,y+hh-8,th.bg2[1],th.bg2[2],th.bg2[3],0.38*a,13)

        -- Header and left navigation base like the reference.
        rr(x+10,y+10,x+ww-10,y+52,th.bg[1],th.bg[2],th.bg[3],0.96*a,12)
        rr(x+10,y+58,x+132,y+hh-12,th.sidebar[1],th.sidebar[2],th.sidebar[3],0.92*a,13)
        rect(x+132,y+60,x+134,y+hh-16,th.line[1],th.line[2],th.line[3],0.62*a)

        txt_left(x+24,y+22,__EC16.brandTitle,th.text[1],th.text[2],th.text[3],0.98*a)
        txt_left(x+24,y+38,"Fallen",th.dim[1],th.dim[2],th.dim[3],0.76*a)

        -- Soft section surfaces behind old content.
        rr(x+148,y+72,x+ww*0.56,y+hh-22,th.pane[1],th.pane[2],th.pane[3],0.34*a,12)
        rr(x+ww*0.58,y+72,x+ww-22,y+hh-22,th.pane[1],th.pane[2],th.pane[3],0.30*a,12)

        if prev_menu then pcall(prev_menu,mx,my,cl,w,h) end

        -- Clean title overlay so old patched titles cannot drift.
        rr(x+12,y+12,x+142,y+48,th.bg[1],th.bg[2],th.bg[3],0.88*a,11)
        txt_left(x+24,y+20,__EC16.brandTitle,th.text[1],th.text[2],th.text[3],0.98*a)
        txt_left(x+24,y+36,"Counter-style menu",th.dim[1],th.dim[2],th.dim[3],0.66*a)
        rect(x+10,y+52,x+ww-10,y+54,th.accent[1],th.accent[2],th.accent[3],0.70*a)
    end

    -- Top mini HUD, matching the second screenshot and blue style.
    function __ec16_draw_top_hud(mx,my,cl)
        if not (__EC16 and __EC16.phase == "menu") then return end
        local th = theme()
        local x = __EC16.hudX or 18
        local y = __EC16.hudY or 14
        local w,h = 216,34

        if __ec16_in and __ec16_in(mx,my,x,y,x+w,y+h) and cl and not (__EC16 and __EC16.lastClick) then
            __EC16.hudDragging = true
            __EC16.hudDragX = mx - x
            __EC16.hudDragY = my - y
        end
        if not cl then __EC16.hudDragging = false end
        if __EC16.hudDragging then
            x = mx - (__EC16.hudDragX or 0)
            y = my - (__EC16.hudDragY or 0)
            __EC16.hudX = x
            __EC16.hudY = y
        end

        rr(x,y,x+w,y+h,th.bg[1],th.bg[2],th.bg[3],0.82,10)
        rr(x+1,y+1,x+w-1,y+h-1,th.bg2[1],th.bg2[2],th.bg2[3],0.60,9)
        rect(x+10,y+h-5,x+w-10,y+h-3,th.accent[1],th.accent[2],th.accent[3],0.80)
        txt_left(x+14,y+9,__EC16.brandShort,th.text[1],th.text[2],th.text[3],0.94)

        local fps = tostring(__EC16.fpsValue or 0) .. " FPS"
        local ms = tostring(__EC16.msValue or 0) .. " ms"
        txt_left(x+96,y+9,fps,th.dim[1],th.dim[2],th.dim[3],0.82)
        txt_left(x+157,y+9,ms,th.dim[1],th.dim[2],th.dim[3],0.78)
    end

    -- Local player card: aligned avatar + text, like the reference bottom-left block.
    function __ec16_draw_local_card_v18()
        if not (__EC16 and __EC16.open and __EC16.phase == "menu") then return end
        local th = theme()
        local a = smooth(__EC16.anim or 1)
        local mx = __EC16.x or 95
        local my = __EC16.y or 70
        local mh = __EC16.h or 610
        local x = mx + 18
        local y = my + mh - 74
        local w,h = 108,56

        local name = local_name()
        local uid = local_uid()
        if #name > 10 then name = string.sub(name,1,10) .. "..." end

        rr(x,y,x+w,y+h,th.sidebar[1],th.sidebar[2],th.sidebar[3],0.88*a,12)
        rr(x+1,y+1,x+w-1,y+h-1,th.bg2[1],th.bg2[2],th.bg2[3],0.46*a,10)
        draw_avatar(x+9,y+12,34,uid,name,th,a)
        txt_left(x+50,y+13,name,th.text[1],th.text[2],th.text[3],0.94*a)
        txt_left(x+50,y+30,"Local",th.dim[1],th.dim[2],th.dim[3],0.80*a)
        rect(x+50,y+44,x+w-12,y+46,th.accent[1],th.accent[2],th.accent[3],0.82*a)
    end

    local function w2s(pos)
        local s = nil
        pcall(function()
            if __ec16_world_to_screen then
                local x,y,on = __ec16_world_to_screen(pos)
                if on then s = {X=x,Y=y,visible=true} end
            end
        end)
        if not s then pcall(function() if aim and aim.world_to_screen then s = aim.world_to_screen(pos) end end) end
        if not s then pcall(function() if rbx and rbx.world_to_screen then s = rbx.world_to_screen(pos) end end) end
        return s
    end

    local function scan_target_20fov()
        local t = now()
        __EC13.cache.checkLast = __EC13.cache.checkLast or 0
        if (t - __EC13.cache.checkLast) < 0.10 then
            return __EC13.cache.checkPlayer, __EC13.cache.checkScreen, __EC13.cache.checkDist
        end
        __EC13.cache.checkLast = t

        local best,bestS,bestD = nil,nil,21
        local cx,cy = screen_center()

        pcall(function()
            if players and players.get_closest_to_crosshair then
                local p = players.get_closest_to_crosshair(20)
                if p and not p.is_self then
                    local pos = p.head_pos or p.position
                    local s = pos and w2s(pos)
                    if s and (s.visible == nil or s.visible == true) then
                        local dx=(s.X or cx)-cx
                        local dy=(s.Y or cy)-cy
                        local d=math.sqrt(dx*dx+dy*dy)
                        if d <= 20 then best,bestS,bestD = p,s,d end
                    end
                end
            end
        end)

        if (not best) and players and players.get_all then
            pcall(function()
                local checked = 0
                for _,p in ipairs(players.get_all()) do
                    checked = checked + 1
                    if checked > 32 then break end
                    if p and not p.is_self then
                        local pos = p.head_pos or p.position
                        local s = pos and w2s(pos)
                        if s and (s.visible == nil or s.visible == true) then
                            local dx=(s.X or cx)-cx
                            local dy=(s.Y or cy)-cy
                            local d=math.sqrt(dx*dx+dy*dy)
                            if d < bestD and d <= 20 then best,bestS,bestD = p,s,d end
                        end
                    end
                end
            end)
        end

        __EC13.cache.checkPlayer = best
        __EC13.cache.checkScreen = bestS
        __EC13.cache.checkDist = bestD
        return best,bestS,bestD
    end

    -- Player checker: avatar lined up + account days.
    function __ec16_draw_player_info_checker_v16()
        if not (__EC16 and __EC16.playerInfoChecker == true) then
            __EC13.target.alpha = lerp(__EC13.target.alpha or 0,0,0.12)
            if (__EC13.target.alpha or 0) < 0.025 then
                __EC13.target.player = nil
                __EC13.target.screen = nil
            end
            return
        end

        local p,s = scan_target_20fov()
        if p then
            __EC13.target.player = p
            __EC13.target.screen = s
            __EC13.target.last = now()
        end

        local active = (p ~= nil) or (__EC13.target.last and (now() - __EC13.target.last) < 0.22)
        __EC13.target.alpha = lerp(__EC13.target.alpha or 0, active and 1 or 0, 0.10)
        local a = smooth(__EC13.target.alpha or 0)
        if a < 0.025 then return end

        p = __EC13.target.player
        s = __EC13.target.screen
        if not p or not s then return end

        local th = theme()
        local uid = uid_from_player(p)
        local name = tostring(p.name or p.display_name or "Player")
        if #name > 15 then name = string.sub(name,1,15) .. "..." end
        local info = uid and account_info(uid) or nil
        local days = info and info.days or nil
        local age = days and (tostring(days) .. " days") or "? days"

        local cardW,cardH = 214,62
        local x = (s.X or 0) - cardW*0.5
        local y = (s.Y or 0) - 84 - 8*(1-a)

        rr(x-1,y-1,x+cardW+1,y+cardH+1,th.accent[1],th.accent[2],th.accent[3],0.070*a,12)
        rr(x,y,x+cardW,y+cardH,th.bg[1],th.bg[2],th.bg[3],0.88*a,11)
        rr(x+1,y+1,x+cardW-1,y+cardH-1,th.bg2[1],th.bg2[2],th.bg2[3],0.62*a,10)

        draw_avatar(x+10,y+12,36,uid,name,th,a)
        txt_left(x+56,y+11,name,th.text[1],th.text[2],th.text[3],0.96*a)
        txt_left(x+56,y+29,"account: " .. age,th.dim[1],th.dim[2],th.dim[3],0.86*a)
        rect(x+56,y+49,x+cardW-14,y+51,th.accent[1],th.accent[2],th.accent[3],0.78*a)
    end

    -- Force boot loader once after injection, overriding the old "skip loader" patch.
    __EC16.phase = "loading"
    __EC16.loadStart = now()
    __EC16.introStart = 0
    __EC16.open = false
    __EC16.wantOpen = false
    __EC16_MENU_ALLOWED = false
    __EC16.anim = 0
    __EC16.animDir = 1

    if notify and not __EC16.__v20_notify_brand then
        __EC16.__v20_notify_brand = true
        local old_notify = notify
        notify = function(message, level)
            local msg = tostring(message or "")
            msg = string.gsub(msg, "FALLEN", "ECLIPZE")
            msg = string.gsub(msg, "Fallen%.lua", "Eclipze.Lua")
            msg = string.gsub(msg, "Fallen", "Eclipze")
            return old_notify(msg, level)
        end
    end

    pcall(function()
        if notify then notify("Eclipze.Lua style loaded", "success") end
    end)
end

