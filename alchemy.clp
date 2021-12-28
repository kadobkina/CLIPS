
(deftemplate ioproxy ; шаблон факта-посредника для обмена информацией с GUI
	(slot message (default none))
)

(deffacts proxy-fact ; экземпляр факта ioproxy
	(ioproxy
		(message none)
	)
)

(defrule clear-message
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?sendmessage <- (sendmessagehalt ?msg)
	=>
	(retract ?clear-msg-flg)
	(retract ?sendmessage)
)

(defrule set-output-and-halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (message ?msg))
	=>
	(modify ?proxy (message ?new-msg))
	(retract ?current-message)
	(halt)
)

;================================================

(deftemplate fact ; Шаблон факта
	(slot name (default none))  ; Название
)

(defrule Rule_1
	(declare (salience 40))
	(fact (name воздух))
	=>
	(assert (fact (name ветер)))
	(assert(sendmessagehalt " Воздух + Воздух = Ветер|ветер|"))
	(halt)
)

(defrule Rule_2
	(declare (salience 40))
	(fact (name земля))
	=>
	(assert (fact (name давление)))
	(assert(sendmessagehalt " Земля + Земля = Давление |давление|"))
	(halt)
)

(defrule Rule_3
	(declare (salience 40))
	(fact (name вода))
	(fact (name огонь))
	=>
	(assert (fact (name спирт)))
	(assert(sendmessagehalt " Огонь + Вода = Спирт|спирт|"))
	(halt)
)

(defrule Rule_4
	(declare (salience 40))
	(fact (name вода))
	=>
	(assert (fact (name море)))
	(assert(sendmessagehalt " Вода + Вода = Море|море|"))
	(halt)
)

(defrule Rule_5
	(declare (salience 40))
	(fact (name вода))
	(fact (name земля))
	=>
	(assert (fact (name пар)))
	(assert(sendmessagehalt " Вода + Воздух = Пар |пар|"))
	(halt)
)

(defrule Rule_6
	(declare (salience 40))
	(fact (name огонь))
	(fact (name земля))
	=>
	(assert (fact (name лава)))
	(assert(sendmessagehalt " Огонь + Земля = Лава|лава|"))
	(halt)
)

(defrule Rule_7
	(declare (salience 40))
	(fact (name давление))
	(fact (name лава))
	=>
	(assert (fact (name вулкан)))
	(assert(sendmessagehalt " Лава + Давление = Вулкан|вулкан|"))
	(halt)
)

(defrule Rule_8
	(declare (salience 40))
	(fact (name вода))
	(fact (name земля))
	=>
	(assert (fact (name болото)))
	(assert(sendmessagehalt " Вода + Земля = Болото|болото|"))
	(halt)
)

(defrule Rule_9
	(declare (salience 40))
	(fact (name воздух))
	(fact (name лава))
	=>
	(assert (fact (name камень)))
	(assert(sendmessagehalt " Воздух + Лава = Камень|камень|"))
	(halt)
)

(defrule Rule_10
	(declare (salience 40))
	(fact (name огонь))
	(fact (name камень))
	=>
	(assert (fact (name металл)))
	(assert(sendmessagehalt " Огонь + Камень = Металл|металл|"))
	(halt)
)

(defrule Rule_11
	(declare (salience 40))
	(fact (name давление))
	(fact (name болото))
	=>
	(assert (fact (name торф)))
	(assert(sendmessagehalt " Давление + Болото = Торф|торф|"))
	(halt)
)

(defrule Rule_12
	(declare (salience 40))
	(fact (name пар))
	(fact (name металл))
	=>
	(assert (fact (name паровой_котел)))
	(assert(sendmessagehalt " Металл + Пар = Паровой котел|паровой котел|"))
	(halt)
)

(defrule Rule_13
	(declare (salience 40))
	(fact (name ветер))
	(fact (name камень))
	=>
	(assert (fact (name песок)))
	(assert(sendmessagehalt " Камень + Ветер = Песок|песок|"))
	(halt)
)

(defrule Rule_14
	(declare (salience 40))
	(fact (name вода))
	(fact (name песок))
	=>
	(assert (fact (name пляж)))
	(assert(sendmessagehalt " Вода + Песок = Пляж|пляж|"))
	(halt)
)

