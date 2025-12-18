Config = {}

-- Menu trigger settings [DEFAULT COMMAND]
Config.MenuTrigger = 'command' -- 'command' or 'key'
Config.MenuKey = 'F5'
Config.MenuCommand = 'vehicles'

-- Toggle ACE permission check for the whole menu [DEFAULT FALSE]
Config.UseAcePerms = false

-- Global permission that overrides all category perms
Config.GlobalAcePerm = "devx.vehiclemenu"

Config.VehicleCategories = {
    {
        label = "PUNDAAS",
        acePerm = "devx.vehiclemenu.pundaas",
        vehicles = {
            { name = "supracompv2", label = "kane Supra" },
            { name = "7d_hycpolo", label = "kane polo" },
            { name = "rrenzog", label = "lucifer enzo" },
            { name = "vanveer", label = "Beepoop M8" },
            { name = "7d_janem8", label = "Jane M8" },
            { name = "7d_v4s", label = "Jane V4S" },
            { name = "7d_janer35", label = "Jane R35" },
            { name = "italigtoc", label = "Beeran" },
            { name = "2000gtr", label = "Beeran GTR" },
            { name = "7d_judy_m2", label = "Jude M2" },
        }
    },
    {
        label = "VINTAGE",
        acePerm = "devx.vehiclemenu.vintage",
        vehicles = {
            { name = "demod_e92bagged", label = "BMW" },
            { name = "fleetline48", label = "fleetline48" },
            { name = "jagxjs80", label = "Jaguar" },
            { name = "mk2tahomalow", label = "mk2tahomalow" },
            { name = "rrshelbycobra", label = "rrshelbycobra" },
            { name = "ikx3rsr", label = "ikx3rsr" },
            { name = "rrporsche", label = "rrporsche" },
        }
    },
    {
        label = "BIKES",
        acePerm = "devx.vehiclemenu.bikes",
        vehicles = {
            { name = "20mt10", label = "mt10" },
            { name = "davidson22", label = "davidson22" },
            { name = "r1", label = "r1" },
            { name = "GODzBMWS1000RR", label = "BMWS1000RR" },
        }
    },
    {
        label = "OFF_ROAD",
        acePerm = "devx.vehiclemenu.offroad",
        vehicles = {
            { name = "GCWBChevy", label = "GCWBChevy" },
            { name = "tacoma24", label = "Tacoma" },
            { name = "bm_tacoma", label = "bm_tacoma"},
            { name = "RubberRufus", label = "RubberRufus" },
            { name = "willysmb", label = "willysmb" },
        }
    },
    {
        label = "FUNNY",
        acePerm = "devx.vehiclemenu.funny",
        vehicles = {
            { name = "KKCenoura", label = "Carrot vandi" },
            { name = "ringbati", label = "bike" },
            { name = "ag_flywc", label = "ag_flywc" },
            { name = "drag", label = "dragon" },
            { name = "banana_car", label = "banana_car" },
            { name = "foodvan", label = "foodvan" },
            { name = "tacotuck", label = "tacotuck" },
        }
    },
    {
        label = "Fly",
        acePerm = "devx.vehiclemenu.fly",
        vehicles = {
            { name = "thruster4", label = "Butterfly heli" },
            { name = "dkbatwing", label = "Batman 1" },
            { name = "bvsbatwing", label = "Batman 2" },
            { name = "19890604", label = "Parakana vandi" },
        }
    },
    {
        label = "Special Cars",
        acePerm = "devx.vehiclemenu.special",
        vehicles = {
            { name = "Zinxy", label = "Zinxy" },
            { name = "c7", label = "c7" },
            { name = "escaladesport", label = "escaladesport" },
            { name = "KillerRs7", label = "KillerRs7" },
            { name = "mclareng", label = "mclareng" },
            { name = "rmodsianr1", label = "rmodsianr1" },
            { name = "RRazirrisa", label = "RRazirrisa" },
            { name = "DBDEFz_Pinky", label = "DBDEFz_Pinky" },
            { name = "ikx3_srt170", label = "srt170" },
            { name = "ikx3_sfnf1", label = "sfnf1" },
            { name = "ikx3_m390", label = "m390" },
            { name = "ikx3_gtd25", label = "gtd25" },
            { name = "GODzR36CONCEPT", label = "R36CONCEPT" },
            { name = "lmboss427", label = "gstrufboss1" },
            { name = "ikx3_cc23", label = "cc23" },
            { name = "ikx3_vanq25b", label = "vanq25b" },
            { name = "ikx3gt3rs23", label = "gt3rs23" },
        }
    },
    {
        label = "Toy",
        acePerm = "devx.vehiclemenu.toy",
        vehicles = {
            { name = "babycar", label = "babycar" },
            { name = "cat_car", label = "cat_car" },
            { name = "f1kart", label = "f1kart" },
            { name = "ponycar", label = "ponycar" },
            { name = "ppht3", label = "ppht3" },
            { name = "PV_bmwe36", label = "PV_bmwe36" },
            { name = "PV_bugvr", label = "PV_bugvr" },
            { name = "PV_dawn", label = "PV_dawn" },
            { name = "PV_gtr", label = "PV_gtr" },
            { name = "PV_jeep", label = "PV_jeep" },
            { name = "PV_lgss", label = "PV_lgss" },
            { name = "PV_rover", label = "PV_rover" },
            { name = "PV_sianr", label = "PV_sianr" },
            { name = "PV_urus", label = "PV_urus" },
        }
    },
    {
        label = "Animated",
        acePerm = "devx.vehiclemenu.animated",
        vehicles = {
            { name = "amggtbs", label = "amggtbs" },
            { name = "bbdawn", label = "bbdawn" },
            { name = "amggt63", label = "amggt63" },
            { name = "bmwhommage", label = "bmwhommage" },
            { name = "hycadeevo", label = "hycadeevo" },
            { name = "gcmlamboultimae", label = "gcmlamboultimae" },
            { name = "mach1", label = "mach1" },
            { name = "gxm5", label = "gxm5" },
            { name = "ie2", label = "ie2" },
            { name = "lc500", label = "lc500" },
            { name = "m4hycade21", label = "m4hycade21" },
            { name = "mk4hycade", label = "mk4hycade" },
            { name = "protoz", label = "protoz" },
            { name = "wmfenyr", label = "wmfenyr" },
        }
    },
    {
        label = "OTHER",
        acePerm = "devx.vehiclemenu.other",
        vehicles = {
            { name = "senny", label = "Senny" },
            { name = "x3m4gt322", label = "M4" },
            { name = "r34hugo", label = "R34" },
            { name = "puipui", label = "puipui" },
            { name = "lotelise190", label = "lotelise190" },
            { name = "ag_minecraftpig", label = "minecraftpig" },
            { name = "c8z06abflug", label = "c8z06abflug" },
            { name = "bhorschetaytrs", label = "porche" },
            { name = "demod_e92bagged", label = "BMW" },
            { name = "x3m4gt322", label = "M4" },
            { name = "pbbmwm3", label = "M4 animated" },
            { name = "rmodm8c", label = "M8 comp" },
            { name = "slsr", label = "slsr" },
            { name = "agerasuper", label = "agerasuper" },
            { name = "ugcgojira", label = "GTR" },
            { name = "GODz10LFAGT", label = "GODz10LFAGT" },
            { name = "gti8", label = "gti8" },
            { name = "mustanghycade", label = "mustanghycade" },
            { name = "ftype2022", label = "ftype2022" },
            { name = "x6m47", label = "x6m47" },
        }
    },
}
