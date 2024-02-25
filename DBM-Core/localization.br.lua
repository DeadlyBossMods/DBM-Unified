-- Last update by GlitterStorm @ Azralon on Feb,28th,2015
if GetLocale() ~= "ptBR" then return end
if not DBM_CORE_L then DBM_CORE_L = {} end

local L = DBM_CORE_L

local dateTable = date("*t")
if dateTable.day and dateTable.month and dateTable.day == 1 and dateTable.month == 4 then
	--L.DEADLY_BOSS_MODS					= "Bigwigs"
	--L.DBM								= "BW"
end

L.HOW_TO_USE_MOD					= "Bem vindo ao "..L.DBM..". Digite /dbm help para obter uma lista dos comandos disponíveis. Para acessar as opções, digite /dbm no seu chat para começar a configuração. Carregue zonas específicas manualmente para configurar opções específicas de cada chefe para o seu gosto pessoal. O "..L.DBM.." tenta fazer isso automaticamente para você, observando sua spec na primeira vez que é executado. De qualquer forma, você pode querer habilitar outras opções."
--L.SILENT_REMINDER						= "Reminder: " .. L.DBM .. " is still in silent mode."
--L.NEWS_UPDATE							= "|h|c11ff1111News|r|h: This update is basically a re-release of 9.1.9 to clear a false malware detection on the hash of the previous file release. Read more about it |Hgarrmission:DBM:news|h|cff3588ff[here]|r|h"

--L.COPY_URL_DIALOG_NEWS					= "To read latest news, visit link below"

L.LOAD_MOD_ERROR					= "Erro ao carregar módulo %s: %s "
L.LOAD_MOD_SUCCESS					= "Módulo '%s' carregado. Para mais opções, digite /dbm ou /dbm help no chat"
L.LOAD_MOD_COMBAT					= "Carregamento de '%s' adiado até que você saia de combate"
L.LOAD_GUI_ERROR					= "Não foi possível carregar interface gráfica: %s"
L.LOAD_GUI_COMBAT					= "A interface gráfica não pode ser carregada em combate e será assim que você o sair. Quando estiver carregada, você poderá chama-la em combate."
L.BAD_LOAD							= L.DBM .. " detectou que a sua mod desta área falhou ao tentar carregar por completo por estar em combate. Use o comando /reloadui assim que sair de combate para corrigir o problema."
L.LOAD_MOD_VER_MISMATCH				= "%s não foi carregado por não cumprir os requerimentos. Uma atualização da mod é necessária. Obrigado."
--L.LOAD_MOD_EXP_MISMATCH					= "%s could not be loaded because it is designed for a WoW expansion that's not currently available. When expansion becomes available, this mod will automatically work."
--L.LOAD_MOD_TOC_MISMATCH					= "%s could not be loaded because it is designed for a WoW patch (%s) that's not currently available. When patch becomes available, this mod will automatically work."
--L.LOAD_MOD_DISABLED						= "%s is installed but currently disabled. This mod will not be loaded unless you enable it."
--L.LOAD_MOD_DISABLED_PLURAL				= "%s are installed but currently disabled. These mods will not be loaded unless you enable them."

--L.COPY_URL_DIALOG						= "Copy URL"
--L.COPY_WA_DIALOG						= "Copy WA Key"

--Post Patch 7.1
--L.TEXT_ONLY_RANGE						= "Range frame is limited to text only due to API restrictions in this area."
--L.NO_RANGE								= "Range frame can not be used due to API restrictions in this area."
--L.NO_ARROW								= "Arrow can not be used in instances"
--L.NO_HUD								= "HUDMap can not be used in instances"

L.DYNAMIC_DIFFICULTY_CLUMP			= L.DBM .. " desabilitou o quadro de alcance dinâmico nesta luta, por falta de informação sobre o numero de jogadores à ficarem amontoados para um grupo desse tamanho."
L.DYNAMIC_ADD_COUNT					= L.DBM .. " desabilitou aviso da contagem de adds nesta luta, por falta de informação da quantidade de adds para um grupo deste tamanho."
L.DYNAMIC_MULTIPLE					= L.DBM .. " desabilitou varias funções desta luta por causa da falta de informação sobre certas mecânicas para um grupo deste tamanho."

L.LOOT_SPEC_REMINDER				= "A sua especialização atual é %s. A sua escolha atual de loot é %s."

L.BIGWIGS_ICON_CONFLICT				= L.DBM .. " detectou que você tem ícones habilitados tanto no BigWigs quanto no "..L.DBM..". Por favor desabilite um dos dois para evitar conflitos com o líder da raid"

L.MOD_AVAILABLE						= "%s esta disponível para este conteúdo. Esta disponível em |Hgarrmission:DBM:forums|h|cff3588ffdeadlybossmods.com|r. Está mensagem só será exibida uma vez."

L.COMBAT_STARTED					= "%s na mira. Boa sorte e divirta-se! :)"
L.COMBAT_STARTED_IN_PROGRESS		= "Entrando em uma luta em progresso contra %s. Boa sorte e divirta-se! :)"
--L.GUILD_COMBAT_STARTED				= "%s engrenou em combate com a Guild"--Uncomment when updated, args have changed
L.SCENARIO_STARTED					= "%s começou. Boa sorte e divirta-se! :)"
L.SCENARIO_STARTED_IN_PROGRESS		= "Juntando-se à %s em progresso. Boa sorte e divirta-se! :)"
L.BOSS_DOWN							= "%s derrotado após %s!"
L.BOSS_DOWN_I						= "%s derrotado! você tem %d vitorias no total."
L.BOSS_DOWN_L						= "%s derrotado após %s! Sua última vitória levou %s, sua vitória mais rápida %s. Você tem um total de %d vitórias."
L.BOSS_DOWN_NR						= "%s derrotado após %s! Esse é um novo recorde! (Recorde antigo era %s). Você tem um total de %d vitórias."
--L.RAID_DOWN								= "%s cleared after %s!"
--L.RAID_DOWN_L							= "%s cleared after %s! Your fastest clear took %s."
--L.RAID_DOWN_NR							= "%s cleared after %s! This is a new record! (Old record was %s)."
--L.GUILD_BOSS_DOWN					= "%s foi derrotado pela guild após %s!"--Uncomment when updated, args have changed
L.SCENARIO_COMPLETE					= "%s completado após %s!"
L.SCENARIO_COMPLETE_I				= "%s completado! Você tem %d vitórias no total."
L.SCENARIO_COMPLETE_L				= "%s completado após %s! A sua ultima vitória demorou %s e a mais rápida %s. Você tem %d vitórias no total."
L.SCENARIO_COMPLETE_NR				= "%s completado após %s! Esse é o seu novo recorde! (Ultimo recorde era %s). Você tem %d vitórias no total."
L.COMBAT_ENDED_AT					= "Combate contra %s (%s) encerrado após %s."
L.COMBAT_ENDED_AT_LONG				= "Combate contra %s (%s) encerrado após %s. Você tem um total de %d derrotas nessa dificuldade."
--L.GUILD_COMBAT_ENDED_AT				= "Guild foi derrotada por %s (%s) após %s."--Uncomment when updated, args have changed
L.SCENARIO_ENDED_AT					= "%s finalizado após %s."
L.SCENARIO_ENDED_AT_LONG			= "%s finalizado após %s. Você tem %d de vitórias parciais nessa dificuldade."
L.COMBAT_STATE_RECOVERED			= "Luta contra %s começou %s atrás, reajustando cronógrafos..."
L.TRANSCRIPTOR_LOG_START			= "Gravação do Transcritor começou."
L.TRANSCRIPTOR_LOG_END				= "Gravação do Transcritor finalizado."

