resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

---- OneBeast

files {
    'onebeast/vehicles.meta',
    'onebeast/carvariations.meta',
    'onebeast/beastweapons.meta',
    'onebeast/handling.meta',
}

data_file 'HANDLING_FILE' 'onebeast/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'onebeast/vehicles.meta'
data_file 'BEAST_WEAPONS_FILE' 'onebeast/beastweapons.meta'
data_file 'VEHICLE_VARIATION_FILE' 'onebeast/carvariations.meta'


client_script {
    'vehicle_names.lua'
}

------ SecretService Suburban

files {
    'sspres/vehicles.meta',
    'sspres/carvariations.meta',
    'sspres/contentunlocks.meta',
    'sspres/handling.meta',
    'sspres/vehiclelayouts.meta',
}

data_file 'HANDLING_FILE' 'sspres/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'sspres/vehicles.meta'
data_file 'CONTENT_UNLOCKS_FILE' 'sspres/contentunlocks.meta'
data_file 'VEHICLE_VARIATION_FILE' 'sspres/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'sspres/vehiclelayouts.meta'


client_script {
    'vehicle_names.lua'
}