(defrule Rule_15
	(declare (salience 40))
	(fact (name земля))
	(fact (name воздух))
	=>
	(assert (fact (name пыль)))
	(assert(sendmessagehalt " Земля + Воздух = Пыль|пыль|"))
	(halt)
)

(defrule Rule_16
	(declare (salience 40))
	(fact (name давление))
	(fact (name вулкан))
	=>
	(assert (fact (name пепел)))
	(assert(sendmessagehalt " Вулкан + Давление = Пепел|пепел|"))
	(halt)
)

(defrule Rule_17
	(declare (salience 40))
	(fact (name огонь))
	(fact (name пыль))
	=>
	(assert (fact (name порох)))
	(assert(sendmessagehalt " Огонь + Пыль = Порох|порох|"))
	(halt)
)

(defrule Rule_18
	(declare (salience 40))
	(fact (name земля))
	(fact (name пар))
	=>
	(assert (fact (name гейзер)))
	(assert(sendmessagehalt " Пар + Земля = Гейзер|гейзер|"))
	(halt)
)

(defrule Rule_19
	(declare (salience 40))
	(fact (name песок))
	=>
	(assert (fact (name пустыня)))
	(assert(sendmessagehalt " Песок + Песок = Пустыня|пустыня|"))
	(halt)
)

(defrule Rule_20
	(declare (salience 40))
	(fact (name вода))
	(fact (name пыль))
	=>
	(assert (fact (name грязь)))
	(assert(sendmessagehalt " Вода + Пыль = Грязь|грязь|"))
	(halt)
)

(defrule Rule_21
	(declare (salience 40))
	(fact (name огонь))
	(fact (name торф))
	=>
	(assert (fact (name дым)))
	(assert(sendmessagehalt " Огонь + Торф = Дым|дым|"))
	(halt)
)

(defrule Rule_22
	(declare (salience 40))
	(fact (name огонь))
	(fact (name воздух))
	=>
	(assert (fact (name энергия)))
	(assert(sendmessagehalt " Огонь + Воздух = Энергия|энергия|"))
	(halt)
)

(defrule Rule_23
	(declare (salience 40))
	(fact (name воздух))
	(fact (name энергия))
	=>
	(assert (fact (name буря)))
	(assert(sendmessagehalt " Энергия + Воздух = Буря|буря|"))
	(halt)
)

(defrule Rule_24
	(declare (salience 40))
	(fact (name болото))
	(fact (name песок))
	=>
	(assert (fact (name глина)))
	(assert(sendmessagehalt " Песок + Болото = Глина|глина|"))
	(halt)
)

(defrule Rule_25
	(declare (salience 40))
	(fact (name металл))
	(fact (name ветер))
	=>
	(assert (fact (name звук)))
	(assert(sendmessagehalt " Ветер + Металл = Звук|звук|"))
	(halt)
)

(defrule Rule_26
	(declare (salience 40))
	(fact (name воздух))
	(fact (name пар))
	=>
	(assert (fact (name облако)))
	(assert(sendmessagehalt " Воздух + Пар = Облако |облако|"))
	(halt)
)

(defrule Rule_27
	(declare (salience 40))
	(fact (name воздух))
	(fact (name облако))
	=>
	(assert (fact (name небо)))
	(assert(sendmessagehalt " Воздух + Облако = Небо|небо|"))
	(halt)
)

(defrule Rule_28
	(declare (salience 40))
	(fact (name огонь))
	(fact (name глина))
	=>
	(assert (fact (name кирпич)))
	(assert(sendmessagehalt " Огонь + Глина = Кирпич|кирпич|"))
	(halt)
)

(defrule Rule_29
	(declare (salience 40))
	(fact (name огонь))
	(fact (name песок))
	=>
	(assert (fact (name стекло)))
	(assert(sendmessagehalt " Песок + Огонь = Стекло|стекло|"))
	(halt)
)

(defrule Rule_30
	(declare (salience 40))
	(fact (name вода))
	(fact (name кирпич))
	=>
	(assert (fact (name плотина)))
	(assert(sendmessagehalt " Вода + Кирпич = Плотина|плотина|"))
	(halt)
)