--L.MOVIE_SKIPPED							= L.DBM .. " has attempted to skip a cut scene automatically."
--L.MOVIE_NOTSKIPPED							= L.DBM .. " has detected a skipable cut scene but has NOT skipped it due to a blizzard bug. When this bug is fixed, skipping will be re-enabled"
--L.BONUS_SKIPPED							= L.DBM .. " has automatically closed bonus loot frame. If you need to get this frame back, type /dbmbonusroll within 3 minutes"

--L.AFK_WARNING							= "You are AFK and in combat (%d percent health remaining), firing sound alert. If you are not AFK, clear your AFK flag or disable this option in 'extra features'."
--
--L.COMBAT_STARTED_AI_TIMER				= "My CPU is a neural net processor; a learning computer. (This fight will use the new timer AI feature to generate timer approximations)"

L.PROFILE_NOT_FOUND					= "<"..L.DBM.."> Seu perfil atual esta corrompido. "..L.DBM.." carregara o perfil 'padrão/default'."
L.PROFILE_CREATED					= "'%s' perfil criado."
L.PROFILE_CREATE_ERROR				= "Falha ao criar perfil. nome de perfil invalido."
L.PROFILE_CREATE_ERROR_D			= "Falha ao criar perfil. '%s' perfil já existe."
L.PROFILE_APPLIED					= "'%s' perfil aplicado."
L.PROFILE_APPLY_ERROR				= "Falha ao aplicar perfil. '%s' perfil não existe."
L.PROFILE_COPIED					= "'%s' perfil copiado."
L.PROFILE_COPY_ERROR				= "Falha ao copiar perfil. '%s' perfil não existe."
L.PROFILE_COPY_ERROR_SELF			= "Falha ao copiar perfil, não é possível copiar a si mesmo."
L.PROFILE_DELETED					= "'%s' perfil deletado. Perfil 'padrão/default' será aplicado."
L.PROFILE_DELETE_ERROR				= "Falha ao deletar perfil. '%s' perfil não existe."
L.PROFILE_CANNOT_DELETE				= "Não é possível deletar o perfil 'padrão/Default'."
L.MPROFILE_COPY_SUCCESS				= "%s's (%d spec) preferencias da mod foram copiadas."
L.MPROFILE_COPY_SELF_ERROR			= "Não é possível copiar às preferencias do char para ele mesmo"
L.MPROFILE_COPY_S_ERROR				= "Origem esta corrompida. Preferencias não foram copias ou foram copiadas parcialmente. Falha ao copiar."
L.MPROFILE_COPYS_SUCCESS			= "%s's (%d spec) preferencias de sons da mod foram copiadas."
L.MPROFILE_COPYS_SELF_ERROR			= "Não é possível copiar as preferencias de sons do char para ele mesmo"
L.MPROFILE_COPYS_S_ERROR			= "Origem esta corrompida. Preferencias de sons não foram copiadas ou foram copiadas parcialmente. Falha ao copiar."
L.MPROFILE_DELETE_SUCCESS			= "%s's (%d spec) preferencias da mod deletadas."
L.MPROFILE_DELETE_SELF_ERROR		= "Não é possível deletar preferencias que estão em uso."
L.MPROFILE_DELETE_S_ERROR			= "Origem esta corrompida. Preferencias não foram deletadas ou foram deletadas parcialmente. Falha ao deletar."

--L.NOTE_SHARE_SUCCESS					= "%s has shared their note for %s"
--L.NOTE_SHARE_LINK						= "Click Here to Open Note"
--L.NOTE_SHARE_FAIL						= "%s attempted to share note text with you for %s. However, mod associated with this ability is not installed or is not loaded. If you need this note, make sure you load the mod they are sharing notes for and ask them to share again"
--
--L.NOTEHEADER							= "Enter your note text here for %s. Enclosing a players name with >< class colors it. For alerts with multiple counts, separate notes with '/'"
--L.NOTEFOOTER							= "Press 'Okay' to accept changes or 'Cancel' to decline changes"
--L.NOTESHAREDHEADER						= "%s has shared below note text for %s. If you accept it, it will overwrite your existing note"
--L.NOTESHARED							= "Your note has been sent to the group"
--L.NOTESHAREERRORSOLO					= "Lonely? Shouldn't be passing notes to yourself"
--L.NOTESHAREERRORBLANK					= "Cannot share blank notes"
--L.NOTESHAREERRORGROUPFINDER				= "Notes cannot be shared in BGs, LFR, or LFG"
--L.NOTESHAREERRORALREADYOPEN				= "Cannot open a shared note link while note editor is already open, to prevent you from losing the note you are currently editing"

L.ALLMOD_DEFAULT_LOADED				= "Foram carregadas preferencias padrões para todas as mods desta area."
L.ALLMOD_STATS_RESETED				= "Todas as estatísticas da mod foram apagadas."
L.MOD_DEFAULT_LOADED				= "Foram carregadas opções padrão para esta luta."

L.WORLDBOSS_ENGAGED					= "%s foi possivelmente puxado no seu reino %s por cento de vida. (Enviado por %s)"
L.WORLDBOSS_DEFEATED				= "%s foi possivelmente derrotado no seu reino (Enviado por %s)."
L.WORLDBUFF_STARTED					= "%s buff começou em seu reino para a facção da %s (Enviado por %s)."

L.TIMER_FORMAT_SECS					= "%.2f |4segundo:segundos;"
L.TIMER_FORMAT_MINS					= "%d |4minuto:minutos;"
L.TIMER_FORMAT						= "%d |4minuto:minutos; e %.2f |4segundo:segundos;"

L.MIN								= "min"
L.MIN_FMT							= "%d min"
L.SEC								= "seg"
L.SEC_FMT							= "%s seg"

L.GENERIC_WARNING_OTHERS			= "e mais um"
L.GENERIC_WARNING_OTHERS2			= "e %d outros"
L.GENERIC_WARNING_BERSERK			= "Frenético em %s %s"
L.GENERIC_TIMER_BERSERK				= "Frenético"
L.OPTION_TIMER_BERSERK				= "Exibir cronógrafo para $spell:26662"
--L.BAD									= "Bad"

L.OPTION_CATEGORY_TIMERS			= "Barras"
--Sub cats for "announce" object
L.OPTION_CATEGORY_WARNINGS			= "Categoria de anúncios"
L.OPTION_CATEGORY_WARNINGS_YOU		= "Anúncios pessoais"
L.OPTION_CATEGORY_WARNINGS_OTHER	= "Anúncios de alvo"
L.OPTION_CATEGORY_WARNINGS_ROLE		= "Anúncios de função"
--L.OPTION_CATEGORY_SPECWARNINGS			= "Special Announces"

L.OPTION_CATEGORY_SOUNDS			= "Sons"
--Misc object broken down into sub cats
--L.OPTION_CATEGORY_DROPDOWNS				= "Dropdowns"--Still put in MISC sub grooup, just used for line separators since multiple of these on a fight (or even having on of these at all) is rare.
--L.OPTION_CATEGORY_YELLS					= "Yells"
--L.OPTION_CATEGORY_NAMEPLATES			= "Nameplates"
--L.OPTION_CATEGORY_ICONS					= "Icons"
--L.OPTION_CATEGORY_PAURAS				= "Private Auras"

