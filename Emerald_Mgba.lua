----------------------------------------------------------
--variables ive been using / editing for rnging in emerald
--entirely for mgba, do variable = 1000
--or whatever number you want in mgba console
--if you want to do ho-oh, or  a mon that requires movement 
--shiny_key = 0
--shinyframe = 10000
--to change that to whatever key you want to use to triget the mon. ho-oh is key_up so do shiny_key = 6
--inorder to change variables, type it in the console for mgba
--\n key_a = 0, key_b = 1, \n key_select = 2, key_start = 3\n key_right = 4 key_left = 5 key_up = 6 key_down = 7,\n key_l = 8, key_r = 9
--
----------------------------------------------------------
shinyframe = 10000000000000000  --default is realy high number so it doesnt trigger without you setting it in console
locationOffset = 0
direction_held_time = 20
button_frame_delay = 4
key_shiny = 0
console:log("if here are the variables and values i use for the script \n shinyframe = 10000000000000000\n key_shiny = 0 \n key_a = 0, key_b = 1, \n key_select = 2, key_start = 3\n key_right = 4 key_left = 5 key_up = 6 key_down = 7,\n key_l = 8, key_r = 9")

-------------------------------------------------------------------------------------------------------------------------------------
-- pokefinder information for hunting in emerald IN EMU, in cart they may be a few frames off due to original hardware limitations --
-------------------------------------------------------------------------------------------------------------------------------------
--known offsets from some rediter Kaus_Raube. NOT TESTED BY ME
-------------------------------------------------------------------------------------------------------------------------------------
--
--
--
--
--
--
--
--
--
--
--
-------------------------------------------------------------------------------------------------------------------------------------
--MY KNOWN RNG OFFSETS
-------------------------------------------------------------------------------------------------------------------------------------
--time offsets, for pokefinder its target frame - location offset - pokemon offset. you are going to have to do the math for now because i havent done an offset table or made anything interactive yet.
--
--pokefinder wild location offset is 264 or 262 for grass, and 274 for cave
--
--
--
-- 
-- MY TESTED OFFSETS  (remember to REMOVE this from the frames not add)
-- ho-oh = 377 
-- lugia = 275 
-- deoxis = 500 (note, deoxis can only be cought officially on english carts. if you get flagged for cheating by using deoxis on jp, idk man)
-- regi-rock = 102
-- regi-ice = 102
-- groudon = 287
--
----------------------------------------------------------------------------------------------
-- mostly original Emerald RNG 2.0 .lua vba variables start here							--
-- minor changes mostly for mgba compatability					                            --
----------------------------------------------------------------------------------------------
local natureNamesList = {
"Hardy", "Lonely", "Brave", "Adamant", "Naughty","Bold", "Docile", "Relaxed", "Impish", "Lax","Timid", "Hasty", "Serious", "Jolly", "Naive","Modest", "Mild", "Quiet", "Bashful", "Rash","Calm", "Gentle", "Sassy", "Careful", "Quirky"
}

local HPTypeNamesList = {
	"Fighting", "Flying", "Poison", "Ground","Rock", "Bug", "Ghost", "Steel","Fire", "Water", "Grass", "Electric","Psychic", "Ice", "Dragon", "Dark"}

local speciesNamesList = {
-- Gen 1
"Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle", "Blastoise","Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata","Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew", "Sandslash", "Nidoran♀","Nidorina", "Nidoqueen", "Nidoran♂", "Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat","Venomoth", "Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape", "Growlithe","Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp","Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta","Rapidash", "Slowpoke", "Slowbro", "Magnemite", "Magneton", "Farfetch'd", "Doduo", "Dodrio", "Seel", "Dewgong","Grimer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno", "Krabby","Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan","Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea", "Seadra","Goldeen", "Seaking", "Staryu", "Starmie", "Mr. Mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros","Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar","Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite","Mewtwo", "Mew",
-- Gen 2
"Chikorita", "Bayleef", "Meganium", "Cyndaquil", "Quilava", "Typhlosion", "Totodile", "Croconaw", "Feraligatr","Sentret", "Furret", "Hoothoot", "Noctowl", "Ledyba", "Ledian", "Spinarak", "Ariados", "Crobat", "Chinchou", "Lanturn","Pichu", "Cleffa", "Igglybuff", "Togepi", "Togetic", "Natu", "Xatu", "Mareep", "Flaaffy", "Ampharos", "Bellossom","Marill", "Azumarill", "Sudowoodo", "Politoed", "Hoppip", "Skiploom", "Jumpluff", "Aipom", "Sunkern", "Sunflora","Yanma", "Wooper", "Quagsire", "Espeon", "Umbreon", "Murkrow", "Slowking", "Misdreavus", "Unown", "Wobbuffet","Girafarig", "Pineco", "Forretress", "Dunsparce", "Gligar", "Steelix", "Snubbull", "Granbull", "Qwilfish", "Scizor","Shuckle", "Heracross", "Sneasel", "Teddiursa", "Ursaring", "Slugma", "Magcargo", "Swinub", "Piloswine", "Corsola","Remoraid", "Octillery", "Delibird", "Mantine", "Skarmory", "Houndour", "Houndoom", "Kingdra", "Phanpy", "Donphan","Porygon2", "Stantler", "Smeargle", "Tyrogue", "Hitmontop", "Smoochum", "Elekid", "Magby", "Miltank", "Blissey","Raikou", "Entei", "Suicune", "Larvitar", "Pupitar", "Tyranitar", "Lugia", "Ho-Oh", "Celebi",
-- Gen 3
"Treecko", "Grovyle", "Sceptile", "Torchic", "Combusken", "Blaziken", "Mudkip", "Marshtomp", "Swampert", "Poochyena","Mightyena", "Zigzagoon", "Linoone", "Wurmple", "Silcoon", "Beautifly", "Cascoon", "Dustox", "Lotad", "Lombre", "Ludicolo","Seedot", "Nuzleaf", "Shiftry", "Taillow", "Swellow", "Wingull", "Pelipper", "Ralts", "Kirlia", "Gardevoir", "Surskit","Masquerain", "Shroomish", "Breloom", "Slakoth", "Vigoroth", "Slaking", "Nincada", "Ninjask", "Shedinja", "Whismur","Loudred", "Exploud", "Makuhita", "Hariyama", "Azurill", "Nosepass", "Skitty", "Delcatty", "Sableye", "Mawile", "Aron","Lairon", "Aggron", "Meditite", "Medicham", "Electrike", "Manectric", "Plusle", "Minun", "Volbeat", "Illumise", "Roselia","Gulpin", "Swalot", "Carvanha", "Sharpedo", "Wailmer", "Wailord", "Numel", "Camerupt", "Torkoal", "Spoink", "Grumpig","Spinda", "Trapinch", "Vibrava", "Flygon", "Cacnea", "Cacturne", "Swablu", "Altaria", "Zangoose", "Seviper", "Lunatone","Solrock", "Barboach", "Whiscash", "Corphish", "Crawdaunt", "Baltoy", "Claydol", "Lileep", "Cradily", "Anorith", "Armaldo","Feebas", "Milotic", "Castform", "Kecleon", "Shuppet", "Banette", "Duskull", "Dusclops", "Tropius", "Chimecho", "Absol","Wynaut", "Snorunt", "Glalie", "Spheal", "Sealeo", "Walrein", "Clamperl", "Huntail", "Gorebyss", "Relicanth", "Luvdisc","Bagon", "Shelgon", "Salamence", "Beldum", "Metang", "Metagross", "Regirock", "Regice", "Registeel", "Latias", "Latios","Kyogre", "Groudon", "Rayquaza", "Jirachi", "Deoxys"
}

local abilityNamesList = {
"Stench", "Drizzle", "Speed Boost", "Battle Armor", "Sturdy", "Damp", "Limber","Sand Veil", "Static", "Volt Absorb", "Water Absorb", "Oblivious", "Cloud Nine","Compound Eyes", "Insomnia", "Color Change", "Immunity", "Flash Fire","Shield Dust", "Own Tempo", "Suction Cups", "Intimidate", "Shadow Tag", "Rough Skin", "Wonder Guard", "Levitate", "Effect Spore", "Synchronize","Clear Body", "Natural Cure", "Lightning Rod", "Serene Grace", "Swift Swim","Chlorophyll", "Illuminate", "Trace", "Huge Power", "Poison Point", "Inner Focus","Magma Armor", "Water Veil", "Magnet Pull", "Soundproof", "Rain Dish", "Sand Stream","Pressure", "Thick Fat", "Early Bird", "Flame Body", "Run Away", "Keen Eye","Hyper Cutter", "Pickup", "Truant", "Hustle", "Cute Charm", "Plus", "Minus", "Forecast","Sticky Hold", "Shed Skin", "Guts", "Marvel Scale", "Liquid Ooze", "Overgrow", "Blaze","Torrent", "Swarm", "Rock Head", "Drought", "Arena Trap", "Vital Spirit", "White Smoke","Pure Power", "Shell Armor", "Cacophony", "Air Lock"
}

