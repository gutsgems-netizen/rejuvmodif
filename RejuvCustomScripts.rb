
# pbVictoryRoadPuzzle(0)
def pbInfoBox(number)
  unrealbackup = $unrealClock.visible
  $unrealClock.visible = false
  clues = [
    # 0
    [
      "1. Underneath Chrisola Hotel.",
      "2. Underneath Dr. Jenkel's Laboratory.",
      "3. Underneath the largest fountain."
    ],
    # 1
    [
      "Rules of the Land:",
      "8. Thou shalt not have better Ice-type Pokemon than me.",
      "Me as in Angie.",
      "10. People shall remain a 6 foot distance from each",
      "other at all times.",
      "12. Thou shalt not pour the milk before the cereal.",
      "16. Thou shalt not wake up at 7:01 on the dot.",
      "23. Thou shalt not fish for compliments.",
      "34. Thou shalt not be mean to Lady Angie.",
      "40. Thou shalt not look at the moon with a grimace.",
      "43. Thou shalt not boogie like a maniac a quarter past midnight.",
      "49. Thou shalt not be hungry after a workout.",
      "55. Thou shalt not use emojis in text messages.",

    ],
    # 2
    [
      "Zygarde Cells found: #{$game_variables[:Z_Cells]}",
      "Zygarde Cores found: #{$game_variables[:Z_Cores]}",
      "Red Essence collected: #{$game_variables[:RedEssence]}",
      "Spiritomb Wisps collected: #{$game_variables[:SpiritombWisps]}",
    ],
  ]
  cmdwin=pbListWindow(clues[number],Graphics.width)
  cmdwin.rowHeight = 20
  cmdwin.refresh
  Graphics.update
  loop do
    Graphics.update
    Input.update
    cmdwin.update
    break if Input.trigger?(Input::C) || Input.trigger?(Input::B)
  end
  cmdwin.dispose
  $unrealClock.visible = unrealbackup
end
# pbVictoryRoadPuzzle(0)

Events.onStepTaken+=proc{
  if $game_variables[:LabStepLimit] > 0
    $game_variables[:LabStepLimit]-=1
  end
}

Events.onWildPokemonCreate+=proc {|sender,e|
  pokemon=e[0]
  check = rand(100)
  check = rand(20) if $game_variables[:LuckShinies] < 0
  if check==0
    pokemon.item = :BLKPRISM
    if !($cache.pkmn[pokemon.species].EggGroups.include?(:Undiscovered) || pokemon.species == :MANAPHY) #undiscovered group or manaphy
      stat1, stat2, stat3 = [0,1,2,3,4,5].sample(3)
      for i in 0..5
        pokemon.iv[i]=31 if [stat1,stat2,stat3].include?(i)
      end
    end
  end
}