L.AUTO_RESPONDED					= "Respondido automaticamente"
L.STATUS_WHISPER					= "%s: %s, %d/%d pessoas vivas"
--Bosses
L.AUTO_RESPOND_WHISPER				= "%s está ocupado lutando contra %s (%s, %d/%d pessoas vivas)"
L.WHISPER_COMBAT_END_KILL			= "%s derrotou %s!"
L.WHISPER_COMBAT_END_KILL_STATS		= "%s derrotou %s! Eles tem um total de %d vitórias."
L.WHISPER_COMBAT_END_WIPE_AT		= "%s foi derrotado por %s em %s"
L.WHISPER_COMBAT_END_WIPE_STATS_AT	= "%s foi derrotado por %s em %s. Eles tem um total de %d derrotas nessa dificuldade."
--Scenarios (no percents. words like "fighting" or "wipe" changed to better fit scenarios)
L.AUTO_RESPOND_WHISPER_SCENARIO		= "%s esta ocupado em %s (%d/%d pessoas vivas)"
L.WHISPER_SCENARIO_END_KILL			= "%s foi completado %s!"
L.WHISPER_SCENARIO_END_KILL_STATS	= "%s foi completado %s! Eles tem um total de %d vitórias."
L.WHISPER_SCENARIO_END_WIPE			= "%s não foi completado %s"
L.WHISPER_SCENARIO_END_WIPE_STATS	= "%s não foi completado %s. Eles tem um total de %d vitórias parciais nesta dificuldade."

L.VERSIONCHECK_HEADER				= L.DEADLY_BOSS_MODS.." - Versões"
L.VERSIONCHECK_ENTRY				= "%s: %s (%s)"
L.VERSIONCHECK_ENTRY_TWO			= "%s: %s (%s) & %s (%s)"--Two Boss mods
L.VERSIONCHECK_ENTRY_NO_DBM			= "%s: "..L.DBM.." não instalado"
L.VERSIONCHECK_FOOTER				= "Encontrados %d jogadores com "..L.DBM.." & %d jogadores com Bigwigs"
L.VERSIONCHECK_OUTDATED				= "Os seguintes %d jogadores estão com versões desatualizadas de boss mods: %s"
L.YOUR_VERSION_OUTDATED				= "Sua versão do "..L.DEADLY_BOSS_MODS.." está desatualizada. Por favor, acesse www.deadlybossmods.com para baixar a versão mais recente."
L.VOICE_PACK_OUTDATED				= "O pacote de vozes do seu "..L.DBM.." pode estar sem alguns dos sons suportados por esta versão do "..L.DBM..". Filtro de aviso especial sonoro foi desativado. Por favor baixe a versão mais recente do pacote de vozes ou contate o autor para um pacote que contenha os sons aqui referidos."
L.VOICE_MISSING						= "Você tinha um pacote de vozes "..L.DBM.." selecionado que não pode ser encontrado. Sua seleção foi restaurada para 'Nenhum/None'. Caso seja um erro, certifique-se que o pacote esta instalado corretamente e habilitado em addons."
--L.VOICE_DISABLED						= "You currently have at least one " .. L.DBM .. " voice pack installed but none enabled. If you intend to use a voice pack, make sure it's chosen in 'Spoken Alerts', else uninstall unused voice packs to hide this message"
L.VOICE_COUNT_MISSING				= "Voz de contagem regressiva %d esta selecionada para um pacote de voz que não pode ser encontrado. Foi restaurada a configuração padrão."
--L.BIG_WIGS								= "BigWigs" -- OPTIONAL
--L.WEAKAURA_KEY							= " (|cff308530WA Key:|r %s)"

L.UPDATEREMINDER_HEADER				= "Sua versão do "..L.DEADLY_BOSS_MODS.." está desatualizada.\n A versão %s (%s) está disponível para baixar no site da curse, WoWI ou aqui:"
L.UPDATEREMINDER_FOOTER				= "Pressione Ctrl+C para copiar o link de download para a área de transferência."
L.UPDATEREMINDER_FOOTER_GENERIC		= "Pressione Ctrl+C para copiar o link de download para a área de transferência."
L.UPDATEREMINDER_DISABLE			= "AVISO: O seu "..L.DBM.." foi desativado por estar drasticamente desatualizado (pelo menos %d revisões), atualize para utilizar novamente. Isso garante que versões antigas ou códigos incompatíveis não arruínem à experiência de jogo para você ou para os membros da raid."
--L.UPDATEREMINDER_DISABLETEST			= "WARNING: Due to your " .. L.DEADLY_BOSS_MODS.. " being out of date and this being a test/beta realm, it has been force disabled and cannot be used until updated. This is to ensure out of date mods aren't being used to generate test feedback"
L.UPDATEREMINDER_HOTFIX				= "A sua versão do "..L.DBM.." contem temporizadores ou avisos incorretos para este chefe. Isso foi corrigido em uma versão mais recente ( ou alpha caso não exista versão estável mais recente disponível)"
L.UPDATEREMINDER_HOTFIX_ALPHA		= L.UPDATEREMINDER_HOTFIX--TEMP, FIX ME!
L.UPDATEREMINDER_MAJORPATCH			= "AVISO: O seu "..L.DBM.." foi desativado por estar drasticamente desatualizado (pelo menos %d revisões), atualize para utilizar novamente. Isso garante que versões antigas ou códigos incompatíveis não arruínem à experiência de jogo para você ou para os membros da raid. Certifique-se de baixar a versão mais recente em deadlybossmods.com ou curse o mais breve possível."
L.VEM								= "AVISO: Você esta usando "..L.DBM.." e Voice Encounter Mods. "..L.DBM.." não funcionara corretamente nesta configuração e portanto não será carregada."
L.OUTDATEDPROFILES						= "AVISO: "..L.DBM.."-Profiles não é compatível com esta versão de "..L.DBM..". Deve ser removida antes de "..L.DBM.." continuar para evitar conflitos."
--L.OUTDATEDSPELLTIMERS					= "WARNING: DBM-SpellTimers breaks " .. L.DBM .. " and must be disabled for " .. L.DBM .. " to function properly."
--L.OUTDATEDRLT							= "WARNING: DBM-RaidLeadTools breaks " .. L.DBM .. ". DBM-RaidLeadTools is no longer supported and must be removed for " .. L.DBM .. " to function properly."
--L.VICTORYSOUND							= "WARNING: DBM-VictorySound is not compatible with this version of " .. L.DBM .. ". It must be removed before " .. L.DBM .. " can proceed, to avoid conflict."
--L.DPMCORE								= "WARNING: Deadly PvP mods is discontinued and not compatible with this version of " .. L.DBM .. ". It must be removed before " .. L.DBM .. " can proceed, to avoid conflict."
--L.DBMLDB								= "WARNING: DBM-LDB is now built into DBM-Core. While it won't do any harm, it's recommended to remove 'DBM-LDB' from your addons folder"
--L.DBMLOOTREMINDER						= "WARNING: 3rd party mod DBM-LootReminder is installed. This addon is no longer compatible with Retail WoW client and will cause " .. L.DBM .. " to break and not be able to send pull timers. Uninstall of this addon recommended"
L.UPDATE_REQUIRES_RELAUNCH			= "AVISO: Esta versão de "..L.DBM.." não funcionara corretamente até que você recomece o jogo por completo. Esta atualização contem novos arquivos ou mudanças no .toc que não podem ser carregadas via ReloadUI. Você pode encontrar funcionalidades quebradas ou erros caso continue sem recomeçar o jogo por completo."
--L.OUT_OF_DATE_NAG						= "Your version of " .. L.DBM.. " is out-of-date and this specific fight mod has newer features or bug fixes. It is recommended you update for this fight to improve your experience."
--L.PLATER_NP_AURAS_MSG					= L.DBM .. " includes an advanced feature to show enemy cooldown timers using icons on nameplates. This is on by default for most users, but for Plater users it is off by default in Plater options unless you enable it. To get the most out of DBM (and Plater) it's recommended you enable this feature in Plater under 'Buff Special' section. If you don't want to see this message again, you can also just entirely disable 'Cooldown icons on nameplates' option in DBM global disable or nameplate options panels"

L.MOVABLE_BAR						= "Arraste-me!"