local moveNamesList = {
"--" , "Pound", "Karate Chop", "Double Slap", "Comet Punch", "Mega Punch", "Pay Day", "Fire Punch", "Ice Punch", "Thunder Punch","Scratch", "Vice Grip", "Guillotine", "Razor Wind", "Swords Dance", "Cut", "Gust", "Wing Attack", "Whirlwind", "Fly","Bind", "Slam", "Vine Whip", "Stomp", "Double Kick", "Mega Kick", "Jump Kick", "Rolling Kick", "Sand Attack", "Headbutt","Horn Attack", "Fury Attack", "Horn Drill", "Tackle", "Body Slam", "Wrap", "Take Down", "Thrash", "Double-Edge","Tail Whip", "Poison Sting", "Twineedle", "Pin Missile", "Leer", "Bite", "Growl", "Roar", "Sing", "Supersonic", "Sonic Boom","Disable", "Acid", "Ember", "Flamethrower", "Mist", "Water Gun", "Hydro Pump", "Surf", "Ice Beam", "Blizzard", "Psybeam","Bubble Beam", "Aurora Beam", "Hyper Beam", "Peck", "Drill Peck", "Submission", "Low Kick", "Counter", "Seismic Toss","Strength", "Absorb", "Mega Drain", "Leech Seed", "Growth", "Razor Leaf", "Solar Beam", "Poison Powder", "Stun Spore","Sleep Powder", "Petal Dance", "String Shot", "Dragon Rage", "Fire Spin", "Thunder Shock", "Thunderbolt", "Thunder Wave","Thunder", "Rock Throw", "Earthquake", "Fissure", "Dig", "Toxic", "Confusion", "Psychic", "Hypnosis", "Meditate","Agility", "Quick Attack", "Rage", "Teleport", "Night Shade", "Mimic", "Screech", "Double Team", "Recover", "Harden","Minimize", "Smokescreen", "Confuse Ray", "Withdraw", "Defense Curl", "Barrier", "Light Screen", "Haze", "Reflect","Focus Energy", "Bide", "Metronome", "Mirror Move", "Self-Destruct", "Egg Bomb", "Lick", "Smog", "Sludge", "Bone Club","Fire Blast", "Waterfall", "Clamp", "Swift", "Skull Bash", "Spike Cannon", "Constrict", "Amnesia", "Kinesis", "Soft-Boiled","High Jump Kick", "Glare", "Dream Eater", "Poison Gas", "Barrage", "Leech Life", "Lovely Kiss", "Sky Attack", "Transform","Bubble", "Dizzy Punch", "Spore", "Flash", "Psywave", "Splash", "Acid Armor", "Crabhammer", "Explosion", "Fury Swipes","Bonemerang", "Rest", "Rock Slide", "Hyper Fang", "Sharpen", "Conversion", "Tri Attack", "Super Fang", "Slash","Substitute", "Struggle", "Sketch", "Triple Kick", "Thief", "Spider Web", "Mind Reader", "Nightmare", "Flame Wheel","Snore", "Curse", "Flail", "Conversion 2", "Aeroblast", "Cotton Spore", "Reversal", "Spite", "Powder Snow", "Protect","Mach Punch", "Scary Face", "Feint Attack", "Sweet Kiss", "Belly Drum", "Sludge Bomb", "Mud-Slap", "Octazooka", "Spikes","Zap Cannon", "Foresight", "Destiny Bond", "Perish Song", "Icy Wind", "Detect", "Bone Rush", "Lock-On", "Outrage","Sandstorm", "Giga Drain", "Endure", "Charm", "Rollout", "False Swipe", "Swagger", "Milk Drink", "Spark", "Fury Cutter","Steel Wing", "Mean Look", "Attract", "Sleep Talk", "Heal Bell", "Return", "Present", "Frustration", "Safeguard","Pain Split", "Sacred Fire", "Magnitude", "Dynamic Punch", "Megahorn", "Dragon Breath", "Baton Pass", "Encore", "Pursuit","Rapid Spin", "Sweet Scent", "Iron Tail", "Metal Claw", "Vital Throw", "Morning Sun", "Synthesis", "Moonlight", "Hidden Power","Cross Chop", "Twister", "Rain Dance", "Sunny Day", "Crunch", "Mirror Coat", "Psych Up", "Extreme Speed", "Ancient Power","Shadow Ball", "Future Sight", "Rock Smash", "Whirlpool", "Beat Up", "Fake Out", "Uproar", "Stockpile", "Spit Up","Swallow", "Heat Wave", "Hail", "Torment", "Flatter", "Will-O-Wisp", "Memento", "Facade", "Focus Punch", "Smelling Salts","Follow Me", "Nature Power", "Charge", "Taunt", "Helping Hand", "Trick", "Role Play", "Wish", "Assist", "Ingrain","Superpower", "Magic Coat", "Recycle", "Revenge", "Brick Break", "Yawn", "Knock Off", "Endeavor", "Eruption", "Skill Swap","Imprison", "Refresh", "Grudge", "Snatch", "Secret Power", "Dive", "Arm Thrust", "Camouflage", "Tail Glow", "Luster Purge","Mist Ball", "Feather Dance", "Teeter Dance", "Blaze Kick", "Mud Sport", "Ice Ball", "Needle Arm", "Slack Off","Hyper Voice", "Poison Fang", "Crush Claw", "Blast Burn", "Hydro Cannon", "Meteor Mash", "Astonish", "Weather Ball","Aromatherapy", "Fake Tears", "Air Cutter", "Overheat", "Odor Sleuth", "Rock Tomb", "Silver Wind", "Metal Sound","Grass Whistle", "Tickle", "Cosmic Power", "Water Spout", "Signal Beam", "Shadow Punch", "Extrasensory", "Sky Uppercut","Sand Tomb", "Sheer Cold", "Muddy Water", "Bullet Seed", "Aerial Ace", "Icicle Spear", "Iron Defense", "Block", "Howl","Dragon Claw", "Frenzy Plant", "Bulk Up", "Bounce", "Mud Shot", "Poison Tail", "Covet", "Volt Tackle", "Magical Leaf","Water Sport", "Calm Mind", "Leaf Blade", "Dragon Dance", "Rock Blast", "Shock Wave", "Water Pulse", "Doom Desire","Psycho Boost"
}

local nationalDexList = {
1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119,120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159,160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179,180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219,220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239,240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 387, 388, 389, 390, 391, 392, 393, 394,395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 252, 253, 254,255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274,275, 290, 291, 292, 276, 277, 285, 286, 327, 278, 279, 283, 284, 320, 321, 300, 301, 352, 343, 344,299, 324, 302, 339, 340, 370, 341, 342, 349, 350, 318, 319, 328, 329, 330, 296, 297, 309, 310, 322,323, 363, 364, 365, 331, 332, 361, 362, 337, 338, 298, 325, 326, 311, 312, 303, 307, 308, 333, 334,360, 355, 356, 315, 287, 288, 289, 316, 317, 357, 293, 294, 295, 366, 367, 368, 359, 353, 354, 336,335, 369, 304, 305, 306, 351, 313, 314, 345, 346, 347, 348, 280, 281, 282, 371, 372, 373, 374, 375,376, 377, 378, 379, 382, 383, 384, 380, 381, 385, 386, 358
}

local pokemonAbilities = {
[001] = {65, 34}, [002] = {65, 34}, [003] = {65, 34}, [004] = {66}, [005] = {66}, [006] = {66}, [007] = {67, 44},[008] = {67, 44}, [009] = {67, 44}, [010] = {19, 50}, [011] = {61}, [012] = {14}, [013] = {19, 50}, [014] = {61},[015] = {68}, [016] = {51}, [017] = {51}, [018] = {51}, [019] = {50, 62, 55}, [020] = {50, 62, 55}, [021] = {51},[022] = {51}, [023] = {22, 61}, [024] = {22, 61}, [025] = {9, 31}, [026] = {9, 31}, [027] = {8}, [028] = {8},[029] = {38, 55}, [030] = {38, 55}, [031] = {38}, [032] = {38, 55}, [033] = {38, 55}, [034] = {38}, [035] = {56},[036] = {56}, [037] = {18, 70}, [038] = {18, 70}, [039] = {56}, [040] = {56}, [041] = {39}, [042] = {39},[043] = {34, 50}, [044] = {34, 1}, [045] = {34, 27}, [046] = {27, 6}, [047] = {27, 6}, [048] = {14, 50},[049] = {19}, [050] = {8, 71}, [051] = {8, 71}, [052] = {53}, [053] = {7}, [054] = {6, 13, 33},[055] = {6, 13, 33}, [056] = {72}, [057] = {72}, [058] = {22, 18}, [059] = {22, 18}, [060] = {11, 6, 33},[061] = {11, 6, 33}, [062] = {11, 6, 33}, [063] = {28, 39}, [064] = {28, 39}, [065] = {28, 39}, [066] = {62},[067] = {62}, [068] = {62}, [069] = {34}, [070] = {34}, [071] = {34}, [072] = {29, 64, 44}, [073] = {29, 64, 44},[074] = {69, 5, 8}, [075] = {69, 5, 8}, [076] = {69, 5, 8}, [077] = {50, 18, 49}, [078] = {50, 18, 49},[079] = {12, 20}, [080] = {12, 20}, [081] = {42, 5}, [082] = {42, 5}, [083] = {51, 39}, [084] = {50, 48},[085] = {50, 48}, [086] = {47}, [087] = {47}, [088] = {1, 60}, [089] = {1, 60}, [090] = {75}, [091] = {75},[092] = {26}, [093] = {26}, [094] = {26}, [095] = {69, 5}, [096] = {15, 39}, [097] = {15, 39}, [098] = {52, 75},[099] = {52, 75}, [100] = {43, 9}, [101] = {43, 9}, [102] = {34}, [103] = {34}, [104] = {69, 31, 4},[105] = {69, 31, 4}, [106] = {7}, [107] = {51, 39}, [108] = {20, 12, 13}, [109] = {26, 1}, [110] = {26, 1},[111] = {31, 69}, [112] = {31, 69}, [113] = {30, 32}, [114] = {34}, [115] = {48, 39}, [116] = {33, 6},[117] = {38, 6}, [230] = {33, 6}, [118] = {33, 41, 31}, [119] = {33, 41, 31}, [120] = {35, 30}, [121] = {35, 30},[122] = {43}, [123] = {68}, [212] = {68}, [238] = {12}, [124] = {12}, [239] = {9, 72}, [125] = {9, 72},[240] = {49, 72}, [126] = {49, 72}, [127] = {52}, [128] = {22}, [129] = {33}, [130] = {22}, [131] = {11, 75},[132] = {7}, [133] = {50}, [134] = {11}, [135] = {10}, [136] = {18, 62}, [196] = {28}, [197] = {28, 39},[137] = {36}, [233] = {36}, [138] = {33, 75}, [139] = {33, 75}, [140] = {33, 4}, [141] = {33, 4}, [142] = {69, 46},[143] = {17, 47}, [144] = {46}, [145] = {46, 9}, [146] = {46, 49}, [147] = {61, 63}, [148] = {61, 63}, [149] = {39},[150] = {46}, [151] = {28}, [152] = {65}, [153] = {65}, [154] = {65}, [155] = {66, 18}, [156] = {66, 18},[157] = {66, 18}, [158] = {67}, [159] = {67}, [160] = {67}, [161] = {50, 51}, [162] = {50, 51}, [163] = {15, 51},[164] = {15, 51}, [165] = {68, 48}, [166] = {68, 48}, [167] = {68, 15}, [168] = {68, 15}, [169] = {39},[170] = {10, 35, 11}, [171] = {10, 35, 11}, [172] = {9, 31}, [173] = {56}, [174] = {56}, [175] = {55, 32},[176] = {55, 32}, [177] = {28, 48}, [178] = {28, 48}, [179] = {9, 57}, [180] = {9, 57}, [181] = {9, 57}, [182] = {34},[183] = {47, 37}, [184] = {47, 37}, [185] = {5, 69}, [186] = {11, 6, 2}, [187] = {34}, [188] = {34}, [189] = {34},[190] = {50, 53}, [191] = {34, 48}, [192] = {34, 48}, [193] = {3, 14}, [194] = {6, 11}, [195] = {6, 11}, [198] = {15},[199] = {12, 20}, [200] = {26}, [201] = {26}, [202] = {23}, [203] = {39, 48}, [204] = {5}, [205] = {5},[206] = {32, 50}, [207] = {52, 8, 17}, [208] = {69, 5}, [209] = {22, 50}, [210] = {22}, [211] = {38, 33, 22},[213] = {5}, [214] = {68, 62}, [215] = {39, 51}, [216] = {53}, [217] = {62}, [218] = {40, 49}, [219] = {40, 49},[220] = {12, 47}, [221] = {12, 47}, [222] = {55, 30}, [223] = {55}, [224] = {21}, [225] = {72, 55, 15},[226] = {33, 11, 41}, [227] = {51, 5}, [228] = {48, 18}, [229] = {48, 18}, [231] = {53, 8}, [232] = {5, 8},[234] = {22}, [235] = {20}, [236] = {62, 72}, [237] = {22}, [241] = {47}, [242] = {30, 32}, [243] = {46, 39},[244] = {46, 39}, [245] = {46, 39}, [246] = {62, 8}, [247] = {61}, [248] = {45}, [249] = {46}, [250] = {46},[251] = {30}, [252] = {65}, [253] = {65}, [254] = {65}, [255] = {66, 3}, [256] = {66, 3}, [257] = {66, 3},[258] = {67, 6}, [259] = {67, 6}, [260] = {67, 6}, [261] = {50}, [262] = {22}, [263] = {53}, [264] = {53},[265] = {19, 50}, [266] = {61}, [267] = {68}, [268] = {61}, [269] = {19, 14}, [270] = {33, 44, 20}, [271] = {33, 44, 20},[272] = {33, 44, 20}, [273] = {34, 48}, [274] = {34, 48}, [275] = {34, 48}, [276] = {62}, [277] = {62}, [278] = {51, 44},[279] = {51, 2, 44}, [280] = {28, 36}, [281] = {28, 36}, [282] = {28, 36}, [283] = {33, 44}, [284] = {22}, [285] = {27},[286] = {27}, [287] = {54}, [288] = {72}, [289] = {54}, [290] = {14, 50}, [291] = {3}, [292] = {25}, [293] = {43},[294] = {43}, [295] = {43}, [296] = {47, 62}, [297] = {47, 62}, [298] = {47, 37}, [299] = {5, 42}, [300] = {56},[301] = {56}, [302] = {51}, [303] = {52, 22}, [304] = {5, 69}, [305] = {5, 69}, [306] = {5, 69}, [307] = {74},[308] = {74}, [309] = {9, 31, 58}, [310] = {9, 31, 58}, [311] = {57, 31}, [312] = {58, 10}, [313] = {35, 68}, [314] = {12},[315] = {30, 38}, [316] = {64, 60}, [317] = {64, 60}, [318] = {24, 3}, [319] = {24, 3}, [320] = {41, 12, 46},[321] = {41, 12, 46}, [322] = {12, 20}, [323] = {40}, [324] = {73, 70, 75}, [325] = {47, 20}, [326] = {47, 20}, [327] = {20},[328] = {52, 71}, [329] = {26}, [330] = {26}, [331] = {8, 11}, [332] = {8, 11}, [333] = {30, 13}, [334] = {30, 13},[335] = {17}, [336] = {61}, [337] = {26}, [338] = {26}, [339] = {12}, [340] = {12}, [341] = {52, 75}, [342] = {52, 75},[343] = {26}, [344] = {26}, [345] = {21}, [346] = {21}, [347] = {4, 33}, [348] = {4, 33}, [349] = {33, 12}, [350] = {63, 56},[351] = {59}, [352] = {16}, [353] = {15}, [354] = {15}, [355] = {26}, [356] = {46}, [357] = {34}, [358] = {26}, [359] = {46},[360] = {23}, [361] = {39}, [362] = {39}, [363] = {47, 12}, [364] = {47, 12}, [365] = {47, 12}, [366] = {75}, [367] = {33, 41},[368] = {33}, [369] = {33, 69, 5}, [370] = {33}, [371] = {69}, [372] = {69}, [373] = {22}, [374] = {29}, [375] = {29},[376] = {29}, [377] = {29, 5}, [378] = {29}, [379] = {29}, [380] = {26}, [381] = {26}, [382] = {2}, [383] = {70}, [384] = {77},[385] = {32}, [386] = {46}
}