(defrule Rule_31
	(declare (salience 40))
	(fact (name огонь))
	(fact (name порох))
	=>
	(assert (fact (name взрыв)))
	(assert(sendmessagehalt " Порох + Огонь = Взрыв|взрыв|"))
	(halt)
)

(defrule Rule_32
	(declare (salience 40))
	(fact (name вода))
	(fact (name спирт))
	=>
	(assert (fact (name водка)))
	(assert(sendmessagehalt " Вода + Спирт = Водка |водка|"))
	(halt)
)

(defrule Rule_33
	(declare (salience 40))
	(fact (name вода))
	(fact (name стекло))
	=>
	(assert (fact (name лед)))
	(assert(sendmessagehalt " Вода + Стекло = Лед|лед|"))
	(halt)
)

(defrule Rule_34
	(declare (salience 40))
	(fact (name огонь))
	(fact (name стекло))
	=>
	(assert (fact (name лампа)))
	(assert(sendmessagehalt " Огонь + Стекло = Лампа|лампа|"))
	(halt)
)

(defrule Rule_35
	(declare (salience 40))
	(fact (name металл))
	(fact (name энергия))
	=>
	(assert (fact (name электричество)))
	(assert(sendmessagehalt " Металл + Энергия = Электричество |электричество|"))
	(halt)
)

(defrule Rule_36
	(declare (salience 40))
	(fact (name болото))
	(fact (name энергия))
	=>
	(assert (fact (name жизнь)))
	(assert(sendmessagehalt " Болото + Энергия = Жизнь|жизнь|"))
	(halt)
)

(defrule Rule_37
	(declare (salience 40))
	(fact (name болото))
	(fact (name жизнь))
	=>
	(assert (fact (name бактерии)))
	(assert(sendmessagehalt " Болото + Жизнь = Бактерии|бактерии|"))
	(halt)
)

(defrule Rule_38
	(declare (salience 40))
	(fact (name вода))
	(fact (name жизнь))
	=>
	(assert (fact (name водоросли)))
	(assert(sendmessagehalt " Вода + Жизнь = Водоросли|водоросли|"))
	(halt)
)

(defrule Rule_39
	(declare (salience 40))
	(fact (name глина))
	(fact (name жизнь))
	=>
	(assert (fact (name голем)))
	(assert(sendmessagehalt " Глина + Жизнь = Голем|голем|"))
	(halt)
)

(defrule Rule_40
	(declare (salience 40))
	(fact (name жизнь))
	(fact (name голем))
	=>
	(assert (fact (name человек)))
	(assert(sendmessagehalt " Голем + Жизнь = Человек |человек|"))
	(halt)
)

(defrule Rule_41
	(declare (salience 40))
	(fact (name камень))
	(fact (name человек))
	=>
	(assert (fact (name хижина)))
	(assert(sendmessagehalt " Человек + Камень = Хижина|хижина|"))
	(halt)
)

(defrule Rule_42
	(declare (salience 40))
	(fact (name камень))
	(fact (name жизнь))
	=>
	(assert (fact (name яйцо)))
	(assert(sendmessagehalt " Камень + Жизнь = Яйцо|яйцо|"))
	(halt)
)

(defrule Rule_43
	(declare (salience 40))
	(fact (name жизнь))
	(fact (name яйцо))
	=>
	(assert (fact (name курица)))
	(assert(sendmessagehalt " Жизнь + Яйцо = Курица|курица|"))
	(halt)
)

(defrule Rule_44
	(declare (salience 40))
	(fact (name яйцо))
	(fact (name курица))
	=>
	(assert (fact (name дилемма)))
	(assert(sendmessagehalt " Яйцо + Курица = Дилемма|дилемма|"))
	(halt)
)

(defrule Rule_45
	(declare (salience 40))
	(fact (name металл))
	(fact (name жизнь))
	=>
	(assert (fact (name металлический_голем)))
	(assert(sendmessagehalt " Металл + Жизнь = Металлический голем|металлический голем|"))
	(halt)
)