L.PIZZA_SYNC_INFO					= "|Hplayer:%1$s|h[%1$s]|h te enviou um cronógrafo do "..L.DBM..": '%2$s'\n|Hgarrmission:DBM:cancel:%2$s:nil|h|cff3588ff[Cancelar esse cronógrafo]|r|h  |Hgarrmission:DBM:ignore:%2$s:%1$s|h|cff3588ff[Ignorar cronógrafos de %1$s]|r|h"
L.PIZZA_CONFIRM_IGNORE				= "Você tem certeza de que realmente deseja ignorar cronógrafos de %s até o fim desta sessão?"
L.PIZZA_ERROR_USAGE					= "Uso: /dbm [broadcast] timer <tempo> <texto>"

--L.MINIMAP_TOOLTIP_HEADER				= L.DEADLY_BOSS_MODS --Technically redundant -- OPTIONAL
L.MINIMAP_TOOLTIP_FOOTER			= "Use shift+click ou clique com o botão direito para mover\nUse alt+shift+click para arrastar livremente"

L.RANGECHECK_HEADER					= "Medir distância: (%d m)"
--L.RANGECHECK_HEADERT					= "Range Check (%dy-%dP)"
--L.RANGECHECK_RHEADER					= "R-Range Check (%dy)"
--L.RANGECHECK_RHEADERT					= "R-Range Check (%dy-%dP)"
L.RANGECHECK_SETRANGE				= "Definir distância"
L.RANGECHECK_SETTHRESHOLD			= "Definir limite para jogador"
L.RANGECHECK_SOUNDS					= "Sons"
L.RANGECHECK_SOUND_OPTION_1			= "Soar quando um jogador entrar na distância"
L.RANGECHECK_SOUND_OPTION_2			= "Soar quando mais de um jogador entrar na distância"
L.RANGECHECK_SOUND_0				= "Sem som"
L.RANGECHECK_SOUND_1				= "Som padrão"
L.RANGECHECK_SOUND_2				= "Bip irritante"
L.RANGECHECK_SETRANGE_TO			= "%d m"
L.RANGECHECK_OPTION_FRAMES			= "Quadros"
L.RANGECHECK_OPTION_RADAR			= "Mostrar quadro do radar"
L.RANGECHECK_OPTION_TEXT			= "Mostrar quadro de texto"
L.RANGECHECK_OPTION_BOTH			= "Mostrar ambos"
L.RANGERADAR_HEADER					= "Radar (%d m)"
--L.RANGERADAR_RHEADER					= "R-Rng:%d Players:%d"
--L.RANGERADAR_IN_RANGE_TEXT				= "%d in range (%0.1fy)"--Multi
--L.RANGECHECK_IN_RANGE_TEXT				= "%d in range"--Text based doesn't need (%dyd), especially since it's not very accurate to the specific yard anyways
--L.RANGERADAR_IN_RANGE_TEXTONE			= "%s (%0.1fy)"--One target

L.INFOFRAME_SHOW_SELF				= "Sempre exibir seu poder"		-- Always show your own power value even if you are below the threshold
--L.INFOFRAME_SETLINES					= "Set max lines"
--L.INFOFRAME_SETCOLS						= "Set max columns"
--L.INFOFRAME_LINESDEFAULT				= "Set by mod"
--L.INFOFRAME_LINES_TO					= "%d lines"
--L.INFOFRAME_COLS_TO						= "%d columns"
--L.INFOFRAME_POWER						= "Power"
--L.INFOFRAME_AGGRO						= "Aggro"
--L.INFOFRAME_MAIN						= "Main:"--Main power
--L.INFOFRAME_ALT							= "Alt:"--Alternate Power

L.LFG_INVITE						= "Aceitar convite"

L.SLASHCMD_HELP						= {
	"Comandos disponíveis:",
	"-----------------",
	"/dbm unlock: Exibe uma barra de cronógrafo móvel. (ou: move).",
	"/range <number> or /distance <number>: Shows range frame. /rrange or /rdistance to reverse colors.",--Translate
	"/hudar <number>: Shows HUD based range finder.",--Translate
	"/dbm timer: Starts a custom "..L.DBM.." timer, see '/dbm timer' for details.",--Translate
	"/dbm arrow: Exibe a seta do "..L.DBM..", veja /dbm arrow help para detalhes.",
	"/dbm hud: Shows the "..L.DBM.." hud, see '/dbm hud' for details.",--Translate
	"/dbm help2: Shows raid management slash commands."--Translate
}
L.SLASHCMD_HELP2					= {
	"Comandos disponíveis:",
	"-----------------",
	"/dbm pull <seg>: Dispara um cronógrafo para iniciar a luta em <seg> segundos. Dá a todos os integrantes da raid um cronógrafo para iniciar a luta (requer status de líder/guia).",
	"/dbm break <min>: Inicia um cronógrafo de intervalo de <min> minutos. Dá a todos os integrantes da raid um cronógrafo de intervalo (requer status de líder/guia).",
	"/dbm version: Realiza uma checagem de versão de toda a raid. (ou: ver).",
	"/dbm version2: Realiza uma checagem de versão de toda a raid e sussurra para avisando os membros que estão desatualizados (alias: ver2).",
	"/dbm lag: Performs a raid-wide latency check.",
	"/dbm durability: Performs a raid-wide durability check."
}
--Translate all of these
L.TIMER_USAGE						= {
	"DBM timer commands:",
	"-----------------",
	"/dbm timer <time> <text>: Starts a <x> second "..L.DBM.." Timer with the name <text>.",
	"/dbm ltimer <time> <text>: Starts a timer that also automatically loops until canceled.",
	"('Broadcast' in front of any timer also shares it with raid if leader/promoted)",
	"/dbm timer endloop: Stops any looping ltimer."
}

L.ERROR_NO_PERMISSION				= "Você não tem as permissões necessárias para fazer isso."
--L.TIME_TOO_SHORT						= "Pull timer must be longer than 3 seconds."

--L.BREAK_USAGE							= "Break timer cannot be longer than 60 minutes. Make sure you're inputting time in minutes and not seconds."
L.BREAK_START						= "Intervalo começando agora -- você tem %s!"
L.BREAK_MIN							= "Intervalo encerra-se em %s minuto(s)!"
L.BREAK_SEC							= "Intervalo encerra-se em %s segundos!"
L.TIMER_BREAK						= "Intervalo!"
L.ANNOUNCE_BREAK_OVER				= "O intervalo acabou"

L.TIMER_PULL						= "Puxando em"
L.ANNOUNCE_PULL						= "Puxando em %d seg"
L.ANNOUNCE_PULL_NOW					= "Puxando agora!"
--L.ANNOUNCE_PULL_TARGET					= "Pulling %s in %d sec. (Sent by %s)"
--L.ANNOUNCE_PULL_NOW_TARGET				= "Pulling %s now!"
--L.GEAR_WARNING							= "Warning: Check gear. Your equipped ilvl is %d lower than bag ilvl"
--L.GEAR_WARNING_WEAPON					= "Warning: Check if your weapon is correctly equipped."
--L.GEAR_FISHING_POLE						= "Fishing Pole"

L.ACHIEVEMENT_TIMER_SPEED_KILL		= "Vitória mais rápida."

