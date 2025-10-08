-- If an option is commented out it is,
-- because at present ONB only allows up to 3 options for
-- quiz player without weird work arounds.

-- If an entire entry is commented out it is either because:
-- it required a feature this script does not currently support
-- Answers were found to be too long and break Net/Async.quiz_player in v2.0/2.1
-- OR --
-- The question was found to be too specific to be of any meaningful use with current implementation.

-- TODOs:
-- - Some questions may need to be adjusted/re-worded to give additional context.
-- - Add extra tags for the entries that are currently barebones
-- - Snatch up ShaDisNX255s YuGiOh code to figure out how he handled turns/preventing players delaying forever on their turns.
--   Then adjust code to be abit more reusable and/or standalone if needed. Design and implement a system for Team Trivia night
--       - This should include setting up a lobby with a limit of 8 players (Possibly variable limits)
--       - Delay deterants/Answer timers
--       - Scoring system (and a way to do a quiz that doesnt stop on incorrect answers need to rethink how I handle setting the bot up to handle different types of configurations.)
--       - Maybe? Option to do teams, Would need to work out logistics on how this could work.
--         Maybe pick a leader at the start or its random member (Or event on a cycle) of each team each turn and there's
--         a deliberation period using BBS?
--       - Implement currating quizes from specific tags (Filtering by tags)