(defrule Rule_46
	(declare (salience 40))
	(fact (name лава))
	(fact (name жизнь))
	=>
	(assert (fact (name лавовый_голем)))
	(assert(sendmessagehalt " Лава + Жизнь = Лавовый голем|лавовый голем|"))
	(halt)
)

(defrule Rule_47
	(declare (salience 40))
	(fact (name огонь))
	(fact (name жизнь))
	=>
	(assert (fact (name огненный_элементал)))
	(assert(sendmessagehalt " Огонь + Жизнь = Огненный голем|огненный элементал|"))
	(halt)
)

(defrule Rule_48
	(declare (salience 40))
	(fact (name пепел))
	(fact (name жизнь))
	=>
	(assert (fact (name призрак)))
	(assert(sendmessagehalt " Пепел + Жизнь = Призрак|призрак|"))
	(halt)
)

(defrule Rule_49
	(declare (salience 40))
	(fact (name песок))
	(fact (name жизнь))
	=>
	(assert (fact (name семена)))
	(assert(sendmessagehalt " Песок + Жизнь = Семена|семена|"))
	(halt)
)

(defrule Rule_50
	(declare (salience 40))
	(fact (name электричество))
	(fact (name металлический_голем))
	=>
	(assert (fact (name робот)))
	(assert(sendmessagehalt " Металлический голем + Электричество = Робот|робот|"))
	(halt)
)

(defrule Rule_51
	(declare (salience 40))
	(fact (name хижина))
	(fact (name курица))
	=>
	(assert (fact (name курятник)))
	(assert(sendmessagehalt " Хижина + Курица = Курятник|курятник|"))
	(halt)
)

(defrule Rule_52
	(declare (salience 40))
	(fact (name земля))
	(fact (name водоросли))
	=>
	(assert (fact (name гриб)))
	(assert(sendmessagehalt " Водоросли + Земля = Гриб|гриб|"))
	(halt)
)

(defrule Rule_53
	(declare (salience 40))
	(fact (name земля))
	(fact (name яйцо))
	=>
	(assert (fact (name динозавр)))
	(assert(sendmessagehalt " Земля + Яйцо = Динозавр|динозавр|"))
	(halt)
)

(defrule Rule_54
	(declare (salience 40))
	(fact (name металл))
	(fact (name человек))
	=>
	(assert (fact (name инструменты)))
	(assert(sendmessagehalt " Человек + Металл = Инструменты|инструменты|"))
	(halt)
)

(defrule Rule_55
	(declare (salience 40))
	(fact (name металл))
	(fact (name инструменты))
	=>
	(assert (fact (name оружие)))
	(assert(sendmessagehalt " Инструменты + Металл = Оружие|оружие|"))
	(halt)
)

(defrule Rule_56
	(declare (salience 40))
	(fact (name земля))
	(fact (name семена))
	=>
	(assert (fact (name дерево)))
	(assert(sendmessagehalt " Земля + Семена = Дерево|дерево|"))
	(halt)
)

(defrule Rule_57
	(declare (salience 40))
	(fact (name огонь))
	(fact (name дерево))
	=>
	(assert (fact (name уголь)))
	(assert(sendmessagehalt " Огонь + Дерево = Уголь|уголь|"))
	(halt)
)

(defrule Rule_58
	(declare (salience 40))
	(fact (name огонь))
	(fact (name человек))
	=>
	(assert (fact (name труп)))
	(assert(sendmessagehalt " Человек + Огонь = Труп|труп|"))
	(halt)
)

(defrule Rule_59
	(declare (salience 40))
	(fact (name жизнь))
	(fact (name труп))
	=>
	(assert (fact (name зомби)))
	(assert(sendmessagehalt " Жизнь + Труп = Зомби|зомби|"))
	(halt)
)

(defrule Rule_60
	(declare (salience 40))
	(fact (name водка))
	(fact (name человек))
	=>
	(assert (fact (name алкаш)))
	(assert(sendmessagehalt " Человек + Водка = Алкаш |алкаш|"))
	(halt)
)

(defrule Rule_61
	(declare (salience 40))
	(fact (name земля))
	(fact (name труп))
	=>
	(assert (fact (name могила)))
	(assert(sendmessagehalt " Труп + Земля = Могила|могила|"))
	(halt)
)