Events.onWildPokemonCreate+=proc {|sender,e|
  pokemon=e[0]
  # Egg moves for wild events
  case $game_variables[:WildMods]
  when 1 # A-Exegg
    pokemon.form=1
    pokemon.pbLearnMove(:DRAGONHAMMER)
    pokemon.initAbility
  when 3 # Darmanitan
    pokemon.pbLearnMove(:EXTRASENSORY)
    pokemon.setAbility(:ZENMODE)
  when 4 #Mandibuzz
    pokemon.pbLearnMove(:SWIFT)
  when 9 #Voltorb
    pokemon.pbLearnMove(:SIGNALBEAM)
  when 11 #Electrike
    pokemon.pbLearnMove(:FLAMEBURST)  
  when 12 #Pichu
    pokemon.pbLearnMove(:PRESENT) 
  when 13 #Litleo
    pokemon.pbLearnMove(:FIRESPIN) 
  when 16 #Munna
    pokemon.pbLearnMove(:SWIFT)
  when 17 #Seviper
    pokemon.pbLearnMove(:BODYSLAM)
  when 18 # Just extrasensory, Whismur
    pokemon.pbLearnMove(:EXTRASENSORY)
  when 19 # Spoink
    pokemon.pbLearnMove(:FUTURESIGHT)
  when 20 # Solrock
    pokemon.pbLearnMove(:STOMPINGTANTRUM)
  when 22 # Growlithe, Pinsir
    pokemon.pbLearnMove(:CLOSECOMBAT)
  when 26 # Tropius
    pokemon.pbLearnMove(:DRAGONDANCE)
  when 27 # Yanma
    pokemon.pbLearnMove(:SILVERWIND)
  when 28 # Krabby
    pokemon.pbLearnMove(:KNOCKOFF)
  when 29 # Kingler
    pokemon.pbLearnMove(:KNOCKOFF)
    pokemon.pbLearnMove(:LIQUIDATION)
  when 31 # Squirtle
    pokemon.pbLearnMove(:MIRRORCOAT)
  when 32 # Gastrodon
    pokemon.pbLearnMove(:EARTHPOWER)
  when 33 # Ralts
    pokemon.pbLearnMove(:SHADOWSNEAK)
  when 36 # Piplup
    pokemon.pbLearnMove(:ICYWIND)
  when 37 # Empoleon
    pokemon.pbLearnMove(:LIQUIDATION)
    pokemon.pbLearnMove(:STEALTHROCK)
  when 38 # Piplup
    pokemon.pbLearnMove(:ICYWIND)
  when 39 # Octillery
    pokemon.pbLearnMove(:GUNKSHOT)
  when 41 # Sneasel
    pokemon.pbLearnMove(:ICICLECRASH)
  when 42 # Mareep
    pokemon.pbLearnMove(:MAGNETRISE)
  when 43 # Inkay
  when 44 # H. Growlithe
    pokemon.pbLearnMove(:HEADSMASH)
  when 48 # Stantler
    pokemon.pbLearnMove(:MEGAHORN)
  when 49 # Sawsbuck
    pokemon.pbLearnMove(:HEADBUTT)
  when 50 # Dodrio
    pokemon.pbLearnMove(:BRAVEBIRD)
  when 54 # Beedrill
    pokemon.pbLearnMove(:DRILLRUN)
  when 56 # Stufful
    pokemon.pbLearnMove(:ICEPUNCH)
  when 57 # Chatot
    pokemon.pbLearnMove(:BOOMBURST)
  when 61 # Komala
    pokemon.pbLearnMove(:PLAYROUGH)
  when 62 # Sandygast
    pokemon.pbLearnMove(:GRAVITY)
  when 64 # Buizel
    pokemon.pbLearnMove(:TAILSLAP)
  when 66 # Jynx
    pokemon.pbLearnMove(:PSYCHIC)
  when 68 # Blitzle
    pokemon.pbLearnMove(:DOUBLEKICK)
  when 71 # 
    pokemon.pbLearnMove(:SPIKES)
  when 72 # 
    pokemon.pbLearnMove(:NIGHTSLASH)
  when 74 # Ambipom
    pokemon.pbLearnMove(:GROWL)
    pokemon.pbLearnMove(:TAILSLAP)
  when 75 # Lunatone
    pokemon.pbLearnMove(:STEALTHROCK)
  when 76 # 
    pokemon.pbLearnMove(:MAGNETRISE)  
  when 77 # Swablu
    pokemon.pbLearnMove(:HEALBELL) 
  when 78 # 
    pokemon.pbLearnMove(:REFRESH)
  when 79 # 
    pokemon.pbLearnMove(:TRICK)
  when 80 # Gastly
    pokemon.pbLearnMove(:REFLECTTYPE)
    pokemon.pbLearnMove(:FRUSTRATION) 
    pokemon.makeFemale
    pokemon.happiness=0
  when 82 # Corsola
    pokemon.pbLearnMove(:THROATCHOP)
  when 83 # Pyukumuku
    pokemon.pbLearnMove(:BLOCK)
  when 85 # Pinsir
    pokemon.pbLearnMove(:QUICKATTACK)
  when 89 # Larvesta
    pokemon.pbLearnMove(:GIGADRAIN)
  when 90 # Vulpix
    pokemon.pbLearnMove(:HEATWAVE)
    pokemon.pbLearnMove(:TAILSLAP)
  when 92 # Horsea
    pokemon.pbLearnMove(:DRAGONPULSE)
    pokemon.pbLearnMove(:SNIPESHOT)
  when 93 # Pelipper
    pokemon.pbLearnMove(:SHOCKWAVE)
    pokemon.pbLearnMove(:SEEDBOMB)
  when 95 # Mech  
    pokemon.pbLearnMove(:JAWLOCK)  
    pokemon.pbLearnMove(:THUNDERFANG)  
    pokemon.pbLearnMove(:HIGHHORSEPOWER)  
    pokemon.pbLearnMove(:HEAVYSLAM)  
    pokemon.name="LAIR-????" 
    pokemon.setNature(:ADAMANT)
    pokemon.form=1
    pokemon.setGender(2)
    pokemon.initAbility
    for i in 0...5
     pokemon.iv[i]=31
    end
    case $game_variables[:DifficultyModes]
    when 0
    pokemon.ev[1]=252
    pokemon.ev[3]=252
    pokemon.ev[4]=4
    when 1
    for i in 0...5
      pokemon.ev[i]=[85,pokemon.level*3/2].min
    end
    end
    pokemon.calcStats  
  when 96 # Lapras
    pokemon.pbLearnMove(:ROCKSLIDE)
    pokemon.pbLearnMove(:PSYCHIC)
    pokemon.pbLearnMove(:CONFUSERAY)
    pokemon.pbLearnMove(:SING)
  when 98 # Mech
    pokemon.pbLearnMove(:LIGHTSCREEN)
    pokemon.pbLearnMove(:REFLECT)
    pokemon.name="CLAY-????"
    pokemon.setNature(:MODEST)
    pokemon.form=1
    pokemon.initAbility
    pokemon.item = :CLAYCREST
    case $game_variables[:DifficultyModes]
    when 0
    pokemon.ev[0]=252
    pokemon.ev[2]=252
    pokemon.ev[4]=4
    pokemon.pbLearnMove(:FLASHCANNON)
    pokemon.pbLearnMove(:HYPERBEAM)
    when 1
    for i in 0...5
      pokemon.ev[i]=[85,pokemon.level*3/2].min
    end
    pokemon.pbLearnMove(:FLASHCANNON)
    pokemon.pbLearnMove(:HYPERBEAM)
    when 2
      for i in 0...5
          pokemon.ev[i]=252
      end  
      rnd=rand(3)
      if rnd<1
        pokemon.pbLearnMove(:EARTHPOWER)
        pokemon.pbLearnMove(:HYPERBEAM)
      elsif rnd<2
        pokemon.pbLearnMove(:ICEBEAM)
        pokemon.pbLearnMove(:PSYBEAM)
      else
        pokemon.pbLearnMove(:SOLARBEAM)
        pokemon.pbLearnMove(:HYPERBEAM)
      end
    end
    pokemon.calcStats    
  when 99 # Treecko
    pokemon.pbLearnMove(:LEECHSEED)
  when 100 # Regice
    pokemon.pbLearnMove(:COLDTRUTH)
    pokemon.pbLearnMove(:REFLECT)
    pokemon.pbLearnMove(:THUNDERBOLT)
    pokemon.pbLearnMove(:SHEERCOLD)
    pokemon.name="REGICE"
    pokemon.setNature(:MODEST)
    pokemon.form=1
    case $game_variables[:DifficultyModes]
    when 0
    pokemon.ev[0]=252
    pokemon.ev[2]=252
    pokemon.ev[4]=4
    when 1
    for i in 0...5
      pokemon.ev[i]=[85,pokemon.level*3/2].min
    end 
    end
    pokemon.calcStats
  when 102 # Hoothoot
    pokemon.pbLearnMove(:SLEEPTALK)
    pokemon.pbLearnMove(:NIGHTSHADE)
    pokemon.status=:SLEEP
    pokemon.statusCount=3
    pokemon.setAbility(:TINTEDLENS)
  when 103 # Cubone
    pokemon.pbLearnMove(:ANCIENTPOWER)
    pokemon.pbLearnMove(:PERISHSONG)
  when 104 # Duskull
    pokemon.pbLearnMove(:MEMENTO)
    pokemon.pbLearnMove(:CHARGEBEAM)
  when 105
  when 106
  when 107
  when 108 # MANKEY
    pokemon.pbLearnMove(:VACUUMWAVE)
  when 109 # Corphish
    pokemon.pbLearnMove(:DRAGONDANCE)
  when 110 # Clauncher
    pokemon.pbLearnMove(:SLUDGEBOMB)
  when 111 # Salazzle
    pokemon.pbLearnMove(:BELCH)
    pokemon.item = :TAMATOBERRY
  when 112 # Salazzle
    pokemon.pbLearnMove(:HAMMERARM)
  when 113 # Ariados
    pokemon.pbLearnMove(:GIGADRAIN)
    pokemon.status=:SLEEP
  when 114 # Woobat
    pokemon.pbLearnMove(:ROOST)
    pokemon.pbLearnMove(:HELPINGHAND)
  when 115 # Deerling/Sawsbuck Fall
    pokemon.form=1
    pokemon.pbLearnMove(:SEEDBOMB)
    pokemon.pbLearnMove(:GIGADRAIN)
    pokemon.pbLearnMove(:GRASSWHISTLE)
  when 116 # Deerling/Sawsbuck Winter
    pokemon.form=3
    pokemon.pbLearnMove(:SEEDBOMB)
    pokemon.pbLearnMove(:GIGADRAIN)
    pokemon.pbLearnMove(:GRASSWHISTLE)
  when 117 # Paras
    pokemon.pbLearnMove(:FELLSTINGER)
    pokemon.pbLearnMove(:CROSSPOISON)
    pokemon.pbLearnMove(:GRASSYTERRAIN)
  when 118 # Starly
    pokemon.pbLearnMove(:FEATHERDANCE)
    pokemon.pbLearnMove(:REVENGE)
  when 119 # Ruthless
    pokemon.item = :BLKPRISM
    if !$game_switches[:Empty_IVs_Password]
      if !($cache.pkmn[pokemon.species].EggGroups.include?(:Undiscovered) || pokemon.species == :MANAPHY) #undiscovered group or manaphy
        stat1, stat2, stat3 = [0,1,2,3,4,5].sample(3)
        for i in 0..5
          pokemon.iv[i]=31 if [stat1,stat2,stat3].include?(i)
        end
      end
    end
  when 120 #RustedMech
    pokemon.pbLearnMove(:GIGAIMPACT)
    pokemon.pbLearnMove(:BITE)
    pokemon.pbLearnMove(:CHARGE)
    pokemon.pbLearnMove(:FOCUSENERGY)
    pokemon.name="???"
    pokemon.setNature(:NAIVE)
    pokemon.setGender(2)
    pokemon.form=2
    pokemon.initAbility
  when 121 # Aevian Bronzor
  when 122 # Gen 2 Shellder
    pokemon.pbLearnMove(:CURSE)
    pokemon.pbLearnMove(:SELFDESTRUCT)
    pokemon.pbLearnMove(:TRIATTACK)
  when 123 # Gen 2 Zubat
    pokemon.pbLearnMove(:DOUBLEEDGE)
    pokemon.pbLearnMove(:PLUCK)
  when 124 # h-sneasel
    pokemon.pbLearnMove(:GROWL)
    pokemon.pbLearnMove(:LASHOUT)
  when 125 # Gen 2 Poliwag
    pokemon.pbLearnMove(:DIVE)
  when 126 # Gen 2 Cyndaquil
    pokemon.pbLearnMove(:MUDSLAP)
  when 127 # Gen 2 Onix
    pokemon.pbLearnMove(:ANCIENTPOWER)
    pokemon.pbLearnMove(:TWISTER)
  when 128 # Delpha
    # setting form with the variable doesn't generate as that form
    # so we have to reinit ability and manually apply levelup movepool
    pokemon.form=1
    pokemon.initAbility
    pokemon.name="Delpha"
    pokemon.setNature(:MODEST)
    pokemon.makeFemale
    pokemon.pbLearnMove(:SUNNYDAY)
    pokemon.pbLearnMove(:MAGICROOM)
    pokemon.pbLearnMove(:FIREBLAST)
    pokemon.pbLearnMove(:FUTURESIGHT)
  when 129 # Territorial Luvdisc
    stat1, stat2, stat3 = [0,1,2,3,4,5].sample(3)
    for i in 0..5
      pokemon.iv[i]=31 if [stat1,stat2,stat3].include?(i)
    end
    pokemon.item = :LUVCREST
    pokemon.happiness=255
    pokemon.pbLearnMove(:CHARM)
    pokemon.pbLearnMove(:ATTRACT)
    pokemon.pbLearnMove(:DRAININGKISS)
    pokemon.pbLearnMove(:AQUAJET)
  when 131 # Prism Exploud
    pokemon.item = :BLKPRISM
    for i in 0..5
      pokemon.iv[i]=31
    end
    pokemon.pbLearnMove(:UPROAR)
    pokemon.pbLearnMove(:OUTRAGE)
    pokemon.pbLearnMove(:STOMPINGTANTRUM)
    pokemon.pbLearnMove(:SCREECH)
  when 132 # Grookey
    pokemon.pbLearnMove(:GROWL)
    pokemon.pbLearnMove(:LEECHSEED)
  when 133 # Chimchar
    pokemon.pbLearnMove(:GROWL)
  when 134 # Larvitar
    pokemon.pbLearnMove(:ANCIENTPOWER)
    pokemon.pbLearnMove(:OUTRAGE)
  when 136 # Wooloo
    pokemon.pbLearnMove(:PAYBACK)
    pokemon.pbLearnMove(:COUNTER)
  when 137 # A-Sewaddle
    pokemon.pbLearnMove(:TACKLE)
  when 138 # Azelf
    pokemon.pbLearnMove(:NASTYPLOT)
    pokemon.pbLearnMove(:EXTRASENSORY)
    pokemon.pbLearnMove(:LASTRESORT)
    pokemon.pbLearnMove(:SWIFT)
  when 139 # Mesprit
    pokemon.pbLearnMove(:CHARM)
    pokemon.pbLearnMove(:EXTRASENSORY)
    pokemon.pbLearnMove(:COPYCAT)
    pokemon.pbLearnMove(:SWIFT)
  when 140 # Uxie
    pokemon.pbLearnMove(:AMNESIA)
    pokemon.pbLearnMove(:EXTRASENSORY)
    pokemon.pbLearnMove(:FLAIL)
    pokemon.pbLearnMove(:SWIFT)
end
}

