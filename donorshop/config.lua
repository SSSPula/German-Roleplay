Config = {
  UseConsoleCommand = true,
  
  ShowMarker  = true,
  ShowBlip    = false,

  InsideSpawn = vector3(-1266.979,-3013.096,-48.49),
  OutsideSpawn = vector3(-1394.815,-3265.038,13.50),
  InsideTeleport = vector3(-1267.568,-3038.146,-49.450),
  OutsideTeleport = vector3(-1394.815,-3265.038,13.50),

  InsideMarker = {
    type          = 27,
    posX          = -1267.568,
    posY          = -3038.146,
    posZ          =   -49.450,
    scaleX        = 2.0,
    scaleY        = 2.0,
    scaleZ        = 2.0,
    red           = 000,
    green         = 000,
    blue          = 000,
    alpha         = 155, 
    bobUpAndDown  = false,   
    faceCamera    = true,
  },

  OutsideMarker = {
    type          = 27,
    posX          = -1394.815,
    posY          = -3265.038,
    posZ          =    13.000,
    scaleX        = 2.0,
    scaleY        = 2.0,
    scaleZ        = 2.0,
    red           = 000,
    green         = 225,
    blue          = 000,
    alpha         = 155, 
    bobUpAndDown  = false,   
    faceCamera    = true,
  },

  Blip = {
    posX          = -1394.815,
    posY          = -3265.038,
    posZ          =    13.944,
    sprite        = 530,
    color         = 5,
    display       = 3,
    scale         = 1.0,
    shortRange    = true,
    highDetail    = true,
    text          = "Import Showroom",
  },
}

DonorTiers = {
  [1] = {
    vehicles = {
      {
        model = 'autarch',
        price = 10,
      },
      {
        model = 'nero',
        price = 10,
      },
      {
        model = 'le7b',
        price = 10,
      },
      {
        model = 'pfister811',
        price = 10,
      },
      {
        model = 'tyrus',
        price = 10,
      },
      {
        model = 'tyrus',
        price = 10,
      },
    },
  },
  [2] = {
    vehicles = {
      {
        model = 'autarch',
        price = 5,
      },
      {
        model = 'nero',
        price = 5,
      },
      {
        model = 'le7b',
        price = 5,
      },
      {
        model = 'pfister811',
        price = 5,
      },
      {
        model = 'tyrus',
        price = 5,
      },
      {
        model = 'tyrus',
        price = 5,
      },

      {
        model = 'fmj',
        price = 15,
      },
      {
        model = 'sheava',
        price = 15,
      },
      {
        model = 't20',
        price = 15,
      },
      {
        model = 'prototipo',
        price = 15,
      },
    },
  },
  [3] = {
    vehicles = {
      {
        model = '190e',
        price = 5,
      },
      {
        model = 'skyline',
        price = 5,
      },
      {
        model = 'gtr',
        price = 5,
      },
      {
        model = 'audirs6tk',
        price = 5,
      },
      {
        model = 'a45amg',
        price = 5,
      },
      {
        model = 'w222wald',
        price = 5,
      },

      {
        model = 'r1',
        price = 10,
      },
      {
        model = 'rmodmustang',
        price = 10,
      },
      {
        model = '720s',
        price = 10,
      },
      {
        model = 'acs8',
        price = 10,
      },

      {
        model = '21sierra',
        price = 20,
      },
      {
        model = '66fastback',
        price = 20,
      },
      {
        model = 'italia458',
        price = 20,
      },
      {
        model = 'r8ppi',
        price = 20,
      },
    },
  },
}

mLibs = exports["meta_libs"]