(defrule Rule_62
	(declare (salience 40))
	(fact (name огонь))
	(fact (name курица))
	=>
	(assert (fact (name курица-гриль)))
	(assert(sendmessagehalt " Огонь + Курица = Курица-гриль|курица-гриль|"))
	(halt)
)

(defrule Rule_63
	(declare (salience 40))
	(fact (name воздух))
	(fact (name яйцо))
	=>
	(assert (fact (name птица)))
	(assert(sendmessagehalt " Воздух + Яйцо = Птица|птица|"))
	(halt)
)

(defrule Rule_64
	(declare (salience 40))
	(fact (name болото))
	(fact (name яйцо))
	=>
	(assert (fact (name ящерица)))
	(assert(sendmessagehalt " Яйцо + Болото = Ящерица|ящерица|"))
	(halt)
)

(defrule Rule_65
	(declare (salience 40))
	(fact (name земля))
	(fact (name ящерица))
	=>
	(assert (fact (name зверь)))
	(assert(sendmessagehalt " Ящерица + Земля = Зверь|зверь|"))
	(halt)
)

(defrule Rule_66
	(declare (salience 40))
	(fact (name вода))
	(fact (name зверь))
	=>
	(assert (fact (name кит)))
	(assert(sendmessagehalt " Зверь + Вода = Кит |кит|"))
	(halt)
)

(defrule Rule_67
	(declare (salience 40))
	(fact (name человек))
	(fact (name зверь))
	=>
	(assert (fact (name домашний_скот)))
	(assert(sendmessagehalt " Зверь + Человек = Домашний скот|домашний скот|"))
	(halt)
)

(defrule Rule_68
	(declare (salience 40))
	(fact (name человек))
	(fact (name домашний_скот))
	=>
	(assert (fact (name молоко)))
	(assert(sendmessagehalt " Человек + Домашний скот = Молоко|молоко|"))
	(halt)
)

(defrule Rule_69
	(declare (salience 40))
	(fact (name человек))
	(fact (name домашний_скот))
	=>
	(assert (fact (name мясо)))
	(assert(sendmessagehalt " Человек + Домашний скот = Мясо|мясо|"))
	(halt)
)

(defrule Rule_70
	(declare (salience 40))
	(fact (name человек))
	(fact (name домашний_скот))
	=>
	(assert (fact (name шерсть)))
	(assert(sendmessagehalt " Человек + Домашний скот = Шерсть|шерсть|"))
	(halt)
)

(defrule Rule_71
	(declare (salience 40))
	(fact (name человек))
	(fact (name молоко))
	=>
	(assert (fact (name женщина)))
	(assert(sendmessagehalt " Молоко + Человек = Женщина|женщина|"))
	(halt)
)

(defrule Rule_72
	(declare (salience 40))
	(fact (name металл))
	(fact (name птица))
	=>
	(assert (fact (name самолет)))
	(assert(sendmessagehalt " Металл + Птица = Самолет|самолет|"))
	(halt)
)

(defrule Rule_73
	(declare (salience 40))
	(fact (name семена))
	(fact (name грязь))
	=>
	(assert (fact (name цветок)))
	(assert(sendmessagehalt " Семена + Грязь = Цветок |цветок|"))
	(halt)
)

(defrule Rule_74
	(declare (salience 40))
	(fact (name пустыня))
	(fact (name зверь))
	=>
	(assert (fact (name верблюд)))
	(assert(sendmessagehalt " Пустыня + Зверь = Верблюд|верблюд|"))
	(halt)
)

(defrule Rule_75
	(declare (salience 40))
	(fact (name грязь))
	(fact (name гриб))
	=>
	(assert (fact (name плесень)))
	(assert(sendmessagehalt " Грязь + Гриб = Плесень|плесень|"))
	(halt)
)

(defrule Rule_76
	(declare (salience 40))
	(fact (name вода))
	(fact (name бактерии))
	=>
	(assert (fact (name вода)))
	(assert(sendmessagehalt " Вода + Бактерии = Планктон |вода|"))
	(halt)
)