#Regional Variants + Other things with multiple movesets (Wormadam, Meowstic, etc)
Events.onWildPokemonCreate+=proc {|sender,e|
  pokemon=e[0]
  exceptionlist = [95, 98, 100, 120, 128, 129]
	if $game_variables[:LuckMoves] != 0 && !exceptionlist.include?($game_variables[:WildMods])
    v = pokemon.formCheck(:compatiblemoves)
    if v!=nil
      bonuslist = v
    else      
      bonuslist = $cache.pkmn[pokemon.species].compatiblemoves
    end
    exceptionlist = pokemon.formCheck(:moveexceptions)
    exceptionlist = $cache.pkmn[pokemon.species].moveexceptions if exceptionlist.nil?
    bonuslist = bonuslist + (PBStuff::UNIVERSALTMS - exceptionlist)
    bonuslist += pokemon.getEggMoveList
    bonuslist.uniq!
    extramove = bonuslist.sample if !bonuslist.empty?
    extramove = nil if [:FISSURE,:ROCKCLIMB,:MAGMADRIFT].include?(extramove)
    newmovelist = []
    pokemon.moves = pokemon.moves.reverse
    for moves in pokemon.moves     
      newmovelist.push(moves.move)
    end
    if extramove && !newmovelist.include?(extramove)
      newmovelist[-1] = extramove
    end
    newmovelist.uniq!
    newmovelist= [:SELFDESTRUCT] if $game_variables[:LuckMoves] < 0
    pokemon.moves = []
    for i in 0...newmovelist.length
      break if i > 3
      moveid = newmovelist[i]
      pokemon.moves[i] = moveid.nil? ? nil : PBMove.new(moveid) 
    end 
  end
}



