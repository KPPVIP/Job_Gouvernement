Config                            = {}

config = {

    armurie = {
        {
            grade = "Recrue",
            weapons = {
                "weapon_flar",
                "weapon_flashlight",
                "weapon_stungun",
                "WEAPON_NIGHTSTICK",
            }
        },
        {
            grade = "Officier",
            weapons = {
                "weapon_flare",
                "weapon_flashlight",
                "weapon_stungun",
                "WEAPON_NIGHTSTICK",
                "WEAPON_PISTOL",
            }
        },
        {
            grade = "Sergent",
            weapons = {
                "weapon_flare",
                "weapon_flashlight",
                "weapon_stungun",
                "WEAPON_NIGHTSTICK",
                "WEAPON_PISTOL",
                "WEAPON_BZGAS",
                "WEAPON_PUMPSHOTGUN",
            }
        },
        {
            grade = "Brigadier",
            weapons = {
                "weapon_flare",
                "weapon_flashlight",
                "weapon_stungun",
                "WEAPON_NIGHTSTICK",
                "WEAPON_PISTOL",
                "WEAPON_PISTOL50",
                "WEAPON_BZGAS",
                "WEAPON_PUMPSHOTGUN",
                "WEAPON_SMG",
            }
        },
        {
            grade = "Lieutenant",
            weapons = {
                "weapon_flare",
                "weapon_flashlight",
                "weapon_stungun",
                "WEAPON_NIGHTSTICK",
                "WEAPON_PISTOL",
                "WEAPON_PISTOL50",
                "WEAPON_BZGAS",
                "WEAPON_PUMPSHOTGUN",
                "WEAPON_SMG",
                "WEAPON_CARBINERIFLE_MK2",
            }
        },
        {
            grade = "Capitaine",
            weapons = {
                "weapon_flare",
                "weapon_flashlight",
                "weapon_stungun",
                "WEAPON_NIGHTSTICK",
                "WEAPON_PISTOL",
                "WEAPON_PISTOL50",
                "WEAPON_BZGAS",
                "WEAPON_PUMPSHOTGUN",
                "WEAPON_SMG",
                "WEAPON_CARBINERIFLE_MK2",
            }
        },
        {
            grade = "Commandant",
            weapons = {
                "weapon_flare",
                "weapon_flashlight",
                "weapon_stungun",
                "WEAPON_NIGHTSTICK",
                "WEAPON_PISTOL",
                "WEAPON_PISTOL50",
                "WEAPON_BZGAS",
                "WEAPON_PUMPSHOTGUN",
                "WEAPON_SMG",
                "WEAPON_CARBINERIFLE_MK2",
            }
        },
    },

    serviceWeapons = { -- All weapons to remove when service out
        "weapon_nightstick",
        "weapon_stungun",
        "weapon_combatpistol",
        "weapon_pumpshotgun",
        "weapon_flare",
        "weapon_flashlight",
        "WEAPON_PISTOL",
        "WEAPON_PISTOL50",
        "WEAPON_BZGAS",
        "WEAPON_SMG",
        "WEAPON_CARBINERIFLE_MK2",
    },
    
    zone = {
        -- {"armurie", vector3(479.248, -996.771, 30.69), "Appuyer sur ~INPUT_PICKUP~ pour intéragir", function() OpenPoliceArmurieMenu() end, "s_m_y_cop_01", 6.0628008842468, true},
        {"garage", vector3(-517.78, -251.29, 34.68), "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage", function() OpengouvGarageMenu() end, "mp_s_m_armoured_01", 205.3, true},
    },
    garage = {
        vehs = {
            {label = "Unité de Sécurité", veh = "fbi2"},
            {label = "Service Secret", veh = "sspres"},
            {label = "OneBeast Présidentiel", veh = "onebeast"},
            {label = "Garde Rapprochée", veh = "fbi"},

            
        },
        pos  = {
            {pos = vector3(-498.89, -256.78, 35.38), heading = 111.09},
            {pos = vector3(-505.97, -259.69, 35.51), heading = 111.57},
            {pos = vector3(-513.09, -262.64, 35.42), heading = 111.86},
            {pos = vector3(-520.61, -265.74, 35.33), heading = 109.34},
            {pos = vector3(-526.88, -268.38, 35.26), heading = 109.34},
            
          
        },
    },
}