(defrule Rule_77
	(declare (salience 40))
	(fact (name дракон))
	(fact (name человек))
	=>
	(assert (fact (name пепел)))
	(assert(sendmessagehalt " Дракон + Человек = Пепел|пепел|"))
	(halt)
)

(defrule Rule_78
	(declare (salience 40))
	(fact (name пляж))
	(fact (name яйцо))
	=>
	(assert (fact (name черепаха)))
	(assert(sendmessagehalt " Пляж + Яйцо = Черепаха|черепаха|"))
	(halt)
)

(defrule Rule_79
	(declare (salience 40))
	(fact (name призрак))
	(fact (name энергия))
	=>
	(assert (fact (name эктоплазма)))
	(assert(sendmessagehalt " Призрак + Энергия = Эктоплазма |эктоплазма|"))
	(halt)
)

(defrule Rule_80
	(declare (salience 40))
	(fact (name дерево))
	(fact (name жизнь))
	=>
	(assert (fact (name энты)))
	(assert(sendmessagehalt " Дерево + Жизнь = Энты|энты|"))
	(halt)
)

(defrule Rule_81
	(declare (salience 40))
	(fact (name воздух))
	(fact (name бактерии))
	=>
	(assert (fact (name грипп)))
	(assert(sendmessagehalt " Воздух + Бактерии = Грипп |грипп|"))
	(halt)
)

(defrule Rule_82
	(declare (salience 40))
	(fact (name воздух))
	(fact (name электричество))
	=>
	(assert (fact (name озон)))
	(assert(sendmessagehalt " Воздух + Электричество = Озон |озон|"))
	(halt)
)

(defrule Rule_83
	(declare (salience 40))
	(fact (name электричество))
	(fact (name зомби))
	=>
	(assert (fact (name франкенштейн)))
	(assert(sendmessagehalt " Электричество + Зомби = Франкенштейн|франкенштейн|"))
	(halt)
)

(defrule Rule_84
	(declare (salience 40))
	(fact (name труп))
	(fact (name птица))
	=>
	(assert (fact (name гриф)))
	(assert(sendmessagehalt " Труп + Птица = Гриф|гриф|"))
	(halt)
)

(defrule Rule_85
	(declare (salience 40))
	(fact (name инструменты))
	(fact (name камень))
	=>
	(assert (fact (name статуя)))
	(assert(sendmessagehalt " Инструменты + Камень = Статуя |статуя|"))
	(halt)
)

(defrule Rule_86
	(declare (salience 40))
	(fact (name инструменты))
	(fact (name мясо))
	=>
	(assert (fact (name нож)))
	(assert(sendmessagehalt " Инструменты + Мясо = Нож|нож|"))
	(halt)
)

(defrule Rule_87
	(declare (salience 40))
	(fact (name инструменты))
	(fact (name дерево))
	=>
	(assert (fact (name древесина)))
	(assert(sendmessagehalt " Инструменты + Дерево = Древесина|древесина|"))
	(halt)
)

(defrule Rule_88
	(declare (salience 40))
	(fact (name инструменты))
	(fact (name шерсть))
	=>
	(assert (fact (name ткань)))
	(assert(sendmessagehalt " Инструменты + Шерсть = Ткань|ткань|"))
	(halt)
)

(defrule Rule_89
	(declare (salience 40))
	(fact (name инструменты))
	(fact (name древесина))
	=>
	(assert (fact (name колесо)))
	(assert(sendmessagehalt " Инструменты + Древесина = Колесо|колесо|"))
	(halt)
)

(defrule Rule_90
	(declare (salience 40))
	(fact (name человек))
	(fact (name оружие))
	=>
	(assert (fact (name охотник)))
	(assert(sendmessagehalt " Человек + Оружие = Охотник|охотник|"))
	(halt)
)

(defrule Rule_91
	(declare (salience 40))
	(fact (name огонь))
	(fact (name водоросли))
	=>
	(assert (fact (name йод)))
	(assert(sendmessagehalt " Огонь + Водоросли = Йод |йод|"))
	(halt)
)

(defrule Rule_92
	(declare (salience 40))
	(fact (name земля))
	(fact (name динозавр))
	=>
	(assert (fact (name окаменелость)))
	(assert(sendmessagehalt " Земля + Динозавр = Окаменелость|окаменелость|"))
	(halt)
)