def pbRentReturn
  $Trainer.party = $game_variables[543]
end

class PokeBattle_Pokemon
  attr_accessor :forcePrismOutline
  attr_accessor :prismPower
  attr_accessor :rampCrestUsed
  def rampCrestUsed
    @rampCrestUsed = false if !@rampCrestUsed
    @rampCrestUsed
  end
    
  def canRelearnAll?
    if !@relearner
      @relearner=[false,0]
    end
    return @relearner[0]
  end

  def updateRelearnBar
    if !@relearner
      @relearner=[false,0]
    end
    @relearner[1]+=1 if relearner[1]<3
    activateRelearner() if @relearner[1]>=3
  end
end


class MoveRelearnerScreen
  def pbStartScreen(pokemon)
    moves=pbGetRelearnableMoves(pokemon)
    @scene.pbStartScene(pokemon,moves)
    loop do
      move=@scene.pbChooseMove
      if !move.is_a?(Symbol)
        if @scene.pbConfirm(
          _INTL("Give up trying to teach a new move to {1}?",pokemon.name))
          @scene.pbEndScene
          return false
        end
      else
        if @scene.pbConfirm(_INTL("Teach {1}?",getMoveName(move)))
          if pbLearnMove(pokemon,move)
            pokemon.updateRelearnBar if !pokemon.canRelearnAll?
            @scene.pbEndScene
            return true
          end
        end
      end
    end
  end
end 