-- Auto-generated Warning Localizations
--L.AUTO_ANNOUNCE_TEXTS.you									= "%s on YOU"
L.AUTO_ANNOUNCE_TEXTS.target		= "%s em >%%s<"
--L.AUTO_ANNOUNCE_TEXTS.targetsource						= ">%%s< cast %s on >%%s<"
L.AUTO_ANNOUNCE_TEXTS.targetcount	= "%s (%%s) em >%%s<"
L.AUTO_ANNOUNCE_TEXTS.spell			= "%s"
--L.AUTO_ANNOUNCE_TEXTS.incoming							= "%s incoming debuff"
--L.AUTO_ANNOUNCE_TEXTS.incomingcount						= "%s incoming debuff (%%s)"
--L.AUTO_ANNOUNCE_TEXTS.ends 								= "%s ended"
--L.AUTO_ANNOUNCE_TEXTS.endtarget							= "%s ended: >%%s<"
--L.AUTO_ANNOUNCE_TEXTS.fades								= "%s faded"
L.AUTO_ANNOUNCE_TEXTS.addsleft		= "%s restantes: %%d"
L.AUTO_ANNOUNCE_TEXTS.cast			= "Lançando %s: %.1f seg"
L.AUTO_ANNOUNCE_TEXTS.soon			= "%s em breve"
--L.AUTO_ANNOUNCE_TEXTS.sooncount							= "%s (%%s) soon"
--L.AUTO_ANNOUNCE_TEXTS.countdown							= "%s in %%ds"
--
L.AUTO_ANNOUNCE_TEXTS.prewarn		= "%s em %s"
--L.AUTO_ANNOUNCE_TEXTS.bait								= "%s soon - bait now"
--
L.AUTO_ANNOUNCE_TEXTS.stage			= "Fase %s"
L.AUTO_ANNOUNCE_TEXTS.prestage		= "Fase %s em breve"
L.AUTO_ANNOUNCE_TEXTS.count			= "%s (%%s)"
L.AUTO_ANNOUNCE_TEXTS.stack			= "%s em >%%s< (%%d)"
--L.AUTO_ANNOUNCE_TEXTS.moveto								= "%s - move to >%%s<"

local prewarnOption					= "Exibir aviso antecipado para $spell:%s"
--L.AUTO_ANNOUNCE_OPTIONS.you									= "Announce when $spell:%s on you"
L.AUTO_ANNOUNCE_OPTIONS.target		= "Anunciar alvos de $spell:%s"
--L.AUTO_ANNOUNCE_OPTIONS.targetNF							= "Announce $spell:%s targets (ignores global target filter)"
--L.AUTO_ANNOUNCE_OPTIONS.targetsource						= "Announce $spell:%s targets (with source)"
L.AUTO_ANNOUNCE_OPTIONS.targetcount	= "Anunciar alvos de $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.spell		= "Exibir aviso para $spell:%s"
--L.AUTO_ANNOUNCE_OPTIONS.incoming							= "Announce when $spell:%s has incoming debuffs"
--L.AUTO_ANNOUNCE_OPTIONS.incomingcount						= "Announce (with count) when $spell:%s has incoming debuffs"
--L.AUTO_ANNOUNCE_OPTIONS.ends								= "Announce when $spell:%s has ended"
--L.AUTO_ANNOUNCE_OPTIONS.endtarget							= "Announce when $spell:%s has ended (with target)"
--L.AUTO_ANNOUNCE_OPTIONS.fades								= "Announce when $spell:%s has faded"
L.AUTO_ANNOUNCE_OPTIONS.addsleft	= "Announce how many $spell:%s remain"
L.AUTO_ANNOUNCE_OPTIONS.cast		= "Exibir aviso quando $spell:%s está sendo lançado"
L.AUTO_ANNOUNCE_OPTIONS.soon		= prewarnOption
L.AUTO_ANNOUNCE_OPTIONS.sooncount							= prewarnOption
--L.AUTO_ANNOUNCE_OPTIONS.countdown							= "Show pre-warning countdown spam for $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.prewarn		= prewarnOption
--L.AUTO_ANNOUNCE_OPTIONS.bait								= "Show pre-warning (to bait) for $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.stage		= "Anunciar Fase %s"
--L.AUTO_ANNOUNCE_OPTIONS.stagechange							= "Announce stage changes"
L.AUTO_ANNOUNCE_OPTIONS.prestage	= "Mostrar aviso antecipado para a Fase %s"
L.AUTO_ANNOUNCE_OPTIONS.count		= "Exibir aviso para $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.stack		= "Anunciar empilhamento de $spell:%s"
--L.AUTO_ANNOUNCE_OPTIONS.moveto								= "Announce when to move to someone or some place for $spell:%s"

L.AUTO_SPEC_WARN_TEXTS.spell		= "%s!"
--L.AUTO_SPEC_WARN_TEXTS.ends								= "%s ended"
--L.AUTO_SPEC_WARN_TEXTS.fades								= "%s faded"
--L.AUTO_SPEC_WARN_TEXTS.soon								= "%s soon"
--L.AUTO_SPEC_WARN_TEXTS.sooncount							= "%s (%%s) soon"
--L.AUTO_SPEC_WARN_TEXTS.bait								= "%s soon - bait now"
--L.AUTO_SPEC_WARN_TEXTS.prewarn								= "%s in %s"
L.AUTO_SPEC_WARN_TEXTS.dispel		= "%s em >%%s< - remova agora"
L.AUTO_SPEC_WARN_TEXTS.interrupt	= "%s - interrompa >%%s<"
L.AUTO_SPEC_WARN_TEXTS.interruptcount	= "%s - interrompa >%%s< (%%d)"
L.AUTO_SPEC_WARN_TEXTS.you			= "%s em você"
L.AUTO_SPEC_WARN_TEXTS.youcount		= "%s (%%s) em você"
--L.AUTO_SPEC_WARN_TEXTS.youpos								= "%s (Position: %%s) on you"
--L.AUTO_SPEC_WARN_TEXTS.youposcount							= "%s (%%s) (Position: %%s) on you"
--L.AUTO_SPEC_WARN_TEXTS.soakpos								= "%s (Soak Position: %%s)"
L.AUTO_SPEC_WARN_TEXTS.target		= "%s em >%%s<"
--L.AUTO_SPEC_WARN_TEXTS.targetcount							= "%s (%%s) on >%%s< "
--L.AUTO_SPEC_WARN_TEXTS.defensive							= "%s - defensive"
--L.AUTO_SPEC_WARN_TEXTS.taunt								= "%s on >%%s< - taunt now"
L.AUTO_SPEC_WARN_TEXTS.close		= "%s em >%%s< perto de você"
L.AUTO_SPEC_WARN_TEXTS.move			= "%s - saia de perto"
--L.AUTO_SPEC_WARN_TEXTS.keepmove							= "%s - keep moving"
--L.AUTO_SPEC_WARN_TEXTS.stopmove							= "%s - stop moving"
--L.AUTO_SPEC_WARN_TEXTS.dodge								= "%s - dodge attack"
--L.AUTO_SPEC_WARN_TEXTS.dodgecount							= "%s (%%s) - dodge attack"
--L.AUTO_SPEC_WARN_TEXTS.dodgeloc							= "%s - dodge from %%s"
--L.AUTO_SPEC_WARN_TEXTS.moveaway							= "%s - move away from others"
--L.AUTO_SPEC_WARN_TEXTS.moveawaycount						= "%s (%%s) - move away from others"
--L.AUTO_SPEC_WARN_TEXTS.moveto								= "%s - move to >%%s<"
--L.AUTO_SPEC_WARN_TEXTS.soak								= "%s - soak it"
--L.AUTO_SPEC_WARN_TEXTS.soakcount							= "%s - soak (%%s)"
L.AUTO_SPEC_WARN_TEXTS.jump			= "%s - salte"
L.AUTO_SPEC_WARN_TEXTS.run			= "%s - corra para longe"
--L.AUTO_SPEC_WARN_TEXTS.runcount							= "%s - run away (%%s)"
L.AUTO_SPEC_WARN_TEXTS.cast			= "%s - pare de lançar"
--L.AUTO_SPEC_WARN_TEXTS.lookaway							= "%s on %%s - look away"
--L.AUTO_SPEC_WARN_TEXTS.reflect								= "%s on >%%s< - stop attacking"
--L.AUTO_SPEC_WARN_TEXTS.count								= "%s! (%%s)" -- OPTIONAL
L.AUTO_SPEC_WARN_TEXTS.stack		= "%s (%%d)"
L.AUTO_SPEC_WARN_TEXTS.switch		= "%s - mude de alvo"
L.AUTO_SPEC_WARN_TEXTS.switchcount	= "%s - mude de alvo (%%s)"
--L.AUTO_SPEC_WARN_TEXTS.gtfo								= "%%s damage - move away",
--L.AUTO_SPEC_WARN_TEXTS.adds								= "Incoming Adds - switch targets"--Basically a generic of switch
--L.AUTO_SPEC_WARN_TEXTS.addscount							= "Incoming Adds - switch targets (%%s)"--Basically a generic of switch
--L.AUTO_SPEC_WARN_TEXTS.addscustom							= "Incoming Adds - %%s"--Same as above, but more info, pretty much made for like 3 boss mods, such as akama
--L.AUTO_SPEC_WARN_TEXTS.targetchange						= "Target Change - switch to %%s"