(defrule Rule_93
	(declare (salience 40))
	(fact (name земля))
	(fact (name древесина))
	=>
	(assert (fact (name виноград)))
	(assert(sendmessagehalt " Земля + Древесина = Виноград |виноград|"))
	(halt)
)

(defrule Rule_94
	(declare (salience 40))
	(fact (name земля))
	(fact (name инструменты))
	=>
	(assert (fact (name пашня)))
	(assert(sendmessagehalt " Земля + Инструменты = Пашня|пашня|"))
	(halt)
)

(defrule Rule_95
	(declare (salience 40))
	(fact (name мясо))
	(fact (name огонь))
	=>
	(assert (fact (name жареное_мясо)))
	(assert(sendmessagehalt " Мясо + Огонь = Жареное мясо|жареное мясо|"))
	(halt)
)

(defrule Rule_96
	(declare (salience 40))
	(fact (name порох))
	(fact (name оружие))
	=>
	(assert (fact (name огнестрельное_оружие)))
	(assert(sendmessagehalt " Порох + Оружие = Огнестрельное оружие|огнестрельное оружие|"))
	(halt)
)

(defrule Rule_97
	(declare (salience 40))
	(fact (name человек))
	(fact (name огнестрельное_оружие))
	=>
	(assert (fact (name солдат)))
	(assert(sendmessagehalt " Человек + Огнестрельное оружие = Солдат|солдат|"))
	(halt)
)

(defrule Rule_98
	(declare (salience 40))
	(fact (name охотник))
	(fact (name оружие))
	=>
	(assert (fact (name воин)))
	(assert(sendmessagehalt " Охотник + Оружие = Воин|воин|"))
	(halt)
)

(defrule Rule_99
	(declare (salience 40))
	(fact (name огнестрельное_оружие))
	(fact (name воин))
	=>
	(assert (fact (name солдат)))
	(assert(sendmessagehalt " Огнестрельное оружие + Воин = Солдат|солдат|"))
	(halt)
)

(defrule Rule_100
	(declare (salience 40))
	(fact (name дракон))
	(fact (name воин))
	=>
	(assert (fact (name кровь)))
	(assert(sendmessagehalt " Дракон + Воин = Кровь |кровь|"))
	(halt)
)

(defrule Rule_101
	(declare (salience 40))
	(fact (name колесо))
	(fact (name древесина))
	=>
	(assert (fact (name телега)))
	(assert(sendmessagehalt " Колесо + Древесина = Телега|телега|"))
	(halt)
)

(defrule Rule_102
	(declare (salience 40))
	(fact (name земля))
	(fact (name планктон))
	=>
	(assert (fact (name червь)))
	(assert(sendmessagehalt " Земля + Планктон = Червь|червь|"))
	(halt)
)

(defrule Rule_103
	(declare (salience 40))
	(fact (name червь))
	(fact (name воздух))
	=>
	(assert (fact (name бабочка)))
	(assert(sendmessagehalt " Червь + Воздух = Бабочка|бабочка|"))
	(halt)
)

(defrule Rule_104
	(declare (salience 40))
	(fact (name червь))
	(fact (name земля))
	=>
	(assert (fact (name жук)))
	(assert(sendmessagehalt " Червь + Земля = Жук|жук|"))
	(halt)
)

(defrule Rule_105
	(declare (salience 40))
	(fact (name огонь))
	(fact (name червь))
	=>
	(assert (fact (name пепел)))
	(assert(sendmessagehalt " Огонь + Червь = Пепел|пепел|"))
	(halt)
)

(defrule Rule_106
	(declare (salience 40))
	(fact (name огонь))
	(fact (name хижина))
	=>
	(assert (fact (name пепел)))
	(assert(sendmessagehalt " Огонь + Хижина = Пепел|пепел|"))
	(halt)
)

(defrule Rule_107
	(declare (salience 40))
	(fact (name огонь))
	(fact (name энты))
	=>
	(assert (fact (name призрак)))
	(assert(sendmessagehalt " Огонь + Энты = Призрак|призрак|"))
	(halt)
)