def pbMoveTutorChoose(move,movelist=nil,bymachine=false,bytutor=false)
  ret=false
  pbFadeOutIn(99999){
     scene=PokemonScreen_Scene.new
     movename=getMoveName(move)
     screen=PokemonScreen.new(scene,$Trainer.party)
     annot=pbMoveTutorAnnotations(move,movelist)
     screen.pbStartScene(_INTL("Teach which Pokémon?"),false,annot)
     if !($Trainer.tutorlist)
      $Trainer.tutorlist=[]
     end
     loop do
       chosen=screen.pbChoosePokemon
       if chosen>=0
         pokemon=$Trainer.party[chosen]
         if pokemon.isEgg?
           Kernel.pbMessage(_INTL("{1} can't be taught to an Egg.",movename))
         elsif (pokemon.isShadow? rescue false)
           Kernel.pbMessage(_INTL("Shadow Pokémon can't be taught any moves."))
         elsif movelist && !movelist.any?{|j| j==pokemon.species }
           Kernel.pbMessage(_INTL("{1} is not compatible with {2}.",pokemon.name,movename))
           Kernel.pbMessage(_INTL("{1} can't be learned.",movename))
         elsif $Trainer.tutorlist.length>0 && ($Trainer.tutorlist.include?(move)) && bytutor==false
            Kernel.pbMessage(_INTL("You've already bought {1}. Check out the app on the Cybernav!",movename))
         elsif !pokemon.SpeciesCompatible?(move)
           Kernel.pbMessage(_INTL("{1} is not compatible with {2}.",pokemon.name,movename))
           Kernel.pbMessage(_INTL("{1} can't be learned.",movename))
         else
           if pbLearnMove(pokemon,move,false,bymachine)
             pbMoveTutorListAdd(move) if bymachine==false
             ret=true
             break
           end
         end
       else
         break
       end  
     end
     screen.pbEndScene
  }
  return ret # Returns whether the move was learned by a Pokemon
end

class MiningGameScene
  BOARDWIDTH  = 13
  BOARDHEIGHT = 10
  ITEMS = [ # Item, probability, graphic x, graphic y, width, height, pattern
     [:RAREBONE,5, 3,20, 3,6,[1,1,1,0,1,0,0,1,0,0,1,0,0,1,0,1,1,1]],
     [:RAREBONE,2, 16,32, 4,3,[1,1,1,1,1,1,1,1,1,1,1,1]]
  ] 
  IRON = [   # Graphic x, graphic y, width, height, pattern
     [0,0, 1,4,[1,1,1,1]],
     [1,0, 2,4,[1,1,1,1,1,1,1,1]],
     [3,0, 4,2,[1,1,1,1,1,1,1,1]],
     [3,2, 4,1,[1,1,1,1]],
     [7,0, 3,3,[1,1,1,1,1,1,1,1,1]],
     [0,5, 3,2,[1,1,0,0,1,1]],
     [0,7, 3,2,[0,1,0,1,1,1]],
     [3,5, 3,2,[0,1,1,1,1,0]],
     [3,7, 3,2,[1,1,1,0,1,0]],
     [6,3, 2,3,[1,0,1,1,0,1]],
     [8,3, 2,3,[0,1,1,1,1,0]],
     [6,6, 2,3,[1,0,1,1,1,0]],
     [8,6, 2,3,[0,1,1,1,0,1]]
  ]
end

###DemICE>>  IV / EV changeing doctor functions
def setIVs(pkmn,cmd2)    
  params=ChooseNumberParams.new
  params.setRange(0,31)
  params.setDefaultValue(pkmn.iv[cmd2])
  params.setCancelValue(pkmn.iv[cmd2])
  f=Kernel.pbMessageChooseNumber(_INTL("What would you like the volume of the injection to be?"),params)
  pkmn.iv[cmd2]=f
  pkmn.calcStats        
end    

def setEVs(pkmn,cmd2)
  totalev=0
  for i in 0...6
    totalev+=pkmn.ev[i]
  end
    if totalev+252>510
        for i in 0...6
            pkmn.ev[i]=0 if pkmn.ev[i]!=252
        end        
    end
    totalev=0
  for i in 0...6
    totalev+=pkmn.ev[i]
  end    
  stats=[_INTL("HP"),_INTL("Attack"),_INTL("Defense"),
      _INTL("Speed"),_INTL("Sp. Attack"),_INTL("Sp. Defense")]        
  found=[]
  foundnum=[]
  if totalev+252>510
      for i in 0...6
          if pkmn.ev[i]==252
              found.push(stats[i])
              foundnum.push(i)
          end    
      end
      Kernel.pbMessage(_INTL("Hm, it seems that your {1} already has two maximized stats. Which one would you like to replace?",getMonName(pkmn.species)))
      cmd=0
      cmd=Kernel.pbShowCommands(nil,found,cmd)
      pkmn.ev[foundnum[cmd]]=0                
  end        
  pkmn.ev[cmd2]=252    
  pkmn.calcStats        
end    

def pbPartyHasDualTypes(type1,type2)
  typevar=false
  for mon in $Trainer.party
    next if mon.nil? || mon.isEgg?
    typevar=true if mon.hp > 0 && mon.hasType?(type1) && mon.hasType?(type2)
  end
  return typevar
end


###>>DemICE

