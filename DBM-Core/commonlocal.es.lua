if GetLocale() ~= "esES" and GetLocale() ~= "esMX" then return end
if not DBM_COMMON_L then DBM_COMMON_L = {} end

local CL = DBM_COMMON_L

--General
CL.NONE						= "Ninguno"
CL.RANDOM					= "Aleatorio"
CL.UNKNOWN					= "Desconocido"--UNKNOWN which is "Unknown" (does u vs U matter?)
CL.NEXT						= "Siguiente %s"
CL.COOLDOWN					= "%s TdR"
CL.INCOMING					= "%s en breve"
CL.INTERMISSION				= "Intermedio"--No blizz global for this, and will probably be used in most end tier fights with intermission phases
CL.NO_DEBUFF				= "Sin %s"--For use in places like info frame where you put "Not Spellname"
CL.ALLY						= "un aliado"--Such as "Move to Ally"
CL.ALLIES					= "tus aliados"--Such as "Move to Allies"
CL.TANK						= "Tanque"--Such as "Move to Tank"
CL.CLEAR					= "Limpiar"
CL.SAFE						= "Zona segura"
CL.NOTSAFE					= "Zona no segura"
CL.SEASONAL					= "Temporal"--Used for option headers to label options that apply to seasonal mechanics (Such as season of mastery on classic era)
CL.FULLENERGY				= "Energía al máximo"
--Movements/Places
CL.UP						= "Arriba"
CL.DOWN						= "Abajo"
CL.LEFT						= "Izquierda"
CL.RIGHT					= "Derecha"
CL.CENTER					= "Centro"
CL.BOTH						= "Ambos"
CL.BEHIND					= "Detrás"
CL.BACK						= "Atrás"--BACK
CL.SIDE						= "Lado"
CL.TOP						= "Arriba"
CL.BOTTOM					= "Abajo"
CL.MIDDLE					= "Medio"
CL.FRONT					= "Delante"
CL.EAST						= "Este"
CL.WEST						= "Oeste"
CL.NORTH					= "Norte"
CL.SOUTH					= "Sur"
CL.NORTHEAST				= "Noreste"
CL.SOUTHEAST				= "Sureste"
CL.SOUTHWEST				= "Suroeste"
CL.NORTHWEST				= "Noroeste"
CL.SHIELD					= "Escudo"
CL.PILLAR					= "Pilar"
--CL.SHELTER				= "Shelter"
CL.EDGE						= "los bordes de la sala"
CL.FAR_AWAY					= "alejarte"
CL.PIT						= "Fosa"--Pit, as in hole in ground
CL.TOTEM					= "Tótem"
CL.TOTEMS					= "Tótems"
--Mechanics
CL.BOMB						= "Bomba"--Usually auto localized but kept around in case it needs to be used in a place that's not auto localized such as MoveTo or Use alert
CL.BOMBS					= "Bombas"--Usually auto localized but kept around in case it needs to be used in a place that's not auto localized such as MoveTo or Use alert
CL.ORB						= "Orbe"
CL.ORBS						= "Orbes"
CL.RING						= "Anillo"
CL.RINGS					= "Anillos"
CL.CHEST					= "Cofre"--As in Treasure 'Chest'. Not Chest as in body part.
CL.ADD						= "Esbirro"--A fight Add as in "boss spawned extra adds" - must check
CL.ADDS						= "Esbirros"
CL.ADDCOUNT					= "Esbirro %s"
CL.BIG_ADD					= "Esbirro grande"
CL.BOSS						= "Jefe"
CL.ENEMIES					= "Enemigos"
CL.BREAK_LOS				= "romper la línea de mira"
CL.RESTORE_LOS				= "la línea de mira"
CL.BOSSTOGETHER				= "Jefes juntos"
CL.BOSSAPART				= "Jefes separados"
CL.MINDCONTROL				= "Control mental"
CL.TANKCOMBO				= "Combo de tanque"
CL.AOEDAMAGE				= "Daño AOE"
CL.GROUPSOAK				= "Absorpción"
CL.GROUPSOAKS				= "Absorpciones"
CL.DODGES					= "Esquivas"
CL.POOL						= "Charco"
CL.POOLS					= "Charcos"
CL.DEBUFFS					= "Perjuicios"
CL.DISPELS					= "Disipaciones"
CL.PUSHBACK					= "Empujón"
CL.FRONTAL					= "Frontal"
CL.LASER					= "Láser"
CL.LASERS					= "Láseres"
CL.RIFT						= "Falla"--Often has auto localized alternatives, but still translated for BW aura matching when needed
CL.RIFTS					= "Fallas"--Often has auto localized alternatives, but still translated for BW aura matching when needed
CL.TRAPS					= "Trampas"
CL.ROOTS					= "Raíces"
CL.MARK						= "Marca"--As in short text for all the encounter mechanics that start or end in "Mark"
CL.MARKS					= "Marcas"--Plural of above
CL.SWIRLS					= "Remolinos"--Plural of Swirl
