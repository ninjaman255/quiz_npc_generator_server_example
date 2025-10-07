-- Tag options as of present
-- {
-- "General Knowledge",
-- "BN"#,
-- "Map Knowledge",
-- "Lore Knowledge",
-- "Game Knowledge",
-- "Chip Knowledge",
-- "Character Knowledge",
-- }

local questionBank = {
    -- BN1
    {
        tags = {
            "BN1",
            "Map Knowledge",
        },
        question = "How many light bulbs in the power plant network?",
        options = {
            "16",
            "17",
            "18",
        },
        answer = 2,
    },

    {
        tags = {
            "BN1",
            "Lore Knowledge",
        },
        question = "What's the name of the Navi that took over the Waterworks?",
        options = {
            "GutsMan",
            "Iceman",
            "Stoneman",
        },
        answer = 1,
    },

    --{
    --    tags = {
    --        "BN1",
    --        "Game Knowledge",
    --    },
    --    question = "What do you always say when you jack in?",
    --    options = {
    --        "Transmission!",
    --        "Battle operation!",
    --        "Transmit!",
    --    },
    --    answer = 2,
    --},

    {
        tags = {
            "BN1",
            "Chip Knowledge",
        },
        question = "Which of these chips does 80 damage to your opponent?",
        options = {
            "ShockWave",
            "Recov80",
            "Sword",
        },
        answer = 2,
    },

    {
        tags = {
            "BN1",
            "Chip Knowledge",
        },
        question = "Which of these chips increases your battle area?",
        options = {
            "Steal",
            "Escape",
            "X-Panel1",
        },
        answer = 0,
    },

    {
        tags = {
            "General Knowledge",
        },
        question = "Who's Navi is called GutsMan?",
        options = {
            "Dex",
            "Yai",
            "Mayl",
        },
        answer = 0,
    },

    {
        tags = {
            "BN1",
            "Character Knowledge",
        },
        question = "Who's the summer school teacher in DenTown?",
        options = {
            "Ms. Miyu",
            "Ms. Mari",
            "Ms. Yuri",
        },
        answer = 2,
    },

    {
        tags = {
            "General Knowledge",
            "Map Knowledge",
            "Character Knowledge",
        },
        question = "Who owns the chip shop in ACDC Town?",
        options = {
            "Bigsby",
            "Higsby",
            "Migsby",
        },
        answer = 1,
    },

    {
        tags = {
            "BN1",
            "Map Knowledge",
        },
        question = "How many chairs are in the schools AV room?",
        options = {
            "6",
            "8",
            "9",
        },
        answer = 2,
    },

    {
        tags = {
            "BN1",
            "Map Knowledge",
        },
        question = "What musical instrument is in Mayl's room?",
        options = {
            "A piano",
            "A violin",
            "A pipe organ",
        },
        answer = 0,
    },

    {
        tags = {
            "BN1",
            "Character Knowledge",
        },
        question = "How old is Yai?",
        options = {
            "6",
            "8",
            "12",
        },
        answer = 1,
    },

    {
        tags = {
            "BN1",
            "Chip Knowledge",
        },
        question = "What chip do you use to escape from a battle?",
        options = {
            "JackOut",
            "Steal",
            "Escape",
        },
        answer = 2,
    },

    {
        tags = {
            "BN1",
            "Map Knowledge",
        },
        question = "The antique shop is on what Block of DenTown?",
        options = {
            "Block2",
            "Block3",
            "Block4",
        },
        answer = 0,
    },

    {
        tags = {
            "BN1",
            "Map Knowledge",
        },
        question = "What kind of toy is in Mayl's room?",
        options = {
            "A game machine",
            "A stuffed Lan",
            "A stuffed animal",
        },
        answer = 2,
    },

    {
        tags = {
            "BN1",
            "Character Knowledge",
        },
        question = "What are Ms. Mari's measurements?",
        options = {
            "30, 25, 30",
            "33, 22, 33",
            "44, 33, 44",
        },
        answer = 1,
    },
    --- BN2
    {
        tags = {
            "General Knowledge",
            "Map Knowledge",
        },
        question = "What animal does the ACDC Town Park Slide look like?",
        options = {
            "Squirrel",
            "Elephant",
            "Giraffe",
        },
        answer = 1,
    },


    --{
    --    tags = {},
    --    question = "What distinguishes the Marine Station kiosk?",
    --    options = {
    --        "The Selection",
    --        "The Low Prices",
    --        "The Pretty Staff"
    --    },
    --    answer = 0
    --},
    {
        tags = {},
        question = "How many tents are in Okuden Valley Campground?",
        options = {
            "2",
            "3",
            "4"
        },
        answer = 1
    },
    {
        tags = {},
        question = "Where did the Marine Harbor Cafe waitress work before?",
        options = {
            "Restaurant",
            "Arcade",
            "The Center"
        },
        answer = 0
    },
    {
        tags = {},
        question = "Choose cannons in A, B, and C order, and what do you get?",
        options = {
            "Omega Cannon",
            "Ultra Cannon",
            "Zeta Cannon"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's the popular announcer Ribitta's TV show name?",
        options = {
            "DNN News",
            "CattleOx TV",
            "RaiShip TV"
        },
        answer = 0
    },
    {
        tags = {},
        question = "What's the name of the quick, rat-shaped virus?",
        options = {
            "Ratton",
            "Ratter",
            "Ratty"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What advance occurs when Spreaders are in alphabet-order?",
        options = {
            "PwdCanon",
            "H-Burst",
            "O-Canon1"
        },
        answer = 1
    },
    {
        tags = {},
        question = "What shape is Okuden Valley's air-monitoring system?",
        options = {
            "Guardian",
            "Tent",
            "Bear"
        },
        answer = 0
    },
    {
        tags = {},
        question = "Where is the statue of the ancient Melpos god of war?",
        options = {
            "Net Castle",
            "Jewelry Store",
            "Yai's House"
        },
        answer = 2
    },
    {
        tags = {},
        question =
        "A rooster stood on the peak of a barn. It laid an egg. Which side did the egg roll down? The left side... or the right?",
        options = {
            "The left",
            "The right",
            "Can't lay eggs!"
        },
        answer = 2
    },
    {
        tags = {},
        question = "Which has a more powerful attack? LilBomb or HeatSprd?",
        options = {
            "LilBomb",
            "HeatSprd",
            "The same power"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's the name of SnakeMan's operator?",
        options = {
            "Mrs. Salmonella",
            "Mrs. Millions",
            "Mrs. Millionaire"
        },
        answer = 1
    },
    {
        tags = {},
        question = "What wood does the bath in ACDC Town's largest house use?",
        options = {
            "Hackberry",
            "Cedar",
            "Cypress"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's in the trashcan in underground Netopia?",
        options = {
            "Teddy bear",
            "Radio",
            "Basketball"
        },
        answer = 0
    },
    {
        tags = {},
        question = "What's ShadowMan's element?",
        options = {
            "Aqua",
            "No Element",
            "Wood"
        },
        answer = 1
    },
    {
        tags = {},
        question = "What's the virus that shoots CannonBalls from its mouth?",
        options = {
            "CannBall",
            "Handy",
            "HardHead"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's the combined attack of ThunManV3, Navi+40 & Navi+20?",
        options = {
            "190",
            "220",
            "240"
        },
        answer = 2
    },
    {
        tags = {},
        question = "Who is a former WWW operator?",
        options = {
            "Arashi",
            "Chaud",
            "Mr. Match"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's the name of MagnetMan's operator Gauss's brother?",
        options = {
            "Anpere Gauss",
            "Hippopotamus Gauss",
            "Jack Electricity"
        },
        answer = 2
    },
    {
        tags = {},
        question = "Of these Navis, who is vulnerable to Wood attacks?",
        options = {
            "MagnetMan",
            "HeatMan",
            "KnightMan"
        },
        answer = 0
    },
    {
        tags = {},
        question = "What's the temperature of the Netopia hotel fridge?",
        options = {
            "-3 degrees C",
            "0 degrees C",
            "3 degrees C"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's the name of the popular robot cartoon in Netopia?",
        options = {
            "Rondam",
            "RoboX",
            "RottaRobo"
        },
        answer = 1
    },
    {
        tags = {},
        question = "How many houses are there in ACDC Town?",
        options = {
            "7",
            "8",
            "9"
        },
        answer = 0
    },
    {
        tags = {},
        question = "Which virus has the highest attack power?",
        options = {
            "Swordy2",
            "Swordy",
            "Swordy3"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's in DenCity but not in Netopia?",
        options = {
            "MetroLine",
            "BusStop",
            "CyberSquare"
        },
        answer = 0
    },
    {
        tags = {},
        question = "What area can you enter the Undernet from?",
        options = {
            "NetSq.Ent.",
            "Netopia 2",
            "Netopia 3"
        },
        answer = 2
    },
    {
        tags = {},
        question = "Where was Quiz?",
        options = {
            "Okuden Valley",
            "The Center",
            "Den Airport"
        },
        answer = 2
    },
    {
        tags = {},
        question = "What's Mother Comp1's second keyword?",
        options = {
            "WATCH",
            "RIVER",
            "UCANGO"
        },
        answer = 1
    },
    {
        tags = {},
        question = "Who's the leader of WWW?",
        options = {
            "Gospel",
            "Dark",
            "Wiley"
        },
        answer = 2
    },

    -- BN3

    --    {
    --        tags = { "BN3", },
    --        question = "Which is heaviest?",
    --        options = {
    --            "1000g of iron",
    --            "10000mg of stone",
    --            "100L of water"
    --        },
    --        answer = 2
    --    },

    {
        tags = { "BN3", },
        question = "What is the fake job of BeastMan's operator?",
        options = {
            "Circus leader",
            "Zoo boss",
            "WWW operator"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "Who is the host of N1's Hades Isle battle?",
        options = {
            "Yasu",
            "Masa",
            "Hiro"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "Which style is ideal for operators that use busters?",
        options = {
            "HeatCuts",
            "ElectroCuts",
            "AquaGuts"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "Which of these is a breaking chip?",
        options = {
            "CannBall",
            "HiCannon",
            "DublBomb"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "How many holes are in ACDC Park's Hole Mountain?",
        options = {
            "2",
            "3",
            "4"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "What is on the left screen in the virus lab?",
        options = {
            "Mettaur",
            "MegaMan",
            "The earth"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "How many drawings are on the wall outside classroom 5-A?",
        options = {
            "5",
            "9",
            "11"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "How much is a cup of coffee at the Beach Street Cafe?",
        options = {
            "380 Zennys",
            "10 Zennys",
            "500 Zennys"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "How many toy pandas are there in the zoo raffle ticket booth?",
        options = {
            "1",
            "2",
            "3"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "Which Breeder Grand Prix did class 5-B win?",
        options = {
            "The 4th",
            "The 8th",
            "The 11th"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "Which animal pours out water into the inn's outdoor bath?",
        options = {
            "Lion",
            "Tiger",
            "Bear"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "At the mini cake stand in front of the zoo...",
        options = {
            "2",
            "4",
            "5"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "Which of these items is not in Mayl's room?",
        options = {
            "Trash can",
            "Mirror",
            "Stuffed animal"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "In what direction is the panda at the zoo looking?",
        options = {
            "Forward",
            "Backward",
            "Sideways"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "How many statues of people are there, just inside the zoo?",
        options = {
            "2",
            "3",
            "5"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "Where is the newest blackboard in the school?",
        options = {
            "Classroom 5-A",
            "Classroom 5-B",
            "Teacher's Lounge"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "How many gold shield displays are in the Principal's Office?",
        options = {
            "3",
            "4",
            "6"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "How much is it to buy a lottery ticket in front of the zoo?",
        options = {
            "100 Zennys",
            "150 Zennys",
            "300 Zennys"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "Which of these is actually placed in the school?",
        options = {
            "A clay statue",
            "A boomerang",
            "A crystal ball"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "Small at noon, tall in the evening, and gone at night: It's...",
        options = {
            "A shadow",
            "A star",
            "A person"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "3.1415926535... What is this?",
        options = {
            "Pie",
            "Pi",
            "Pye"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "What do you get when you cross sandals and a banana peel?",
        options = {
            "Sneakers",
            "Shoes",
            "Slippers"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "What's round on both ends and high in the middle?",
        options = {
            "A mountain",
            "New York",
            "Ohio"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "What goes up but never comes down?",
        options = {
            "Your birthday",
            "Your age",
            "A kite"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "Where would you find Mt. Fuji?",
        options = {
            "Fiji",
            "Japan",
            "Korea"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "A pig gives pork, a cow gives beef, and a baby sheep is?",
        options = {
            "A mutton",
            "A lamb",
            "A glutton"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "In the fairytale, what is Hansel's sister called?",
        options = {
            "Gretchen",
            "Petel",
            "Gretel"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "Which planet is between Mars and Saturn?",
        options = {
            "Jupiter",
            "Earth",
            "Pluto"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "Which one of these animals lays eggs?",
        options = {
            "A dolphin",
            "A bat",
            "A snake"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "What's the attack force of \"CannBall\"?",
        options = {
            "60",
            "100",
            "160"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "Dr. Hikari's lab is on what floor in SciLab?",
        options = {
            "The 2nd",
            "The 5th",
            "The 7th"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "A spider has 8, a rhino has 4, how many have you?",
        options = {
            "6",
            "5",
            "2"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "What did GutsMan have to face in the Endurance Contest?",
        options = {
            "Hunger",
            "Heat",
            "Cold"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "How many girls are in Class 5-A?",
        options = {
            "3",
            "4",
            "5"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "How does Tamako decorate her hair?",
        options = {
            "A silver gear",
            "A red heart",
            "A blue ribbon"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "What was Wily the master?",
        options = {
            "Robots",
            "The net",
            "PETs"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "What is this game's second title?",
        options = {
            "Transmission",
            "Battle Network",
            "Battle Operation"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "Which BubbleMan's dance called?",
        options = {
            "Bubble Dance",
            "Bubbly Dance",
            "Spongy Dance"
        },
        answer = 1
    },
    {
        tags = { "BN3", },
        question = "What type of Navi is BeastMan?",
        options = {
            "A beast",
            "A monster",
            "A psycho"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "What was Higsby's job in the past?",
        options = {
            "Teacher",
            "Fishmonger",
            "Sandwich chef"
        },
        answer = 0
    },
    {
        tags = { "BN3", },
        question = "What name is on the pillars in Metroline Beach Station?",
        options = {
            "Beach Metro",
            "Beach",
            "st. BEACH"
        },
        answer = 2
    },
    {
        tags = { "BN3", },
        question = "What was Yai crazy about?",
        options = {
            "Round fans",
            "Folding fans",
            "Marbles"
        },
        answer = 1
    }
}

return questionBank