class PokemonScreen
  def pbPokemonScreen
    @scene.pbStartScene(@party,
       @party.length>1 ? _INTL("Choose a Pokémon.") : _INTL("Choose Pokémon or cancel."),nil)
    loop do
      @scene.pbSetHelpText(
         @party.length>1 ? _INTL("Choose a Pokémon.") : _INTL("Choose Pokémon or cancel."))
      pkmnid=@scene.pbChoosePokemon(false,true)
      if pkmnid.is_a?(Array) && pkmnid[0]==1# Switch
        next if pkmnid[1]==6 
        @scene.pbSetHelpText(_INTL("Move to where?"))
        oldpkmnid = pkmnid[1]
        pkmnid = @scene.pbChoosePokemon(true,true,1)
        if pkmnid>=0 && pkmnid!=oldpkmnid && pkmnid<6
          pbSwitch(oldpkmnid,pkmnid)
        end
        next
      end
      if (pkmnid.is_a?(Array))
        break if pkmnid.length<0
      else
        break if pkmnid<0
      end
      pkmn=@party[pkmnid]
      commands=[]
      cmdSummary=-1
      cmdRelearn=-1
      cmdLearnset=-1
      cmdSwitch=-1
      cmdItem=-1
      cmdDebug=-1
      cmdMail=-1
      cmdRename=-1
      # Build the commands
      commands[cmdSummary=commands.length]=_INTL("Summary")
      if !pkmn.relearner.is_a?(Array)
        pkmn.relearner = [pkmn.relearner,0]
      end
      commands[cmdRelearn=commands.length]=_INTL("Relearn") if pbHasRelearnableMove?(pkmn)
      commands[cmdLearnset=commands.length]=_INTL("Learnset") if !pkmn.isEgg?
      if $DEBUG
        # Commands for debug mode only
        commands[cmdDebug=commands.length]=_INTL("Debug")
      end
      if $game_switches[:EasyHMs_Password]
        acmdTMX=-1
        commands[acmdTMX=commands.length]=_INTL("Use TMX")
      end
      cmdMoves=[-1,-1,-1,-1]
      for i in 0...pkmn.moves.length
        move=pkmn.moves[i]
        # Check for hidden moves and add any that were found
        if !pkmn.isEgg? && (
           (move.move == :MILKDRINK) ||
           (move.move == :SOFTBOILED) ||
           HiddenMoveHandlers.hasHandler(move.move)
           )
          commands[cmdMoves[i]=commands.length]=getMoveName(move.move)
        end
      end
      commands[cmdSwitch=commands.length]=_INTL("Switch") if @party.length>1
      if !pkmn.isEgg?
        if pkmn.mail
          commands[cmdMail=commands.length]=_INTL("Mail")
        else
          commands[cmdItem=commands.length]=_INTL("Item")
        end
        commands[cmdRename = commands.length] = _INTL("Rename")
      end
      commands[commands.length]=_INTL("Cancel")
      command=@scene.pbShowCommands(_INTL("Do what with {1}?",pkmn.name),commands)
      havecommand=false
      for i in 0...4
        if cmdMoves[i]>=0 && command==cmdMoves[i]
          havecommand=true
          if pkmn.moves[i].move == :SOFTBOILED || pkmn.moves[i].move == :MILKDRINK
            if pkmn.hp<=(pkmn.totalhp/5.0).floor
              pbDisplay(_INTL("Not enough HP..."))
              break
            end
            @scene.pbSetHelpText(_INTL("Use on which Pokémon?"))
            oldpkmnid=pkmnid
            loop do
              @scene.pbPreSelect(oldpkmnid)
              pkmnid=@scene.pbChoosePokemon(true)
              break if pkmnid<0
              newpkmn=@party[pkmnid]
              if newpkmn.isEgg? || newpkmn.hp==0 || newpkmn.hp==newpkmn.totalhp || pkmnid==oldpkmnid
                pbDisplay(_INTL("This item can't be used on that Pokémon."))
              else
                pkmn.hp-=(pkmn.totalhp/5.0).floor
                hpgain=pbItemRestoreHP(newpkmn,(pkmn.totalhp/5.0).floor)
                @scene.pbDisplay(_INTL("{1}'s HP was restored by {2} points.",newpkmn.name,hpgain))
                pbRefresh
              end
            end
            break
          elsif Kernel.pbCanUseHiddenMove?(pkmn,pkmn.moves[i].move)
            @scene.pbEndScene
            if pkmn.moves[i].move == :FLY
              if $cache.mapdata[$game_map.map_id].MapPosition.is_a?(Hash)
                region = pbUnpackMapHash[0]
              else
                region=$cache.mapdata[$game_map.map_id].MapPosition[0]
              end              
              scene=PokemonRegionMapScene.new(region,false)
              screen=PokemonRegionMap.new(scene)
              ret=screen.pbStartFlyScreen
              if ret
                $PokemonTemp.flydata=ret
                $game_system.bgs_stop
                $game_screen.weather(0,0,0)
                return [pkmn,pkmn.moves[i].move]
              end
              @scene.pbStartScene(@party,
                 @party.length>1 ? _INTL("Choose a Pokémon.") : _INTL("Choose Pokémon or cancel."))
              break
            end
            return [pkmn,pkmn.moves[i].move]
          else
            break
          end
        end
      end
      if $game_switches[:EasyHMs_Password] && !pkmn.isEgg?
        if acmdTMX>=0 && command==acmdTMX
          aRetArr = passwordUseTMX(pkmn)
          if aRetArr.length > 0
            havecommand=true
            return aRetArr
          end
        end
      end
      next if havecommand
      if cmdSummary>=0 && command==cmdSummary
        @scene.pbSummary(pkmnid)
      elsif cmdRelearn>=0 && command==cmdRelearn
        pbRelearnMoveScreen(pkmn)
      elsif cmdLearnset >= 0 && command==cmdLearnset
      showMovesetForMon(pkmn)
      elsif cmdSwitch>=0 && command==cmdSwitch
        @scene.pbSetHelpText(_INTL("Move to where?"))
        oldpkmnid=pkmnid
        pkmnid=@scene.pbChoosePokemon(true)
        if pkmnid>=0 && pkmnid!=oldpkmnid
          pbSwitch(oldpkmnid,pkmnid)
        end
      elsif cmdDebug>=0 && command==cmdDebug
        pbPokemonDebug(self, pkmn,pkmnid)
      elsif cmdMail>=0 && command==cmdMail
        command=@scene.pbShowCommands(_INTL("Do what with the mail?"),[_INTL("Read"),_INTL("Take"),_INTL("Cancel")])
        case command
          when 0 # Read
            pbFadeOutIn(99999){
               pbDisplayMail(pkmn.mail,pkmn)
            }
          when 1 # Take
            pbTakeItem(pkmn)
            pbRefreshSingle(pkmnid)
        end
      elsif cmdItem>=0 && command==cmdItem
        if $game_variables[650] > 0 
          pbDisplay(_INTL("You are not allowed to change the rental team's items."))
          @scene.pbEndScene
          return nil
        end
        command=@scene.pbShowCommands(_INTL("Do what with an item?"),[_INTL("Use"),_INTL("Give"),_INTL("Take"),_INTL("Cancel")])
        case command
          when 0 # Use
          item=@scene.pbChooseItem($PokemonBag,from_bag: true)
          if !item.nil?
            pbUseItemOnPokemon(item,pkmn,self)
            pbRefreshSingle(pkmnid)
          end            
          when 1 # Give
            item=@scene.pbChooseItem($PokemonBag,from_bag: true)
            if !item.nil?
              if pbIsZCrystal?(item)
                pbUseItemOnPokemon(item,pkmn,self)
              else
                pbGiveItem(item,pkmn,pkmnid)
              end
              pbRefreshSingle(pkmnid)
            end
          when 2 # Take
            pbTakeItem(pkmn)
            pbRefreshSingle(pkmnid)
        end
      elsif cmdRename>=0 && command==cmdRename
        species=getMonName(pkmn.species)
        $game_variables[5]=Kernel.pbMessageFreeText("#{species}'s nickname?",_INTL(""),false,12)
        if pbGet(5)==""
          pkmn.name=getMonName(pkmn.species)
          pbSet(5,pkmn.name)
        end
        pkmn.name=pbGet(5)
        pbDisplay(_INTL("{1} was renamed to {2}.",species,pkmn.name))
      end
    end
    @scene.pbEndScene
    return nil
  end  