local itemNamesList = {
"None", "Master Ball", "Ultra Ball", "Great Ball", "Poke Ball", "Safari Ball", "Net Ball", "Dive Ball", "Nest Ball", "Repeat Ball","Timer Ball", "Luxury Ball", "Premier Ball", "Potion", "Antidote", "Burn Heal", "Ice Heal", "Awakening", "Parlyz Heal", "Full Restore","Max Potion", "Hyper Potion", "Super Potion", "Full Heal", "Revive", "Max Revive", "Fresh Water", "Soda Pop", "Lemonade", "Moomoo Milk","EnergyPowder", "Energy Root", "Heal Powder", "Revival Herb", "Ether", "Max Ether", "Elixir", "Max Elixir", "Lava Cookie", "Blue Flute","Yellow Flute", "Red Flute", "Black Flute", "White Flute", "Berry Juice", "Sacred Ash", "Shoal Salt", "Shoal Shell", "Red Shard","Blue Shard", "Yellow Shard", "Green Shard", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown","unknown", "unknown", "unknown", "HP Up", "Protein", "Iron", "Carbos", "Calcium", "Rare Candy", "PP Up", "Zinc", "PP Max", "unknown","Guard Spec.", "Dire Hit", "X Attack", "X Defend", "X Speed", "X Accuracy", "X Special", "Poke Doll", "Fluffy Tail", "unknown","Super Repel", "Max Repel", "Escape Rope", "Repel", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "Sun Stone","Moon Stone", "Fire Stone", "Thunderstone", "Water Stone", "Leaf Stone", "unknown", "unknown", "unknown", "unknown", "TinyMushroom","Big Mushroom", "unknown", "Pearl", "Big Pearl", "Stardust", "Star Piece", "Nugget", "Heart Scale", "unknown", "unknown", "unknown","unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "Orange Mail", "Harbor Mail", "Glitter Mail", "Mech Mail", "Wood Mail","Wave Mail", "Bead Mail", "Shadow Mail", "Tropic Mail", "Dream Mail", "Fab Mail", "Retro Mail", "Cheri Berry", "Chesto Berry","Pecha Berry", "Rawst Berry", "Aspear Berry", "Leppa Berry", "Oran Berry", "Persim Berry", "Lum Berry", "Sitrus Berry", "Figy Berry","Wiki Berry", "Mago Berry", "Aguav Berry", "Iapapa Berry", "Razz Berry", "Bluk Berry", "Nanab Berry", "Wepear Berry", "Pinap Berry","Pomeg Berry", "Kelpsy Berry", "Qualot Berry", "Hondew Berry", "Grepa Berry", "Tamato Berry", "Cornn Berry", "Magost Berry", "Rabuta Berry","Nomel Berry", "Spelon Berry", "Pamtre Berry", "Watmel Berry", "Durin Berry", "Belue Berry", "Liechi Berry", "Ganlon Berry", "Salac Berry","Petaya Berry", "Apicot Berry", "Lansat Berry", "Starf Berry", "Enigma Berry", "unknown", "unknown", "unknown", "BrightPowder", "White Herb","Macho Brace", "Exp. Share", "Quick Claw", "Soothe Bell", "Mental Herb", "Choice Band", "King's Rock", "SilverPowder", "Amulet Coin","Cleanse Tag", "Soul Dew", "DeepSeaTooth", "DeepSeaScale", "Smoke Ball", "Everstone", "Focus Band", "Lucky Egg", "Scope Lens", "Metal Coat","Leftovers", "Dragon Scale", "Light Ball", "Soft Sand", "Hard Stone", "Miracle Seed", "BlackGlasses", "Black Belt", "Magnet", "Mystic Water","Sharp Beak", "Poison Barb", "NeverMeltIce", "Spell Tag", "TwistedSpoon", "Charcoal", "Dragon Fang", "Silk Scarf", "Up-Grade", "Shell Bell","Sea Incense", "Lax Incense", "Lucky Punch", "Metal Powder", "Thick Club", "Stick", "unknown", "unknown", "unknown", "unknown", "unknown","unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown","unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "Red Scarf", "Blue Scarf","Pink Scarf", "Green Scarf", "Yellow Scarf", "Mach Bike", "Coin Case", "Itemfinder", "Old Rod", "Good Rod", "Super Rod", "S.S. Ticket","Contest Pass", "unknown", "Wailmer Pail", "Devon Goods", "Soot Sack", "Basement Key", "Acro Bike", "Pokeblock Case", "Letter", "Eon Ticket","Red Orb", "Blue Orb", "Scanner", "Go-Goggles", "Meteorite", "Rm. 1 Key", "Rm. 2 Key", "Rm. 4 Key", "Rm. 6 Key", "Storage Key", "Root Fossil","Claw Fossil", "Devon Scope", "TM 01", "TM 02", "TM 03", "TM 04", "TM 05", "TM 06", "TM 07", "TM 08", "TM 09", "TM 10", "TM 11", "TM 12","TM 13", "TM 14", "TM 15", "TM 16", "TM 17", "TM 18", "TM 19", "TM 20", "TM 21", "TM 22", "TM 23", "TM 24", "TM 25", "TM 26", "TM 27", "TM 28","TM 29", "TM 30", "TM 31", "TM 32", "TM 33", "TM 34", "TM 35", "TM 36", "TM 37", "TM 38", "TM 39", "TM 40", "TM 41", "TM 42", "TM 43", "TM 44","TM 45", "TM 46", "TM 47", "TM 48", "TM 49", "TM 50", "HM 01", "HM 02", "HM 03", "HM 04", "HM 05", "HM 06", "HM 07", "HM 08", "unknown","unknown", "Oak's Parcel", "Poke Flute", "Secret Key", "Bike Voucher", "Gold Teeth", "Old Amber", "Card Key", "Lift Key", "Helix Fossil","Dome Fossil", "Silph Scope", "Bicycle", "Town Map", "VS Seeker", "Fame Checker", "TM Case", "Berry Pouch", "Teachy TV", "Tri-Pass","Rainbow Pass", "Tea", "MysticTicket", "AuroraTicket", "Powder Jar", "Ruby", "Sapphire", "Magma Emblem", "Old Sea Map"
}