(defrule Rule_108
	(declare (salience 40))
	(fact (name грипп))
	(fact (name человек))
	=>
	(assert (fact (name больной)))
	(assert(sendmessagehalt " Грипп + Человек = Больной |больной|"))
	(halt)
)

(defrule Rule_109
	(declare (salience 40))
	(fact (name колесо))
	(fact (name шерсть))
	=>
	(assert (fact (name прялка)))
	(assert(sendmessagehalt " Колесо + Шерсть = Прялка|прялка|"))
	(halt)
)

(defrule Rule_110
	(declare (salience 40))
	(fact (name планктон))
	(fact (name камень))
	=>
	(assert (fact (name ракушки)))
	(assert(sendmessagehalt " Планктон + Камень = Ракушки|ракушки|"))
	(halt)
)

(defrule Rule_111
	(declare (salience 40))
	(fact (name давление))
	(fact (name древесина))
	=>
	(assert (fact (name бумага)))
	(assert(sendmessagehalt " Давление + Древесина = Бумага |бумага|"))
	(halt)
)

(defrule Rule_112
	(declare (salience 40))
	(fact (name самолет))
	(fact (name металл))
	=>
	(assert (fact (name алюминий)))
	(assert(sendmessagehalt " Самолет + Металл = Алюминий|алюминий|"))
	(halt)
)

(defrule Rule_113
	(declare (salience 40))
	(fact (name алюминий))
	(fact (name стекло))
	=>
	(assert (fact (name зеркало)))
	(assert(sendmessagehalt " Алюминий + Стекло = Зеркало|зеркало|"))
	(halt)
)

(defrule Rule_114
	(declare (salience 40))
	(fact (name камень))
	(fact (name бумага))
	=>
	(assert (fact (name известняк)))
	(assert(sendmessagehalt " Камень + Ракушки = Известняк|известняк|"))
	(halt)
)

(defrule Rule_115
	(declare (salience 40))
	(fact (name бактерии))
	(fact (name виноград))
	=>
	(assert (fact (name вино)))
	(assert(sendmessagehalt " Бактерии + Виноград = Вино|вино|"))
	(halt)
)

(defrule Rule_116
	(declare (salience 40))
	(fact (name цветок))
	(fact (name дерево))
	=>
	(assert (fact (name фрукт)))
	(assert(sendmessagehalt " Цветок + Дерево = Фрукт |фрукт|"))
	(halt)
)

(defrule Rule_117
	(declare (salience 40))
	(fact (name птица))
	(fact (name грипп))
	=>
	(assert (fact (name птичий_грипп)))
	(assert(sendmessagehalt " Птица + Грипп = Птичий грипп|птичий грипп|"))
	(halt)
)

(defrule Rule_118
	(declare (salience 40))
	(fact (name человек))
	(fact (name пар))
	=>
	(assert (fact (name сауна)))
	(assert(sendmessagehalt " Человек + Пар = Сауна|сауна|"))
	(halt)
)

(defrule Rule_119
	(declare (salience 40))
	(fact (name море))
	(fact (name вулкан))
	=>
	(assert (fact (name остров)))
	(assert(sendmessagehalt " Вулкан + Море = Остров|остров|"))
	(halt)
)

(defrule Rule_120
	(declare (salience 40))
	(fact (name огонь))
	(fact (name уголь))
	=>
	(assert (fact (name энергия)))
	(assert(sendmessagehalt " Уголь + Огонь = Энергия|энергия|"))
	(halt)
)

(defrule Rule_121
	(declare (salience 40))
	(fact (name Максим_Галкин))
	(fact (name Алла_Пугачёва))
	=>
	(assert (fact (name Филипп_Киркоров_)))
	(assert(sendmessagehalt " Алла Пугачёва + Максим Галкин = Филипп Киркоров|Филипп Киркоров |"))
	(halt)
)

(defrule Rule_122
	(declare (salience 40))
	(fact (name прялка))
	(fact (name известняк))
	=>
	(assert (fact (name Филипп_Киркоров_)))
	(assert(sendmessagehalt " прялка + известняк = Филипп Киркоров|Филипп Киркоров |"))
	(halt)
)