end

def showMovesetForMon(pkmn)   #Extreme this if to show level up learnsets
  cmdwin=pbListWindow([],200)
  helpwin=Window_UnformattedTextPokemon.new("")

  levelup = []
  tms = []
  tutors = []
  egg = []

  tmmoves = []

  pbEachNaturalMove(pkmn){|move,level|
    lvname = level == 0 ? _INTL("Evo") : level
    levelup.push(_INTL("{1} - {2}", lvname, getMoveName(move)))
  }

  $cache.items.keys.each { |item|
    if pbIsTM?(item)
      move = pbGetTM(item)
      tmmoves.push(move)
      if pkmn.SpeciesCompatible?(move)
        tms.push(_INTL("{1} {2}", getItemName(item), getMoveName(move)))
      end
    end
  }

  tmmovelist = pkmn.formCheck(:compatiblemoves)
  tmmovelist = $cache.pkmn[pkmn.species].compatiblemoves if tmmovelist.nil?

  tmmovelist.each { |move|
    if !tmmoves.include?(move)
      tutors.push(getMoveName(move))
    end
  }

  pkmn.getEggMoveList.each { |move|
    egg.push(getMoveName(move))
  }

  commands = [levelup, tms, tutors, egg]
  descs = [_INTL("Level Up"), _INTL("TMs"), _INTL("Tutors"), _INTL("Egg Moves")] 
  commands.each(&:uniq!)
  entries = []
  for i in 0...4
    entries.push([commands[i], descs[i]]) unless commands[i].empty?
  end

  pbListMulti(cmdwin,helpwin,entries) 
  cmdwin.dispose
  helpwin.dispose
end

def pbListMulti(cmdwindow,helpwindow,commands)
  cmdwindow.z=99999
  cmdwindow.visible=true
  cmdwindow.commands, helpwindow.text=commands[0]
  cmdwindow.width=256
  cmdwindow.height=Graphics.height if cmdwindow.height>Graphics.height
  cmdwindow.x=0
  cmdwindow.y=0
  cmdwindow.active=true

  helpwindow.z=99999
  helpwindow.visible=true
  helpwindow.resizeToFit(helpwindow.text,Graphics.width)
  helpwindow.x = Graphics.width - helpwindow.width
  helpwindow.y = Graphics.height - helpwindow.height

  commandPositions = commands.map { 0 }
  cmdpos = 0
  loop do
    Graphics.update
    Input.update
    cmdwindow.update
    if Input.trigger?(Input::B) || Input.trigger?(Input::C)
      break
    elsif Input.trigger?(Input::LEFT)
      cmdpos -= 1
      cmdpos += commandPositions.length if cmdpos < 0
      cmdwindow.commands, helpwindow.text = commands[cmdpos]
      cmdwindow.index = commandPositions[cmdpos]
      helpwindow.resizeToFit(helpwindow.text,Graphics.width)
      helpwindow.x = Graphics.width - helpwindow.width
      helpwindow.y = Graphics.height - helpwindow.height
      pbPlayCursorSE
    elsif Input.trigger?(Input::RIGHT)
      cmdpos += 1
      cmdpos = 0 if cmdpos >= commandPositions.length
      cmdwindow.commands, helpwindow.text = commands[cmdpos]
      cmdwindow.index = commandPositions[cmdpos]
      helpwindow.resizeToFit(helpwindow.text,Graphics.width)
      helpwindow.x = Graphics.width - helpwindow.width
      helpwindow.y = Graphics.height - helpwindow.height
      pbPlayCursorSE
    end
  end
  cmdwindow.active=false
end

def incrementBlackPrisms(obtainmentmenthod=nil,qty=1)
  # 0 = receive
  # 1 = caught
  # 2 = itemball
  # 3 = others(illegitimate)
  return if obtainmentmenthod==nil
  if !$Trainer.prismData
    $Trainer.prismData = [0,0,0,0]
  end
  $Trainer.prismData[obtainmentmenthod]+=qty
end