-- Tag options as of present
-- {
-- "General Knowledge",
-- "BN"#,
-- "Map Knowledge",
-- "Lore Knowledge",
-- "Game Knowledge",
-- "Chip Knowledge",
-- "Character Knowledge",
-- "Riddle"
-- "Custom"
-- "Random"
-- "General Question"
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
        question = "Whose Navi is called GutsMan?",
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
    --    tags = {"BN2"},
    --    question = "What distinguishes the Marine Station kiosk?",
    --    options = {
    --        "The Selection",
    --        "The Low Prices",
    --        "The Pretty Staff"
    --    },
    --    answer = 0
    --},
    {
        tags = { "BN2" },
        question = "How many tents are in Okuden Valley Campground?",
        options = {
            "2",
            "3",
            "4"
        },
        answer = 1
    },
    {
        tags = { "BN2" },
        question = "Where did the Marine Harbor Cafe waitress work before?",
        options = {
            "Restaurant",
            "Arcade",
            "The Center"
        },
        answer = 0
    },
    {
        tags = { "BN2" },
        question = "Choose cannons in A, B, and C order, and what do you get?",
        options = {
            "Omega Cannon",
            "Ultra Cannon",
            "Zeta Cannon"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "What's the popular announcer Ribitta's TV show name?",
        options = {
            "DNN News",
            "CattleOx TV",
            "RaiShip TV"
        },
        answer = 0
    },
    {
        tags = { "BN2" },
        question = "What's the name of the quick, rat-shaped virus?",
        options = {
            "Ratton",
            "Ratter",
            "Ratty"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "What advance occurs when Spreaders are in alphabet-order?",
        options = {
            "PwdCanon",
            "H-Burst",
            "O-Canon1"
        },
        answer = 1
    },
    {
        tags = { "BN2" },
        question = "What shape is Okuden Valley's air-monitoring system?",
        options = {
            "Guardian",
            "Tent",
            "Bear"
        },
        answer = 0
    },
    {
        tags = { "BN2" },
        question = "Where is the statue of the ancient Melpos god of war?",
        options = {
            "Net Castle",
            "Jewelry Store",
            "Yai's House"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
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
        tags = { "BN2" },
        question = "Which has a more powerful attack? LilBomb or HeatSprd?",
        options = {
            "LilBomb",
            "HeatSprd",
            "The same power"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "What's the name of SnakeMan's operator?",
        options = {
            "Mrs. Salmonella",
            "Mrs. Millions",
            "Mrs. Millionaire"
        },
        answer = 1
    },
    {
        tags = { "BN2" },
        question = "What wood does the bath in ACDC Town's largest house use?",
        options = {
            "Hackberry",
            "Cedar",
            "Cypress"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "What's in the trashcan in underground Netopia?",
        options = {
            "Teddy bear",
            "Radio",
            "Basketball"
        },
        answer = 0
    },
    {
        tags = { "BN2" },
        question = "What's ShadowMan's element?",
        options = {
            "Aqua",
            "No Element",
            "Wood"
        },
        answer = 1
    },
    {
        tags = { "BN2" },
        question = "What's the virus that shoots CannonBalls from its mouth?",
        options = {
            "CannBall",
            "Handy",
            "HardHead"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "What's the combined attack of ThunManV3, Navi+40 & Navi+20?",
        options = {
            "190",
            "220",
            "240"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "Who is a former WWW operator?",
        options = {
            "Arashi",
            "Chaud",
            "Mr. Match"
        },
        answer = 2
    },
    -- {
    --     tags = {"BN2"},
    --     question = "What's the name of MagnetMan's operator Gauss's brother?",
    --     options = {
    --         "Anpere Gauss",
    --         "Hippopotamus Gauss",
    --         "Jack Electricity"
    --     },
    --     answer = 2
    -- },
    {
        tags = { "BN2" },
        question = "Of these Navis, who is vulnerable to Wood attacks?",
        options = {
            "MagnetMan",
            "HeatMan",
            "KnightMan"
        },
        answer = 0
    },
    {
        tags = { "BN2" },
        question = "What's the temperature of the Netopia hotel fridge?",
        options = {
            "-3 degrees C",
            "0 degrees C",
            "3 degrees C"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "What's the name of the popular robot cartoon in Netopia?",
        options = {
            "Rondam",
            "RoboX",
            "RottaRobo"
        },
        answer = 1
    },
    {
        tags = { "BN2" },
        question = "How many houses are there in ACDC Town?",
        options = {
            "7",
            "8",
            "9"
        },
        answer = 0
    },
    {
        tags = { "BN2" },
        question = "Which virus has the highest attack power?",
        options = {
            "Swordy2",
            "Swordy",
            "Swordy3"
        },
        answer = 2
    },
    {
        tags = { "BN2" },
        question = "What's in DenCity but not in Netopia?",
        options = {
            "MetroLine",
            "BusStop",
            "CyberSquare"
        },
        answer = 0
    },
    {
        tags = { "BN2" },
        question = "What area can you enter the Undernet from?",
        options = {
            "NetSq.Ent.",
            "Netopia 2",
            "Netopia 3"
        },
        answer = 2
    },
    -- {
    --     tags = { "BN2" },
    --     question = "Where was Quiz?",
    --     options = {
    --         "Okuden Valley",
    --         "The Center",
    --         "Den Airport"
    --     },
    --     answer = 2
    -- },
    {
        tags = { "BN2" },
        question = "What's Mother Comp1's second keyword?",
        options = {
            "WATCH",
            "RIVER",
            "UCANGO"
        },
        answer = 1
    },
    {
        tags = { "BN2" },
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
    -- {
    --     tags = { "BN3", },
    --     question = "Where is the newest blackboard in the school?",
    --     options = {
    --         "Classroom 5-A",
    --         "Classroom 5-B",
    --         "Teacher's Lounge"
    --     },
    --     answer = 2
    -- },
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
    },
    -- BN4
    {
        tags = { "BN4" },
        question = "What is the full name for a PET?",
        options = {
            "PErsonal Tank",
            "PErfect Tag",
            "PErsonal Terminal"
        },
        answer = 2
    },
    {
        tags = { "BN4" },
        question = "What statue stands in the garden of the mansions in ACDC?",
        options = {
            "Elephant",
            "Duck",
            "Giraffe"
        },
        answer = 2
    },
    {
        tags = { "BN4" },
        question = "Which is the largest electrical store in ElecTown",
        options = {
            "Jomon Electric",
            "Comeon Electric",
            "Yo,Mon! Electric"
        },
        answer = 0
    },
    {
        tags = { "BN4" },
        question = "What is the name of the maiden who works at Higsby's?",
        options = {
            "Hinako",
            "Nanako",
            "Yoyoko"
        },
        answer = 1
    },
    {
        tags = { "BN4" },
        question = "What kind of stand is set up next to DenDome?",
        options = {
            "Pancake Stand",
            "Convns Store",
            "Hotdog Stand"
        },
        answer = 2
    },
    {
        tags = { "BN4", "Riddle", },
        question = "What goes around the house, and in the house, but never touches the house?",
        options = {
            "Air",
            "Fog",
            "The Sun",
            -- "Rain"
        },
        answer = 2
    },
    {
        tags = { "BN4", "Riddle", },
        question =
        "I go around in circles, But always straight ahead. Never complain no matter where I am led. What am I?",
        options = {
            "Baby",
            "Mule",
            "Wheel"
            -- "Boat"
        },
        answer = 2
    },
    {
        tags = { "BN4", "Riddle", },
        question =
        "Brothers and sisters I have none, But that man's father. Is my father's son? Who is it?",
        options = {
            "My Son",
            "My Father",
            "Me"
            -- "My Uncle"
        },
        answer = 0
    },
    {
        tags = { "BN4", "Riddle", },
        question =
        "What is put on a table, cut, and never eaten?",
        options = {
            "Silence",
            "Cards",
            "Air"
            -- "Water"
        },
        answer = 1
    },
    {
        tags = { "BN4", "Riddle", },
        question =
        "Lovely and round, I shine with pale light, grown in the darkness, a lady's delight. What am I?",
        options = {
            "Ring",
            "Diamond",
            "Pearl"
            -- "Baby"
        },
        answer = 2
    },
    {
        tags = { "BN4", "Riddle", },
        question =
        "I build up castles. I tear down mountains. I make some men blind. I help others to see. What am I?",
        options = {
            "Sand",
            "Steel",
            "Glass"
            -- "Dynamite"
        },
        answer = 0
    },
    {
        tags = { "BN4", "Riddle", },
        question =
        "Lighter than what I am made of, more of me is hidden than is seen. What am I?",
        options = {
            "Iceberg",
            "Star",
            "Whale"
            -- "Snail"
        },
        answer = 0
    },
    {
        tags = { "BN4", },
        question =
        "How many houses are there in NetFrica?",
        options = {
            "3",
            "4",
            "5"
        },
        answer = 1
    },
    {
        tags = { "BN4", },
        question =
        "How many tusks does Nupopo have?",
        options = {
            "2",
            "3",
            "4"
        },
        answer = 0
    },
    {
        tags = { "BN4", },
        question =
        'What\'s the Attack of the Battle Chip "Boomer1"?',
        options = {
            "40",
            "50",
            "60"
        },
        answer = 2
    },
    {
        tags = { "BN4", },
        question =
        'The NetFrica youth club leader wears what color clothes?',
        options = {
            "White",
            "Green",
            "Brown"
        },
        answer = 1
    },
    {
        tags = { "BN4", },
        question =
        'How many big, round platforms are there in the Netopia Area?',
        options = {
            "20",
            "21",
            "22"
        },
        answer = 2
    },
    {
        tags = { "BN4", },
        question =
        'What was score for Lan\'s last math test towards the end of his tournament campaign?',
        options = {
            "0 Pts",
            "35 Pts",
            "75 Pts"
        },
        answer = 1
    },
    {
        tags = { "BN4", },
        question =
        'What is Lan\'s favorite food?',
        options = {
            "Steak",
            "Hotdogs",
            "Hamburgers"
        },
        answer = 2
    },
    --   Trick Question
    --  {
    --      tags = { "BN4", },
    --      question =
    --      'Which of Megamans previous foes were the strongest?',
    --      options = {
    --          "MachoManB",
    --          "KickManO",
    --          "CyberManZ"
    --      },
    --      answer = 3
    --  },
    -- BN5
    {
        tags = { "BN5" },
        question = "What was dropped from the car around the curve?",
        options = {
            "Speed",
            "Luggage",
            "Its driver"
        },
        answer = 0
    },
    {
        tags = { "BN5" },
        question = "It grinds down hills yet remains unseen.",
        options = {
            "Time",
            "A volcano",
            "A river"
        },
        answer = 0
    },
    {
        tags = { "BN5" },
        question = "How many steel drums are outside the Old Mine on Oran Isle?",
        options = {
            "6",
            "8",
            "10"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "What is the combined Atk of Cannon + MiniBomb + WideSwrd?",
        options = {
            "150",
            "170",
            "230"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "This sport is a bit scary because people hit, throw and steal.",
        options = {
            "Soccer",
            "Baseball",
            "Croquet"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "In boxing, attacks like a ChamoyEX's are called what?",
        options = {
            "A one-two Punch",
            "Man-to-man defense",
            "A counter punch"
        },
        answer = 0
    },
    {
        tags = { "BN5" },
        question = "The total Atk of a ChampyEX's right and left punches is...",
        options = {
            "50",
            "60",
            "70"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "What is the opposite of sweet?",
        options = {
            "Sour",
            "Spicy",
            "Bitter"
        },
        answer = 1
    },
    -- {
    --     tags = { "BN5" },
    --     question = "How many times did I just say 'la'?",
    --     options = {
    --         "3",
    --         "4",
    --         "5"
    --     },
    --     answer = 1
    -- },
    {
        tags = { "BN5" },
        question = "In which area do Handi appear?",
        options = {
            "SciLab1",
            "SciLab2",
            "Oran Area2"
        },
        answer = 1
    },
    -- {
    --     tags = { "BN5" },
    --     question = "...La la la, la la la. Just kidding. What question is this?",
    --     options = {
    --         "#7",
    --         "#8",
    --         "#9"
    --     },
    --     answer = 0
    -- },
    {
        tags = { "BN5" },
        question = "You can jack into which sculpture outside of SciLab?",
        options = {
            "The left one",
            "The middle one",
            "The right one"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "What does the sculpture portray?",
        options = {
            "A man",
            "A BattleChip",
            "A PC"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "Influenza is caused by what?",
        options = {
            "A germ",
            "A bacterium",
            "A virus"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "The dice at Higsby's add up to what number?",
        options = {
            "5",
            "8",
            "11"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "What is the name of Mr.Famous's Navi?",
        options = {
            "HoodMan",
            "WoodMan",
            "GridMan"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "How many posts are next to ACDC Town's Metroline station?",
        options = {
            "6",
            "8",
            "10"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "Of the following chips, which one has the highest Attack?",
        options = {
            "MrkCan2",
            "TankCan1",
            "M-Cannon"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "What color does blue limitus paper turn when dipped in hydrochloric acid?",
        options = {
            "Red",
            "Blue",
            "Don't know"
        },
        answer = 0
    },
    {
        tags = { "BN5" },
        question = "7,14,21,28,35,42 What comes next?",
        options = {
            "49,55,63,72,89,96",
            "49,56,63,70,77,84",
            "45,51,64,72,83,81"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "The visible sides of the dice at Higsby's add up to what number?",
        options = {
            "11",
            "22",
            "33"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "Which word means the same as 'erase'?",
        options = {
            "Dessert",
            "Delete",
            "Delicate"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "What is above a female deer and a drop of golden sun?",
        options = {
            "You",
            "Trees",
            "Me"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "Ryan's friend Kyle went over to Ian's house to play. Who is the subject of this sentence?",
        options = {
            "Ryan",
            "Kyle",
            "Ian"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "What chip has ID67 in the Data Library?",
        options = {
            "Sword",
            "DrilArm1",
            "AirHoc"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "What follows Aries, Taurus, and Gemini?",
        options = {
            "Pisces",
            "Scorpio",
            "Cancer"
        },
        answer = 2
    },
    {
        tags = {
            "BN5",
            "Riddle"
        },
        question =
        "A bus is driving down a street. There are 13 people inside, including the driver. 7 get off and 4 get on at the 1st stop. 3 get off and 5 get on at the 2nd stop. How many people are on the bus now?",
        options = {
            "11",
            "12",
            "13"
        },
        answer = 1
    },
    {
        tags = { "BN5" },
        question = "Which ship is docked in the harbor behind SciLab?",
        options = {
            "Princess Miki",
            "Rodriguez Cartan",
            "Queen Bohemia"
        },
        answer = 2
    },
    {
        tags = { "BN5" },
        question = "Whose web page does not have a BBS?",
        options = {
            "Dex's",
            "Mayl's",
            "Yai's"
        },
        answer = 1
    },
    -- BN6
    {
        tags = { "BN6" },
        question = "What can't you grab with your left hand?",
        options = {
            "Left hand",
            "Right hand",
            "Pickaxe"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "What does a Mettaur always have?",
        options = {
            "Shield",
            "Pickaxe",
            "Helmet"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "Which one of these fish might chase a mouse?",
        options = {
            "Catfish",
            "Goldfish",
            "Shark"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "What walks on 4 legs, then 2 legs, then 3 legs?",
        options = {
            "Human",
            "Dog",
            "Bird"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "What is the color of the tulips in Cyber Academy Class 1-2?",
        options = {
            "Red",
            "Blue",
            "Yellow"
        },
        answer = "2"
    },
    {
        tags = { "BN6" },
        question = "How many trees are in the park?",
        options = {
            "8 Trees",
            "10 Trees",
            "12 Trees"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "Which letters are in 'Subchip' but not in 'Chip'?",
        options = {
            "S and B",
            "C and A",
            "U and S"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "What do you call a small program in a PET?",
        options = {
            "Subchip",
            "MiniProg",
            "DataBit"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "What chip is formed by combining Aqua and Sword?",
        options = {
            "AquaSwrd",
            "WaterBlade",
            "HydroCut"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "1 + 3 × 4 + 2 – 3 = ?",
        options = {
            "10",
            "12",
            "14"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "Difference between Hi-Cannon and Spreader 2 attack power?",
        options = {
            "30",
            "40",
            "50"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "How many students in Class 6-A?",
        options = {
            "6",
            "8",
            "10"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "What is the seal's name?",
        options = {
            "Fanny",
            "Furry",
            "Flipper"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "What is the name of the battle game?",
        options = {
            "Netbattle",
            "CyberFight",
            "DataDuel"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "How much HP does MiniEnergy restore?",
        options = {
            "30",
            "50",
            "100"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "Which chip has ID58 in the Data Library?",
        options = {
            "MiniBomb",
            "AirShot",
            "Cannon"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "How high is Sky Town?",
        options = {
            "20,000 Feet",
            "25,000 Feet",
            "30,000 Feet"
        },
        answer = "2"
    },
    {
        tags = { "BN6" },
        question = "(Sword + Mini Bomb) – (Air Shot + Cannon) = ?",
        options = {
            "60",
            "70",
            "80"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "What Navi attacked the Aquarium?",
        options = {
            "Diveman",
            "Swordman",
            "Numberman"
        },
        answer = "0"
    },
    -- {
    --     tags = { "BN6" },
    --     question = "Who am I?",
    --     options = {
    --         "QuizMaster",
    --         "QuizKing",
    --         "QuizNavi"
    --     },
    --     answer = "1"
    -- },
    {
        tags = { "BN6" },
        question = "What is the Attack power of 'Time Bomb 1'?",
        options = {
            "100",
            "150",
            "200"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "Does a needle have an 'Eye', 'Ear', or 'Mouth'?",
        options = {
            "Eye",
            "Ear",
            "Mouth"
        },
        answer = "0"
    },
    -- {
    --     tags = { "BN6" },
    --     question = "What does PET stand for?",
    --     options = {
    --         "Personal Terminal",
    --         "Portable Energy Tool",
    --         "Program Execution Terminal"
    --     },
    --     answer = "0"
    -- },
    {
        tags = { "BN6" },
        question = "In the Green Town Courtroom Foyer, what is written?",
        options = {
            "Justice",
            "Law",
            "Truth"
        },
        answer = "2"
    },
    {
        tags = { "BN6" },
        question = "6, 4, or 8 – Which takes the most strokes to write?",
        options = {
            "6",
            "4",
            "8"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "Which one of these is not in the Seaside Aquarium?",
        options = {
            "Fur Seal",
            "Penguin",
            "Jellyfish"
        },
        answer = "0"
    },
    {
        tags = { "BN6" },
        question = "If hit by a Mettaur and Champy attack, how much damage?",
        options = {
            "20",
            "30",
            "40"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "How many students are in Class 6-A?",
        options = {
            "6",
            "8",
            "10"
        },
        answer = "1"
    },
    {
        tags = { "BN6" },
        question = "Where is the aquarium's exit?",
        options = {
            "Seaside Area 1",
            "Seaside Area 2",
            "Seaside Area 3"
        },
        answer = "2"
    },
    {
        tags = { "BN6" },
        question = "Which century is it in the game?",
        options = {
            "21st Century",
            "30th Century",
            "31st Century"
        },
        answer = "2"
    },
    {
        tags = { "Random" },
        question = "Are you a sentient human being?",
        options = {
            "Yes",
            "No",
            "Unfortunately"
        },
        answer = "2"
    }
}

return questionBank