-- Auto-generated Special Warning Localizations
L.AUTO_SPEC_WARN_OPTIONS.spell 		= "Exibir aviso especial para $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.ends 								= "Show special announce when $spell:%s has ended"
--L.AUTO_SPEC_WARN_OPTIONS.fades 								= "Show special announce when $spell:%s has faded"
--L.AUTO_SPEC_WARN_OPTIONS.soon 								= "Show pre-special announce for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.sooncount							= "Show pre-special announce (with count) for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.bait								= "Show pre-special announce (to bait) for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.prewarn 							= "Show pre-special announce %s seconds before $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.dispel 	= "Exibir aviso especial para remover/roubar $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.interrupt	= "Exibir aviso especial para interromper $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.interruptcount						= "Show special announce (with count) to interrupt $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.you 		= "Exibir aviso especial quando você é afetado por $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.youcount							= "Show special announce (with count) when you are affected by $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.youpos								= "Show special announce (with position) when you are affected by $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.youposcount							= "Show special announce (with position and count) when you are affected by $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.soakpos								= "Show special announce (with position) to help soak others affected by $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.target 	= "Exibir aviso especial quando alguém é afetador por $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.targetcount 						= "Show special announce (with count) when someone is affected by $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.defensive 							= "Show special announce to use defensive abilites for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.taunt 								= "Show special announce to taunt when other tank affected by $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.close 		= "Exibir aviso especial quando alguém próximo de você é afetado por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.move 		= "Exibir aviso especial quando você é afetado por $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.keepmove 							= "Show special announce to keep moving for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.stopmove 							= "Show special announce to stop moving for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.dodge 								= "Show special announce to dodge $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.dodgecount							= "Show special announce (with count) to dodge $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.dodgeloc							= "Show special announce (with location) to dodge $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.moveaway							= "Show special announce to move away from others for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.moveawaycount						= "Show special announce (with count) to move away from others for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.moveto								= "Show special announce to move to someone or some place for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.soak								= "Show special announce to soak for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.soakcount							= "Show special announce (with count) to soak for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.jump								= "Show special announce to move to jump for $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.run 		= "Exibir aviso especial para $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.runcount							= "Show special announce (with count) to run away from $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.cast 		= "Exibir aviso especial para o lançamento de $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.lookaway							= "Show special announce to look away for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.reflect 							= "Show special announce to stop attacking $spell:%s"--Spell Reflect
--L.AUTO_SPEC_WARN_OPTIONS.count 								= "Show special announce (with count) for $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.stack 		= "Exibir aviso especial para pilha >=%d de $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.switch		= "Exibir aviso especial para mudar de alvo para $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.switchcount							= "Show special announce (with count) to switch targets for $spell:%s"
--L.AUTO_SPEC_WARN_OPTIONS.gtfo 								= "Show special announce to move out of bad stuff on ground"
--L.AUTO_SPEC_WARN_OPTIONS.adds								= "Show special announce to switch targets for incoming adds"
--L.AUTO_SPEC_WARN_OPTIONS.addscount							= "Show special announce (with count) to switch targets for incoming adds"
--L.AUTO_SPEC_WARN_OPTIONS.addscustom							= "Show special announce for incoming adds"
--L.AUTO_SPEC_WARN_OPTIONS.targetchange						= "Show special announce for priority target changes"

L.AUTO_TIMER_TEXTS.target			= "%s: >%%s<"
--L.AUTO_TIMER_TEXTS.targetcount							= "%s (%%2$s): %%1$s"
L.AUTO_TIMER_TEXTS.cast				= "%s"
--L.AUTO_TIMER_TEXTS.castcount							= "%s (%%s)"
--L.AUTO_TIMER_TEXTS.castsource							= "%s: %%s"
L.AUTO_TIMER_TEXTS.active			= "%s acaba" --Buff/Debuff/event on boss
L.AUTO_TIMER_TEXTS.fades			= "%s desvanece" --Buff/Debuff on players
--L.AUTO_TIMER_TEXTS.ai									= "%s AI"

L.AUTO_TIMER_TEXTS.cd				= "%s recarrega"
L.AUTO_TIMER_TEXTS.cdcount			= "%s recarrega (%%s)"
L.AUTO_TIMER_TEXTS.cdsource			= "%s recarrega: >%%s<"
--L.AUTO_TIMER_TEXTS.cdspecial							= "Special"

L.AUTO_TIMER_TEXTS.next				= "Próx. %s"
L.AUTO_TIMER_TEXTS.nextcount		= "Próx. %s (%%s)"
L.AUTO_TIMER_TEXTS.nextsource		= "Próx %s: >%%s<"
--L.AUTO_TIMER_TEXTS.nextspecial							= "Special"

L.AUTO_TIMER_TEXTS.achievement		= "%s"
--L.AUTO_TIMER_TEXTS.stage								= "Stage",
--L.AUTO_TIMER_TEXTS.stagecount							= "Stage %%s"--NOT BUGGED, stage is 2nd arg, spellID is ignored on purpose
--L.AUTO_TIMER_TEXTS.stagecountcycle						= "Stage %%s (%%s)"--^^. Example: Stage 2 (3) for a fight that alternates stage 1 and stage 2, but also tracks total cycles
--L.AUTO_TIMER_TEXTS.stagecontext						= "%s" -- OPTIONAL
--L.AUTO_TIMER_TEXTS.stagecontextcount					= "%s (%%s)" -- OPTIONAL
--L.AUTO_TIMER_TEXTS.intermission						= "Intermission"
--L.AUTO_TIMER_TEXTS.intermissioncount					= "Intermission %%s"
--L.AUTO_TIMER_TEXTS.adds								= "Adds"
--L.AUTO_TIMER_TEXTS.addscustom							= "Adds (%%s)"
--L.AUTO_TIMER_TEXTS.roleplay							= GUILD_INTEREST_RP or "Roleplay"--Used mid fight, pre fight, or even post fight. Boss does NOT auto engage upon completion
L.AUTO_TIMER_TEXTS.combat			= "Combate começa"
--This basically clones np only bar option and display text from regular counterparts
--L.AUTO_TIMER_TEXTS.cdnp = L.AUTO_TIMER_TEXTS.cd -- OPTIONAL
--L.AUTO_TIMER_TEXTS.nextnp = L.AUTO_TIMER_TEXTS.next -- OPTIONAL
--L.AUTO_TIMER_TEXTS.cdcountnp = L.AUTO_TIMER_TEXTS.cdcount -- OPTIONAL
--L.AUTO_TIMER_TEXTS.nextcountnp = L.AUTO_TIMER_TEXTS.nextcount -- OPTIONAL