def trackPrismData
  if !$Trainer.prismData
    $Trainer.prismData = [0,0,0,0]
    return false
  end
  totalprisms = $PokemonBag.pbQuantity(:BLKPRISM)
  return false if totalprisms == 0
  sum = 0
  for i in $Trainer.prismData
    next if i == $Trainer.prismData[3]
    sum += i
  end
  if totalprisms > sum
    illegitimate = totalprisms - sum
    $Trainer.prismData[3] = illegitimate
    return true
  end
  return false 
end

def pbCallTitleFull #:nodoc:
  splash = "sp"
  return Scene_Intro.new(['intro1'], splash)
end


def mainFunctionTwo #:nodoc:
  begin
    startup
    $game_system        = Game_System.new
    $game_mute = false
    Graphics.update
    Graphics.freeze
    rebornCheckRemoteVersion() if Reborn && $DEBUG != true
    desolationCheckRemoteVersion() if Desolation && $DEBUG != true
    puts (Time.now - $boottime)
    $scene = pbCallTitleFull
    while $scene != nil
      $scene.main
    end
    Graphics.transition(2)
  rescue Hangup
    pbEmergencySave
    raise
  end
end

class PokeBattle_Trainer
  attr_accessor :prismData
  def prismData
    @prismData = [0,0,0,0] if !@prismData || @prismData.empty?
    @prismData
  end
end


module BallHandlers #catching mons!
  self.singleton_class.send(:alias_method, :__core_OnCatch_Prisms, :onCatch)
  def self.onCatch(ball,battle,pokemon)
    __core_OnCatch_Prisms(ball,battle,pokemon)
    incrementBlackPrisms(1) if pokemon.item == :BLKPRISM
  end
end

Kernel.singleton_class.send(:alias_method, :__core_pbReceiveItem, :pbReceiveItem)
Kernel.singleton_class.send(:alias_method, :__core_itemBall_Prisms, :pbItemBall)
def Kernel.pbItemBall(*args)
  console = false
  console = true if Input.text_input == true 
  ret = __core_itemBall_Prisms(*args)
  return ret if ret == false
  incrementBlackPrisms(2,args[1].nil? ? 1 : args[1]) if args[0]==:BLKPRISM && console == false
  return ret
end

def Kernel.pbReceiveItem(*args)
  console = false
  console = true if Input.text_input == true 
  ret = __core_pbReceiveItem(*args)
  return ret if ret == false
  incrementBlackPrisms(0,args[1].nil? ? 1 : args[1]) if args[0]==:BLKPRISM && console == false
  return ret
end

class PBStuff
  ABILITYBLACKLIST = [:MULTITYPE,:COMATOSE,:DISGUISE,:SCHOOLING, 
    :RKSSYSTEM,:IMPOSTER,:SHIELDSDOWN,:POWEROFALCHEMY,:RECEIVER,:TRACE,:FORECAST,:DNAMATTER,:FLOWERGIFT,
    :ILLUSION,:WONDERGUARD,:ZENMODE,:STANCECHANGE,:POWERCONSTRUCT,:ICEFACE,:ASONE,:NEUTRALIZINGGAS,:GULPMISSILE,:RESUSCITATION,:PRISMPOWER]
  
end

def Kernel.pbStartOver(gameover=false)
  pbHealAll()
  if $PokemonGlobal.pokecenterMapId && $PokemonGlobal.pokecenterMapId>=0
    Kernel.pbMessage(_INTL("<ac>\\w[]\\wm\\c[8]\\l[3]Defeat is not an option. {1}... Bathe yourself in our light.</ac>",$Trainer.name))
    Kernel.pbCancelVehicles
    pbRemoveDependencies()
    $game_switches[:Starting_Over]=true
    $game_temp.player_new_map_id=617
    $game_temp.player_new_x=10
    $game_temp.player_new_y=10
    $game_temp.player_new_direction=1
    $scene.transfer_player if $scene.is_a?(Scene_Map)
    for i in 0...$game_screen.pictures.length
      next if !$game_screen.pictures[i]
      $game_screen.pictures[i].erase
    end
    $game_map.refresh
  else
    homedata=$cache.metadata[:home]
    if (homedata && !pbRxdataExists?(sprintf("Data/Map%03d",homedata[0])) )
      if $DEBUG
        Kernel.pbMessage(_ISPRINTF("<ac>Can't find the map 'Map{1:03d}' in the Data folder.  The game will resume at the player's position.</ac>",homedata[0]))
      end
      pbHealAll()
      return
    end
    Kernel.pbMessage(_INTL("<ac>\\w[]\\wm\\c[8]\\l[3]Defeat is not an option. {1}... Bathe yourself in our light.</ac>",$Trainer.name))
    if homedata
      Kernel.pbCancelVehicles
      pbRemoveDependencies()
      $game_switches[:Starting_Over]=true
      $game_temp.player_new_map_id=617
      $game_temp.player_new_x=10
      $game_temp.player_new_y=10
      $game_temp.player_new_direction=1
      $scene.transfer_player if $scene.is_a?(Scene_Map)
      for i in 0...$game_screen.pictures.length
        next if !$game_screen.pictures[i]
        $game_screen.pictures[i].erase
      end
      $game_map.refresh
    else
      for i in 0...$game_screen.pictures.length
        next if !$game_screen.pictures[i]
        $game_screen.pictures[i].erase
      end
      $game_map.refresh
      pbHealAll()
    end
  end
  pbEraseEscapePoint
end

class Pokedex

  alias __core_gender genderDifferenceArr
  def genderDifferenceArr
    ret = __core_gender
    return ret + [
      :ELGYEM,
      :ZORUA,
      :ZOROARK
    ]
  end
end