local catchRatesList = {
-- Gen 1
45, 45, 45, 45, 45, 45, 45, 45, 45, 255, 120, 45, 255, 120, 45, 255, 120,45, 255, 127, 255, 90, 255, 90, 190, 75, 255, 90, 235, 120, 45, 235, 120,45, 150, 25, 190, 75, 170, 50, 255, 90, 255, 120, 45, 190, 75, 190, 75,255, 50, 255, 90, 190, 75, 190, 75, 190, 75, 255, 120, 45, 200, 100, 50,180, 90, 45, 255, 120, 45, 190, 60, 255, 120, 45, 190, 60, 190, 75, 190,60, 45, 190, 45, 190, 75, 190, 75, 190, 60, 190, 90, 45, 45, 190, 75,225, 60, 190, 60, 90, 45, 190, 75, 45, 45, 45, 190, 60, 120, 60, 30,45, 45, 225, 75, 225, 60, 225, 60, 45, 45, 45, 45, 45, 45, 45, 255, 45,45, 35, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 25, 3, 3, 3, 45, 45, 45,3, 45,
-- Gen 2
45, 45, 45, 45, 45, 45, 45, 45, 45, 255, 90, 255, 90, 255, 90, 255, 90,90, 190, 75, 190, 150, 170, 190, 75, 190, 75, 235, 120, 45, 45, 190, 75,65, 45, 255, 120, 45, 45, 235, 120, 75, 255, 90, 45, 45, 30, 70, 45, 225,45, 60, 190, 75, 190, 60, 25, 190, 75, 45, 25, 190, 45, 60, 120, 60, 190,75, 225, 75, 60, 190, 75, 45, 25, 25, 120, 45, 45, 120, 60, 45, 45, 45, 75,45, 45, 45, 45, 45, 30, 3, 3, 3, 45, 45, 45, 3, 3, 45,
-- Gen 3
45, 45, 45, 45, 45, 45, 45, 45, 45, 255, 127, 255, 90, 255, 120, 45, 120,45, 255, 120, 45, 255, 120, 45, 200, 45, 190, 45, 235, 120, 45, 200, 75,255, 90, 255, 120, 45, 255, 120, 45, 190, 120, 45, 180, 200, 150, 255, 255,60, 45, 45, 180, 90, 45, 180, 90, 120, 45, 200, 200, 150, 150, 150, 225, 75,225, 60, 125, 60, 255, 150, 90, 255, 60, 255, 255, 120, 45, 190, 60, 255,45, 90, 90, 45, 45, 190, 75, 205, 155, 255, 90, 45, 45, 45, 45, 255, 60, 45,200, 225, 45, 190, 90, 200, 45, 30, 125, 190, 75, 255, 120, 45, 255, 60,60, 25, 225, 45, 45, 45, 3, 3, 3, 3, 3, 3, 3, 3, 5, 5, 3, 3, 3
}

local locationNamesList = {
"Petalburg City", "Slateport City", "Mauville City", "Rustboro City", "Fortree City", "Lilycove City","Mossdeep City", "Sootopolis City", "Ever Grande City", "Littleroot Town", "Oldale Town", "Dewford Town","Lavaridge Town", "Fallarbor Town", "Verdanturf Town", "Pacifidlog Town", "Route 101", "Route 102","Route 103", "Route 104", "Route 105", "Route 106", "Route 107", "Route 108", "Route 109", "Route 110","Route 111", "Route 112", "Route 113", "Route 114", "Route 115", "Route 116", "Route 117", "Route 118","Route 119", "Route 120", "Route 121", "Route 122", "Route 123", "Route 124", "Route 125", "Route 126","Route 127", "Route 128", "Route 129", "Route 130", "Route 131", "Route 132", "Route 133", "Route 134","Underwater Route124", "Underwater Route126", "Underwater Route 127", "Underwater Route 128","Underwater Route 129", "Underwater Route 105", "Underwater Route 125"
}

local statusConditionNamesList = {
"None", "SLP", "PSN", "BRN", "FRZ", "PAR", "PSN"}
local gameversionaddr = 0x080000AE
local gameVersion = emu:read8(gameversionaddr)
local game
local gamelangaddr = 0x080000AF
local gameLang = emu:read8(gamelangaddr)
local language = ""
local warning

local mode = {"None", "Capture", "100% Catch", "Breeding", "Pandora", "TID Bot", "Pokemon Info"}
local index = 1
local prevKey = {}
local showInstructionsText = false
local leftArrowColor
local rightArrowColor
local leftInfoArrowColor
local rightInfoArrowColor
local prevKeyInfo = {}
local showRoamerInfoText = false
local showRngInfoText = true

local initSeedAddr = 0x02020000
local currSeedAddr
local tempInit = 0
local advances = 0
local advancesAddr
local adjustAdvances = 0
local battleVideoSeed1Addr
local battleVideoSeed2Addr

local wildAddr
local saveBlock1Addr
local saveBlock2Addr
local roamerMapGroupNumAddr
local prevPID = 0
local tempEncounterSeed = 0
local hitEncounterSeed = 0
local advancesHit = 0
local encounterMethod = 0

local speciesDexIndexAddr
local selectedItemAddr
local wildTypeAddr
local isUnderWaterAddr
local safariZoneStepsCounterAddr
local safariCatchFactorPointerAddr
local battleTurnsCounterAddr
local ballRate = {"1", "255", "2", "1.5", "1", "1.5", "1", "1", "1", "1", "1", "1", "1"}
local catchCheckFlagAddr = 0x0200558C
local startingCatchAdvances
local catchDelayCounter = 0
local catchDelay = 0

local skips
local oneTimeCatchRng = true
local currSeed2

local eggCurrSeedAddr
local timerAddr
local base = 0
local iter = 0
local partyAddr
local partySlotsCounterAddr
local eggPIDPointerAddr
local savePath = "./"
local TIDBotState = emu:saveStateFile(savePath)
local TIDFound = false
local botTargetTIDs = {0, 1, 1337, 8453, 8411, 11233, 11111, 22222, 33333}  -- Input here the bot target TIDs

local infoMode = {"Gift", "Party", "Party Stats", "Battle Party Stats", "Box", "1st Floor Box Stats", "2nd Floor Box Stats", "DayCare Box Stats"}
local infoIndex = 1
local partySelectedSlotNumberAddr
local pokemonStatsScreenAddr
local pokemonStatsScreen2Addr = 0x0200001C
local pokemonBattleStatsScreenAddr = 0x0200E808
local currBoxNumberPointerAddr
local boxSelectedSlotNumberAddr
----------------------------------------------------------------------------------------------
-- mostly original Emerald RNG code variables end here										--
----------------------------------------------------------------------------------------------
-- mostly original pokemon.lua code starts here												--
----------------------------------------------------------------------------------------------

local Game = {
	new = function (self, game)
		self.__index = self
		setmetatable(game, self)
		return game
	end
}

function Game.getParty(game)
	local party = {}
	local monStart = game._party
	local nameStart = game._partyNames
	local otStart = game._partyOt
	for i = 1, emu:read8(game._partyCount) do
		party[i] = game:_readPartyMon(monStart, nameStart, otStart)
		monStart = monStart + game._partyMonSize
		if game._partyNames then
			nameStart = nameStart + game._monNameLength + 1
		end
		if game._partyOt then
			otStart = otStart + game._playerNameLength + 1
		end
	end
	return party
end