L.AUTO_TIMER_OPTIONS.target			= "Exibir cronógrafo para a penalidade $spell:%s"
--L.AUTO_TIMER_OPTIONS.targetcount							= "Show timer (with count) for $spell:%s debuff"
L.AUTO_TIMER_OPTIONS.cast			= "Exibir cronógrafo para lançar $spell:%s"
--L.AUTO_TIMER_OPTIONS.castcount							= "Show timer (with count) for $spell:%s cast"
--L.AUTO_TIMER_OPTIONS.castsource							= "Show timer (with source) for $spell:%s cast"
L.AUTO_TIMER_OPTIONS.active			= "Exibir cronógrafo para a duração de $spell:%s"
L.AUTO_TIMER_OPTIONS.fades			= "Exibir cronógrafo para quando $spell:%s desvanecerá dos jogadores"
--L.AUTO_TIMER_OPTIONS.ai									= "Show AI timer for $spell:%s cooldown"
L.AUTO_TIMER_OPTIONS.cd				= "Exibir cronógrafo para recarga de $spell:%s"
L.AUTO_TIMER_OPTIONS.cdcount		= "Exibir cronógrafo para recarga de $spell:%s"
--L.AUTO_TIMER_OPTIONS.cdnp								= "Show nameplate only timer for $spell:%s cooldown"
--L.AUTO_TIMER_OPTIONS.cdnpcount							= "Show nameplate only timer (with count) for $spell:%s cooldown"
L.AUTO_TIMER_OPTIONS.cdsource		= "Exibir cronógrafo para recarga de $spell:%s"
--L.AUTO_TIMER_OPTIONS.cdspecial							= "Show timer for special ability cooldown"
--L.AUTO_TIMER_OPTIONS.cdcombo								= "Show timer for ability combo cooldown"--Used for combining 2 abilities into a single timer
L.AUTO_TIMER_OPTIONS.next			= "Exibir cronógrafo para o próximo $spell:%s"
L.AUTO_TIMER_OPTIONS.nextcount		= "Exibir cronógrafo para o próximo $spell:%s"
--L.AUTO_TIMER_OPTIONS.nextnp								= "Show nameplate only timer for next $spell:%s"
--L.AUTO_TIMER_OPTIONS.nextnpcount							= "Show nameplate only timer (with count) for next $spell:%s"
L.AUTO_TIMER_OPTIONS.nextsource		= "Exibir cronógrafo para o próximo $spell:%s"
--L.AUTO_TIMER_OPTIONS.nextspecial							= "Show timer for next special ability"
--L.AUTO_TIMER_OPTIONS.nextcombo							= "Show timer for next ability combo"--Used for combining 2 abilities into a single timer
L.AUTO_TIMER_OPTIONS.achievement	= "Exibir cronógrafo para %s"
--L.AUTO_TIMER_OPTIONS.stage								= "Show timer for next stage"
--L.AUTO_TIMER_OPTIONS.stagecount							= "Show timer (with count) for next stage"
--L.AUTO_TIMER_OPTIONS.stagecountcycle						= "Show timer (with stage count and cycle count) for next stage"
--L.AUTO_TIMER_OPTIONS.stagecontext						= "Show timer for next $spell:%s stage"
--L.AUTO_TIMER_OPTIONS.stagecontextcount					= "Show timer (with count) for next $spell:%s stage"
--L.AUTO_TIMER_OPTIONS.intermission						= "Show timer for next intermission"
--L.AUTO_TIMER_OPTIONS.intermissioncount					= "Show timer (with count) for next intermission"
--L.AUTO_TIMER_OPTIONS.adds								= "Show timer for incoming adds"
--L.AUTO_TIMER_OPTIONS.addscustom							= "Show timer for incoming adds"
--L.AUTO_TIMER_OPTIONS.roleplay							= "Show timer for roleplay duration"--This does need localizing though.
L.AUTO_TIMER_OPTIONS.combat			= "Exibir cronógrafo para começo do combate"


L.AUTO_ICONS_OPTION_TARGETS			= "Colocar ícones nos alvos de $spell:%s"
--L.AUTO_ICONS_OPTION_TARGETS_TANK_A		= "Set icons on $spell:%s targets with tank over melee over ranged priority and alphabetical fallback"
--L.AUTO_ICONS_OPTION_TARGETS_TANK_R		= "Set icons on $spell:%s targets with tank over melee over ranged priority and raid roster fallback"
--L.AUTO_ICONS_OPTION_TARGETS_MELEE_A		= "Set icons on $spell:%s targets with melee and alphabetical priority"
--L.AUTO_ICONS_OPTION_TARGETS_MELEE_R		= "Set icons on $spell:%s targets with melee and raid roster priority"
--L.AUTO_ICONS_OPTION_TARGETS_RANGED_A	= "Set icons on $spell:%s targets with ranged and alphabetical priority"
--L.AUTO_ICONS_OPTION_TARGETS_RANGED_R	= "Set icons on $spell:%s targets with ranged and raid roster priority"
--L.AUTO_ICONS_OPTION_TARGETS_ALPHA		= "Set icons on $spell:%s targets with alphabetical priority"
--L.AUTO_ICONS_OPTION_TARGETS_ROSTER		= "Set icons on $spell:%s targets with raid roster priority"
L.AUTO_ICONS_OPTION_NPCS			= "Set icons on $spell:%s"
--L.AUTO_ICONS_OPTION_CONFLICT			= " (May conflict with other options)"

--L.AUTO_ARROW_OPTION_TEXT				= "Show " .. L.DBM .. " Arrow to move toward target affected by $spell:%s"
--L.AUTO_ARROW_OPTION_TEXT2				= "Show " .. L.DBM .. " Arrow to move away from target affected by $spell:%s"
--L.AUTO_ARROW_OPTION_TEXT3				= "Show " .. L.DBM .. " Arrow to move toward specific location for $spell:%s"

--L.AUTO_YELL_OPTION_TEXT.shortyell							= "Yell when you are affected by $spell:%s"
--L.AUTO_YELL_OPTION_TEXT.yell								= "Yell (with player name) when you are affected by $spell:%s"
--L.AUTO_YELL_OPTION_TEXT.count								= "Yell (with count) when you are affected by $spell:%s"
--L.AUTO_YELL_OPTION_TEXT.fade								= "Yell (with countdown and spell name) when $spell:%s is fading"
--L.AUTO_YELL_OPTION_TEXT.shortfade							= "Yell (with countdown) when $spell:%s is fading"
--L.AUTO_YELL_OPTION_TEXT.iconfade							= "Yell (with countdown and icon) when $spell:%s is fading"
--L.AUTO_YELL_OPTION_TEXT.position							= "Yell (with position and player name) when you are affected by $spell:%s"
--L.AUTO_YELL_OPTION_TEXT.shortposition						= "Yell (with position) when you are affected by $spell:%s"
--L.AUTO_YELL_OPTION_TEXT.combo								= "Yell (with custom text) when you are affected by $spell:%s and other spells at same time"
--L.AUTO_YELL_OPTION_TEXT.repeatplayer						= "Yell repeatedly (with player name) when you are affected by $spell:%s"
--L.AUTO_YELL_OPTION_TEXT.repeaticon							= "Yell repeatedly (with icon) when you are affected by $spell:%s"

--L.AUTO_YELL_ANNOUNCE_TEXT.shortyell							= "%s" -- OPTIONAL
L.AUTO_YELL_ANNOUNCE_TEXT.yell								= "%s em " .. UnitName("player")
L.AUTO_YELL_ANNOUNCE_TEXT.count								= "%s em " .. UnitName("player") .. " (%%d)"
--L.AUTO_YELL_ANNOUNCE_TEXT.fade								= "%s fading in %%d"
--L.AUTO_YELL_ANNOUNCE_TEXT.shortfade							= "%%d" -- OPTIONAL
--L.AUTO_YELL_ANNOUNCE_TEXT.iconfade							= "{rt%%2$d}%%1$d" -- OPTIONAL
--L.AUTO_YELL_ANNOUNCE_TEXT.position 							= "%s %%s on {rt%%d}" ..UnitName("player").. "{rt%%d}"
--L.AUTO_YELL_ANNOUNCE_TEXT.shortposition 						= "{rt%%1$d}%s %%2$d"--Icon, Spellname, number -- OPTIONAL
--L.AUTO_YELL_ANNOUNCE_TEXT.combo								= "%s and %%s"--Spell name (from option, plus spellname given in arg)
--L.AUTO_YELL_ANNOUNCE_TEXT.repeatplayer						= UnitName("player")--Doesn't need translation, it's just player name spam -- OPTIONAL
--L.AUTO_YELL_ANNOUNCE_TEXT.repeaticon							= "{rt%%1$d}"--Doesn't need translation. It's just icon spam -- OPTIONAL

--L.AUTO_YELL_CUSTOM_POSITION				= "{rt%d}%s"--Doesn't need translating. Has no strings (Used in niche situations such as icon repeat yells) -- OPTIONAL
--L.AUTO_YELL_CUSTOM_FADE					= "%s faded"
--L.AUTO_HUD_OPTION_TEXT					= "Show HudMap for $spell:%s (Retired)"
--L.AUTO_HUD_OPTION_TEXT_MULTI			= "Show HudMap for various mechanics (Retired)"
--L.AUTO_NAMEPLATE_OPTION_TEXT			= "Show Nameplate Auras for $spell:%s using compatible nameplate addon or "..L.DBM
--L.AUTO_NAMEPLATE_OPTION_TEXT_FORCED		= "Show Nameplate Auras for $spell:%s using only "..L.DBM
--L.AUTO_RANGE_OPTION_TEXT				= "Show range frame (%s) for $spell:%s"--string used for range so we can use things like "5/2" as a value for that field
--L.AUTO_RANGE_OPTION_TEXT_SHORT			= "Show range frame (%s)"--For when a range frame is just used for more than one thing
--L.AUTO_RRANGE_OPTION_TEXT				= "Show reverse range frame (%s) for $spell:%s"--Reverse range frame (green when players in range, red when not)
--L.AUTO_RRANGE_OPTION_TEXT_SHORT			= "Show reverse range frame (%s)"
--L.AUTO_INFO_FRAME_OPTION_TEXT			= "Show info frame for $spell:%s"
--L.AUTO_INFO_FRAME_OPTION_TEXT2			= "Show info frame for encounter overview"
--L.AUTO_INFO_FRAME_OPTION_TEXT3			= "Show info frame for $spell:%s (when threshold of %%s is met)"
--L.AUTO_READY_CHECK_OPTION_TEXT			= "Play ready check sound when boss is pulled (even if it's not targeted)"
--L.AUTO_SPEEDCLEAR_OPTION_TEXT			= "Show timer for fastest clear of %s"
--L.AUTO_PRIVATEAURA_OPTION_TEXT			= "Play DBM sound alerts for $spell:%s private auras on this fight."

-- New special warnings
--L.MOVE_WARNING_BAR						= "Announce movable"
--L.MOVE_WARNING_MESSAGE					= "Thanks for using " .. L.DEADLY_BOSS_MODS
L.MOVE_SPECIAL_WARNING_BAR			= "Aviso especial móvel"
--L.MOVE_SPECIAL_WARNING_TEXT				= "Special Warning"

--L.HUD_INVALID_TYPE						= "Invalid HUD type defined"
--L.HUD_INVALID_TARGET					= "No valid target given for HUD"
--L.HUD_INVALID_SELF						= "Cannot use self as target for HUD"
--L.HUD_INVALID_ICON						= "Cannot use icon method for HUD on a target with no icon"
--L.HUD_SUCCESS							= "HUD successful started with your parameters. This will cancel after %s, or by calling '/dbm hud hide'."
--L.HUD_USAGE								= {
--	L.DBM .. "-HudMap usage:",
--	"-----------------",
--	"/dbm hud <type> <target> <duration>: Creates a HUD that points to a player for the desired duration",
--	"Valid types: arrow, dot, red, blue, green, yellow, icon (requires a target with raid icon)",
--	"Valid targets: target, focus, <playername>",
--	"Valid durations: any number (in seconds). If left blank, 20min will be used.",
--	"/dbm hud hide: disables user generated HUD objects"
--}

L.ARROW_MOVABLE						= "Seta móvel"
--L.ARROW_WAY_USAGE						= "/dway <x> <y>: Creates an arrow that points to a specific location (using local zone map coordinates)"
--L.ARROW_WAY_SUCCESS						= "To hide arrow, do '/dbm arrow hide' or reach arrow"
L.ARROW_ERROR_USAGE					= {
	"Uso da seta do " .. L.DBM .. ":",
	"-----------------",
	"/dbm arrow <x> <y>  cria uma seta que aponta para um local específico (0 < x/y < 100)",
	"/dbm arrow map <x> <y>: Creates an arrow that points to a specific location (using zone map coordinates)",--TRANSLATE
	"/dbm arrow <jogador>  cria uma seta que aponta para um jogador específico no seu grupo",
	"/dbm arrow hide  esconde a seta",
	"/dbm arrow move  torna móvel a seta"
}

L.SPEED_KILL_TIMER_TEXT				= "Vitória em tempo recorde"
L.SPEED_CLEAR_TIMER_TEXT			= "Limpeza mais rápida"
L.COMBAT_RES_TIMER_TEXT				= "Próxima recarga CR"
L.TIMER_RESPAWN						= "%s Respawn"

L.LAG_CHECKING						= "Verificando a latência da raide..."
L.LAG_HEADER						= L.DEADLY_BOSS_MODS .. " - Resultados de latência"
L.LAG_ENTRY							= "%s: Latência mundial [%d ms] / Latência em casa [%d ms]"
L.LAG_FOOTER						= "Sem resposta: %s"

L.DUR_CHECKING						= "Verificando a durabilidade da raide..."
L.DUR_HEADER						= L.DEADLY_BOSS_MODS .. " - Resultados de durabilidade"
L.DUR_ENTRY							= "%s: Durabilidade [%d percent] / quebrada [%s]"

--L.OVERRIDE_ACTIVATED					= "Configuration overrides have been activated for this encounter by RL"

--LDB
L.LDB_TOOLTIP_HELP1					= "Clique para abrir " .. L.DBM
L.LDB_TOOLTIP_HELP2					= "Alt-clique para alternar o modo silencioso"
L.SILENTMODE_IS						= "Modo silencioso é "

L.WORLD_BUFFS.hordeOny		= "Povo da Horda, cidadãos de Orgrimmar, venham! Vamos homenagear uma heroína da Horda"
L.WORLD_BUFFS.allianceOny	= "Cidadãos e aliados de Ventobravo, no dia de hoje, fez-se história."
L.WORLD_BUFFS.hordeNef		= "NEFARIAN ESTÁ MORTO! Povo de Orgrimmar"
L.WORLD_BUFFS.allianceNef	= "Cidadãos da Aliança, o Senhor da Rocha Negra foi derrubado!"
L.WORLD_BUFFS.zgHeart		= "Agora só falta um passo para nos livrarmos do Esfolador de Almas"
L.WORLD_BUFFS.zgHeartBooty	= "O Deus Sanguinário, o Esfolador de Almas, foi derrotado! Acabaram-se os nossos temores!"
L.WORLD_BUFFS.zgHeartYojamba	= "Iniciem o ritual, meus servos. Temos que banir o coração de Hakkar de volta para o vórtice!"
L.WORLD_BUFFS.rendHead		= "O falso Chefe Guerreiro, Laceral Mão Negra, caiu!"
--L.WORLD_BUFFS.blackfathomBoon						= "boon of Blackfathom"