function Game.toString(game, rawstring)
	local string = ""
	for _, char in ipairs({rawstring:byte(1, #rawstring)}) do
		if char == game._terminator then
			break
		end
		string = string..game._charmap[char]
	end
	return string
end

function Game.getSpeciesName(game, id)
	if game._speciesIndex then
		local index = game._index
		if not index then
			index = {}
			for i = 0, 255 do
				index[emu.memory.cart0:read8(game._speciesIndex + i)] = i
			end
			game._index = index
		end
		id = index[id]
	end
	local pointer = game._speciesNameTable + (game._speciesNameLength) * id
	return game:toString(emu.memory.cart0:readRange(pointer, game._monNameLength))
end

local GBGameEn = Game:new{
	_terminator=0x50,
	_monNameLength=10,
	_speciesNameLength=10,
	_playerNameLength=10,
}

local GBAGameEn = Game:new{
	_terminator=0xFF,
	_monNameLength=10,
	_speciesNameLength=11,
	_playerNameLength=10,
}

local Generation1En = GBGameEn:new{
	_boxMonSize=33,
	_partyMonSize=44,
}

local Generation2En = GBGameEn:new{
	_boxMonSize=32,
	_partyMonSize=48,
}

local Generation3En = GBAGameEn:new{
	_boxMonSize=80,
	_partyMonSize=100,
}

GBGameEn._charmap = { [0]=
	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", " ",	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",	"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "(", ")", ":", ";", "[", "]",	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",	"q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "é", "ʼd", "ʼl", "ʼs", "ʼt", "ʼv",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�",	"'", "P\u{200d}k", "M\u{200d}n", "-", "ʼr", "ʼm", "?", "!", ".", "ァ", "ゥ", "ェ", "▹", "▸", "▾", "♂",	"$", "×", ".", "/", ",", "♀", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
}

GBAGameEn._charmap = { [0]=
	" ", "À", "Á", "Â", "Ç", "È", "É", "Ê", "Ë", "Ì", "こ", "Î", "Ï", "Ò", "Ó", "Ô",	"Œ", "Ù", "Ú", "Û", "Ñ", "ß", "à", "á", "ね", "ç", "è", "é", "ê", "ë", "ì", "ま",	"î", "ï", "ò", "ó", "ô", "œ", "ù", "ú", "û", "ñ", "º", "ª", "�", "&", "+", "あ",	"ぃ", "ぅ", "ぇ", "ぉ", "v", "=", "ょ", "が", "ぎ", "ぐ", "げ", "ご", "ざ", "じ", "ず", "ぜ",	"ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ",	"っ", "¿", "¡", "P\u{200d}k", "M\u{200d}n", "P\u{200d}o", "K\u{200d}é", "�", "�", "�", "Í", "%", "(", ")", "セ", "ソ",	"タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "â", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "í",	"ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "⬆", "⬇", "⬅", "➡", "ヲ", "ン", "ァ",	"ィ", "ゥ", "ェ", "ォ", "ャ", "ュ", "ョ", "ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ",	"ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "ビ", "ブ", "ベ", "ボ", "パ", "ピ", "プ", "ペ", "ポ",	"ッ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?", ".", "-", "・",	"…", "“", "”", "‘", "’", "♂", "♀", "$", ",", "×", "/", "A", "B", "C", "D", "E",	"F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",	"V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",	"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "▶",	":", "Ä", "Ö", "Ü", "ä", "ö", "ü", "⬆", "⬇", "⬅", "�", "�", "�", "�", "�", ""
}


function _read16BE(emu, address)
	return (emu:read8(address) << 8) | emu:read8(address + 1)
end

function Generation1En._readBoxMon(game, address, nameAddress, otAddress)
	local mon = {}
	mon.species = emu.memory.cart0:read8(game._speciesIndex + emu:read8(address + 0) - 1)
	mon.hp = _read16BE(emu, address + 1)
	mon.level = emu:read8(address + 3)
	mon.status = emu:read8(address + 4)
	mon.type1 = emu:read8(address + 5)
	mon.type2 = emu:read8(address + 6)
	mon.catchRate = emu:read8(address + 7)
	mon.moves = {
		emu:read8(address + 8),
		emu:read8(address + 9),
		emu:read8(address + 10),
		emu:read8(address + 11),
	}
	mon.otId = _read16BE(emu, address + 12)
	mon.experience = (_read16BE(emu, address + 14) << 8)| emu:read8(address + 16)
	mon.hpEV = _read16BE(emu, address + 17)
	mon.attackEV = _read16BE(emu, address + 19)
	mon.defenseEV = _read16BE(emu, address + 21)
	mon.speedEV = _read16BE(emu, address + 23)
	mon.spAttackEV = _read16BE(emu, address + 25)
	mon.spDefenseEV = mon.spAttackEv
	local iv = _read16BE(emu, address + 27)
	mon.attackIV = (iv >> 4) & 0xF
	mon.defenseIV = iv & 0xF
	mon.speedIV = (iv >> 12) & 0xF
	mon.spAttackIV = (iv >> 8) & 0xF
	mon.spDefenseIV = mon.spAttackIV
	mon.pp = {
		emu:read8(address + 28),
		emu:read8(address + 29),
		emu:read8(address + 30),
		emu:read8(address + 31),
	}
	mon.nickname = game:toString(emu:readRange(nameAddress, game._monNameLength))
	mon.otName = game:toString(emu:readRange(otAddress, game._playerNameLength))
	return mon
end

function Generation1En._readPartyMon(game, address, nameAddress, otAddress)
	local mon = game:_readBoxMon(address, nameAddress, otAddress)
	mon.level = emu:read8(address + 33)
	mon.maxHP = _read16BE(emu, address + 34)
	mon.attack = _read16BE(emu, address + 36)
	mon.defense = _read16BE(emu, address + 38)
	mon.speed = _read16BE(emu, address + 40)
	mon.spAttack = _read16BE(emu, address + 42)
	mon.spDefense = mon.spAttack
	return mon
end

function  Generation2En._readBoxMon(game, address, nameAddress, otAddress)
	local mon = {}
	mon.species = emu:read8(address + 0)
	mon.item = emu:read8(address + 1)
	mon.moves = {
		emu:read8(address + 2),
		emu:read8(address + 3),
		emu:read8(address + 4),
		emu:read8(address + 5),
	}
	mon.otId = _read16BE(emu, address + 6)
	mon.experience = (_read16BE(emu, address + 8) << 8)| emu:read8(address + 10)
	mon.hpEV = _read16BE(emu, address + 11)
	mon.attackEV = _read16BE(emu, address + 13)
	mon.defenseEV = _read16BE(emu, address + 15)
	mon.speedEV = _read16BE(emu, address + 17)
	mon.spAttackEV = _read16BE(emu, address + 19)
	mon.spDefenseEV = mon.spAttackEv
	local iv = _read16BE(emu, address + 21)
	mon.attackIV = (iv >> 4) & 0xF
	mon.defenseIV = iv & 0xF
	mon.speedIV = (iv >> 12) & 0xF
	mon.spAttackIV = (iv >> 8) & 0xF
	mon.spDefenseIV = mon.spAttackIV
	mon.pp = {
		emu:read8(address + 23),
		emu:read8(address + 24),
		emu:read8(address + 25),
		emu:read8(address + 26),
	}
	mon.friendship = emu:read8(address + 27)
	mon.pokerus = emu:read8(address + 28)
	local caughtData = _read16BE(emu, address + 29)
	mon.metLocation = (caughtData >> 8) & 0x7F
	mon.metLevel = caughtData & 0x1F
	mon.level = emu:read8(address + 31)
	mon.nickname = game:toString(emu:readRange(nameAddress, game._monNameLength))
	mon.otName = game:toString(emu:readRange(otAddress, game._playerNameLength))
	return mon
end

function Generation2En._readPartyMon(game, address, nameAddress, otAddress)
	local mon = game:_readBoxMon(address, nameAddress, otAddress)
	mon.status = emu:read8(address + 32)
	mon.hp = _read16BE(emu, address + 34)
	mon.maxHP = _read16BE(emu, address + 36)
	mon.attack = _read16BE(emu, address + 38)
	mon.defense = _read16BE(emu, address + 40)
	mon.speed = _read16BE(emu, address + 42)
	mon.spAttack = _read16BE(emu, address + 44)
	mon.spDefense = _read16BE(emu, address + 46)
	return mon
end

function Generation3En._readBoxMon(game, address)
	local mon = {}
	mon.personality = emu:read32(address + 0)
	mon.otId = emu:read32(address + 4)
	mon.nickname = game:toString(emu:readRange(address + 8, game._monNameLength))
	mon.language = emu:read8(address + 18)
	local flags = emu:read8(address + 19)
	mon.isBadEgg = flags & 1
	mon.hasSpecies = (flags >> 1) & 1
	mon.isEgg = (flags >> 2) & 1
	mon.otName = game:toString(emu:readRange(address + 20, game._playerNameLength))
	mon.markings = emu:read8(address + 27)

	local key = mon.otId ~ mon.personality
	local substructSelector = {
		[ 0] = {0, 1, 2, 3},
		[ 1] = {0, 1, 3, 2},
		[ 2] = {0, 2, 1, 3},
		[ 3] = {0, 3, 1, 2},
		[ 4] = {0, 2, 3, 1},
		[ 5] = {0, 3, 2, 1},
		[ 6] = {1, 0, 2, 3},
		[ 7] = {1, 0, 3, 2},
		[ 8] = {2, 0, 1, 3},
		[ 9] = {3, 0, 1, 2},
		[10] = {2, 0, 3, 1},
		[11] = {3, 0, 2, 1},
		[12] = {1, 2, 0, 3},
		[13] = {1, 3, 0, 2},
		[14] = {2, 1, 0, 3},
		[15] = {3, 1, 0, 2},
		[16] = {2, 3, 0, 1},
		[17] = {3, 2, 0, 1},
		[18] = {1, 2, 3, 0},
		[19] = {1, 3, 2, 0},
		[20] = {2, 1, 3, 0},
		[21] = {3, 1, 2, 0},
		[22] = {2, 3, 1, 0},
		[23] = {3, 2, 1, 0},
	}

	local pSel = substructSelector[mon.personality % 24]
	local ss0 = {}
	local ss1 = {}
	local ss2 = {}
	local ss3 = {}

	for i = 0, 2 do
		ss0[i] = emu:read32(address + 32 + pSel[1] * 12 + i * 4) ~ key
		ss1[i] = emu:read32(address + 32 + pSel[2] * 12 + i * 4) ~ key
		ss2[i] = emu:read32(address + 32 + pSel[3] * 12 + i * 4) ~ key
		ss3[i] = emu:read32(address + 32 + pSel[4] * 12 + i * 4) ~ key
	end

	mon.species = ss0[0] & 0xFFFF
	mon.heldItem = ss0[0] >> 16
	mon.experience = ss0[1]
	mon.ppBonuses = ss0[2] & 0xFF
	mon.friendship = (ss0[2] >> 8) & 0xFF

	mon.moves = {
		ss1[0] & 0xFFFF,
		ss1[0] >> 16,
		ss1[1] & 0xFFFF,
		ss1[1] >> 16
	}
	mon.pp = {
		ss1[2] & 0xFF,
		(ss1[2] >> 8) & 0xFF,
		(ss1[2] >> 16) & 0xFF,
		ss1[2] >> 24
	}

	mon.hpEV = ss2[0] & 0xFF
	mon.attackEV = (ss2[0] >> 8) & 0xFF
	mon.defenseEV = (ss2[0] >> 16) & 0xFF
	mon.speedEV = ss2[0] >> 24
	mon.spAttackEV = ss2[1] & 0xFF
	mon.spDefenseEV = (ss2[1] >> 8) & 0xFF
	mon.cool = (ss2[1] >> 16) & 0xFF
	mon.beauty = ss2[1] >> 24
	mon.cute = ss2[2] & 0xFF
	mon.smart = (ss2[2] >> 8) & 0xFF
	mon.tough = (ss2[2] >> 16) & 0xFF
	mon.sheen = ss2[2] >> 24

	mon.pokerus = ss3[0] & 0xFF
	mon.metLocation = (ss3[0] >> 8) & 0xFF
	flags = ss3[0] >> 16
	mon.metLevel = flags & 0x7F
	mon.metGame = (flags >> 7) & 0xF
	mon.pokeball = (flags >> 11) & 0xF
	mon.otGender = (flags >> 15) & 0x1
	flags = ss3[1]
	mon.hpIV = flags & 0x1F
	mon.attackIV = (flags >> 5) & 0x1F
	mon.defenseIV = (flags >> 10) & 0x1F
	mon.speedIV = (flags >> 15) & 0x1F
	mon.spAttackIV = (flags >> 20) & 0x1F
	mon.spDefenseIV = (flags >> 25) & 0x1F
	-- Bit 30 is another "isEgg" bit
	mon.altAbility = (flags >> 31) & 1
	flags = ss3[2]
	mon.coolRibbon = flags & 7
	mon.beautyRibbon = (flags >> 3) & 7
	mon.cuteRibbon = (flags >> 6) & 7
	mon.smartRibbon = (flags >> 9) & 7
	mon.toughRibbon = (flags >> 12) & 7
	mon.championRibbon = (flags >> 15) & 1
	mon.winningRibbon = (flags >> 16) & 1
	mon.victoryRibbon = (flags >> 17) & 1
	mon.artistRibbon = (flags >> 18) & 1
	mon.effortRibbon = (flags >> 19) & 1
	mon.marineRibbon = (flags >> 20) & 1
	mon.landRibbon = (flags >> 21) & 1
	mon.skyRibbon = (flags >> 22) & 1
	mon.countryRibbon = (flags >> 23) & 1
	mon.nationalRibbon = (flags >> 24) & 1
	mon.earthRibbon = (flags >> 25) & 1
	mon.worldRibbon = (flags >> 26) & 1
	mon.eventLegal = (flags >> 27) & 0x1F
	return mon
end

function Generation3En._readPartyMon(game, address)
	local mon = game:_readBoxMon(address)
	mon.status = emu:read32(address + 80)
	mon.level = emu:read8(address + 84)
	mon.mail = emu:read32(address + 85)
	mon.hp = emu:read16(address + 86)
	mon.maxHP = emu:read16(address + 88)
	mon.attack = emu:read16(address + 90)
	mon.defense = emu:read16(address + 92)
	mon.speed = emu:read16(address + 94)
	mon.spAttack = emu:read16(address + 96)
	mon.spDefense = emu:read16(address + 98)
	return mon
end

local gameRBEn = Generation1En:new{
	name="Red/Blue (USA)",
	_party=0xd16b,
	_partyCount=0xd163,
	_partyNames=0xd2b5,
	_partyOt=0xd273,
	_speciesNameTable=0x1c21e,
	_speciesIndex=0x41024,
}

local gameYellowEn = Generation1En:new{
	name="Yellow (USA)",
	_party=0xd16a,
	_partyCount=0xd162,
	_partyNames=0xd2b4,
	_partyOt=0xd272,
	_speciesNameTable=0xe8000,
	_speciesIndex=0x410b1,
}

local gameGSEn = Generation2En:new{
	name="Gold/Silver (USA)",
	_party=0xda2a,
	_partyCount=0xda22,
	_partyNames=0xdb8c,
	_partyOt=0xdb4a,
	_speciesNameTable=0x1b0b6a,
}

local gameCrystalEn = Generation2En:new{
	name="Crystal (USA)",
	_party=0xdcdf,
	_partyCount=0xdcd7,
	_partyNames=0xde41,
	_partyOt=0xddff,
	_speciesNameTable=0x5337a,
}

local gameRubyEn = Generation3En:new{
	name="Ruby (USA)",
	_party=0x3004360,
	_partyCount=0x3004350,
	_speciesNameTable=0x1f716c,
}

local gameRubyEnR1 = Generation3En:new{
	name="Ruby (USA)",
	_party=0x3004360,
	_partyCount=0x3004350,
	_speciesNameTable=0x1f7184,
}

local gameSapphireEn = Generation3En:new{
	name="Sapphire (USA)",
	_party=0x3004360,
	_partyCount=0x3004350,
	_speciesNameTable=0x1f70fc,
}

local gameSapphireEnR1 = Generation3En:new{
	name="Sapphire (USA)",
	_party=0x3004360,
	_partyCount=0x3004350,
	_speciesNameTable=0x1f7114,
}

local gameEmeraldEn = Generation3En:new{
	name="Emerald (USA)",
	_party=0x20244ec,
	_partyCount=0x20244e9,
	_speciesNameTable=0x3185c8,
}
local gameEmeraldJP = Generation3En:new{
    name="Emerald (JP)", --tbh idk if this is correct -Naru
    _party=0x20244ec, 
    _partyCount=0x20244e9, 
    _speciesNameTable=0x3185c8, 

}
local gameFireRedEn = Generation3En:new{
	name="FireRed (USA)",
	_party=0x2024284,
	_partyCount=0x2024029,
	_speciesNameTable=0x245ee0,
}
local gameFireRedEnR1 = gameFireRedEn:new{
	name="FireRed (USA) (Rev 1)",
	_speciesNameTable=0x245f50,
}
local gameLeafGreenEn = Generation3En:new{
	name="LeafGreen (USA)",
	_party=0x2024284,
	_partyCount=0x2024029,
	_speciesNameTable=0x245ebc,
}
local gameLeafGreenEnR1 = gameLeafGreenEn:new{
	name="LeafGreen (USA)",
	_party=0x2024284,
	_partyCount=0x2024029,
	_speciesNameTable=0x245f2c,
}

gameCodes = {
    ["DMG-AAUE"]=gameGSEn, -- Gold
    ["DMG-AAXE"]=gameGSEn, -- Silver
    ["CGB-BYTE"]=gameCrystalEn,
    ["AGB-AXVE"]=gameRubyEn,
    ["AGB-AXPE"]=gameSapphireEn,
    ["AGB-BPEE"]=gameEmeraldEn,
    ["AGB-BPRE"]=gameFireRedEn,
    ["AGB-BPGE"]=gameLeafGreenEn,
    ["AGB-BPEJ"]=gameEmeraldJP, -- Added the Japanese version of Emerald
}

gameCrc32 = {
    [0x9f7fdd53] = gameRBEn, -- Red
    [0xd6da8a1a] = gameRBEn, -- Blue
    [0x7d527d62] = gameYellowEn,
    [0x84ee4776] = gameFireRedEnR1,
    [0xdaffecec] = gameLeafGreenEnR1,
    [0x61641576] = gameRubyEnR1, -- Rev 1
    [0xaeac73e6] = gameRubyEnR1, -- Rev 2
    [0xbafedae5] = gameSapphireEnR1, -- Rev 1
    [0x9cc4410e] = gameSapphireEnR1, -- Rev 2
    [0x4881F3F8] = gameEmeraldJP, -- Added the CRC32 for Japanese Emerald
}	
if gameVersion == 0x45 then  -- Check game version
	game = "Emerald"
	elseif gameVersion == 0x47 then
	game = "LeafGreen"
	elseif gameVersion == 0x50 then
	game = "Sapphire"
	elseif gameVersion == 0x52 then
	game = "FireRed"
	elseif gameVersion == 0x56 then
	game = "Ruby"
	end
	
	if gameLang == 0x4A then  -- Check game language
	language = "JPN"
	currSeedAddr = 0x03005AE0
	advancesAddr = 0x02024664
	battleVideoSeed1Addr = 0x0203B9F8
	battleVideoSeed2Addr = 0x0203AD74
	wildAddr = 0x020243E8  -- capture
	saveBlock1Addr = 0x03005AEC
	saveBlock2Addr = 0x03005AF0
	roamerMapGroupNumAddr = 0x0203B952
	speciesDexIndexAddr = 0x0202370C  -- 100% catch
	selectedItemAddr = 0x0203CB48
	wildTypeAddr = 0x02023DA1
	isUnderWaterAddr = 0x02036FCF
	safariZoneStepsCounterAddr = 0x02039D1A
	safariCatchFactorPointerAddr = 0x02024140
	battleTurnsCounterAddr = 0x03005A83
	eggCurrSeedAddr = 0x03005AE4  -- breeding
	timerAddr = 0x03002384
	partyAddr = 0x02024190
	partySlotsCounterAddr = 0x0202418D
	eggPIDPointerAddr = 0x0203B944
	partySelectedSlotNumberAddr = 0x0203CB9D  -- info
	pokemonStatsScreenAddr = 0x02002FE0
	currBoxNumberPointerAddr = 0x03005AF4
	boxSelectedSlotNumberAddr = 0x02039A19
	else
	language = "EUR/USA"
	currSeedAddr = 0x03005D80
	advancesAddr = 0x020249C0
	battleVideoSeed1Addr = 0x0203BD2C
	battleVideoSeed2Addr = 0x0203B0A8
	wildAddr = 0x02024744  -- capture
	saveBlock1Addr = 0x03005D8C
	saveBlock2Addr = 0x03005D90
	roamerMapGroupNumAddr = 0x0203BC86
	speciesDexIndexAddr = 0x02023A68  -- 100% catch
	selectedItemAddr = 0x0203CE7C
	wildTypeAddr = 0x020240FD
	isUnderWaterAddr = 0x0203732F
	safariZoneStepsCounterAddr = 0x0203A04E
	safariCatchFactorPointerAddr = 0x0202449C
	battleTurnsCounterAddr = 0x03005D23
	eggCurrSeedAddr = 0x03005D84  -- breeding
	timerAddr = 0x030022E4
	partyAddr = 0x020244EC
	partySlotsCounterAddr = 0x020244E9
	eggPIDPointerAddr = 0x0203BC78
	partySelectedSlotNumberAddr = 0x0203CED1  -- info
	pokemonStatsScreenAddr = 0x020032A8
	currBoxNumberPointerAddr = 0x03005D94
	boxSelectedSlotNumberAddr = 0x02039D79
	end

	
	if game ~= "Emerald" then
	
		warning = " - Wrong game version! Use Emerald instead"
	else
	warning = ""
	end
	



	function printPartyStatus(game, buffer)
    buffer:clear()
    for _, mon in ipairs(game:getParty()) do
        buffer:print(string.format("Lv: %d (%s): %d/%d (%s)\n",
            mon.level,
            game:getSpeciesName(mon.species),
            mon.hp,
            mon.maxHP,
            mon.nickname))
    end
end

----------------------------------------------------------------------------------------------
-- mostly original pokemon.lua mgba variables end here                            			--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
-- regular non speficic rng buffers end here												--
----------------------------------------------------------------------------------------------
function printGameInfo(game, buffer)
	buffer:clear()
	buffer:print(string.format("Game: %s\n", game.name))
	buffer:print("Devon Studios x Real.96 x NaruZkurai x E_RNG_2.0 for VBA-M")
end

function getTID(buffer)
    local IDsAddr
    local IDs
    local TID
    local SID

    if mode[index] ~= "Pokemon Info" then
        IDsAddr = emu:read32(saveBlock2Addr) + 0xA
        IDs = emu:read32(IDsAddr)
    else
		addr = emu:read32(saveBlock2Addr) + 0x4
        IDs = emu:read32(addr + 0x4)
    end

    TID = IDs % 0x10000
    SID = math.floor(IDs / 0x10000)
    buffer:print(string.format("TID: %05d\n", TID))

end
function printfindsid(buffer)
	for i = 0, 14, 2 do
		local value = emu:read32(0x03005D90 + i)
		local potentialTID = value % 0x10000
		local potentialSID = math.floor(value / 0x10000)
		if potentialTID == 57934 or potentialSID == 59651 then
			buffer:print(string.format("Found potential TID or SID at address %08X", 0x03005D90 + i))
		else
		end
	
	end
end

function printRNGInfo(game, buffer)
	--print the value of addresses related to rng
	buffer:clear()

	--other usefull things
	buffer:print("other usefull things\n")
	buffer:print(string.format("Advances: %d\n", emu:read32(advancesAddr)))
	--buffer:print(string.format("Timer: %08X\n", emu:read32(timerAddr)))
	--buffer:print(string.format("direct  seed: %08X\n", emu:read32(0x0203BCD8)))
	buffer:print(string.format("Current Seed: %08X\n", emu:read32(currSeedAddr)))
	buffer:print(string.format("Current / last Encounter Seed: %08X\n", emu:read32(wildAddr)))
	
	buffer:print(string.format("Battle Video Seed 1: %08X\n", emu:read32(battleVideoSeed1Addr)))
	buffer:print(string.format("Battle Video Seed 2: %08X\n", emu:read32(battleVideoSeed2Addr)))

	buffer:print(string.format("Save Block 1: %08X\n", emu:read32(saveBlock1Addr)))
	buffer:print(string.format("Save Block 2: %08X\n", emu:read32(saveBlock2Addr)))

	buffer:print(string.format("Roamer Map Group Number: %d\n", emu:read32(roamerMapGroupNumAddr)))
	buffer:print(string.format("Species Dex Index: %d\n", emu:read32(speciesDexIndexAddr)))
	buffer:print(string.format("Selected Item: %d\n", emu:read32(selectedItemAddr)))
	buffer:print(string.format("Wild Type: %d\n", emu:read32(wildTypeAddr)))
	buffer:print(string.format("Is Under Water: %d\n", emu:read32(isUnderWaterAddr)))
	buffer:print(string.format("Safari Zone Steps Counter: %d\n", emu:read32(safariZoneStepsCounterAddr)))
	buffer:print(string.format("Safari Catch Factor Pointer: %08X\n", emu:read32(safariCatchFactorPointerAddr)))
	buffer:print(string.format("Battle Turns Counter: %d\n", emu:read32(battleTurnsCounterAddr)))
	buffer:print(string.format("Egg Current Seed: %08X\n", emu:read32(eggCurrSeedAddr)))

	buffer:print(string.format("Party: %08X\n", emu:read32(partyAddr)))
	buffer:print(string.format("Party Slots Counter: %d\n", emu:read32(partySlotsCounterAddr)))
	buffer:print(string.format("Egg PID Pointer: %08X\n", emu:read32(eggPIDPointerAddr)))
	buffer:print(string.format("Party Selected Slot Number: %d\n", emu:read32(partySelectedSlotNumberAddr)))
	buffer:print(string.format("Pokemon Stats Screen: %08X\n", emu:read32(pokemonStatsScreenAddr)))
	buffer:print(string.format("Current Box Number Pointer: %08X\n", emu:read32(currBoxNumberPointerAddr)))
	buffer:print(string.format("Box Selected Slot Number: %d\n", emu:read32(boxSelectedSlotNumberAddr)))
--print tid / sid
	getTID(buffer)
--print current rng seed

end
function printPartyMember(game, buffer, slot)
    buffer:clear()
    local mon = game:getParty()[slot]
    if mon == nil then
        buffer:print(string.format("No Pokemon in slot %d", slot))
        return
    end
    -- Display basic info
    buffer:print(string.format("Lv: %d (%s): %d (%s)\n",
        mon.level,
        game:getSpeciesName(mon.species),
        mon.hp,
        mon.nickname))

    -- Display IVs and EVs for each stat
    buffer:print(string.format("(HP) IVs: %2i, EVs: %3i\n", mon.hpIV, mon.hpEV))
    buffer:print(string.format("(ATK) IVs: %2i, EVs: %3i\n", mon.attackIV, mon.attackEV))
    buffer:print(string.format("(DEF) IVs: %2i, EVs: %3i\n", mon.defenseIV, mon.defenseEV))
    buffer:print(string.format("(SPA) IVs: %2i, EVs: %3i\n", mon.spAttackIV, mon.spAttackEV))
    buffer:print(string.format("(SPD) IVs: %2i, EVs: %3i\n", mon.spDefenseIV, mon.spDefenseEV))
    buffer:print(string.format("(SPE) IVs: %2i, EVs: %3i\n", mon.speedIV, mon.speedEV))
	buffer:print(string.format("monpersonality %x\n", mon.personality))
	buffer:print(string.format("TID: %d\n", mon.otId % 0x10000))
	buffer:print(string.format("SID: %d\n", math.floor(mon.otId / 0x10000)))
end


----------------------------------------------------------------------------------------------
-- regular non speficic rng buffers end here												--
-- functions for rng start here							                           			--
----------------------------------------------------------------------------------------------

function pressAforShiny(targetframe)
	local buffer = pressAforShinyBuffer
	key_type_button = 0
	key_type_direction = 1
	key_A = key_shiny

	if key_shiny == 4 or key_shiny == 5 or key_shiny == 6 or key_shiny == 7 then
		key_type = key_type_direction
	else
		key_type = key_type_button
	end

	buffer:clear()
	if shinyframe ~= nil then
		local currentframe = emu:read32(advancesAddr)
		targetframe = shinyframe
		if lastframe == nil then
			--lastframe = 0
			lastframe = 0
		end

		buffer:print(string.format("Current frame: %d\n", currentframe))
		buffer:print(string.format("Target frame:  %d\n", targetframe))
		buffer:print(string.format("Last frame: %d\n", lastframe))

-- add key condition

		if currentframe == targetframe then
			emu:addKey(key_shiny)
			lastframe = currentframe
		end
        
-- release key condition

        if key_type == key_type_button  then
            target_end_frame = targetframe + button_frame_delay
            buffer:print(string.format("key_type = %d (button is 0)\n to be released on frame  %d\n", key_type, target_end_frame))
            if currentframe == target_end_frame then
                emu:clearKey(key_shiny)
                buffer:print(string.format("A released at frame %d\n",  key_type, target_end_frame))
            end
        end




		if key_type == key_type_direction then
			target_end_frame = targetframe + direction_held_time
			if currentframe >= targetframe and currentframe < target_end_frame then
				buffer:print(string.format("key_type = %d (direction is 1)\n to be released on frame  %d\n", key_type,  key_type, target_end_frame))
            end
            if currentframe == target_end_frame then
				buffer:print(string.format("key_type = %d (direction is 1)\nreleased on frame  %d\n", key_type,  key_type, target_end_frame))
				emu:clearKey(key_shiny)
			end
		end



	end
    buffer:print(string.format("key_type = %d (direction is 1 button is 0)\n to be released on frame  %d\n", key_type, target_end_frame))

end
----------------------------------------------------------------------------------------------

function catchRng(buffer)
	if buffer == nil then
		buffer = gameInfoBuffer
	end
    buffer:clear()
    buffer:print("catchRng\n")
	--if r is pressed then catchswitch ==true 
	catchswitch = emu:getKey(9)
	if lastpressed_r == nil then
		lastpressed_r = 0
	end
	if catchRngStop == nil then
		catchRngStop = true
	end
	if catch == nil then
		catch = false
	end
	if catchswitch == 0 and lastpressed_r == 1 then
		lastpressed_r = 0
	end

	if catch == false and catchswitch == 1 and lastpressed_r ==0 then
		catch = true
		catchRngStop = false
		catchDelayCounter = 9999
		catchDelay = 0
		lastpressed_r = 1
	end

	if catch == true and catchswitch == 1 and lastpressed_r == 0 then
		catch = false
		catchRngStop = true
		catchDelayCounter = 9999
		catchDelay = 0
		lastpressed_r = 1
	end
	if isapressed == nil then
		isapressed = 0
	end
	if isapressed == 1 then
		unpresskey( "A", buffer)
		isapressed = false
	end

	if catch == true then
		isSafariZone = emu:read16(safariZoneStepsCounterAddr) ~= 0
		wildCatchDelay = getCatchDelay(isSafariZone, buffer)
	
		console:log(string.format("wildCatchDelay: %d\n", wildCatchDelay))
		
		local catchSeed = findCatchSeed(emu:read32(currSeedAddr), wildCatchDelay)
		
		
		local sureCatchDelay

		if wildCatchDelay <= 0 then
			
			buffer:print(string.format("wildcatchdelay > 0\n"))
			sureCatchDelay = findSureCatch(catchSeed, calcCatchProb(isSafariZone, buffer), isSafariZone)
			sureCatchDelay = sureCatchDelay 
			buffer:print(("100% catch missing advances:"..sureCatchDelay))
			wildcatchtargetdelay = emu:read32(advancesAddr) + sureCatchDelay
			
		end
		if wildCatchDelay > 0 then
			
			
		else
		end
		
	else
	buffer:print(string.format("catch is disabled\n"))
	end
	
end

function calcCatchProb(isSafariZone, buffer)
	local speciesDexIndex = emu:read16(speciesDexIndexAddr)
	local speciesDexNumber = nationalDexList[speciesDexIndex + 1]
	local HPmax = emu:read16(wildAddr + 0x58)
	local HPcurrent = emu:read16(wildAddr + 0x56)
	local catchRate = getCatchRate(speciesDexNumber, isSafariZone)
	local bonusBall = getBonusBall(speciesDexNumber, isSafariZone)
	local bonusStatus = getBonusStatus()
	
	if HPmax == 0 then
	 HPmax = 1
	 HPcurrent = 1
	end
	local a = math.floor(((((3 * HPmax) - (2 * HPcurrent)) * catchRate * bonusBall) / (3 * HPmax)) * bonusStatus)
	
	if a == 0 then
	 a = 1
	end
	buffer:print(string.format("speciesDexIndex: %d, speciesDexNumber: %d, HPmax: %d, HPcurrent: %d, catchRate: %d, bonusBall: %d, bonusStatus: %d\n", speciesDexIndex, speciesDexNumber, HPmax, HPcurrent, catchRate, bonusBall, bonusStatus))
	local b = math.floor(1048560 / (math.sqrt(math.sqrt(16711680 / a))))
	buffer:print(string.format("catch rate formula current rate: %d, B = %d\n", a, b))
	return b
   end
   
function findCatchSeed(seed, delay)
	local tempSeed = seed
   
	for i = 1, delay do
	lcrng2 = 0x41C6
	lcrng3 = 0x4E6D
	lcrng4 = 0x6073
	 tempSeed = LCRNG(tempSeed, lcrng2, lcrng3, lcrng4)
	 buffer:print(string.format("Catch seed: %08X\n", tempSeed))
	end
   
	return tempSeed
   end

function getCatchRate(speciesDexNumber, isSafariZone)
local safariCatchFactorAddr

if isSafariZone then
	safariCatchFactorAddr = emu:read32(safariCatchFactorPointerAddr) + 0x7C

	return math.floor((1275 * emu:read8(safariCatchFactorAddr)) / 100)
else
	return catchRatesList[speciesDexNumber]
end
end

function getBonusBall(speciesDexNumber, isSafariZone)
	local wildType = emu:read8(wildTypeAddr)
	local isUnderWater = emu:read8(isUnderWaterAddr) == 0x5
	local level = emu:read8(wildAddr + 0x54)
	local saveBlock2 = emu:read32(saveBlock2Addr)
	local dexCaughtMask = rshift(lshift(0x1000000, band((speciesDexNumber - 1), 7)), 24)
	local dexCaughtFlag = band(emu:read8(saveBlock2 + 0x28 + band(rshift(lshift(speciesDexNumber - 1, 16), 19), 0xFF)), dexCaughtMask)
	local battleTurnsCounter = emu:read8(battleTurnsCounterAddr)
	local selectedItem = emu:read16(selectedItemAddr)
	local isBallSelected = selectedItem > 0 and selectedItem < 13
   
	if wildType == 0x0B or wildType == 0x06 then  -- net ball catch rate: 0x0B = Water, 0x06 = Bug
	 ballRate[7] = 3
	else
	 ballRate[7] = 1
	end
   
	if isUnderWater then  -- dive ball catch rate
	 ballRate[8] = 3.5
	 -- gui.text(1, 77, "Undewater? Yes")
	else
	 ballRate[8] = 1
	 -- gui.text(1, 77, "Undewater? No")
	end
   
	if level < 30 then  -- nest ball catch rate
	 ballRate[9] = (40 - level) / 10
	else
	 ballRate[9] = 1
	end
   
	if dexCaughtFlag ~= 0 then  -- repeat ball catch rate
	 ballRate[10] = 3
	 --gui.text(1, 77, "Already Catched? Yes")
	else
	 ballRate[10] = 1
	 --gui.text(1, 77, "Already Catched? No")
	end
   
	if battleTurnsCounter < 30 then  -- timer ball catch rate, bonusBall is x4 if battle turns are >= 30
	 ballRate[11] = (battleTurnsCounter + 10) / 10
	else
	 ballRate[11] = 4
	end
   
	if isSafariZone then
	 return ballRate[6]
	end
   
	if isBallSelected then
	 return ballRate[selectedItem + 1]
	else
	 return 1
	end
   end
   
   function getBonusStatus()
	local status = emu:read8(wildAddr + 0x50)
   
	if status == 0 then
	 bonusStatus = 1
	elseif (status > 0 and status < 0x8) or status == 0x20 then
	 bonusStatus = 2
	else
	 bonusStatus = 1.5
	end
   
	return bonusStatus
   end



function presskey( key, buffer)
	if key == nil then
		return
	end
	local keyName = string.upper(key)
	if keys[keyName] then 
		emu:addKey(keys[keyName])
		currentframe = emu:read32(advancesAddr)
		console:log(string.format("%s pressed at frame %d\n", keyName, currentframe))
	end
end
function unpresskey(key, buffer)
	if key == nil then
		return
	end
	local keyName = string.upper(key)
	if keys[keyName] then 
		emu:clearKey(keys[keyName])
		buffer:print(string.format("%s released at frame %d\n", keyName, currentframe))
	end
end
function findSureCatch(seed, catchProbability, isSafariZone) -- doesnt use buffer
    local tempSeed = seed
    local tempSeed1 = seed
    local delay = 0
    local ballShakes = 0

    while ballShakes ~= 4 do
        ballShakes = 0

        while rshift(tempSeed, 16) < catchProbability and ballShakes < 4 do
            ballShakes = ballShakes + 1
			lcrng2 = 0x41c6
			lcrng3 = 0x4e6d
			lcrng4 = 0x6073
            tempSeed = LCRNG(tempSeed, lcrng2, lcrng3, lcrng4)
        end

        if isSafariZone and delay % 2 ~= 0 then
            ballShakes = 0
        end
		lcrng2 = 0x41c6
		lcrng3 = 0x4e6d
		lcrng4 = 0x6073
        tempSeed1 = LCRNG(tempSeed1, lcrng2, lcrng3, lcrng4)
        tempSeed = tempSeed1

        if ballShakes ~= 4 then
            delay = delay + 1
        end
    end

    if isSafariZone then
        delay = delay / 2
    end

    return delay
end
function rshift(x, n)
	if x == nil then
		x = 0 
	end
	if n == nil then n = 0 end
    if n == 0 then
		return x 
	end
    return math.floor(x / 2^n) --its math.floor coz math:floor returns a table and fails
end
-- Bitwise left shift operation in Lua for mGBA scripting
function lshift(x, n)
    return x * (2^n)
end

-- Bitwise XOR operation in Lua for mGBA scripting
function bxor(a, b)
    local result = 0
    local bitval = 1
    while a > 0 and b > 0 do
        local aa, bb = a % 2, b % 2
        if aa ~= bb then
            result = result + bitval
        end
        a, b = math.floor(a / 2), math.floor(b / 2)
        bitval = bitval * 2
    end
    if a < b then a = b end
    while a > 0 do
        if a % 2 == 1 then
            result = result + bitval
        end
        a = math.floor(a / 2)
        bitval = bitval * 2
    end
    return result
end

-- Bitwise AND operation in Lua for mGBA scripting
function band(a, b)
    local result = 0
    local bitval = 1
    while a > 0 and b > 0 do
        if a % 2 == 1 and b % 2 == 1 then
            result = result + bitval
        end
        a, b = math.floor(a / 2), math.floor(b / 2)
        bitval = bitval * 2
    end
    return result
end

-- Linear Congruential Generator (LCG) function
function LCRNG(s, mul1, mul2, sum)
	local a = mul1 * (s % 0x10000) + rshift(s, 16) * mul2
	local b = mul2 * (s % 0x10000) + (a % 0x10000) * 0x10000 + sum
	local c = b % 4294967296
   
	return c
   end

function getCatchDelay(isSafariZone, buffer)
	local key_select_number = 2
	local key_select = emu:getKey(key_select_number)
	local advancesDelay
	local safariOffset = 0
	local currSeed3

	if isSafariZone then
	 safariOffset = 80
	end
   
	if key_select == 1 then
	 startingCatchAdvances = advances
	 catchDelayCounter = 0
	 catchRngStop = false
	 catchDelay = 0
	 skips = 0
	 oneTimeCatchRng = false
	 currSeed2 = emu:read32(currSeedAddr)
	end
   
	if catchDelayCounter <= 200 and catchDelay == 0 and not catchRngStop then
	 if emu:read8(catchCheckFlagAddr) == 0x40 and not oneTimeCatchRng then
	  currSeed3 = emu:read32(currSeedAddr)
   
	  while currSeed2 ~= currSeed3 do
		lcrng2 = 0x41c6
		lcrng3 = 0x4e6d
		lcrng4 = 0x6073
	   currSeed2 = LCRNG(currSeed2, lcrng2, lcrng3, lcrng4)
	   skips = skips + 1
	  end
   
	  oneTimeCatchRng = true
	  advancesDelay = advances - startingCatchAdvances
	 else
	  currSeed2 = emu:read32(currSeedAddr)
	 end
   
	 if skips == 2 and advancesDelay > 120 - safariOffset then
	  catchDelay = advancesDelay + 1
	 elseif skips == 3 and advancesDelay > 120 - safariOffset then  -- 0 shake
	  catchDelay = advancesDelay
	 elseif skips == 4 and advancesDelay > 120 - safariOffset then  -- 1 shake
	  catchDelay = advancesDelay - 1
	 elseif skips == 5 and advancesDelay > 120 - safariOffset then  -- 2 shake
	  catchDelay = advancesDelay - 2
	 elseif skips == 6 and advancesDelay > 120 - safariOffset then  -- 3 shake
	  catchDelay = advancesDelay - 3
	 end
   
	 catchDelayCounter = catchDelayCounter + 1
	end
   
	return catchDelay
   end
   function getCatchRngStopStartInput(buffer)
	local key_select_number = 2
	local key = emu:getKey(key_select_number)
	-- if key is pressed and last frame it was pressed last key = pressed if key is not pressed and last frame it was pressed last key = not pressed then run if key == 1 and last key == 0 then catchRngStop = true catchDelayCounter = 999 catchDelay = 0
	if key == 1 and last_key == 0 and catchRngStop == true then
	 catchRngStop = false
	 catchDelayCounter = 9999
	 catchDelay = 0
	end
	if key == 0 and last_key == 1 then
	 last_key = 0
	end
	if key == 1 and last_key == 1 then
	 last_key = 1
	end
	if key == 1 and last_key == 0 and catchRngStop == false then
		catchRngStop = true
		catchDelayCounter = 9999
		catchDelay = 0
	end

   
	buffer:print(string.format("catchRngStop: %s\n", catchRngStop))
   end
keys = { ["A"] = 0,    ["B"] = 1,        ["SELECT"] = 2,    ["START"] = 3,        ["RIGHT"] = 4,    ["LEFT"] = 5,        ["UP"] = 6,    ["DOWN"] = 7,        ["L"] = 8,    ["R"] = 9    }
function arekeyspressed(buffer)
	buffer:clear()
	key_a = emu:getKey(0)
	key_b = emu:getKey(1)
	key_select = emu:getKey(2)
	key_start = emu:getKey(3)
	key_right = emu:getKey(4)
	key_left = emu:getKey(5)
	key_up = emu:getKey(6)
	key_down = emu:getKey(7)
	key_l = emu:getKey(8)
	key_r = emu:getKey(9)
    -- sometimes it doesnt register on start and crashes soooooooooooooooooooooooooooo yeah
    local key_a = key_a or 0
    local key_b = key_b or 0
    local key_select = key_select or 0
    local key_start = key_start or 0
    local key_right = key_right or 0
    local key_left = key_left or 0
    local key_up = key_up or 0
    local key_down = key_down or 0
    local key_l = key_l or 0
    local key_r = key_r or 0
    local key_shiny = key_shiny or 0
    local key_type_direction = key_type_direction or 0
    local target_end_frame = target_end_frame or 0
    buffer:print(string.format("A: %d, B: %d, SELECT: %d, START: %d \nRIGHT: %d, LEFT: %d \nUP: %d, DOWN: %d \nL: %d, R: %d", key_a, key_b, key_select, key_start, key_right, key_left, key_up, key_down, key_l, key_r))
end

----------------------------------------------------------------------------------------------
-- end of functions for rng, and buffers			                           			    --
----------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------
-- actiuall loop for the script starts here			                           			    --
----------------------------------------------------------------------------------------------
function detectGame()
	local checksum = 0
	for i, v in ipairs({emu:checksum(C.CHECKSUM.CRC32):byte(1, 4)}) do
		checksum = checksum * 256 + v
	end
	game = gameCrc32[checksum]
	if not game then
		game = gameCodes[emu:getGameCode()]
	end

	if not game then
		console:error("Unknown game!")
		console:log("Game code: " .. emu:getGameCode())
	else
		console:log("Found game: " .. game.name)
		if not partyBuffer then
			partyBuffer = console:createBuffer("Party")
			slotBuffer1 = console:createBuffer("Party Slot 1")
			slotBuffer2 = console:createBuffer("Party Slot 2")
			slotBuffer3 = console:createBuffer("Party Slot 3")
			slotBuffer4 = console:createBuffer("Party Slot 4")
			slotBuffer5 = console:createBuffer("Party Slot 5")
			slotBuffer6 = console:createBuffer("Party Slot 6")
			gameInfoBuffer = console:createBuffer("Game Info")
			rngInfoBuffer = console:createBuffer("RNG Info")
			pressAforShinyBuffer = console:createBuffer("pressingAforShiny")
			
			buttonsPressedBuffer = console:createBuffer("buttonsPressed")
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------
-- end of set buffer variables 					                           			    											--
--------------------------------------------------------------------------------------------------------------------------------------

-------------------
-- modes default --
-------------------
shinyhunt = false
surecatch = false

function updateBuffer()
    if not game or not partyBuffer then
        return
    end
    printPartyStatus(game, partyBuffer)
	printRNGInfo(game, rngInfoBuffer)
    local buffers = {slotBuffer1, slotBuffer2, slotBuffer3, slotBuffer4, slotBuffer5, slotBuffer6}
	for slot, buffer in ipairs(buffers) do
        printPartyMember(game, buffer, slot)
    end

	--remember that target frame is -264 in open area -272 in cave
	arekeyspressed(buttonsPressedBuffer)
	pressAforShiny(locationOffset)
	--catchRng(gameInfoBuffer)

end

callbacks:add("start", detectGame)
callbacks:add("frame", updateBuffer)
if emu then
	detectGame()
end