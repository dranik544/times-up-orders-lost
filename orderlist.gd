extends Node

# OrderList.gd (AutoLoad)

# frmt форматы:
# {"???": {"type": "rand_bool"}}
# игра случайным образом выберет TRUE или FALSE
# 
# {"???": {"type": "rand_int", "min": 0, "max": 10, "step": 2}}
# игра случайным образом выберет число от MIN до MAX с шагом STEP
# 
# {"???": {"type": "rand_option", "pool": ["godot", "engine", "3.6.2", "stable"]}}
# игра случайным образом выберет верный ответ для ???_index из этого списка и даст этот же список по запросу ???_text
# 
# {"???": {"type": "rand_text", "pool": ["godot", "engine", "game"]}}
# игра случайным образом выберет какой-нибудь вариант из списка и сочтёт его верным
# 
# в будущем возможно будет пополняться



var orders: Array = [
	# ---------- СТАРТОВЫЙ ЗАКАЗ (type=1, tag=-1) ----------
	{
		"name": "Drimer544 (создатель игры)",
		"desc": "[center][b]ПЕРВЫЙ ЗАКАЗ![/b][/center]\nПривет! Это тестовое задание. Нужно отметить первый пункт как выполненный, во втором выбрать третий вариант, а в третьем поставить метку ровно на пять.\n[wave]После заполнения нажми зелёную кнопку.[/wave]\nНе опоздай — иначе провал. Кнопка пропуска внизу — если совсем не хочешь браться.\nЧитай внимательно: любая ошибка — и отзыв будет плохим. [color=#ff0000]Две звезды — и ты вылетаешь.[/color]",
		"good review": "Отлично, ты всё сделал правильно! Теперь жди настоящих заказов.",
		"bad review": "[color=#ff8880]Провалить первый заказ?.. Ты серьёзно?..[/color]",
		"time": 145,
		"money": 10000,
		"ready text": "ГОТОВО!",
		"cancel text": "Пропустить",
		"tags": -1,
		"type": 1,
		"mods": {},
		"frmt": {
			
		},
		"prms": [
					{
						"type": "check",
						"text": "Пункт N1",
						"stat": true
					},
					{
						"type": "option",
						"text": "Пункт N2",
						"items": ["1", "2", "3", "4", "5", "6"],
						"indx": 2
					},
					{
						"type": "slider",
						"text": "Пункт N3",
						"step": 1,
						"min value": 3,
						"max value": 6,
						"min d value": 5,
						"max d value": 5
					}
		]
	},
	# ---------- СЮЖЕТНЫЙ ЗАКАЗ ПОСЛЕ ОТНОШЕНИЙ (type=5, tag=-1) ----------
	{
		"name": "Drimer544 (создатель игры)",
		"desc": "[center][b]Я СНОВА ЗДЕСЬ![/b][/center]\nС возвращением! Удивительно, что ты ещё не вышел из игры. Ты мог заметить, что сбоку появилась ещё одна панель - [color=#e4ffcc]состояние отношений[/color]. Не буду скрывать, она напрямую повлияет на твой титул в конце, тоесть, концовку. Не переживай, после титула ты сможешь продолжить свой [wave]бесконечный поток заказов[/wave]. Теперь, наверное, я больше не вернусь к тебе.\n[color=#fff700][center][b]Прощай!",
		"good review": "Больше не увидимся чувак!",
		"bad review": "Больше не увидимся чувак!",
		"time": 145,
		"money": 0,
		"ready text": "Принял!",
		"cancel text": "Ой, чепуха.",
		"tags": -1,
		"type": 5,
		"frmt": {
			
		},
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
	},
	# ---------- 1. Умный дом от Васи (DEFAULT, tag=1) ----------
	{
		"name": "Вася (сосед)",
		"desc": "[center][b]Слышь, сделай мне умный дом![/b][/center]\nНо чтобы сам всё делал, понимаешь? Я в этом не шарю. Короче, [color=#00ccff]настрой там всё как надо[/color], а я потом посмотрю. Главное, чтобы работало, а не как у прошлого ... кхм. Давай, жду!\n\n[color=#ff8800]P.S.[/color] Если что-то пойдёт не так, я буду [b]очень[/b] расстроен.\n\nУведомления присылать? {notify}. Температуру сделай от {t_min} до {t_max} градусов, ну чтобы [i]комфортно[/i] было. Подсветку хочу [color=#ff66aa]{color}[/color], а не эту скучную белую. И пароль поставь {secret}, только никому не говори. Авто-управление пусть будет {auto}. Количество сценариев: {sc} штук. Язык интерфейса: {lang}.",
		"good review": "О, работает! Даже лучше, чем я думал. Спасибо, чувак!",
		"bad review": "Ничего не работает! Опять эти ваши программисты...",
		"time": 90,
		"money": 1500,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"notify": {"type": "rand_bool"},
			"t_min": {"type": "rand_int", "min": 18, "max": 22, "step": 1},
			"t_max": {"type": "rand_int", "min": 24, "max": 28, "step": 1},
			"color": {"type": "rand_option", "pool": ["синий", "зелёный", "красный"]},
			"secret": {"type": "rand_text", "pool": ["opensesame", "magic", "home"]},
			"auto": {"type": "rand_bool"},
			"sc": {"type": "rand_int", "min": 3, "max": 7, "step": 1},
			"lang": {"type": "rand_option", "pool": ["русский", "английский", "испанский"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Уведомления о событиях",
				"stat": "{notify}"
			},
			{
				"type": "slider",
				"text": "Диапазон температуры",
				"step": 1,
				"min value": 10,
				"max value": 35,
				"min d value": "{t_min}",
				"max d value": "{t_max}"
			},
			{
				"type": "option",
				"text": "Цвет",
				"items": ["синий", "зелёный", "красный"],
				"indx": "{color_index}"
			},
			{
				"type": "line",
				"text": "Пароль доступа",
				"ph text": "введите код",
				"correct": "{secret}"
			},
			{
				"type": "check",
				"text": "Авто-управление",
				"stat": "{auto}"
			},
			{
				"type": "slider",
				"text": "Количество сценариев",
				"step": 1,
				"min value": 1,
				"max value": 10,
				"min d value": "{sc}",
				"max d value": "{sc}"
			},
			{
				"type": "option",
				"text": "Язык интерфейса",
				"items": ["Русский", "Английский", "Испанский"],
				"indx": "{lang_index}"
			}
		]
	},
	# ---------- 2. Космическая станция (RARE, tag=2) ----------
	{
		"name": "Геннадий (инженер)",
		"desc": "[center][b]Слушай сюда, это серьёзно![/b][/center]\nДелаем систему для космической станции. Тут тебе не игрушки! [color=#ff4444]Ошибка = смерть[/color], понял? [wave]Ну, или просто увольнение...[/wave]\nКороче, [shake]внимательно[/shake] смотри параметры.\n\nКислород: минимум {o2_min}, максимум {o2_max}. Гравитацию поставь {gravity} процентов. Охлаждение: {cool}. Связь с Землёй? {comm}. Код доступа: {code}. Количество резервных систем: {backup}.",
		"good review": "Отлично! Все системы работают. Ты спас экипаж!",
		"bad review": "Ты что наделал?! У нас тут [b]критическая ошибка[/b]!",
		"time": 120,
		"money": 3000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 3},
		"frmt": {
			"o2_min": {"type": "rand_int", "min": 18, "max": 20, "step": 1},
			"o2_max": {"type": "rand_int", "min": 22, "max": 25, "step": 1},
			"gravity": {"type": "rand_int", "min": 70, "max": 90, "step": 5},
			"cool": {"type": "rand_option", "pool": ["активная", "пассивная", "гибридная"]},
			"comm": {"type": "rand_bool"},
			"code": {"type": "rand_text", "pool": ["alpha", "beta", "gamma", "delta"]},
			"backup": {"type": "rand_int", "min": 2, "max": 5, "step": 1}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Уровень кислорода",
				"step": 1,
				"min value": 10,
				"max value": 30,
				"min d value": "{o2_min}",
				"max d value": "{o2_max}"
			},
			{
				"type": "slider",
				"text": "Гравитация",
				"step": 5,
				"min value": 50,
				"max value": 120,
				"min d value": "{gravity}",
				"max d value": "{gravity}"
			},
			{
				"type": "option",
				"text": "Тип охлаждения",
				"items": ["активная", "пассивная", "гибридная"],
				"indx": "{cool_index}"
			},
			{
				"type": "check",
				"text": "Поддержка радиосвязи",
				"stat": "{comm}"
			},
			{
				"type": "line",
				"text": "Код доступа",
				"ph text": "введите код",
				"correct": "{code}"
			},
			{
				"type": "slider",
				"text": "Резервные системы",
				"step": 1,
				"min value": 1,
				"max value": 10,
				"min d value": "{backup}",
				"max d value": "{backup}"
			}
		]
	},
	# ---------- 3. Заметки от Леночки (MESSAGE, tag=1) ----------
	{
		"name": "Леночка (подруга)",
		"desc": "[center][b]Привет! Сделай мне приложение для заметок![/b][/center]\nА то я вечно всё забываю... [color=#ff66aa]Записки[/color] бы сохранять, а то у меня [s]голова дырявая[/s].\nКороче, сделай что-нибудь [i]простое[/i], но чтобы работало. [wave]Пожалуйста![/wave]\n\nТёмная тема? {dark}. Шрифт сделай {font_size}. Сортировка: {sort}. Категория по умолчанию: {category}. Автосохранение? {autosave}. Количество заметок на странице: {notes_count}.",
		"good review": "Ой, спасибо! Теперь я ничего не забываю! Ты гений!",
		"bad review": "Ничего не работает... Я опять всё забыла...",
		"time": 60,
		"money": 800,
		"ready text": "ГОТОВО",
		"cancel text": "Не успеваю",
		"tags": 1,
		"type": 3,
		"mods": {"safe cancel": true},
		"frmt": {
			"dark": {"type": "rand_bool"},
			"font_size": {"type": "rand_int", "min": 12, "max": 18, "step": 1},
			"sort": {"type": "rand_option", "pool": ["по дате", "по алфавиту", "по важности"]},
			"category": {"type": "rand_text", "pool": ["личные", "рабочие", "учеба"]},
			"autosave": {"type": "rand_bool"},
			"notes_count": {"type": "rand_int", "min": 5, "max": 15, "step": 1}
		},
		"prms": [
			{
				"type": "check",
				"text": "Включить тёмную тему",
				"stat": "{dark}"
			},
			{
				"type": "slider",
				"text": "Размер шрифта",
				"step": 1,
				"min value": 10,
				"max value": 24,
				"min d value": "{font_size}",
				"max d value": "{font_size}"
			},
			{
				"type": "option",
				"text": "Сортировка",
				"items": ["по дате", "по алфавиту", "по важности"],
				"indx": "{sort_index}"
			},
			{
				"type": "line",
				"text": "Категория",
				"ph text": "введите категорию",
				"correct": "{category}"
			},
			{
				"type": "check",
				"text": "Автосохранение",
				"stat": "{autosave}"
			},
			{
				"type": "slider",
				"text": "Заметок на странице",
				"step": 1,
				"min value": 3,
				"max value": 20,
				"min d value": "{notes_count}",
				"max d value": "{notes_count}"
			}
		]
	},
	# ---------- 4. Квантовый компьютер (EMERGENCY, tag=3) ----------
	{
		"name": "Профессор (квантовая физика)",
		"desc": "[center][b][color=#ff00ff]СРОЧНО! КВАНТОВЫЙ КОМПЬЮТЕР![/color][/b][/center]\nПрофессор требует! Нужно настроить [b]квантовый процессор[/b] для [i]эксперимента[/i]. [shake]Времени мало![/shake]\nЕсли всё сделаешь правильно, возможно, мы [color=#00ff00]изменим реальность[/color]. Или нет. [wave]Но попытаться стоит![/wave]\n\nКоличество кубитов: от {q_min} до {q_max}. Алгоритм шифрования: {algo}. Время выполнения: {time_mcs} микросекунд. Точность? {precision}. Пароль админа: {admin_pass}. Количество вентилей: {gates}. Язык программирования: {lang}.",
		"good review": "[color=#00ff00]Невероятно![/color] Квантовый компьютер готов, реальность спасена!",
		"bad review": "[color=#ff4444]Катастрофа![/color] Всё пошло по квантовой... Вселенная в опасности!",
		"time": 150,
		"money": 5000,
		"ready text": "ГОТОВО",
		"cancel text": "Это за гранью",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"frmt": {
			"q_min": {"type": "rand_int", "min": 50, "max": 60, "step": 5},
			"q_max": {"type": "rand_int", "min": 70, "max": 85, "step": 5},
			"algo": {"type": "rand_option", "pool": ["rsa", "ecc", "quantum"]},
			"time_mcs": {"type": "rand_int", "min": 100, "max": 300, "step": 10},
			"precision": {"type": "rand_bool"},
			"admin_pass": {"type": "rand_text", "pool": ["qwerty", "admin123", "quantum", "secure"]},
			"gates": {"type": "rand_int", "min": 1000, "max": 5000, "step": 100},
			"lang": {"type": "rand_option", "pool": ["python", "c++", "rust", "q#"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество кубитов",
				"step": 5,
				"min value": 10,
				"max value": 100,
				"min d value": "{q_min}",
				"max d value": "{q_max}"
			},
			{
				"type": "option",
				"text": "Шифрование",
				"items": ["RSA", "ECC", "Quantum"],
				"indx": "{algo_index}"
			},
			{
				"type": "slider",
				"text": "Время выполнения",
				"step": 10,
				"min value": 50,
				"max value": 500,
				"min d value": "{time_mcs}",
				"max d value": "{time_mcs}"
			},
			{
				"type": "check",
				"text": "Высокая точность",
				"stat": "{precision}"
			},
			{
				"type": "line",
				"text": "Пароль админа",
				"ph text": "введите пароль",
				"correct": "{admin_pass}"
			},
			{
				"type": "slider",
				"text": "Количество логических вентилей",
				"step": 100,
				"min value": 100,
				"max value": 10000,
				"min d value": "{gates}",
				"max d value": "{gates}"
			},
			{
				"type": "option",
				"text": "Язык",
				"items": ["Python", "C++", "Rust", "Q#"],
				"indx": "{lang_index}"
			}
		]
	},
	# ---------- 5. Теневая сделка (DARKNET, tag=2) ----------
	{
		"name": "'Кролик' (тёмный делец)",
		"desc": "[center][b][color=#444444]Тёмная сторона силы...[/color][/b][/center]\nСлышь, есть одно [i]дело[/i]. [shake]Нужна площадка[/shake] для... ну, ты понял. [wave]Анонимность[/wave] — наше всё.\n[color=#ff8800]Не спались![/color]\n\nШифрование: {encrypt}. Уровень анонимности: {anon_level}. Валюта: {currency}. Кодовое слово: {keyword}. Количество зеркал: {mirrors}.",
		"good review": "Площадка работает. Ты чист. Продолжай в том же духе.",
		"bad review": "Нас вычислили... [b]Ты всё испортил![/b]",
		"time": 100,
		"money": 4000,
		"ready text": "ГОТОВО",
		"cancel text": "Не хочу рисковать",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 2},
		"frmt": {
			"encrypt": {"type": "rand_bool"},
			"anon_level": {"type": "rand_int", "min": 3, "max": 7, "step": 1},
			"currency": {"type": "rand_option", "pool": ["btc", "xmr", "eth"]},
			"keyword": {"type": "rand_text", "pool": ["тень", "секрет", "нуар"]},
			"mirrors": {"type": "rand_int", "min": 2, "max": 5, "step": 1}
		},
		"prms": [
			{
				"type": "check",
				"text": "Включить сквозное шифрование",
				"stat": "{encrypt}"
			},
			{
				"type": "slider",
				"text": "Уровень анонимности",
				"step": 1,
				"min value": 1,
				"max value": 10,
				"min d value": "{anon_level}",
				"max d value": "{anon_level}"
			},
			{
				"type": "option",
				"text": "Криптовалюта",
				"items": ["BTC", "XMR", "ETH"],
				"indx": "{currency_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{keyword}"
			},
			{
				"type": "slider",
				"text": "Зеркала сайта",
				"step": 1,
				"min value": 1,
				"max value": 8,
				"min d value": "{mirrors}",
				"max d value": "{mirrors}"
			}
		]
	},
	# ---------- 6. Кастомный: Кофейня (CUSTOM, tag=1) ----------
	{
		"name": "Бариста (кофейня)",
		"desc": "[center][b]Сделайте сайт с меню и бронированием столиков.[/b][/center]\nДизайн уютный, коричневые тона. Карта лояльности не нужна, только промокоды.\n\nКарта лояльности не нужна. Промокоды пусть будут. Онлайн-бронирование столиков обязательно. Цветовая гамма: Коричневые тона. Кодовое слово: coffee. Количество столиков: {tables}.",
		"good review": "Сайт красивый, заказы принимаем, бронирование работает.",
		"bad review": "Где карта лояльности? Я хотел накапливать бонусы!",
		"time": 55,
		"money": 21000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"tables": {"type": "rand_int", "min": 8, "max": 15, "step": 1}
		},
		"prms": [
			{
				"type": "check",
				"text": "Карта лояльности",
				"stat": false
			},
			{
				"type": "check",
				"text": "Промокоды",
				"stat": true
			},
			{
				"type": "check",
				"text": "Бронирование столиков",
				"stat": true
			},
			{
				"type": "option",
				"text": "Цветовая гамма",
				"items": ["Коричневые тона", "Чёрно-белая", "Зелёная"],
				"indx": 0
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "coffee"
			},
			{
				"type": "slider",
				"text": "Количество столиков",
				"step": 1,
				"min value": 4,
				"max value": 20,
				"min d value": "{tables}",
				"max d value": "{tables}"
			}
		]
	},
	# ---------- 7. Egor2001 (DEFAULT, tag=2) ----------
	{
		"name": "Styopa2011 (сайт для взрослых)",
		"desc": "[center][b]Здравствуйте, сделайте сайт для продажи [color=#e39cff]дилдаков[/color].[/b][/center]\nБюджет 20-30тыс. Должно работать на телефонах.\nСоздайте 3, [wave]нет[/wave], 4 вкладки категорий товаров.\n[color=#ff8800]Хотя тогда бюджет надо увеличить до 25-35тыс.[/color]\nИ ещё, я передумал, сделайте [b]2[/b] только вкладки категорий товаров.\n[shake]И ещё пусть сайт будет [color=#9cc0ff]синего[/color] цвета.[/shake]\n[color=#ff0000][shake]Нужно срочно за час сделать![/shake][/color]\n\nБюджет поставь {budget} тысяч. Количество вкладок категорий: {tabs}. Цвет дизайна: {color}. Мобильная поддержка? {mobile}. Секретное слово: {secret}.",
		"good review": "САМЫЙ ЛУЧШИЙ СОЗДАТЕЛЬ САЙТОВ В МИИИИИРЕЕЕЕЕЕЕ!!!",
		"bad review": "ИЗ-ЗА ЭТОГО Х##СОСА МОЙ БИЗНЕС СГОРЕЛ К Е#ЕНЯМ!!!",
		"time": 50,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"budget": {"type": "rand_int", "min": 25, "max": 35, "step": 2},
			"tabs": {"type": "rand_int", "min": 1, "max": 3, "step": 1},
			"color": {"type": "rand_option", "pool": ["красный", "синий", "зелёный", "фиолетовый"]},
			"mobile": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["stepan567", "chizhevich909", "1+1film", "dildo1019"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Бюджет (тыс. руб)",
				"step": 2,
				"min value": 5,
				"max value": 60,
				"min d value": "{budget}",
				"max d value": "{budget}"
			},
			{
				"type": "slider",
				"text": "Кол-во вкладок",
				"step": 1,
				"min value": 0,
				"max value": 6,
				"min d value": "{tabs}",
				"max d value": "{tabs}"
			},
			{
				"type": "option",
				"text": "Цвет дизайна",
				"items": ["красный", "синий", "зелёный", "фиолетовый"],
				"indx": "{color_index}"
			},
			{
				"type": "check",
				"text": "Мобильная поддержка",
				"stat": "{mobile}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 8. ООО Ромашка (DEFAULT, tag=2) ----------
	{
		"name": "ООО Ромашка (CRM)",
		"desc": "[center][b]Срочно! Нужна CRM для управления клиентами.[/b][/center]\nТребования: хранение контактов (имя, телефон, email), [i]история звонков[/i], возможность ставить задачи.\n[color=#0088cc]База данных – SQLite.[/color]\nИнтерфейс – веб-морда.\n[wave]Сделать за 2 дня. Бюджет 50 000 руб.[/wave]\n\nКоличество полей в контакте: {fields}. Тип базы данных: {db}. История звонков? {history}. Кодовое слово администратора: {admin_word}.",
		"good review": "Профессионально, быстро, всё работает. Рекомендую!",
		"bad review": "Не доделали, баги, интерфейс неудобный. Деньги на ветер.",
		"time": 65,
		"money": 50000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"fields": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"db": {"type": "rand_option", "pool": ["sqlite", "postgresql", "mongodb"]},
			"history": {"type": "rand_bool"},
			"admin_word": {"type": "rand_text", "pool": ["admin", "root", "secret", "crm"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество полей",
				"step": 1,
				"min value": 3,
				"max value": 10,
				"min d value": "{fields}",
				"max d value": "{fields}"
			},
			{
				"type": "option",
				"text": "Тип БД",
				"items": ["SQLite", "PostgreSQL", "MongoDB"],
				"indx": "{db_index}"
			},
			{
				"type": "check",
				"text": "Включить историю звонков",
				"stat": "{history}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{admin_word}"
			}
		]
	},
	# ---------- 9. KotikGames (DEFAULT, tag=2) ----------
	{
		"name": "KotikGames",
		"desc": "[center][b]Привет! Хотим игру про котиков.[/b][/center]\nНо не простую, а [i]хоррор-выживалку[/i].\nКотики должны быть милыми, но злыми, они охотятся на игрока.\n[color=#ffaa00]Графика – пиксельная, но с элементами 3D.[/color]\nА, и ещё добавьте режим строительства базы.\n[wave]И котики должны уметь говорить по-английски с акцентом.[/wave]\n[shake]Стоп, убираем строительство, добавляем прокачку котиков.[/shake]\nНет, давайте просто сделаем котиков-танкистов.\n[color=#ff44aa]Короче, сделайте игру, где котики стреляют лазерами из глаз, а игрок должен их гладить, чтобы они не взорвались.[/color]\n[center][b]В общем, сделайте что-то с котиками, чтобы было весело.[/b][/center]\n\nКоличество котиков: {cats}. Оружие котиков: {weapon}. Многопользовательский режим? {multi}. Секретное слово: {secret}.",
		"good review": "Ха-ха, прикольно, котики стреляют! Друзья в восторге!",
		"bad review": "Это не то, что мы просили! Где строительство? Где хоррор? Полный бред!",
		"time": 80,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Это безумие",
		"tags": 2,
		"type": 0,
		"mods": {"safe cancel": true},
		"frmt": {
			"cats": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"weapon": {"type": "rand_option", "pool": ["лазеры", "когти", "мяу-волны", "бомбы"]},
			"multi": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["meow", "purr", "cat"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество котиков",
				"step": 1,
				"min value": 1,
				"max value": 20,
				"min d value": "{cats}",
				"max d value": "{cats}"
			},
			{
				"type": "option",
				"text": "Оружие котиков",
				"items": ["Лазеры", "Когти", "Мяу-волны", "Бомбы"],
				"indx": "{weapon_index}"
			},
			{
				"type": "check",
				"text": "Многопользовательский режим",
				"stat": "{multi}"
			},
			{
				"type": "line",
				"text": "Секретное слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 10. FreshFoods (DEFAULT, tag=2) ----------
	{
		"name": "FreshFoods",
		"desc": "[center][b]Здравствуйте! Сделайте сайт для доставки здоровой еды.[/b][/center]\nДизайн в [color=#00aa00]зелёных тонах[/color].\nКаталог: салаты, супы, смузи.\n[color=#ff8800]Фильтр по калориям.[/color]\nВозможность оформить подписку на неделю.\n[wave]Так, стоп, мы решили расширить ассортимент – добавьте бургеры и пиццу.[/wave]\nНо они не здоровые, ну ладно.\n[shake]И уберите подписку, оставьте разовые заказы.[/shake]\nА ещё добавьте корзину и оплату картой.\n[color=#8888ff]И ещё мы хотим, чтобы была карта с ресторанами, где можно забрать заказ.[/color]\n[wave]Нет, это слишком сложно, просто доставка.[/wave]\n\nКоличество категорий в каталоге: {cat_count}. Основной цвет дизайна: {color}. Наличие подписки? {subscription}. Секретное слово: {secret}.",
		"good review": "Отличный сайт! Всё понятно, заказы принимаем, клиенты довольны.",
		"bad review": "Каша в голове! Где подписка? Где карта? Не доделали!",
		"time": 75,
		"money": 22000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {"safe cancel": true},
		"frmt": {
			"cat_count": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"color": {"type": "rand_option", "pool": ["зелёный", "синий", "красный", "жёлтый"]},
			"subscription": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["healthy", "green", "food"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество категорий",
				"step": 1,
				"min value": 1,
				"max value": 10,
				"min d value": "{cat_count}",
				"max d value": "{cat_count}"
			},
			{
				"type": "option",
				"text": "Цвет",
				"items": ["Зелёный", "Синий", "Красный", "Жёлтый"],
				"indx": "{color_index}"
			},
			{
				"type": "check",
				"text": "Подписка на неделю",
				"stat": "{subscription}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 11. FreelancerHack (DEFAULT, tag=1) ----------
	{
		"name": "FreelancerHack",
		"desc": "[center][b]Привет! Нужно сверстать лендинг для моего нового курса по заработку на фрилансе.[/b][/center]\nУ меня есть текст и картинки.\n[color=#ffaa00]Сделай красиво, современно, адаптивно.[/color]\n[wave]Срок – 2 часа, бюджет 3000 руб. Обычно на лендинге делают 5 секций — этого достаточно.[/wave]\n\nКоличество секций: {sections}. Адаптив под мобилки? {mobile}. Секретное слово: {secret}.",
		"good review": "Супер, лендинг готов, всё как просил! Быстро и качественно.",
		"bad review": "Обычный шаблон, ничего особенного, не стоит таких денег.",
		"time": 40,
		"money": 3000,
		"ready text": "ГОТОВО",
		"cancel text": "Не успеваю",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"sections": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"mobile": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["landing", "course", "money"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество секций",
				"step": 1,
				"min value": 3,
				"max value": 8,
				"min d value": "{sections}",
				"max d value": "{sections}"
			},
			{
				"type": "check",
				"text": "Адаптив",
				"stat": "{mobile}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 12. Стоматология (DEFAULT, tag=1) ----------
	{
		"name": "Стоматология 'Белая улыбка'",
		"desc": "[center]Нужен сайт с записью на приём.[/center]\nОбязательно: [b]форма записи[/b], [i]галерея работ[/i], [color=#0088ff]контакты[/color].\nДизайн в бело-голубых тонах.\n[wave]Уберите форму записи, лучше сделайте онлайн-консультацию.[/wave]\n[color=#ff8800]Итог: онлайн-консультация, галерея, контакты, бело-голубой.[/color]\n\nФорма записи? {form}. Онлайн-консультация? {online}. Цветовая гамма: {color}. Секретное слово: {secret}.",
		"good review": "Отлично! Онлайн-консультация работает, галерея шикарная. Спасибо!",
		"bad review": "Я просил форму записи, а не консультацию. Всё испортили!",
		"time": 45,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"form": {"type": "rand_bool"},
			"online": {"type": "rand_bool"},
			"color": {"type": "rand_option", "pool": ["бело-голубая", "тёмная", "ярко-жёлтая"]},
			"secret": {"type": "rand_text", "pool": ["tooth", "smile", "dentist"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Форма записи",
				"stat": "{form}"
			},
			{
				"type": "check",
				"text": "Онлайн-консультация",
				"stat": "{online}"
			},
			{
				"type": "option",
				"text": "Цветовая гамма",
				"items": ["Бело-голубая", "Тёмная", "Ярко-жёлтая"],
				"indx": "{color_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 13. Фитнес-клуб (DEFAULT, tag=2) ----------
	{
		"name": "Фитнес-клуб 'Качок'",
		"desc": "[center][b]Сделайте приложение для тренировок.[/b][/center]\nДолжны быть [color=#00ff00]упражнения с видео[/color], [i]дневник питания[/i], [b]замеры[/b].\n[wave]Добавьте интеграцию с Apple Watch.[/wave]\n[shake]Но мы передумали, уберите видео, оставьте только дневник и замеры.[/shake]\n[color=#ff8800]Интеграцию оставьте.[/color]\n\nВидео упражнений? {video}. Дневник питания? {food}. Замеры тела? {measure}. Интеграция с носимыми устройствами: {wear}. Секретное слово: {secret}.",
		"good review": "Классное приложение! Дневник и замеры супер, Apple Watch синхронизируется.",
		"bad review": "Где видео? Я хотел смотреть упражнения. Всё удалил.",
		"time": 50,
		"money": 20000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 0,
		"mods": {"safe cancel": true},
		"frmt": {
			"video": {"type": "rand_bool"},
			"food": {"type": "rand_bool"},
			"measure": {"type": "rand_bool"},
			"wear": {"type": "rand_option", "pool": ["apple watch", "fitbit", "garmin", "нет"]},
			"secret": {"type": "rand_text", "pool": ["muscle", "fitness", "strong"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Видео упражнений",
				"stat": "{video}"
			},
			{
				"type": "check",
				"text": "Дневник питания",
				"stat": "{food}"
			},
			{
				"type": "check",
				"text": "Замеры тела",
				"stat": "{measure}"
			},
			{
				"type": "option",
				"text": "Интеграция",
				"items": ["Apple Watch", "Fitbit", "Garmin", "Нет"],
				"indx": "{wear_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 14. Онлайн-школа (DEFAULT, tag=2) ----------
	{
		"name": "Онлайн-школа 'Знайка'",
		"desc": "[center][b]Нужна платформа для курсов.[/b][/center]\nТребования: [color=#ffaa00]регистрация[/color], [i]личный кабинет[/i], [b]система тестов[/b], [color=#00aaff]форум[/color].\n[wave]А, ещё добавьте чат.[/wave]\n[shake]И уберите форум, он не нужен.[/shake]\n[color=#ff8800]Сделайте интеграцию с платежной системой.[/color]\n\nФорум? {forum}. Чат? {chat}. Интеграция с платежной системой? {payment}. Секретное слово: {secret}.",
		"good review": "Платформа отличная! Чат работает, тесты автоматические. Оплата проходит.",
		"bad review": "Форум исчез, как я буду общаться? Всё непонятно.",
		"time": 55,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду браться",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"forum": {"type": "rand_bool"},
			"chat": {"type": "rand_bool"},
			"payment": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["learn", "school", "study"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Форум",
				"stat": "{forum}"
			},
			{
				"type": "check",
				"text": "Чат",
				"stat": "{chat}"
			},
			{
				"type": "check",
				"text": "Интеграция с платежной системой",
				"stat": "{payment}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 15. Интернет-магазин 'Технорай' (DEFAULT, tag=2) ----------
	{
		"name": "Интернет-магазин 'Технорай'",
		"desc": "[center][b]Сделайте магазин электроники.[/b][/center]\nНужен фильтр по цене (от 5000 до 50000), по бренду (Samsung, Apple, Xiaomi), сортировка по популярности.\n[color=#00cc00]Добавьте корзину и оплату.[/color]\nДизайн тёмный.\n[shake]Уберите фильтр по бренду, оставьте только цену и сортировку.[/shake]\n\nНижняя граница цены: {min_price} руб. Верхняя граница цены: {max_price} руб. Фильтр по бренду? {brand}. Сортировка по умолчанию: {sort}. Секретное слово: {secret}.",
		"good review": "Магазин работает, фильтр по цене удобный, сортировка есть. Всё отлично.",
		"bad review": "Где фильтр по бренду? Я хотел выбирать только Apple!",
		"time": 60,
		"money": 28000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"min_price": {"type": "rand_int", "min": 4000, "max": 6000, "step": 1000},
			"max_price": {"type": "rand_int", "min": 45000, "max": 55000, "step": 1000},
			"brand": {"type": "rand_bool"},
			"sort": {"type": "rand_option", "pool": ["популярности", "цене (возр)", "цене (убыв)", "новизне"]},
			"secret": {"type": "rand_text", "pool": ["tech", "shop", "price"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Нижняя граница",
				"step": 1000,
				"min value": 1000,
				"max value": 100000,
				"min d value": "{min_price}",
				"max d value": "{min_price}"
			},
			{
				"type": "slider",
				"text": "Верхняя граница",
				"step": 1000,
				"min value": 1000,
				"max value": 100000,
				"min d value": "{max_price}",
				"max d value": "{max_price}"
			},
			{
				"type": "check",
				"text": "Фильтр по бренду",
				"stat": "{brand}"
			},
			{
				"type": "option",
				"text": "Сортировка",
				"items": ["Популярности", "Цене (возр)", "Цене (убыв)", "Новизне"],
				"indx": "{sort_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 16. Зомби vs Роботы (DEFAULT, tag=2) ----------
	{
		"name": "Зомби vs Роботы (Артём)",
		"desc": "[center][b]Сделайте игру про зомби.[/b][/center]\n[wave]Но я передумал, хочу про роботов.[/wave]\nЧтобы роботы сражались с инопланетянами.\n[color=#ff8800]Добавьте режим кампании и мультиплеер.[/color]\n[shake]Уберите зомби полностью.[/shake]\n\nТема игры: {theme}. Режим кампании? {campaign}. Мультиплеер? {multi}. Секретное слово: {secret}.",
		"good review": "Игра про роботов крутая! Кампания интересная, мультиплеер работает.",
		"bad review": "Я просил зомби, а получил роботов. Обманули!",
		"time": 65,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"theme": {"type": "rand_option", "pool": ["зомби", "роботы", "инопланетяне", "смесь"]},
			"campaign": {"type": "rand_bool"},
			"multi": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["robot", "zombie", "fight"]}
		},
		"prms": [
			{
				"type": "option",
				"text": "Тема",
				"items": ["Зомби", "Роботы", "Инопланетяне", "Смесь"],
				"indx": "{theme_index}"
			},
			{
				"type": "check",
				"text": "Режим кампании",
				"stat": "{campaign}"
			},
			{
				"type": "check",
				"text": "Мультиплеер",
				"stat": "{multi}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 17. LinguaApp (DEFAULT, tag=2) ----------
	{
		"name": "LinguaApp",
		"desc": "[center][b]Сделайте приложение для изучения английского.[/b][/center]\nНужны [color=#ffaa00]карточки слов[/color], [i]грамматические упражнения[/i], [b]аудирование[/b].\n[wave]Добавьте возможность соревноваться с друзьями.[/wave]\n[shake]Уберите аудирование, добавьте тесты на перевод.[/shake]\n[color=#00ccff]И добавьте прогресс-бар.[/color]\n\nАудирование? {audio}. Тесты на перевод? {trans}. Прогресс-бар? {progress}. Уровень сложности: {level}. Секретное слово: {secret}.",
		"good review": "Приложение супер! Учу слова, делаю упражнения, прогресс мотивирует.",
		"bad review": "Где аудирование? Я хотел слушать произношение! Неудобно.",
		"time": 55,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"audio": {"type": "rand_bool"},
			"trans": {"type": "rand_bool"},
			"progress": {"type": "rand_bool"},
			"level": {"type": "rand_option", "pool": ["начальный", "средний", "продвинутый"]},
			"secret": {"type": "rand_text", "pool": ["learn", "english", "speak"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Аудирование",
				"stat": "{audio}"
			},
			{
				"type": "check",
				"text": "Тесты на перевод",
				"stat": "{trans}"
			},
			{
				"type": "check",
				"text": "Прогресс-бар",
				"stat": "{progress}"
			},
			{
				"type": "option",
				"text": "Сложность",
				"items": ["Начальный", "Средний", "Продвинутый"],
				"indx": "{level_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 18. Агентство недвижимости (DEFAULT, tag=2) ----------
	{
		"name": "Агентство 'Квартирка'",
		"desc": "[center][b]Сделайте сайт для продажи квартир.[/b][/center]\nДолжна быть карта с объектами, фильтр по количеству комнат (от 1 до 5), площади (от 30 до 150 кв.м), и цене.\n[color=#00cc00]Добавьте возможность записаться на просмотр.[/color]\nДизайн светлый.\n[shake]Уберите карту, оставьте список объектов и фильтры.[/shake]\n\nКарта с объектами? {map}. Максимальное количество комнат: {rooms_max}. Цвет дизайна: {color}. Секретное слово: {secret}.",
		"good review": "Отличный сайт, фильтры удобные, запись на просмотр работает.",
		"bad review": "Где карта? Я хочу видеть объекты на карте! Неудобно.",
		"time": 50,
		"money": 22000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"map": {"type": "rand_bool"},
			"rooms_max": {"type": "rand_int", "min": 4, "max": 5, "step": 1},
			"color": {"type": "rand_option", "pool": ["светлый", "тёмный", "цветной"]},
			"secret": {"type": "rand_text", "pool": ["house", "flat", "home"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Карта с объектами",
				"stat": "{map}"
			},
			{
				"type": "slider",
				"text": "Комнат (макс)",
				"step": 1,
				"min value": 1,
				"max value": 5,
				"min d value": 1,
				"max d value": "{rooms_max}"
			},
			{
				"type": "option",
				"text": "Цвет дизайна",
				"items": ["Светлый", "Тёмный", "Цветной"],
				"indx": "{color_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 19. ИП Сидоров (DEFAULT, tag=2) ----------
	{
		"name": "ИП Сидоров (пекарня)",
		"desc": "[center][b]Здравствуйте! Нужен интернет-магазин для моей пекарни.[/b][/center]\nКаталог: [color=#cc8800]хлеб, булки, пирожки[/color].\n[wave]Добавить фильтр по виду теста (дрожжевое, слоёное, бездрожжевое).[/wave]\n[color=#ff4444]Корзина и оплата.[/color]\nТакже нужен раздел '[i]акции[/i]'.\n[shake]И чтобы клиенты могли оставлять отзывы.[/shake]\nСделайте красиво, чтобы аппетит разыгрывался.\n[color=#00cc00]И обязательно адаптив.[/color]\n\nКоличество товаров на странице: {items}. Основной вид теста в фильтре: {dough}. Адаптивная вёрстка? {adaptive}. Секретное слово: {secret}.",
		"good review": "Магазин отличный! Заказы посыпались, клиенты довольны. Спасибо!",
		"bad review": "Фильтр не работает, отзывы не сохраняются. Всё плохо.",
		"time": 55,
		"money": 19000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"items": {"type": "rand_int", "min": 10, "max": 14, "step": 1},
			"dough": {"type": "rand_option", "pool": ["дрожжевое", "слоёное", "бездрожжевое", "все"]},
			"adaptive": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["bread", "bake", "flour"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Товаров на странице",
				"step": 1,
				"min value": 6,
				"max value": 24,
				"min d value": "{items}",
				"max d value": "{items}"
			},
			{
				"type": "option",
				"text": "Основной вид теста",
				"items": ["Дрожжевое", "Слоёное", "Бездрожжевое", "Все"],
				"indx": "{dough_index}"
			},
			{
				"type": "check",
				"text": "Адаптивная вёрстка",
				"stat": "{adaptive}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 20. Садовод (DEFAULT, tag=1) ----------
	{
		"name": "Садовод-любитель",
		"desc": "[center][b]Сделайте приложение для садоводов.[/b][/center]\nЧтобы оно подсказывало, когда поливать растения, какие удобрения вносить, распознавало болезни по фото.\n[color=#00aa00]Добавьте календарь посадок.[/color]\n[wave]Уберите распознавание болезней, добавьте список растений с фото и описанием.[/wave]\n[shake]Сделайте простой интерфейс.[/shake]\n\nРаспознавание болезней? {disease}. Календарь посадок? {calendar}. Список растений с описанием? {plants}. Количество растений в базе: {plants_count}. Секретное слово: {secret}.",
		"good review": "Отличное приложение, теперь я знаю, когда поливать и удобрять. Урожай вырос!",
		"bad review": "Где распознавание болезней? Я не могу определить, что с моими цветами!",
		"time": 50,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"disease": {"type": "rand_bool"},
			"calendar": {"type": "rand_bool"},
			"plants": {"type": "rand_bool"},
			"plants_count": {"type": "rand_int", "min": 10, "max": 30, "step": 1},
			"secret": {"type": "rand_text", "pool": ["garden", "plant", "flower"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Распознавание болезней",
				"stat": "{disease}"
			},
			{
				"type": "check",
				"text": "Календарь посадок",
				"stat": "{calendar}"
			},
			{
				"type": "check",
				"text": "Список растений",
				"stat": "{plants}"
			},
			{
				"type": "slider",
				"text": "Количество растений",
				"step": 1,
				"min value": 5,
				"max value": 50,
				"min d value": "{plants_count}",
				"max d value": "{plants_count}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 21. Кофейня 'Зёрнышко' (DEFAULT, tag=1) ----------
	{
		"name": "Кофейня 'Зёрнышко'",
		"desc": "[center][b]Сделайте сайт с меню кофе, десертов, сэндвичей.[/b][/center]\nВозможность заказать на вынос.\n[color=#884400]Добавьте карту лояльности и программу бонусов.[/color]\n[wave]Дизайн уютный, в коричневых тонах.[/wave]\n[shake]Уберите карту лояльности, вместо неё сделайте промокоды.[/shake]\n[color=#ff8800]И добавьте онлайн-бронирование столиков.[/color]\n\nКарта лояльности? {loyalty}. Промокоды? {promo}. Онлайн-бронирование столиков? {booking}. Цветовая гамма: {color}. Секретное слово: {secret}.",
		"good review": "Сайт красивый, заказы принимаем, бронирование работает. Клиенты счастливы.",
		"bad review": "Где карта лояльности? Я хотел накапливать бонусы! Провал.",
		"time": 55,
		"money": 21000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"loyalty": {"type": "rand_bool"},
			"promo": {"type": "rand_bool"},
			"booking": {"type": "rand_bool"},
			"color": {"type": "rand_option", "pool": ["коричневые тона", "чёрно-белая", "зелёная"]},
			"secret": {"type": "rand_text", "pool": ["coffee", "bean", "latte"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Карта лояльности",
				"stat": "{loyalty}"
			},
			{
				"type": "check",
				"text": "Промокоды",
				"stat": "{promo}"
			},
			{
				"type": "check",
				"text": "Бронирование столиков",
				"stat": "{booking}"
			},
			{
				"type": "option",
				"text": "Цветовая гамма",
				"items": ["Коричневые тона", "Чёрно-белая", "Зелёная"],
				"indx": "{color_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 22. Строительная компания (RARE, tag=2) ----------
	{
		"name": "Строительная компания 'Крепкий дом'",
		"desc": "[center][b]Сайт строительной компании.[/b][/center]\n[color=#884400]Портфолио построенных объектов.[/color]\n[wave]Калькулятор стоимости строительства.[/wave]\n[shake]Форма заявки на консультацию.[/shake]\n[color=#00aa00]Отзывы клиентов и сертификаты.[/color]\n\nКалькулятор стоимости? {calc}. Форма заявки? {form}. Отзывы клиентов? {reviews}. Количество проектов в портфолио: {projects}. Сертификаты: {cert}. Секретное слово: {secret}.",
		"good review": "Сайт отличный! Калькулятор точный, заявки приходят, портфолио впечатляет!",
		"bad review": "Калькулятор врёт, форма не работает, портфолио не грузится!",
		"time": 55,
		"money": 45000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 2,
		"mods": {},
		"frmt": {
			"calc": {"type": "rand_bool"},
			"form": {"type": "rand_bool"},
			"reviews": {"type": "rand_bool"},
			"projects": {"type": "rand_int", "min": 10, "max": 20, "step": 1},
			"cert": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["build", "strong", "house"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Калькулятор стоимости",
				"stat": "{calc}"
			},
			{
				"type": "check",
				"text": "Форма заявки",
				"stat": "{form}"
			},
			{
				"type": "check",
				"text": "Отзывы клиентов",
				"stat": "{reviews}"
			},
			{
				"type": "slider",
				"text": "Количество проектов",
				"step": 1,
				"min value": 5,
				"max value": 30,
				"min d value": "{projects}",
				"max d value": "{projects}"
			},
			{
				"type": "check",
				"text": "Показать сертификаты",
				"stat": "{cert}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 23. Медицинский центр (EMERGENCY, tag=3) ----------
	{
		"name": "Медицинский центр 'Здоровье'",
		"desc": "[center][b]Приложение для записи к врачу.[/b][/center]\n[color=#00aa00]Запись к специалистам с выбором даты и времени.[/color]\n[wave]Электронная карта пациента с историей болезней.[/wave]\n[shake]Напоминания о приёмах и рекомендации врача.[/shake]\n[color=#ff8800]Онлайн-консультация с врачом.[/color]\n\nЭлектронная карта пациента? {card}. Онлайн-консультация? {online}. Напоминания о приёмах? {reminders}. Количество врачей в базе: {doctors}. Язык интерфейса: {lang}. Секретное слово: {secret}.",
		"good review": "Отлично! Запись удобная, карта ведётся, напоминания приходят!",
		"bad review": "Запись не работает, карта не сохраняется, консультация не проходит!",
		"time": 55,
		"money": 60000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 3,
		"type": 4,
		"mods": {"multiple review": 5, "disable cancel": true},
		"frmt": {
			"card": {"type": "rand_bool"},
			"online": {"type": "rand_bool"},
			"reminders": {"type": "rand_bool"},
			"doctors": {"type": "rand_int", "min": 5, "max": 15, "step": 1},
			"lang": {"type": "rand_option", "pool": ["русский", "английский", "казахский"]},
			"secret": {"type": "rand_text", "pool": ["health", "doctor", "clinic"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Электронная карта пациента",
				"stat": "{card}"
			},
			{
				"type": "check",
				"text": "Онлайн-консультация",
				"stat": "{online}"
			},
			{
				"type": "check",
				"text": "Напоминания о приёмах",
				"stat": "{reminders}"
			},
			{
				"type": "slider",
				"text": "Количество врачей",
				"step": 1,
				"min value": 3,
				"max value": 20,
				"min d value": "{doctors}",
				"max d value": "{doctors}"
			},
			{
				"type": "option",
				"text": "Язык",
				"items": ["Русский", "Английский", "Казахский"],
				"indx": "{lang_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 24. Автосервис (RARE, tag=2) ----------
	{
		"name": "Автосервис 'Мастер'",
		"desc": "[center][b]Приложение для записи в автосервис.[/b][/center]\n[color=#ff8800]Выбор услуги: диагностика, ремонт, замена масла.[/color]\n[wave]Калькулятор стоимости ремонта.[/wave]\n[shake]Статус ремонта с уведомлениями.[/shake]\n[color=#00aa00]Отзывы клиентов и рейтинг механиков.[/color]\n\nКалькулятор стоимости? {calc}. Рейтинг механиков? {rating}. Уведомления о статусе ремонта? {notify}. Количество механиков: {mechanics}. Тип услуги по умолчанию: {service}. Секретное слово: {secret}.",
		"good review": "Отлично! Запись быстрая, ремонт качественный, цена понятная!",
		"bad review": "Запись не работает, калькулятор врёт, статус не обновляется!",
		"time": 45,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 2,
		"type": 2,
		"mods": {},
		"frmt": {
			"calc": {"type": "rand_bool"},
			"rating": {"type": "rand_bool"},
			"notify": {"type": "rand_bool"},
			"mechanics": {"type": "rand_int", "min": 3, "max": 8, "step": 1},
			"service": {"type": "rand_option", "pool": ["диагностика", "ремонт", "замена масла"]},
			"secret": {"type": "rand_text", "pool": ["car", "repair", "engine"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Калькулятор стоимости",
				"stat": "{calc}"
			},
			{
				"type": "check",
				"text": "Рейтинг механиков",
				"stat": "{rating}"
			},
			{
				"type": "check",
				"text": "Уведомления о статусе",
				"stat": "{notify}"
			},
			{
				"type": "slider",
				"text": "Количество механиков",
				"step": 1,
				"min value": 2,
				"max value": 10,
				"min d value": "{mechanics}",
				"max d value": "{mechanics}"
			},
			{
				"type": "option",
				"text": "Услуга по умолчанию",
				"items": ["Диагностика", "Ремонт", "Замена масла"],
				"indx": "{service_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 25. Туристическое агентство (DEFAULT, tag=2) ----------
	{
		"name": "Туристическое агентство 'Мир'",
		"desc": "[center][b]Сайт для поиска и бронирования туров.[/b][/center]\n[color=#ff66aa]Каталог туров с фильтром по стране и цене.[/color]\n[wave]Калькулятор стоимости тура.[/wave]\n[shake]Онлайн-бронирование и оплата.[/shake]\n[color=#00ccff]Отзывы туристов и рейтинг отелей.[/color]\n\nКалькулятор стоимости? {calc}. Онлайн-бронирование? {booking}. Отзывы туристов? {reviews}. Количество туров в каталоге: {tours}. Секретное слово: {secret}.",
		"good review": "Сайт отличный! Туры легко найти, бронирование удобное, отзывы помогают!",
		"bad review": "Каталог путаный, бронирование не работает, отзывы не грузятся!",
		"time": 55,
		"money": 45000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"calc": {"type": "rand_bool"},
			"booking": {"type": "rand_bool"},
			"reviews": {"type": "rand_bool"},
			"tours": {"type": "rand_int", "min": 20, "max": 50, "step": 5},
			"secret": {"type": "rand_text", "pool": ["travel", "holiday", "trip"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Калькулятор стоимости",
				"stat": "{calc}"
			},
			{
				"type": "check",
				"text": "Онлайн-бронирование",
				"stat": "{booking}"
			},
			{
				"type": "check",
				"text": "Отзывы туристов",
				"stat": "{reviews}"
			},
			{
				"type": "slider",
				"text": "Количество туров",
				"step": 5,
				"min value": 10,
				"max value": 100,
				"min d value": "{tours}",
				"max d value": "{tours}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 26. Sans (DEFAULT, tag=2) ----------
	{
		"name": "Sans (подземелье)",
		"desc": "[center][b]хехе, привет, друг.[/b][/center]\nсделай игру про меня. я хочу быть главным героем.\nпусть я стреляю костяными атаками, а враги - люди.\n[color=#00ccff]добавь режим 'потеть', потому что я всегда потею.[/color]\n[wave]и фон должен быть синим, как моя куртка.[/wave]\nа, ещё добавь злодея, типа моего брата Папируса.\n[shake]хотя нет, убери злодея, пусть просто я хожу и стреляю.[/shake]\n[color=#ff8800]и чтобы у меня была макароны, я люблю макароны.[/color]\n[center][b]сделай за 20 минут, а то я устал шутить.[/b][/center]\n\nГлавный герой: {hero}. Режим 'потеть'? {sweat}. Добавить злодея? {villain}. Цвет фона: {color}. Секретное слово: {secret}.",
		"good review": "хе-хе, отличная игра! я даже вспотел. спасибо, приятель.",
		"bad review": "это не я! где макароны? где синий фон? ты облажался.",
		"time": 45,
		"money": 999,
		"ready text": "Готово, Sans!",
		"cancel text": "Извини, я не умею делать игры со скелетами",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"hero": {"type": "rand_option", "pool": ["санс", "папирус", "фриск", "ториэль"]},
			"sweat": {"type": "rand_bool"},
			"villain": {"type": "rand_bool"},
			"color": {"type": "rand_option", "pool": ["синий", "красный", "зелёный"]},
			"secret": {"type": "rand_text", "pool": ["sans", "bone", "pasta"]}
		},
		"prms": [
			{
				"type": "option",
				"text": "Главный герой",
				"items": ["Санс", "Папирус", "Фриск", "Ториэль"],
				"indx": "{hero_index}"
			},
			{
				"type": "check",
				"text": "Режим 'потеть'",
				"stat": "{sweat}"
			},
			{
				"type": "check",
				"text": "Добавить злодея",
				"stat": "{villain}"
			},
			{
				"type": "option",
				"text": "Цвет фона",
				"items": ["Синий", "Красный", "Зелёный"],
				"indx": "{color_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 27. Гендальф (DEFAULT, tag=2) ----------
	{
		"name": "Гендальф (волшебник)",
		"desc": "[center][b]ТЫ НЕ ПРОЙДЁШЬ![/b][/center]\nА если пройдёшь... сделай мне сайт для Шира! Чтобы хоббиты могли заказывать пиво и эльфийские лепёшки.\n[color=#ffcc00]И добавь карту Средиземья, но без Мордора — там слишком жарко.[/color]\n[wave]И чтобы был балрог в качестве талисмана.[/wave]\n[shake]Хотя убери балрога, добавь просто огненного дракона.[/shake]\n\nКарта Средиземья? {map}. Балрог-талисман? {balrog}. Цветовая гамма: {color}. Секретное слово: {secret}.",
		"good review": "ТЫ ПРОШЁЛ! Сайт Шира готов, хоббиты счастливы!",
		"bad review": "ТЫ НЕ ПРОШЁЛ! Шир в огне, хоббиты плачут!",
		"time": 60,
		"money": 3000,
		"ready text": "ГОТОВО",
		"cancel text": "ТЫ НЕ ПРОЙДЁШЬ!",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"map": {"type": "rand_bool"},
			"balrog": {"type": "rand_bool"},
			"color": {"type": "rand_option", "pool": ["зелёный (эльфийский)", "серый (гномий)", "золотой (людской)"]},
			"secret": {"type": "rand_text", "pool": ["shire", "hobbit", "adventure"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Карта Средиземья",
				"stat": "{map}"
			},
			{
				"type": "check",
				"text": "Балрог-талисман",
				"stat": "{balrog}"
			},
			{
				"type": "option",
				"text": "Цветовая гамма",
				"items": ["Зелёный (эльфийский)", "Серый (гномий)", "Золотой (людской)"],
				"indx": "{color_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 28. Скуби-Ду (MESSAGE, tag=1) ----------
	{
		"name": "Скуби-Ду (пёс)",
		"desc": "[center][b]Скуби-дуби-ду! Сделай мне приложение для поиска привидений![/b][/center]\nЧтобы я мог отмечать места, где видел монстров. [color=#ff66aa]И чтобы была база данных сэндвичей.[/color]\n[wave]И ещё добавь карту с таинственными местами.[/wave]\n[shake]А, и убери поиск привидений, сделай просто доставку сэндвичей.[/shake]\n\nПоиск привидений? {ghosts}. База данных сэндвичей? {sandwiches}. Карта таинственных мест? {map}. Секретное слово: {secret}.",
		"good review": "Скуби-дуби-ду! Приложение работает, сэндвичи доставляются!",
		"bad review": "Рух-рух! Ничего не работает, я голодный!",
		"time": 40,
		"money": 500,
		"ready text": "ГОТОВО",
		"cancel text": "Я боюсь привидений!",
		"tags": 1,
		"type": 3,
		"mods": {},
		"frmt": {
			"ghosts": {"type": "rand_bool"},
			"sandwiches": {"type": "rand_bool"},
			"map": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["scooby", "snack", "ghost"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Поиск привидений",
				"stat": "{ghosts}"
			},
			{
				"type": "check",
				"text": "База данных сэндвичей",
				"stat": "{sandwiches}"
			},
			{
				"type": "check",
				"text": "Карта таинственных мест",
				"stat": "{map}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 29. Человек-паук (DARKNET, tag=2) ----------
	{
		"name": "Питер Паркер (Человек-паук)",
		"desc": "[center][b]Слышь, паучок, сделай мне приложение для сканирования города![/b][/center]\nЧтобы я видел, где происходят преступления. [color=#ff0000]И добавь карту с паутиной, чтобы я мог быстро перемещаться.[/color]\n[wave]И ещё чтобы была система оповещения о злодеях.[/wave]\n[shake]Хотя убери карту, добавь просто список врагов — Зелёный Гоблин, Доктор Осьминог, Песочный Человек.[/shake]\n\nКарта с паутиной? {webmap}. Система оповещения? {alert}. Главный враг: {enemy}. Секретное слово: {secret}.",
		"good review": "Спасибо, паучок! Теперь я знаю, где они прячутся!",
		"bad review": "Ты серьёзно? Карта не работает, я потерял врагов!",
		"time": 50,
		"money": 3500,
		"ready text": "ГОТОВО",
		"cancel text": "Я боюсь пауков!",
		"tags": 2,
		"type": 6,
		"mods": {},
		"frmt": {
			"webmap": {"type": "rand_bool"},
			"alert": {"type": "rand_bool"},
			"enemy": {"type": "rand_option", "pool": ["зелёный гоблин", "доктор осьминог", "песочный человек"]},
			"secret": {"type": "rand_text", "pool": ["spider", "web", "power"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Карта с паутиной",
				"stat": "{webmap}"
			},
			{
				"type": "check",
				"text": "Система оповещения",
				"stat": "{alert}"
			},
			{
				"type": "option",
				"text": "Главный враг",
				"items": ["Зелёный Гоблин", "Доктор Осьминог", "Песочный Человек"],
				"indx": "{enemy_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 30. Шерлок Холмс (CUSTOM, tag=2) ----------
	{
		"name": "Шерлок Холмс (детектив)",
		"desc": "[center][b]Элементарно, Ватсон! Сделай мне базу данных улик.[/b][/center]\nЧтобы я мог связывать преступления и находить преступников.\n[color=#884400]Добавь карту Лондона с местами преступлений.[/color]\n[wave]И чтобы была система дедукции — вводишь улики, получаешь вердикт.[/wave]\n[shake]А, и добавь список подозреваемых: Мориарти, профессор, сэр Генри.[/shake]\n\nКарта Лондона? {map}. Система дедукции? {deduction}. Подозреваемый: {suspect}. Секретное слово: {secret}.",
		"good review": "Элементарно! База данных работает, Мориарти арестован!",
		"bad review": "Катастрофа, Ватсон! Всё сломано, преступники на свободе!",
		"time": 55,
		"money": 4000,
		"ready text": "ГОТОВО",
		"cancel text": "Дело закрыто",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"map": {"type": "rand_bool"},
			"deduction": {"type": "rand_bool"},
			"suspect": {"type": "rand_option", "pool": ["мориарти", "профессор", "сэр генри"]},
			"secret": {"type": "rand_text", "pool": ["holmes", "detective", "clue"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Карта Лондона",
				"stat": "{map}"
			},
			{
				"type": "check",
				"text": "Система дедукции",
				"stat": "{deduction}"
			},
			{
				"type": "option",
				"text": "Подозреваемый",
				"items": ["Мориарти", "Профессор", "Сэр Генри"],
				"indx": "{suspect_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# ---------- 31. Дарт Вейдер (DARKNET, tag=3) ----------
	{
		"name": "Дарт Вейдер (тёмный властелин)",
		"desc": "[center][b][color=#ff0000]Я ТВОЙ ОТЕЦ![/color][/b][/center]\nСделай мне приложение для контроля над галактикой.\n[color=#444444]Добавь карту звёздных систем, но без Альдераана — он больше не нужен.[/color]\n[wave]И чтобы была система управления Звездой Смерти.[/wave]\n[shake]Убери Звезду Смерти, добавь просто список планет для завоевания.[/shake]\n\nКарта звёздных систем? {map}. Управление Звездой Смерти? {deathstar}. Планета для завоевания: {planet}. Секретное слово: {secret}.",
		"good review": "Сила в тебе есть! Приложение работает, галактика почти завоёвана!",
		"bad review": "Я ЧУВСТВУЮ БОЛЬ! Всё сломано, я уничтожу тебя!",
		"time": 60,
		"money": 8000,
		"ready text": "ГОТОВО",
		"cancel text": "Я не буду помогать империи!",
		"tags": 3,
		"type": 6,
		"mods": {"police count": 3},
		"frmt": {
			"map": {"type": "rand_bool"},
			"deathstar": {"type": "rand_bool"},
			"planet": {"type": "rand_option", "pool": ["татуин", "энкор", "корусант"]},
			"secret": {"type": "rand_text", "pool": ["vader", "skywalker", "empire"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Карта звёздных систем",
				"stat": "{map}"
			},
			{
				"type": "check",
				"text": "Управление Звездой Смерти",
				"stat": "{deathstar}"
			},
			{
				"type": "option",
				"text": "Планета для завоевания",
				"items": ["Татуин", "Энкор", "Корусант"],
				"indx": "{planet_index}"
			},
			{
				"type": "line",
				"text": "Кодовое слово",
				"ph text": "введите слово",
				"correct": "{secret}"
			}
		]
	},
	# 1 - Валера (без модов, но с type=3)
	{
		"name": "Валера 18кв (постоянно бухает)",
		"desc": "[wave]аааываэ фыАВЫ[/wave]  сделйа МНЕ САЙт авгде ртппо вфыфыв колчре [color=#ff0000]с#ка[/color] мдепл!Ц!1!!цвы",
		"good review": "АААЭАЭ Т ЫЧБЯ БЛвыф!!!!!",
		"bad review": "АААЭАЭ Т ЫЧБЯ БЛвыф!!!!!",
		"time": 25,
		"money": 0,
		"ready text": "Чего? Ты опять нажрался до верху?!",
		"cancel text": "ПОШЁЛ НА#УЙ! НЕ МЕШАЙ РАБОТАТЬ!",
		"tags": 1,
		"type": 3,
		"mods": {},
		"frmt": {},
		"prms": []
	},
	# 2 - Бабушка Зина
	{
		"name": "Бабушка Зина (83 года)",
		"desc": "[center]Внучек, сделай мне 'интернет'[/center]\nЧтобы я могла смотреть сериалы про любовь.\n[b]Экран чтобы большой был[/b] — поставь галочку 'Увеличить шрифт'.\nИ чтобы кнопка 'пуск' была [color=#ff0000]{color}[/color], а то я теряюсь.\n[wave]А ещё чтобы можно было фотки котиков смотреть.[/wave]\nИ чтобы это не стоило денег, ты же у меня программист?\nСделай побыстрее, а то 'Дом-2' уже начался!",
		"good review": "Ой спасибо, внучек! Всё работает, сериалы смотрю, котики милые!",
		"bad review": "Ничего не понимаю, экран маленький, кнопки не те. Внучек, ты меня не любишь?",
		"time": 40,
		"money": 0,
		"ready text": "Всё готово, бабуль!",
		"cancel text": "Прости, бабуль, я занят",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"color": {"type": "rand_option", "pool": ["красная", "синяя", "зелёная"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Увеличить шрифт (для слабовидящих)",
				"stat": true
			},
			{
				"type": "option",
				"text": "Цвет кнопки 'Пуск'",
				"items": ["Красная", "Синяя", "Зелёная"],
				"indx": "{color_index}"
			}
		]
	},
	# 3 - Тётя Маша
	{
		"name": "Тётя Маша (соседка)",
		"desc": "[b]Сделай мне программу для подсчёта расходов на продукты.[/b]\nЧтобы она считала, сколько я потратила, и говорила, где купить дешевле.\nИ чтоб она сама заполняла список покупок, когда я говорю '[i]молоко, хлеб, яйца[/i]'.\n[color=#00ff00]А ещё чтоб считала калории[/color], а то я на диете.\nНу и чтоб можно было [shake]фоткать чеки[/shake] и она сама всё вносила.\nПродумай структуру: примерно {cats} основных категорий продуктов будет достаточно.\nДавай, сделай за час!",
		"good review": "Всё супер! Теперь я знаю, сколько трачу, и худею! Спасибо!",
		"bad review": "Глючит, не считает, калории неправильные. Ты меня обманул!",
		"time": 45,
		"money": 500,
		"ready text": "Готово!",
		"cancel text": "Это слишком сложно для меня",
		"mods": {"safe cancel": true, "safe skip": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"cats": {"type": "rand_int", "min": 4, "max": 6, "step": 1}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество категорий продуктов",
				"step": 1,
				"min value": 3,
				"max value": 10,
				"min d value": "{cats}",
				"max d value": "{cats}"
			},
			{
				"type": "check",
				"text": "Распознавание чеков по фото",
				"stat": true
			}
		]
	},
	# 4 - Колян
	{
		"name": "Колян (друг с детства)",
		"desc": "[shake]Срочно![/shake] Мой компьютер завис намертво.\nЯ пытался переустановить винду, но у меня нет диска и флешки.\nСделай загрузочную флешку и принеси мне.\n[color=#ff8800]И установи мне ещё Photozhop и пару игр.[/color]\nИ чтобы всё работало быстро.\n[wave]Я тебе пива куплю![/wave]",
		"good review": "Ваще круто! Комп летает, Фотожоп есть, игры идут! Спасибо!",
		"bad review": "Ты чё, мне вирусов поставил? Всё тормозит, ничего не работает!",
		"time": 35,
		"money": 0,
		"ready text": "Всё сделал, братан!",
		"cancel text": "Извини, у меня своих дел полно",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {},
		"prms": [
			{
				"type": "option",
				"text": "Способ установки",
				"items": ["С флешки", "С диска", "По сети"],
				"indx": 0
			},
			{
				"type": "check",
				"text": "Установка Photozhop",
				"stat": true
			}
		]
	},
	# 5 - Мама
	{
		"name": "Мама (звонит)",
		"desc": "[b]Сынок, я скачала приложение для знакомств, а оно не открывается.[/b]\nПочини, пожалуйста. А то я уже зарегистрировалась, а там мужчины ждут!\nИ сделай, чтобы мои фото были красивыми, [color=#ff69b4]с хорошими фильтрами[/color] — поставь галочку.\nИ чтобы оно показывало только тех, кто [i]старше {age_from}[/i].\nИ чтобы можно было отправлять смайлики.\n[wave]Ну и чтобы звук был приятный.[/wave]\nСделай побыстрее, у меня свидание через час!",
		"good review": "Ой, сынок, спасибо! Всё работает, мужчины в восторге, фильтры супер!",
		"bad review": "Ничего не работает, фото не грузятся, звук противный. Ты меня подвёл!",
		"time": 50,
		"money": 0,
		"ready text": "Готово, мам!",
		"cancel text": "Мам, я не могу, это сложно",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"age_from": {"type": "rand_int", "min": 45, "max": 55, "step": 1}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Возрастной фильтр (от)",
				"step": 1,
				"min value": 18,
				"max value": 80,
				"min d value": "{age_from}",
				"max d value": "{age_from}"
			},
			{
				"type": "check",
				"text": "Добавить фильтры для фото",
				"stat": true
			}
		]
	},
	# 6 - Дядя Петя
	{
		"name": "Дядя Петя (сосед)",
		"desc": "[center]Сделай мне сайт для продажи самогона![/center]\nНо чтобы не палиться, назови его '{name}'.\nИ чтобы там можно было заказать с доставкой на дом.\n[color=#666666]Сделай дизайн как у обычного магазина продуктов[/color], чтоб никто не догадался.\n[shake]И ещё добавь раздел 'отзывы', но там пиши только хорошие — поставь галочку.[/shake]\n[wave]Я тебе дам бутылку самогона в подарок![/wave]",
		"good review": "О! Сайт работает, заказы посыпались! Отличная работа!",
		"bad review": "Что за фигня? Меня менты нашли, сайт закрыли! Ты подставил меня!",
		"time": 45,
		"money": 0,
		"ready text": "Сайт готов, дядя Петя!",
		"cancel text": "Я не буду участвовать в этом!",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"name": {"type": "rand_option", "pool": ["Квас-Онлайн", "Напитки-Дома", "Самогон-Мастер"]}
		},
		"prms": [
			{
				"type": "option",
				"text": "Название сайта",
				"items": ["Квас-Онлайн", "Напитки-Дома", "Самогон-Мастер"],
				"indx": "{name_index}"
			},
			{
				"type": "check",
				"text": "Раздел с отзывами (только хорошие)",
				"stat": true
			}
		]
	},
	# 7 - Сестра Лена
	{
		"name": "Сестра Лена (студентка)",
		"desc": "[b]Брат, помоги![/b] Мне нужно сделать презентацию по истории, но я ничего не понимаю.\nСделай мне программу, которая [i]сама делает презентации[/i] по теме.\nВводишь тему - и она выдаёт слайды с картинками и текстом.\n[color=#00aaff]И чтобы можно было выбрать дизайн.[/color] Мне нужен стиль {style}.\nИ чтобы она умела читать текст, ну типа озвучка.\nСделай примерно {slides} слайдов, не больше.\n[wave]Сделай за час, мне завтра сдавать![/wave]",
		"good review": "Вау! Презентация супер, я получила пятёрку! Спасибо, братик!",
		"bad review": "Она сделала презентацию с ошибками и картинки не те. Я провалила экзамен!",
		"time": 40,
		"money": 300,
		"ready text": "Готово, сестрёнка!",
		"cancel text": "Лен, извини, не успеваю",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"style": {"type": "rand_option", "pool": ["классический", "современный", "детский", "деловой"]},
			"slides": {"type": "rand_int", "min": 8, "max": 12, "step": 1}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество слайдов",
				"step": 1,
				"min value": 5,
				"max value": 20,
				"min d value": "{slides}",
				"max d value": "{slides}"
			},
			{
				"type": "option",
				"text": "Тема дизайна",
				"items": ["Классический", "Современный", "Детский", "Деловой"],
				"indx": "{style_index}"
			}
		]
	},
	# 8 - Преподаватель
	{
		"name": "Преподаватель информатики",
		"desc": "[shake]Студент, я знаю, что ты умеешь программировать.[/shake]\nСделай мне систему для проведения тестов по информатике.\nЧтобы я мог создавать вопросы, варианты ответов, а студенты отвечали онлайн.\n[color=#ffcc00]И чтобы автоматически проверялась и выставлялась оценка — поставь галочку.[/color]\nВопросы должны быть {qtype}: и с выбором, и со свободным ответом.\nСделай за два дня, иначе я не поставлю зачёт!",
		"good review": "Отлично, система работает, тесты проходят, оценки автоматические. Молодец!",
		"bad review": "Ужасно! Вопросы не сохраняются, результаты теряются. Я тебе плохих отзывов накручу, сволочь!",
		"time": 60,
		"money": 0,
		"ready text": "Система готова, сэр!",
		"cancel text": "Простите, я не потяну",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true, "multiple review": 3},
		"tags": 1,
		"type": 3,
		"frmt": {
			"qtype": {"type": "rand_option", "pool": ["только выбор", "свободный ответ", "смешанный"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Автоматическая проверка",
				"stat": true
			},
			{
				"type": "option",
				"text": "Тип вопросов",
				"items": ["Только выбор", "Свободный ответ", "Смешанный"],
				"indx": "{qtype_index}"
			}
		]
	},
	# 9 - Племянник Кирилл
	{
		"name": "Племянник Кирилл (10 лет)",
		"desc": "[center][b]Дядя, сделай мне игру про пришельцев![/b][/center]\nНо чтобы они были [i]смешными[/i], а не страшными.\nИ чтобы я мог стрелять в них конфетами.\nИ чтобы был босс - [color=#00aa00]большой зелёный пришелец[/color], который ест конфеты и становится сильнее.\n[wave]И чтобы можно было играть вдвоём с другом — поставь галочку.[/wave]\nИ ещё чтобы были уровни — пусть их будет {levels}, по одному на каждый вид пришельцев.\n[shake]Сделай быстро, я хочу поиграть сегодня![/shake]",
		"good review": "Ура! Игра супер, конфеты летают, пришельцы смешные! Спасибо, дядя!",
		"bad review": "Скучно, пришельцы страшные, конфет мало. Ты не умеешь делать игры!",
		"time": 50,
		"money": 200,
		"ready text": "Игра готова, Кирилл!",
		"cancel text": "Прости, Кирюха, нет времени",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"levels": {"type": "rand_int", "min": 4, "max": 6, "step": 1}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество уровней",
				"step": 1,
				"min value": 1,
				"max value": 10,
				"min d value": "{levels}",
				"max d value": "{levels}"
			},
			{
				"type": "check",
				"text": "Многопользовательский режим (2 игрока)",
				"stat": true
			}
		]
	},
	# 10 - Жена
	{
		"name": "Жена (любимая)",
		"desc": "[b]Дорогой, сделай мне приложение для планирования меню на неделю.[/b]\nЧтобы оно предлагало рецепты из продуктов, которые есть в холодильнике.\nИ чтобы можно было добавлять свои рецепты.\n[color=#ff66aa]И чтобы оно составляло список покупок — поставь галочку.[/color]\nИ ещё чтобы оно считало калории и БЖУ — тоже галочку.\nСделай [i]{style} дизайн[/i], чтобы глаз радовал.\n[wave]И чтобы звуки были приятные. Очень прошу![/wave]",
		"good review": "Ты чудо! Всё идеально, меню на неделю, список покупок, даже калории. Я тебя люблю!",
		"bad review": "Что за убожество? Ничего не работает, рецепты дурацкие, дизайн ужасный. Ты меня не уважаешь?",
		"time": 50,
		"money": 0,
		"ready text": "Всё готово, любимая!",
		"cancel text": "Прости, я не могу, это сложно",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"style": {"type": "rand_option", "pool": ["милый", "строгий", "яркий", "минималистичный"]}
		},
		"prms": [
			{
				"type": "option",
				"text": "Стиль дизайна",
				"items": ["Цветочки", "Минимализм", "Ретро", "Футуризм"],
				"indx": "{style_index}"
			},
			{
				"type": "check",
				"text": "Подсчёт БЖУ",
				"stat": true
			}
		]
	},
	# 11 - Серёга
	{
		"name": "Серёга (пьяный в стельку)",
		"desc": "[wave]слышь чёл[/wave] сделай мне програму штоб я мог взламывать компы друзей\nа то они меня бесят я хочу видеть их пароли и переписки\n[color=#880000]и ещё штоб я мог удалять их игры[/color] ага\nи чтобы она была невидимая — поставь галочку, никаких следов\n[shake]сделай за час а то я приду и вылью пиво на твой ноут[/shake]\nИ используй {method}, он самый надёжный.",
		"good review": "фух работает взламываю всех спасибо друг ты гений!",
		"bad review": "не работает нихера ты лох я всё равно приду и налью пива",
		"time": 30,
		"money": 0,
		"ready text": "Сделано, но это незаконно!",
		"cancel text": "Пошёл на#уй, я не хакер!",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"method": {"type": "rand_option", "pool": ["Брутфорс", "Фишинг", "Кейлоггер"]}
		},
		"prms": [
			{
				"type": "check",
				"text": "Режим невидимости",
				"stat": true
			},
			{
				"type": "option",
				"text": "Метод взлома",
				"items": ["Брутфорс", "Фишинг", "Кейлоггер", "Я не буду это делать!"],
				"indx": "{method_index}"
			}
		]
	},
	# 12 - Тётя Клава
	{
		"name": "Тётя Клава (соседка)",
		"desc": "[center]ай парень сделай мне прилажение для ворон считать[/center]\nа то они все улетели не знаю сколько их а я их кормлю каждый день\n[color=#0088cc]и ещё чтобы оно птичек считало и записывало сколько раз они каркнули[/color]\nи чтобы погоду показывало\n[wave]и чтобы было просто на кнопку нажал и оно считает[/wave]\nа то я старая и не умею пользоваться телефоном",
		"good review": "Ой спасибо, теперь я знаю, сколько ворон, и погода всегда со мной!",
		"bad review": "Ничего не понятно, где считать ворон? Кнопки нет!",
		"time": 40,
		"money": 0,
		"ready text": "Готово!",
		"cancel text": "Это бред, я не буду",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {},
		"prms": [
			{
				"type": "check",
				"text": "Счётчик ворон",
				"stat": true
			},
			{
				"type": "check",
				"text": "Прогноз погоды",
				"stat": true
			}
		]
	},
	# 13 - Among Us
	{
		"name": "Фанат Among Us (сосед)",
		"desc": "[center][b]Сделай мне игру, где я буду искать предателя![/b][/center]\nНо чтобы все были [color=#ff4444]котами[/color], а предатель — {role}.\n[wave]И чтобы можно было голосовать, кидая сосиски — поставь галочку.[/wave]\n[shake]И ещё добавь чат, но только с фразами 'подозрительно' и 'скинь сосиску'.[/shake]\n[color=#00ccff]Сделай за час, а то я пойду жаловаться капитану![/color]",
		"good review": "Вау! Коты и собаки играют, я нашёл предателя! Сосиски работают!",
		"bad review": "Где голосование? Где коты? Всё сломано, ты неудачник!",
		"time": 55,
		"money": 0,
		"ready text": "Готово, ищи предателя!",
		"cancel text": "Я не буду делать игры про животных",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"role": {"type": "rand_option", "pool": ["собака", "кот", "попугай"]}
		},
		"prms": [
			{
				"type": "option",
				"text": "Роль предателя",
				"items": ["Кот", "Собака", "Попугай"],
				"indx": "{role_index}"
			},
			{
				"type": "check",
				"text": "Голосование сосисками",
				"stat": true
			}
		]
	},
	# 14 - Worms
	{
		"name": "Червяк-любитель",
		"desc": "[center][b]Эй, сделай игру про червяков![/b][/center]\nОни должны стрелять [color=#00aa00]бананами[/color] и [color=#ff8800]динамитом[/color] — {weapon} пусть будет основным оружием.\n[wave]Добавь режим 'супер-овца', она взрывается и всё ломает — поставь галочку.[/wave]\n[shake]И чтобы были команды: красные против синих.[/shake]\n[color=#ffcc00]И ещё добавь гранату с задержкой ровно {delay} секунды.[/color]\nСделай за 20 минут, а то я брошу в тебя бананом!",
		"good review": "Червяки довольны, бананы летают, овца взорвалась — класс!",
		"bad review": "Где динамит? Где овца? Ты просто червяк-неудачник!",
		"time": 45,
		"money": 200,
		"ready text": "Червяки готовы!",
		"cancel text": "Я не буду делать игры с червяками",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"weapon": {"type": "rand_option", "pool": ["банан", "динамит", "граната"]},
			"delay": {"type": "rand_int", "min": 2, "max": 4, "step": 1}
		},
		"prms": [
			{
				"type": "option",
				"text": "Оружие по умолчанию",
				"items": ["Банан", "Динамит", "Граната"],
				"indx": "{weapon_index}"
			},
			{
				"type": "slider",
				"text": "Задержка гранаты (сек)",
				"step": 1,
				"min value": 1,
				"max value": 5,
				"min d value": "{delay}",
				"max d value": "{delay}"
			},
			{
				"type": "check",
				"text": "Режим 'супер-овца'",
				"stat": true
			}
		]
	},
	# 15 - Дедушка Вася
	{
		"name": "Дедушка Вася (рыбак)",
		"desc": "[center]Внучок, сделай программу для подсчёта рыб в пруду![/center]\nЧтобы я записывал, сколько поймал, какого размера и на какую наживку.\n[color=#0088ff]И чтобы можно было добавить фото трофея — поставь галочку.[/color]\n[wave]И ещё чтобы она считала общий вес улова за день.[/wave]\n[shake]Сделай простенько, я не силён в этих ваших интернетах.[/shake]\nПримерно {fish_count} видов рыб должно быть в списке.",
		"good review": "Спасибо, внучок! Теперь я знаю, сколько рыбы, и фото сохраняются!",
		"bad review": "Ничего не понятно, кнопки мелкие, рыбу не добавить. Плохо!",
		"time": 35,
		"money": 0,
		"ready text": "Готово, дед!",
		"cancel text": "Прости, дед, я не рыбак",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"fish_count": {"type": "rand_int", "min": 4, "max": 6, "step": 1}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество видов рыб",
				"step": 1,
				"min value": 3,
				"max value": 10,
				"min d value": "{fish_count}",
				"max d value": "{fish_count}"
			},
			{
				"type": "check",
				"text": "Добавление фото",
				"stat": true
			}
		]
	},
	# 16 - Подруга Оля
	{
		"name": "Подруга Оля (шопоголик)",
		"desc": "[b]Ой, привет! Сделай мне приложение для подбора нарядов![/b]\nЧтобы я фоткала вещи и оно предлагало, с чем их носить.\n[color=#ff66aa]И чтобы можно было сохранять готовые образы — поставь галочку.[/color]\n[wave]И ещё чтобы был календарь, куда я записываю, что надела в какой день — тоже галочку.[/wave]\n[shake]Добавь фильтр по цветам и по сезонам, ну пожалуйста![/shake]\nСделай за час, у меня завтра свидание!",
		"good review": "Спасибо! Приложение шикарное, образы подбирает идеально!",
		"bad review": "Глючит, не распознаёт вещи, календарь не работает. Ты меня подвёл!",
		"time": 45,
		"money": 0,
		"ready text": "Готово, Оля!",
		"cancel text": "Оль, я не модельер, извини",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {},
		"prms": [
			{
				"type": "check",
				"text": "Календарь образов",
				"stat": true
			},
			{
				"type": "option",
				"text": "Фильтр по сезону",
				"items": ["Лето", "Зима", "Весна-Осень", "Все сезоны"],
				"indx": 3
			}
		]
	},
	# 17 - Троюродная тётя Галя
	{
		"name": "Троюродная тётя Галя",
		"desc": "[center]Слышь, племянник, сделай сайт для продажи моего варенья![/center]\nНазвание придумай сам, но чтобы было красиво.\n[color=#cc8800]Добавь каталог: клубничное, малиновое, смородиновое, вишнёвое — всего {jam_count} вида.[/color]\n[wave]И чтобы можно было заказать с доставкой.[/wave]\n[shake]Ещё отзывы добавь, но только хорошие, я сама напишу — поставь галочку.[/shake]\nСделай побыстрее, а то банки заканчиваются!",
		"good review": "Ой, спасибо! Сайт работает, варенье раскупают, я счастлива!",
		"bad review": "Ничего не работает, варенье не заказать, ты меня подвёл!",
		"time": 40,
		"money": 0,
		"ready text": "Готово, тёть Галя!",
		"cancel text": "Простите, я не умею торговать",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {
			"jam_count": {"type": "rand_int", "min": 3, "max": 5, "step": 1}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Количество видов варенья",
				"step": 1,
				"min value": 2,
				"max value": 6,
				"min d value": "{jam_count}",
				"max d value": "{jam_count}"
			},
			{
				"type": "check",
				"text": "Раздел с отзывами",
				"stat": true
			}
		]
	},
	# 18 - Neco Arc
	{
		"name": "Neco Arc",
		"desc": "[b][center][color=#F4CEA1][shake]NyaNyaNyaNyaNyaNyaNyaNyaNyaNyaNyaNyaaaaaaaa[/shake][/color]!",
		"good review": "[color=#F4CEA1][shake]NYYYAYYAAAAAAAA[/shake][/color]!!!!!!!",
		"bad review": "[wave]NyuNyuNNNyuuuu[/wave]...",
		"time": 10,
		"money": 0,
		"ready text": "О, кошечка Неко Арк!",
		"cancel text": "НЕ МЕШАЙ!!!",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {},
		"prms": [
			{
				"type": "check",
				"text": "Nyanyaya!!",
				"stat": true
			}
		]
	},
	# 19 - Двоюродный брат Коля
	{
		"name": "Двоюродный брат Коля (дальнобойщик)",
		"desc": "[center]Слышь, братан, сделай приложение для дальнобойщиков![/center]\nЧтобы я мог видеть на карте, где есть нормальные стоянки и где дешевле соляра.\n[color=#ff8800]И чтобы погоду показывало по маршруту — поставь галочку.[/color]\n[wave]И чтобы можно было общаться с другими водилами в чате — ещё галочку.[/wave]\n[shake]Сделай побыстрее, а то я в рейс через два дня![/shake]",
		"good review": "О, спасибо! Приложение топ, стоянки нашёл, соляру дёшево взял!",
		"bad review": "Ничего не работает, карта не грузится, чат пустой. Ты меня подвёл!",
		"time": 35,
		"money": 0,
		"ready text": "Готово, братан!",
		"cancel text": "Извини, я не разбираюсь в логистике",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {},
		"prms": [
			{
				"type": "check",
				"text": "Карта с стоянками",
				"stat": true
			},
			{
				"type": "check",
				"text": "Чат для водителей",
				"stat": true
			}
		]
	},
	# 20 - Тётя Рая
	{
		"name": "Тётя Рая (пенсионерка)",
		"desc": "[center]Сделай мне программу для подсчёта пенсии![/center]\nЧтобы я вводила стаж и зарплату, а оно считало, сколько мне будут платить.\n[color=#00aa00]И чтобы показывало инфляцию и покупательную способность — поставь галочку.[/color]\n[wave]И чтобы графики рисовало, как в тех ваших Excel — ещё галочку.[/wave]\n[shake]Сделай простенько, я не сильна в компьютерах.[/shake]",
		"good review": "Ой, спасибо! Всё понятно, пенсию посчитала, графики красивые!",
		"bad review": "Ничего не понятно, цифры не сходятся, графики кривые!",
		"time": 30,
		"money": 0,
		"ready text": "Готово, тёть Рая!",
		"cancel text": "Простите, я не бухгалтер",
		"mods": {"safe cancel": true, "safe skip": true, "safe rep": true},
		"tags": 1,
		"type": 3,
		"frmt": {},
		"prms": [
			{
				"type": "check",
				"text": "Графики и диаграммы",
				"stat": true
			},
			{
				"type": "check",
				"text": "Учёт инфляции",
				"stat": true
			}
		]
	},
	# Добавить в массив orders (после существующих)

	# 80–94: 7 коротких обычных заказов (DEFAULT)
	# 80. Визитка для мастера маникюра (tag=1)
	{
		"name": "Мастер маникюра Оксана",
		"desc": "[center][b]Нужен сайт-визитка с портфолио и ценами.[/b][/center] Сначала хотела 10 работ в галерею, но потом решила, что {photos} хватит. Прайс: от {price_min} до {price_max} руб. Запись по телефону.",
		"frmt": {
			"photos": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"price_min": {"type": "rand_int", "min": 800, "max": 1200, "step": 100},
			"price_max": {"type": "rand_int", "min": 1500, "max": 2000, "step": 100}
		},
		"good review": "Клиентки довольны, запись идёт, сайт красивый!",
		"bad review": "Фотки грузятся, цены не те, никто не звонит.",
		"time": 30,
		"money": 3000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество фото", "step": 1, "min value": 3, "max value": 12, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "slider", "text": "Минимальная цена", "step": 100, "min value": 500, "max value": 1500, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена", "step": 100, "min value": 1000, "max value": 2500, "min d value": "{price_max}", "max d value": "{price_max}"}
		]
	},
	# 82. Приложение для заметок (tag=3)
	{
		"name": "Заметки для всех",
		"desc": "[center][b]Минималистичное приложение для заметок.[/b][/center] Хранить {notes} заметок в облаке. Сначала думали о синхронизации, но потом решили только локально. Поиск по ключевым словам – включить? {search}",
		"frmt": {
			"notes": {"type": "rand_int", "min": 100, "max": 500, "step": 50},
			"search": {"type": "rand_bool"}
		},
		"good review": "Просто и удобно, все заметки под рукой.",
		"bad review": "Поиск не работает, заметки теряются.",
		"time": 35,
		"money": 2000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество заметок", "step": 50, "min value": 50, "max value": 1000, "min d value": "{notes}", "max d value": "{notes}"},
			{"type": "check", "text": "Поиск по ключевым словам", "stat": "{search}"}
		]
	},
	# 83. Калькулятор ремонта (tag=1)
	{
		"name": "Ремонт квартир",
		"desc": "[center][b]Калькулятор стоимости ремонта.[/b][/center] Площадь: {area} кв.м. Цена за кв.м: {price_per_sqm} руб. Сначала думали включить материалы, но потом решили только работу.",
		"frmt": {
			"area": {"type": "rand_int", "min": 30, "max": 60, "step": 5},
			"price_per_sqm": {"type": "rand_int", "min": 1000, "max": 2000, "step": 100}
		},
		"good review": "Посчитали быстро, цена адекватная.",
		"bad review": "Цена не соответствует, площадь неправильно.",
		"time": 25,
		"money": 1500,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Площадь (кв.м)", "step": 5, "min value": 20, "max value": 100, "min d value": "{area}", "max d value": "{area}"},
			{"type": "slider", "text": "Цена за кв.м (руб)", "step": 100, "min value": 500, "max value": 3000, "min d value": "{price_per_sqm}", "max d value": "{price_per_sqm}"}
		]
	},
	# 84. Меню ресторана (tag=2)
	{
		"name": "Ресторан 'Вкусно'",
		"desc": "[center][b]Сайт с меню и бронированием.[/b][/center] Блюд в меню: {dishes}. Сначала хотели 20, но оставили {dishes} (всё равно часто меняем). Бронирование столиков: {booking}.",
		"frmt": {
			"dishes": {"type": "rand_int", "min": 12, "max": 18, "step": 2},
			"booking": {"type": "rand_bool"}
		},
		"good review": "Меню красивое, бронь работает.",
		"bad review": "Мало блюд, бронь не работает.",
		"time": 45,
		"money": 4000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество блюд", "step": 2, "min value": 8, "max value": 24, "min d value": "{dishes}", "max d value": "{dishes}"},
			{"type": "check", "text": "Онлайн-бронирование", "stat": "{booking}"}
		]
	},
	# 91. Конвертер валют (tag=3)
	{
		"name": "Курс валют",
		"desc": "[center][b]Конвертер валют в реальном времени.[/b][/center] Валют: {currencies}. Сначала хотели добавить график курса, но потом передумали. Источник: {source}.",
		"frmt": {
			"currencies": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"source": {"type": "rand_text", "pool": ["cbr", "google", "yahoo"]}
		},
		"good review": "Курсы точные, конвертер быстрый.",
		"bad review": "Мало валют, источник ненадёжный.",
		"time": 30,
		"money": 1500,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество валют", "step": 1, "min value": 3, "max value": 15, "min d value": "{currencies}", "max d value": "{currencies}"},
			{"type": "option", "text": "Источник курсов", "items": ["CBR", "Google", "Yahoo"], "indx": "{source_index}"}
		]
	},
	# 92. Заказ такси (tag=1)
	{
		"name": "Такси-Мобиль",
		"desc": "[center][b]Вызов такси с расчётом стоимости.[/b][/center] Минимальная цена: {min_price} руб. За километр: {price_per_km} руб. Сначала хотели добавить фиксированную цену, но потом решили по километражу.",
		"frmt": {
			"min_price": {"type": "rand_int", "min": 100, "max": 150, "step": 10},
			"price_per_km": {"type": "rand_int", "min": 15, "max": 25, "step": 1}
		},
		"good review": "Такси быстро, цена адекватная.",
		"bad review": "Дорого, машина долго едет.",
		"time": 25,
		"money": 1000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 10, "min value": 50, "max value": 200, "min d value": "{min_price}", "max d value": "{min_price}"},
			{"type": "slider", "text": "Цена за км (руб)", "step": 1, "min value": 10, "max value": 30, "min d value": "{price_per_km}", "max d value": "{price_per_km}"}
		]
	},
	# 93. Онлайн-библиотека (tag=2)
	{
		"name": "Электронная библиотека",
		"desc": "[center][b]Каталог книг с поиском.[/b][/center] Книг: {books}. Жанров: {genres}. Сначала хотели добавить рейтинг, но потом отказались.",
		"frmt": {
			"books": {"type": "rand_int", "min": 200, "max": 500, "step": 50},
			"genres": {"type": "rand_int", "min": 5, "max": 10, "step": 1}
		},
		"good review": "Большой выбор, поиск удобный.",
		"bad review": "Мало книг, жанров не хватает.",
		"time": 45,
		"money": 3500,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество книг", "step": 50, "min value": 100, "max value": 1000, "min d value": "{books}", "max d value": "{books}"},
			{"type": "slider", "text": "Количество жанров", "step": 1, "min value": 3, "max value": 15, "min d value": "{genres}", "max d value": "{genres}"}
		]
	},
	# 95–104: 10 обычных заказов среднего размера (DEFAULT)

	# 95. Сайт для барбершопа (tag=1)
	{
		"name": "Барбершоп 'Брутальный'",
		"desc": "[center][b]Сделай сайт для мужской парикмахерской![/b][/center] Хочу тёмный дизайн, с фотками работ и прайс-листом. [color=#ff8800]Сначала хотел 5 услуг, но потом понял, что 3 достаточно: стрижка, борода, бритьё.[/color] [wave]Добавь онлайн-запись, но я ещё не решил, через сайт или по телефону. Пусть будет запись на сайте, но с возможностью позвонить, если что.[/wave] [shake]Мы думали про каталог товаров для волос, но это лишнее, оставь только услуги.[/shake] Цена на стрижку: {haircut_price} руб. Запись на {days} дней вперёд. Если спросишь, то стиль – лофт, но я ещё не определился. Сделай за 3 дня, бюджет 15000.",
		"frmt": {
			"haircut_price": {"type": "rand_int", "min": 1000, "max": 1500, "step": 50},
			"days": {"type": "rand_int", "min": 7, "max": 14, "step": 1}
		},
		"good review": "Сайт супер, запись работает, клиенты довольны!",
		"bad review": "Цены не те, запись не работает, стиль ужасный.",
		"time": 55,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Цена стрижки (руб)", "step": 50, "min value": 500, "max value": 2000, "min d value": "{haircut_price}", "max d value": "{haircut_price}"},
			{"type": "slider", "text": "Запись на (дней)", "step": 1, "min value": 3, "max value": 21, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Онлайн-запись на сайте", "stat": true},
			{"type": "check", "text": "Каталог товаров (не нужен)", "stat": false}
		]
	},
	# 96. Приложение для питомцев (tag=2)
	{
		"name": "Приложение 'Зоо-помощник'",
		"desc": "[center][b]Сделай приложение для ухода за питомцами.[/b][/center] Чтобы записывать кормление, прогулки, прививки. [color=#00aa00]Сначала думали добавить трекер веса, но потом решили, что это сложно – оставим только расписание.[/color] [wave]Количество питомцев: {pets}. Напоминания о прививках: {remind}. Хотя, может, не надо напоминания, пусть пользователь сам ставит уведомления.[/wave] [shake]Мы хотели добавить возможность загружать фото питомца, но это не обязательно, можно просто текстовые заметки.[/shake] Интерфейс сделать простым, без лишних украшений. [b]Кодовое слово для входа в настройки: «{secret}».[/b] Сделай за 2 дня.",
		"frmt": {
			"pets": {"type": "rand_int", "min": 2, "max": 5, "step": 1},
			"remind": {"type": "rand_bool"},
			"secret": {"type": "rand_text", "pool": ["pethelper", "zoomagic", "doggo"]}
		},
		"good review": "Отличное приложение, всё под контролем!",
		"bad review": "Напоминания не работают, питомцев мало.",
		"time": 45,
		"money": 8000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество питомцев", "step": 1, "min value": 1, "max value": 8, "min d value": "{pets}", "max d value": "{pets}"},
			{"type": "check", "text": "Напоминания о прививках", "stat": "{remind}"},
			{"type": "check", "text": "Загрузка фото (не обязательно)", "stat": false},
			{"type": "line", "text": "Кодовое слово", "ph text": "введите слово", "correct": "{secret}"}
		]
	},
	# 97. Калькулятор для магазина (tag=3)
	{
		"name": "Магазин 'Товары для дома'",
		"desc": "[center][b]Нужен калькулятор скидок для моего магазина.[/b][/center] Чтобы сотрудники могли быстро считать итоговую цену. [color=#ff8800]Сначала думал сделать просто процент, но потом решил добавить ещё и наценку.[/color] [wave]Скидка по умолчанию: {discount}%. Наценка: {markup}%. Скидка для пенсионеров: {pension}. Но я не уверен, что пенсионерам нужна скидка, у нас не социальный магазин. Хотя, давай оставим, пусть будет.[/wave] [shake]Добавь кнопку сброса, но её можно убрать, если мешает.[/shake] Пусть будет простая таблица, без дизайна. Сделай за 1 день.",
		"frmt": {
			"discount": {"type": "rand_int", "min": 5, "max": 15, "step": 1},
			"markup": {"type": "rand_int", "min": 10, "max": 30, "step": 2},
			"pension": {"type": "rand_bool"}
		},
		"good review": "Удобно, быстро считают, скидки на месте.",
		"bad review": "Кнопка сброса не работает, наценка путает.",
		"time": 30,
		"money": 5000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Скидка по умолчанию (%)", "step": 1, "min value": 0, "max value": 30, "min d value": "{discount}", "max d value": "{discount}"},
			{"type": "slider", "text": "Наценка по умолчанию (%)", "step": 2, "min value": 0, "max value": 50, "min d value": "{markup}", "max d value": "{markup}"},
			{"type": "check", "text": "Скидка для пенсионеров", "stat": "{pension}"},
			{"type": "check", "text": "Кнопка сброса (может быть)", "stat": true}
		]
	},
	# 98. Сайт для автосервиса (tag=1)
	{
		"name": "Автосервис 'Мастер-колёс'",
		"desc": "[center][b]Сделай сайт для автомастерской.[/b][/center] Хочу, чтобы клиенты могли записываться на диагностику, замену масла, шиномонтаж. [color=#ff8800]Сначала думал сделать 3 услуги, но потом добавил ещё и регулировку фар – всего 4.[/color] [wave]Цены: диагностика от {diagnostic_price} руб, масло от {oil_change_price} руб, шиномонтаж от {tire_price} руб. Но я не уверен, что цены правильные, может, надо поднять на 10%.[/wave] [shake]Добавь чат с мастером, но это пока экспериментально, если будут вопросы – уберём.[/shake] Сделай за 3 дня, бюджет 20000.",
		"frmt": {
			"diagnostic_price": {"type": "rand_int", "min": 500, "max": 800, "step": 50},
			"oil_change_price": {"type": "rand_int", "min": 1000, "max": 1500, "step": 50},
			"tire_price": {"type": "rand_int", "min": 800, "max": 1200, "step": 50}
		},
		"good review": "Отлично, запись работает, цены понятные!",
		"bad review": "Цены не те, чат не работает, запись путается.",
		"time": 55,
		"money": 20000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Диагностика (руб)", "step": 50, "min value": 300, "max value": 1200, "min d value": "{diagnostic_price}", "max d value": "{diagnostic_price}"},
			{"type": "slider", "text": "Замена масла (руб)", "step": 50, "min value": 500, "max value": 2000, "min d value": "{oil_change_price}", "max d value": "{oil_change_price}"},
			{"type": "slider", "text": "Шиномонтаж (руб)", "step": 50, "min value": 400, "max value": 1500, "min d value": "{tire_price}", "max d value": "{tire_price}"},
			{"type": "check", "text": "Чат с мастером (экспериментально)", "stat": true}
		]
	},
	# 99. Приложение для изучения языков (tag=2)
	{
		"name": "Изучай слова (Lingo)",
		"desc": "[center][b]Приложение для запоминания иностранных слов.[/b][/center] Добавь карточки с переводом, тесты, и повторение. [color=#00ccff]Сначала хотел 200 слов, но потом решил, что 150 достаточно – меньше нагрузки.[/color] [wave]Количество уровней: {levels}. Время на тест: {test_time} секунд. Но может, лучше без таймера? Для детей таймер – это стресс, пусть будет без него.[/wave] [shake]Добавь возможность создавать свои наборы слов – это круто, но если сложно, то можно стандартные темы.[/shake] Сделай за 2 дня, бюджет 10000.",
		"frmt": {
			"levels": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"test_time": {"type": "rand_int", "min": 30, "max": 60, "step": 5}
		},
		"good review": "Слова запоминаются легко, тесты полезные.",
		"bad review": "Уровней мало, таймер раздражает.",
		"time": 50,
		"money": 10000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество уровней", "step": 1, "min value": 3, "max value": 15, "min d value": "{levels}", "max d value": "{levels}"},
			{"type": "slider", "text": "Время на тест (сек)", "step": 5, "min value": 15, "max value": 90, "min d value": "{test_time}", "max d value": "{test_time}"},
			{"type": "check", "text": "Таймер на тесте (не для детей)", "stat": false}
		]
	},
	# 100. Платформа для онлайн-курсов (tag=3)
	{
		"name": "Образовательный портал 'Умник'",
		"desc": "[center][b]Сделай платформу для онлайн-обучения.[/b][/center] Курсы: Python, Java, Web. [color=#ff8800]Сначала хотели 5 курсов, но потом убрали C++ и SQL – оставили только 3 основных.[/color] [wave]Количество уроков в Python: {python_lessons}, в Java: {java_lessons}, в Web: {web_lessons}. Но мы ещё не решили, сколько уроков добавить, можно сделать по 10 на каждый.[/wave] [shake]Добавь систему тестирования, но если это долго, то можно только домашние задания.[/shake] [b]Кодовое слово для администратора: «{admin_key}».[/b] Сделай за 5 дней, бюджет 50000.",
		"frmt": {
			"python_lessons": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"java_lessons": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"web_lessons": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"admin_key": {"type": "rand_text", "pool": ["admin2026", "educator", "master"]}
		},
		"good review": "Платформа удобная, курсы интересные, тесты помогают.",
		"bad review": "Мало уроков, админка не работает, тесты глючат.",
		"time": 70,
		"money": 50000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Уроков в Python", "step": 1, "min value": 5, "max value": 20, "min d value": "{python_lessons}", "max d value": "{python_lessons}"},
			{"type": "slider", "text": "Уроков в Java", "step": 1, "min value": 5, "max value": 20, "min d value": "{java_lessons}", "max d value": "{java_lessons}"},
			{"type": "slider", "text": "Уроков в Web", "step": 1, "min value": 5, "max value": 20, "min d value": "{web_lessons}", "max d value": "{web_lessons}"},
			{"type": "line", "text": "Код админа", "ph text": "введите ключ", "correct": "{admin_key}"}
		]
	},
	# 101. Сайт для пекарни (tag=2)
	{
		"name": "Пекарня 'Аромат'",
		"desc": "[center][b]Сайт для пекарни с доставкой.[/b][/center] Меню: хлеб, круассаны, пирожки, пицца. [color=#884400]Сначала хотели 4 позиции, но потом решили добавить ещё и сладкие булочки – всего 5.[/color] [wave]Цена на хлеб: {bread_price} руб, круассан: {croissant_price} руб. Доставка: {delivery} – но я не уверен, может, {delivery2} лучше?[/wave] [shake]Добавь систему лояльности, но если это сложно, то просто скидка на день рождения.[/shake] Сделай за 3 дня.",
		"frmt": {
			"bread_price": {"type": "rand_int", "min": 50, "max": 80, "step": 5},
			"croissant_price": {"type": "rand_int", "min": 60, "max": 100, "step": 5},
			"delivery": {"type": "rand_option", "pool": ["курьер", "почта", "самовывоз"]},
			"delivery2": {"type": "rand_option", "pool": ["курьер", "почта", "самовывоз"]}
		},
		"good review": "Вкусно, доставка быстрая, сайт удобный.",
		"bad review": "Цены высокие, доставка долгая, меню скудное.",
		"time": 45,
		"money": 12000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Цена хлеба (руб)", "step": 5, "min value": 30, "max value": 120, "min d value": "{bread_price}", "max d value": "{bread_price}"},
			{"type": "slider", "text": "Цена круассана (руб)", "step": 5, "min value": 40, "max value": 140, "min d value": "{croissant_price}", "max d value": "{croissant_price}"},
			{"type": "option", "text": "Способ доставки", "items": ["Курьер", "Почта", "Самовывоз"], "indx": "{delivery_index}"},
			{"type": "check", "text": "Скидка на день рождения", "stat": true}
		]
	},
	# 102. Приложение для планирования путешествий (tag=1)
	{
		"name": "Планировщик путешествий 'Маршрут'",
		"desc": "[center][b]Приложение для создания маршрутов по городам.[/b][/center] Добавляй достопримечательности, отели, рестораны. [color=#ff66aa]Сначала хотели 5 городов, но потом решили ограничиться 3 основными: Москва, Питер, Сочи.[/color] [wave]Количество дней: {days}. Бюджет на отель: {hotel_budget} руб. Но я думаю, что бюджет занижен, пусть будет больше.[/wave] [shake]Добавь карту, но если это сложно, то просто список мест.[/shake] Сделай за 4 дня, бюджет 25000.",
		"frmt": {
			"days": {"type": "rand_int", "min": 3, "max": 7, "step": 1},
			"hotel_budget": {"type": "rand_int", "min": 2000, "max": 4000, "step": 200}
		},
		"good review": "Маршруты оптимальные, приложение удобное.",
		"bad review": "Мало городов, бюджет не соответствует.",
		"time": 60,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество дней", "step": 1, "min value": 2, "max value": 10, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Бюджет отеля (руб)", "step": 200, "min value": 1000, "max value": 6000, "min d value": "{hotel_budget}", "max d value": "{hotel_budget}"},
			{"type": "check", "text": "Карта с достопримечательностями", "stat": true}
		]
	},
	# 103. Сайт для юридической консультации (tag=3)
	{
		"name": "Юрист Онлайн",
		"desc": "[center][b]Сайт для консультаций по праву.[/b][/center] Разделы: семейное, трудовое, гражданское, уголовное. [color=#00aa00]Сначала хотели 4 раздела, но потом решили оставить только семейное и трудовое – остальное по запросу.[/color] [wave]Стоимость консультации: {price} руб. Первичная консультация – бесплатно, но только 20 минут. Хотя, может, 15 минут? Решай сам.[/wave] [shake]Добавьте онлайн-чат с юристом, но если это слишком дорого, то просто форма заявки.[/shake] Сделай за 3 дня.",
		"frmt": {
			"price": {"type": "rand_int", "min": 1000, "max": 2000, "step": 100}
		},
		"good review": "Консультации качественные, сайт удобный.",
		"bad review": "Мало разделов, цена завышена, чат не работает.",
		"time": 50,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Стоимость консультации (руб)", "step": 100, "min value": 500, "max value": 3000, "min d value": "{price}", "max d value": "{price}"},
			{"type": "check", "text": "Онлайн-чат с юристом", "stat": true},
			{"type": "check", "text": "Бесплатная первичная консультация (20 мин)", "stat": true}
		]
	},
	# 104. Приложение для доставки еды (tag=2)
	{
		"name": "Еда-на-дом",
		"desc": "[center][b]Приложение для заказа еды из ресторанов.[/b][/center] Каталог ресторанов: {restaurants}. Блюд в меню: {dishes_per_rest}. Сначала хотели 10 ресторанов, но потом решили, что 5 достаточно для начала.[color=#ff8800]Доставка бесплатная при заказе от {free_delivery} руб.[/color] [wave]Минимальный заказ: {min_order} руб. Но если клиент закажет мало, то доставка платная – так и оставь.[/wave] [shake]Добавь рейтинг ресторанов, но если это сложно, то можно просто отзывы.[/shake] Сделай за 4 дня.",
		"frmt": {
			"restaurants": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"dishes_per_rest": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"free_delivery": {"type": "rand_int", "min": 500, "max": 1000, "step": 50},
			"min_order": {"type": "rand_int", "min": 200, "max": 400, "step": 50}
		},
		"good review": "Много ресторанов, доставка быстрая, еда вкусная.",
		"bad review": "Мало ресторанов, блюд мало, доставка дорогая.",
		"time": 60,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество ресторанов", "step": 1, "min value": 3, "max value": 12, "min d value": "{restaurants}", "max d value": "{restaurants}"},
			{"type": "slider", "text": "Блюд в ресторане", "step": 1, "min value": 5, "max value": 18, "min d value": "{dishes_per_rest}", "max d value": "{dishes_per_rest}"},
			{"type": "slider", "text": "Сумма для бесплатной доставки (руб)", "step": 50, "min value": 300, "max value": 1500, "min d value": "{free_delivery}", "max d value": "{free_delivery}"},
			{"type": "slider", "text": "Минимальный заказ (руб)", "step": 50, "min value": 100, "max value": 600, "min d value": "{min_order}", "max d value": "{min_order}"}
		]
	},
	# 105–114: 10 сообщений без заказа (только текст)

	# 105. Мама просит купить пельмени
	{
		"name": "Мама (звонит)",
		"desc": "[center][b]Сынок, хватит за компом сидеть![/b][/center] Иди в магазин, купи пельменей, а то у нас ужина нет. Возьми {count} пачки, мы все голодные.",
		"good review": "Молодец, принёс!",
		"bad review": "Опять не принёс? Будешь голодный!",
		"time": 30,
		"money": 0,
		"ready text": "Иду за пельменями!",
		"cancel text": "Я занят, потом",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 106. Друг спрашивает о делах
	{
		"name": "Друг Серёга",
		"desc": "[center][b]Привет! Как дела?[/b][/center] Хули не отвечаешь? Мы уже неделю не виделись. Давай встретимся в пятницу, пивка попьём?",
		"good review": "Классно, встретимся!",
		"bad review": "Ну и ладно, я один выпью.",
		"time": 20,
		"money": 0,
		"ready text": "Давай встретимся!",
		"cancel text": "Не могу, работаю",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 107. Бабушка просит помочь с картошкой
	{
		"name": "Бабушка Зина",
		"desc": "[center][b]Внучек, помоги картошку вскопать![/b][/center] У меня спина болит, а ты сильный. Приходи завтра утром, я пирожков напеку.",
		"good review": "Спасибо, внучек, ты выручил!",
		"bad review": "Эх, придётся самой копать...",
		"time": 25,
		"money": 0,
		"ready text": "Приду, помогу!",
		"cancel text": "Не могу, у меня дела",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 108. Сестра просит скачать фильм
	{
		"name": "Сестра Лена",
		"desc": "[center][b]Братан, скачай фильм «Титаник»![/b][/center] А то я хочу пересмотреть, а у меня интернета нет. Найди в хорошем качестве, с русской озвучкой.",
		"good review": "Спасибо, скачал!",
		"bad review": "Не скачал? Ну и ладно, я попрошу подругу.",
		"time": 15,
		"money": 0,
		"ready text": "Скачаю сейчас!",
		"cancel text": "Не могу, занят",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 109. Сосед просит одолжить дрель
	{
		"name": "Сосед дядя Петя",
		"desc": "[center][b]Слышь, дай дрель на час![/b][/center] Мне полку повесить, а моя сломалась. Я быстро, до вечера верну.",
		"good review": "Одолжил, спасибо!",
		"bad review": "Жалко, что не дал...",
		"time": 15,
		"money": 0,
		"ready text": "Держи дрель!",
		"cancel text": "Самому нужна",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 110. Племянник просит помочь с уроками
	{
		"name": "Племянник Кирилл",
		"desc": "[center][b]Дядя, помоги с математикой![/b][/center] Тут задачи на проценты, я ничего не понимаю. Приходи сегодня, а то завтра контрольная.",
		"good review": "Объяснил, теперь понял!",
		"bad review": "Не пришёл, ну и ладно, спрошу у учителя.",
		"time": 20,
		"money": 0,
		"ready text": "Приду, помогу!",
		"cancel text": "Не могу, я занят",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 111. Тётя просит проверить сайт
	{
		"name": "Тётя Галя",
		"desc": "[center][b]Племянник, посмотри, у меня сайт не открывается![/b][/center] Наверное, вирус. Ты ж программист, почини, а то я в интернет-магазине хотела заказ сделать.",
		"good review": "Починил, спасибо!",
		"bad review": "Не помог, придётся вызывать мастера.",
		"time": 30,
		"money": 0,
		"ready text": "Сейчас гляну!",
		"cancel text": "Не могу, я не в теме",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 112. Девушка спрашивает о планах
	{
		"name": "Подруга Оля",
		"desc": "[center][b]Привет! Что делаешь сегодня вечером?[/b][/center] Мы с девчонками идём в кино, хочешь с нами? Будем смотреть новый фильм ужасов.",
		"good review": "Иду с вами!",
		"bad review": "Ну и ладно, без тебя пойдём.",
		"time": 20,
		"money": 0,
		"ready text": "Иду с вами!",
		"cancel text": "Не могу, работаю",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 113. Дедушка просит найти рецепт
	{
		"name": "Дедушка Вася",
		"desc": "[center][b]Внучок, найди рецепт шашлыка по-кавказски![/b][/center] Я хочу на выходных сделать, а то мой старый рецепт я потерял. Чтобы с маринадом из гранатового сока.",
		"good review": "Нашёл рецепт, спасибо!",
		"bad review": "Не нашёл, ладно, сам придумаю.",
		"time": 25,
		"money": 0,
		"ready text": "Найду рецепт!",
		"cancel text": "Не могу, нет времени",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# 114. Брат просит помочь с переездом
	{
		"name": "Брат Серёга",
		"desc": "[center][b]Братан, помогай переезжать в субботу![/b][/center] Я квартиру снимаю новую, надо вещи перетаскать. У меня только один друг помогает, а надо человек пять. Приходи, я пиво поставлю.",
		"good review": "Помог, спасибо!",
		"bad review": "Не пришёл, ну и ладно, справлюсь сам.",
		"time": 30,
		"money": 0,
		"ready text": "Приду, помогу!",
		"cancel text": "Не могу, занят",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"prms": []
	},
	# ============================================================================
	# 10 НОВЫХ DEFAULT ЗАКАЗОВ С БОЛЬШИМ КОЛИЧЕСТВОМ PRMS (115–124)
	# ============================================================================

	# 115. Обычный (tag=1) – Ремонт квартиры (много параметров)
	{
		"name": "Мастер на час (ремонт)",
		"desc": "[center][b]Слушай, надо сделать ремонт в квартире.[/b][/center] [color=#ff8800]Сначала думали только стены покрасить, но потом решили, что нужно и полы поменять, и потолок выровнять.[/color] [wave]Количество комнат: от {rooms} до {rooms2} – я ещё не решил, сколько именно.[/wave] [shake]И вот с цветом стен я мучаюсь: хочу {color}, но жена говорит, что {color2} лучше. Я склоняюсь к {color}, но не уверен.[/shake] [color=#00ccff]Надо также розетки перенести – примерно {sockets} штук, но может и больше.[/color] [i]И ещё светильники: говорят, что {lights} – это минимум, но я хочу {lights2}, чтобы светлее было.[/i] [b]Бюджет: от {budget_min} до {budget_max} тыс. руб.[/b] [wave]Сроки: {days} дней, но если не успеем, то можно {days2}.[/wave] [shake]А, и ещё: мне сказали, что надо сделать звукоизоляцию, но я думаю, обойдёмся. Или нет? Ладно, пусть будет {soundproof}.[/shake]",
		"good review": "Отлично! Ремонт сделан качественно, всё как я хотел. Спасибо!",
		"bad review": "Кошмар! Цвет не тот, розетки не там, сроки сорваны. Полный провал!",
		"time": 90,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"rooms": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"rooms2": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"color": {"type": "rand_option", "pool": ["белый", "бежевый", "голубой"]},
			"color2": {"type": "rand_option", "pool": ["жёлтый", "зелёный", "розовый"]},
			"sockets": {"type": "rand_int", "min": 4, "max": 8, "step": 1},
			"lights": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"lights2": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"budget_min": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"budget_max": {"type": "rand_int", "min": 35, "max": 50, "step": 2},
			"days": {"type": "rand_int", "min": 10, "max": 15, "step": 1},
			"days2": {"type": "rand_int", "min": 15, "max": 20, "step": 1},
			"soundproof": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Количество комнат (минимум)", "step": 1, "min value": 1, "max value": 6, "min d value": "{rooms}", "max d value": "{rooms}"},
			{"type": "slider", "text": "Количество комнат (максимум)", "step": 1, "min value": 1, "max value": 6, "min d value": "{rooms2}", "max d value": "{rooms2}"},
			{"type": "option", "text": "Цвет стен", "items": ["Белый", "Бежевый", "Голубой"], "indx": "{color_index}"},
			{"type": "check", "text": "Звукоизоляция (нужна?)", "stat": "{soundproof}"},
			{"type": "slider", "text": "Количество розеток", "step": 1, "min value": 2, "max value": 12, "min d value": "{sockets}", "max d value": "{sockets}"},
			{"type": "slider", "text": "Количество светильников (минимум)", "step": 1, "min value": 2, "max value": 10, "min d value": "{lights}", "max d value": "{lights}"},
			{"type": "slider", "text": "Количество светильников (максимум)", "step": 1, "min value": 2, "max value": 10, "min d value": "{lights2}", "max d value": "{lights2}"},
			{"type": "slider", "text": "Бюджет (тыс. руб) – от", "step": 2, "min value": 10, "max value": 60, "min d value": "{budget_min}", "max d value": "{budget_min}"},
			{"type": "slider", "text": "Бюджет (тыс. руб) – до", "step": 2, "min value": 10, "max value": 60, "min d value": "{budget_max}", "max d value": "{budget_max}"},
			{"type": "slider", "text": "Срок (дней) – минимум", "step": 1, "min value": 5, "max value": 25, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Срок (дней) – максимум", "step": 1, "min value": 5, "max value": 25, "min d value": "{days2}", "max d value": "{days2}"}
		]
	},
	# 116. Обычный (tag=2) – Сайт для строительной компании (много параметров)
	{
		"name": "Строй-Гарант (официальный сайт)",
		"desc": "[center][b]Нужен сайт для строительной компании с портфолио, прайсом и онлайн-калькулятором.[/b][/center] [color=#884400]Сначала хотели 5 разделов, но потом решили, что 3 достаточно: 'О нас', 'Услуги', 'Контакты'.[/color] [wave]Количество проектов в портфолио: {projects} – но мы планируем добавить ещё {projects2} позже.[/wave] [shake]Калькулятор должен считать стоимость от {price_from} до {price_to} тыс. руб, но если клиент вводит площадь больше {area} кв.м, то цена увеличивается.[/shake] [color=#00ccff]Отзывы: {reviews} штук, но мы не уверены, что их хватит – может, {reviews2}?[/color] [i]Форма заявки должна содержать поля: имя, телефон, email, комментарий – это обязательно.[/i] [b]Цветовая схема: {color} – я думаю, это подойдёт, но дизайнер предлагает {color2}.[/b] [wave]И ещё: мы хотим добавить блог, но пока не решили – пусть будет {blog}.[/wave]",
		"good review": "Сайт отличный, всё работает, калькулятор точный. Рекомендуем!",
		"bad review": "Портфолио мало, калькулятор врёт, форма не отправляется.",
		"time": 80,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"projects": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"projects2": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"price_from": {"type": "rand_int", "min": 500, "max": 800, "step": 50},
			"price_to": {"type": "rand_int", "min": 900, "max": 1200, "step": 50},
			"area": {"type": "rand_int", "min": 100, "max": 200, "step": 10},
			"reviews": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"reviews2": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"color": {"type": "rand_option", "pool": ["синий", "зелёный", "оранжевый"]},
			"color2": {"type": "rand_option", "pool": ["серый", "белый", "чёрный"]},
			"blog": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Проектов в портфолио (сейчас)", "step": 1, "min value": 4, "max value": 20, "min d value": "{projects}", "max d value": "{projects}"},
			{"type": "slider", "text": "Будет добавлено проектов", "step": 1, "min value": 1, "max value": 10, "min d value": "{projects2}", "max d value": "{projects2}"},
			{"type": "slider", "text": "Минимальная цена (тыс. руб)", "step": 50, "min value": 300, "max value": 1200, "min d value": "{price_from}", "max d value": "{price_from}"},
			{"type": "slider", "text": "Максимальная цена (тыс. руб)", "step": 50, "min value": 300, "max value": 1500, "min d value": "{price_to}", "max d value": "{price_to}"},
			{"type": "slider", "text": "Порог площади для повышения цены (кв.м)", "step": 10, "min value": 50, "max value": 300, "min d value": "{area}", "max d value": "{area}"},
			{"type": "slider", "text": "Количество отзывов (сейчас)", "step": 1, "min value": 3, "max value": 15, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "slider", "text": "Планируемое количество отзывов", "step": 1, "min value": 3, "max value": 20, "min d value": "{reviews2}", "max d value": "{reviews2}"},
			{"type": "option", "text": "Цветовая схема (основная)", "items": ["Синий", "Зелёный", "Оранжевый"], "indx": "{color_index}"},
			{"type": "check", "text": "Добавлять блог на сайт", "stat": "{blog}"}
		]
	},
	# 117. Обычный (tag=3) – Платформа для онлайн-курсов (много параметров)
	{
		"name": "Образовательный центр 'Знание'",
		"desc": "[center][b]Создаём платформу для онлайн-обучения с курсами по программированию, дизайну и маркетингу.[/b][/center] [color=#ff8800]Сначала хотели 5 курсов, но потом сократили до 3 основных: Python, Web-дизайн, SMM.[/color] [wave]Количество уроков в Python: {python_lessons}, в Web-дизайне: {design_lessons}, в SMM: {smm_lessons} – но мы думаем, что можно добавить ещё по {extra_lessons} в каждый.[/wave] [shake]Цена за курс: от {price_min} до {price_max} руб. – мы ещё не определились.[/shake] [color=#00ccff]Система тестирования: {tests} тестов на курс, но может быть и {tests2}.[/color] [i]Длительность доступа: {duration} месяцев – но мы думаем, что {duration2} лучше.[/i] [b]Язык интерфейса: {lang} – хотя мы думали о {lang2}.[/b] [wave]И ещё: нужна интеграция с платежными системами – {payment}.[/wave]",
		"good review": "Платформа удобная, курсы интересные, тесты помогают. Рекомендую!",
		"bad review": "Мало уроков, цена высокая, тесты не работают.",
		"time": 85,
		"money": 40000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"frmt": {
			"python_lessons": {"type": "rand_int", "min": 15, "max": 25, "step": 1},
			"design_lessons": {"type": "rand_int", "min": 12, "max": 20, "step": 1},
			"smm_lessons": {"type": "rand_int", "min": 10, "max": 18, "step": 1},
			"extra_lessons": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"price_min": {"type": "rand_int", "min": 5000, "max": 8000, "step": 500},
			"price_max": {"type": "rand_int", "min": 9000, "max": 12000, "step": 500},
			"tests": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"tests2": {"type": "rand_int", "min": 6, "max": 8, "step": 1},
			"duration": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"duration2": {"type": "rand_int", "min": 6, "max": 12, "step": 1},
			"lang": {"type": "rand_option", "pool": ["русский", "английский", "испанский"]},
			"lang2": {"type": "rand_option", "pool": ["немецкий", "французский", "китайский"]},
			"payment": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Уроков в Python", "step": 1, "min value": 8, "max value": 40, "min d value": "{python_lessons}", "max d value": "{python_lessons}"},
			{"type": "slider", "text": "Уроков в Web-дизайне", "step": 1, "min value": 8, "max value": 40, "min d value": "{design_lessons}", "max d value": "{design_lessons}"},
			{"type": "slider", "text": "Уроков в SMM", "step": 1, "min value": 8, "max value": 40, "min d value": "{smm_lessons}", "max d value": "{smm_lessons}"},
			{"type": "slider", "text": "Дополнительные уроков (в каждый курс)", "step": 1, "min value": 1, "max value": 10, "min d value": "{extra_lessons}", "max d value": "{extra_lessons}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 500, "min value": 2000, "max value": 12000, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 500, "min value": 2000, "max value": 15000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Тестов на курс", "step": 1, "min value": 2, "max value": 10, "min d value": "{tests}", "max d value": "{tests}"},
			{"type": "slider", "text": "Максимальное тестов (если добавим)", "step": 1, "min value": 2, "max value": 12, "min d value": "{tests2}", "max d value": "{tests2}"},
			{"type": "slider", "text": "Длительность доступа (мес)", "step": 1, "min value": 1, "max value": 12, "min d value": "{duration}", "max d value": "{duration}"},
			{"type": "slider", "text": "Максимальная длительность (мес)", "step": 1, "min value": 1, "max value": 18, "min d value": "{duration2}", "max d value": "{duration2}"},
			{"type": "option", "text": "Язык интерфейса", "items": ["Русский", "Английский", "Испанский"], "indx": "{lang_index}"},
			{"type": "check", "text": "Интеграция с платёжными системами", "stat": "{payment}"}
		]
	},
	# 118. Обычный (tag=1) – Приложение для фитнеса (много параметров)
	{
		"name": "FitApp (персональный тренер)",
		"desc": "[center][b]Сделай приложение для фитнеса с планом тренировок и дневником питания.[/b][/center] [color=#00aa00]Сначала хотели включить видеоуроки, но потом решили, что достаточно текстовых описаний.[/color] [wave]Количество тренировок в неделю: {workouts} – но я думаю, что {workouts2} будет лучше.[/wave] [shake]План питания: {meals} приёмов пищи в день, но можно и {meals2}.[/shake] [color=#ff66aa]Интеграция с Apple Watch: {watch} – хотя я сомневаюсь.[/color] [i]Водный баланс: напоминать пить {water} стаканов в день, но, может, {water2}?[/i] [b]Сон: рекомендовать спать {sleep} часов, но я предпочитаю {sleep2}.[/b] [wave]И ещё: нужна возможность делиться результатами в соцсетях – {social}.[/wave]",
		"good review": "Приложение отличное, тренировки эффективные, питание сбалансированное!",
		"bad review": "Мало тренировок, план питания не подходит, интеграция не работает.",
		"time": 55,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"workouts": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"workouts2": {"type": "rand_int", "min": 5, "max": 7, "step": 1},
			"meals": {"type": "rand_int", "min": 3, "max": 4, "step": 1},
			"meals2": {"type": "rand_int", "min": 4, "max": 5, "step": 1},
			"watch": {"type": "rand_bool"},
			"water": {"type": "rand_int", "min": 6, "max": 8, "step": 1},
			"water2": {"type": "rand_int", "min": 8, "max": 10, "step": 1},
			"sleep": {"type": "rand_int", "min": 7, "max": 8, "step": 1},
			"sleep2": {"type": "rand_int", "min": 8, "max": 9, "step": 1},
			"social": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Тренировок в неделю (минимум)", "step": 1, "min value": 2, "max value": 7, "min d value": "{workouts}", "max d value": "{workouts}"},
			{"type": "slider", "text": "Тренировок в неделю (максимум)", "step": 1, "min value": 2, "max value": 7, "min d value": "{workouts2}", "max d value": "{workouts2}"},
			{"type": "slider", "text": "Приёмов пищи в день (минимум)", "step": 1, "min value": 2, "max value": 6, "min d value": "{meals}", "max d value": "{meals}"},
			{"type": "slider", "text": "Приёмов пищи в день (максимум)", "step": 1, "min value": 2, "max value": 6, "min d value": "{meals2}", "max d value": "{meals2}"},
			{"type": "check", "text": "Интеграция с Apple Watch", "stat": "{watch}"},
			{"type": "slider", "text": "Стаканов воды в день (минимум)", "step": 1, "min value": 4, "max value": 12, "min d value": "{water}", "max d value": "{water}"},
			{"type": "slider", "text": "Стаканов воды в день (максимум)", "step": 1, "min value": 4, "max value": 12, "min d value": "{water2}", "max d value": "{water2}"},
			{"type": "slider", "text": "Рекомендуемый сон (часов)", "step": 1, "min value": 5, "max value": 10, "min d value": "{sleep}", "max d value": "{sleep}"},
			{"type": "check", "text": "Возможность делиться результатами", "stat": "{social}"}
		]
	},
	# 119. Обычный (tag=2) – Интернет-магазин одежды (много параметров)
	{
		"name": "Модный гардероб (онлайн-магазин)",
		"desc": "[center][b]Открываем интернет-магазин одежды с доставкой по всей стране.[/b][/center] [color=#ff66aa]Каталог: {categories} категорий товаров, но мы думаем добавить ещё {categories2}.[/color] [wave]Товаров в категории: от {items_min} до {items_max} – пока не знаем точно.[/wave] [shake]Цены: от {price_min} до {price_max} руб. – но с учётом скидок, возможно, будут ниже.[/shake] [color=#0088ff]Фильтры: по размеру, цвету, бренду – {filters} фильтров, но можно {filters2}.[/color] [i]Отзывы: разрешить {reviews} отзывов на товар, но, может, {reviews2}?[/i] [b]Доставка: {delivery} – хотя мы думали о {delivery2}.[/b] [wave]И ещё: нужно добавить корзину и оплату – обязательно.[/wave]",
		"good review": "Магазин отличный, каталог удобный, доставка быстрая. Всё понравилось!",
		"bad review": "Каталог мал, цены завышены, фильтры не работают.",
		"time": 65,
		"money": 22000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"categories": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"categories2": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"items_min": {"type": "rand_int", "min": 10, "max": 15, "step": 1},
			"items_max": {"type": "rand_int", "min": 20, "max": 30, "step": 1},
			"price_min": {"type": "rand_int", "min": 500, "max": 800, "step": 50},
			"price_max": {"type": "rand_int", "min": 1200, "max": 2000, "step": 50},
			"filters": {"type": "rand_int", "min": 3, "max": 4, "step": 1},
			"filters2": {"type": "rand_int", "min": 4, "max": 5, "step": 1},
			"reviews": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"reviews2": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"delivery": {"type": "rand_option", "pool": ["курьер", "почта", "самовывоз"]},
			"delivery2": {"type": "rand_option", "pool": ["сдэк", "боксберри", "сберлогистика"]}
		},
		"prms": [
			{"type": "slider", "text": "Категорий товаров (сейчас)", "step": 1, "min value": 3, "max value": 12, "min d value": "{categories}", "max d value": "{categories}"},
			{"type": "slider", "text": "Планируется добавить категорий", "step": 1, "min value": 1, "max value": 8, "min d value": "{categories2}", "max d value": "{categories2}"},
			{"type": "slider", "text": "Минимальное количество товаров в категории", "step": 1, "min value": 5, "max value": 25, "min d value": "{items_min}", "max d value": "{items_min}"},
			{"type": "slider", "text": "Максимальное количество товаров в категории", "step": 1, "min value": 10, "max value": 50, "min d value": "{items_max}", "max d value": "{items_max}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 50, "min value": 200, "max value": 1500, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 50, "min value": 500, "max value": 3000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Количество фильтров (сейчас)", "step": 1, "min value": 1, "max value": 6, "min d value": "{filters}", "max d value": "{filters}"},
			{"type": "slider", "text": "Максимальное количество фильтров", "step": 1, "min value": 1, "max value": 8, "min d value": "{filters2}", "max d value": "{filters2}"},
			{"type": "slider", "text": "Отзывов на товар (минимум)", "step": 1, "min value": 1, "max value": 8, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "slider", "text": "Отзывов на товар (максимум)", "step": 1, "min value": 1, "max value": 10, "min d value": "{reviews2}", "max d value": "{reviews2}"},
			{"type": "option", "text": "Способ доставки", "items": ["Курьер", "Почта", "Самовывоз"], "indx": "{delivery_index}"}
		]
	},
	# 120. Обычный (tag=3) – Бронирование отелей (много параметров)
	{
		"name": "Отель-Бук (система бронирования)",
		"desc": "[center][b]Создаём систему бронирования отелей с календарём и онлайн-оплатой.[/b][/center] [color=#884400]Количество отелей: {hotels} – но мы планируем расширяться до {hotels2}.[/color] [wave]Номеров в отеле: от {rooms_min} до {rooms_max} – в зависимости от отеля.[/wave] [shake]Цены: от {price_min} до {price_max} руб. за ночь – но с учётом сезона могут меняться.[/shake] [color=#00ccff]Сервисы: {services} дополнительных услуг, но можно {services2}.[/color] [i]Отзывы: {reviews} отзывов на отель – но мы хотим {reviews2}.[/i] [b]Язык интерфейса: {lang} – хотя мы думали о {lang2}.[/b] [wave]И ещё: нужна система скидок и бонусов – {discount}.[/wave]",
		"good review": "Система удобная, бронирование быстрое, отели хорошие. Отлично!",
		"bad review": "Мало отелей, цены высокие, бронирование не работает.",
		"time": 75,
		"money": 35000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"frmt": {
			"hotels": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"hotels2": {"type": "rand_int", "min": 30, "max": 50, "step": 2},
			"rooms_min": {"type": "rand_int", "min": 10, "max": 15, "step": 1},
			"rooms_max": {"type": "rand_int", "min": 20, "max": 30, "step": 1},
			"price_min": {"type": "rand_int", "min": 1500, "max": 2500, "step": 100},
			"price_max": {"type": "rand_int", "min": 3500, "max": 5000, "step": 100},
			"services": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"services2": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"reviews": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"reviews2": {"type": "rand_int", "min": 30, "max": 50, "step": 2},
			"lang": {"type": "rand_option", "pool": ["русский", "английский", "немецкий"]},
			"lang2": {"type": "rand_option", "pool": ["французский", "испанский", "китайский"]},
			"discount": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Количество отелей (сейчас)", "step": 2, "min value": 10, "max value": 60, "min d value": "{hotels}", "max d value": "{hotels}"},
			{"type": "slider", "text": "Планируемое количество отелей", "step": 2, "min value": 10, "max value": 80, "min d value": "{hotels2}", "max d value": "{hotels2}"},
			{"type": "slider", "text": "Минимальное количество номеров в отеле", "step": 1, "min value": 5, "max value": 25, "min d value": "{rooms_min}", "max d value": "{rooms_min}"},
			{"type": "slider", "text": "Максимальное количество номеров в отеле", "step": 1, "min value": 10, "max value": 50, "min d value": "{rooms_max}", "max d value": "{rooms_max}"},
			{"type": "slider", "text": "Минимальная цена за ночь (руб)", "step": 100, "min value": 800, "max value": 4000, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена за ночь (руб)", "step": 100, "min value": 2000, "max value": 6000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Количество дополнительных услуг", "step": 1, "min value": 1, "max value": 10, "min d value": "{services}", "max d value": "{services}"},
			{"type": "slider", "text": "Максимальное количество услуг", "step": 1, "min value": 1, "max value": 12, "min d value": "{services2}", "max d value": "{services2}"},
			{"type": "slider", "text": "Количество отзывов на отель", "step": 2, "min value": 5, "max value": 80, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "slider", "text": "Максимум отзывов на отель", "step": 2, "min value": 5, "max value": 100, "min d value": "{reviews2}", "max d value": "{reviews2}"},
			{"type": "option", "text": "Язык интерфейса", "items": ["Русский", "Английский", "Немецкий"], "indx": "{lang_index}"},
			{"type": "check", "text": "Система скидок и бонусов", "stat": "{discount}"}
		]
	},
	# 121. Обычный (tag=1) – Сайт для барбершопа (много параметров)
	{
		"name": "Брутальный барбершоп",
		"desc": "[center][b]Сделай сайт для мужской парикмахерской с записью онлайн и прайс-листом.[/b][/center] [color=#ff8800]Услуги: {services} основных, но мы хотим добавить ещё {services2}.[/color] [wave]Цены: стрижка от {haircut_price}, борода от {beard_price}, комплекс от {complex_price} – но скидки на первые посещения.[/wave] [shake]Мастеров: {barbers} человек, но планируем нанять {barbers2}.[/shake] [color=#00ccff]Запись: с {time_from} до {time_to} часов – но можно сдвинуть.[/color] [i]Отзывы: {reviews} отзывов, но хотим больше.[/i] [b]Цветовая схема: {color} – я думаю, это подойдёт.[/b] [wave]И ещё: нужен раздел с работами – {portfolio}.[/wave]",
		"good review": "Сайт крутой, запись удобная, мастера отличные. Всё супер!",
		"bad review": "Цены высокие, запись не работает, мало мастеров.",
		"time": 50,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"services": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"services2": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"haircut_price": {"type": "rand_int", "min": 1000, "max": 1500, "step": 50},
			"beard_price": {"type": "rand_int", "min": 500, "max": 800, "step": 50},
			"complex_price": {"type": "rand_int", "min": 1500, "max": 2000, "step": 50},
			"barbers": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"barbers2": {"type": "rand_int", "min": 5, "max": 7, "step": 1},
			"time_from": {"type": "rand_int", "min": 9, "max": 11, "step": 1},
			"time_to": {"type": "rand_int", "min": 20, "max": 22, "step": 1},
			"reviews": {"type": "rand_int", "min": 15, "max": 25, "step": 1},
			"color": {"type": "rand_option", "pool": ["чёрный", "серый", "коричневый"]},
			"portfolio": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Основных услуг", "step": 1, "min value": 2, "max value": 8, "min d value": "{services}", "max d value": "{services}"},
			{"type": "slider", "text": "Планируется добавить услуг", "step": 1, "min value": 1, "max value": 5, "min d value": "{services2}", "max d value": "{services2}"},
			{"type": "slider", "text": "Цена стрижки (руб)", "step": 50, "min value": 500, "max value": 2000, "min d value": "{haircut_price}", "max d value": "{haircut_price}"},
			{"type": "slider", "text": "Цена бороды (руб)", "step": 50, "min value": 300, "max value": 1200, "min d value": "{beard_price}", "max d value": "{beard_price}"},
			{"type": "slider", "text": "Цена комплекса (руб)", "step": 50, "min value": 1000, "max value": 2500, "min d value": "{complex_price}", "max d value": "{complex_price}"},
			{"type": "slider", "text": "Мастеров (сейчас)", "step": 1, "min value": 2, "max value": 8, "min d value": "{barbers}", "max d value": "{barbers}"},
			{"type": "slider", "text": "Мастеров (планируется)", "step": 1, "min value": 2, "max value": 10, "min d value": "{barbers2}", "max d value": "{barbers2}"},
			{"type": "slider", "text": "Время начала записи (час)", "step": 1, "min value": 8, "max value": 12, "min d value": "{time_from}", "max d value": "{time_from}"},
			{"type": "slider", "text": "Время окончания записи (час)", "step": 1, "min value": 18, "max value": 23, "min d value": "{time_to}", "max d value": "{time_to}"},
			{"type": "slider", "text": "Количество отзывов", "step": 1, "min value": 5, "max value": 40, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "option", "text": "Цветовая схема", "items": ["Чёрный", "Серый", "Коричневый"], "indx": "{color_index}"},
			{"type": "check", "text": "Раздел с портфолио", "stat": "{portfolio}"}
		]
	},
	# 122. Обычный (tag=2) – Доставка еды (много параметров)
	{
		"name": "Еда-Момент (сервис доставки)",
		"desc": "[center][b]Создаём сервис доставки еды из ресторанов.[/b][/center] [color=#ff8800]Ресторанов: {restaurants} – но мы хотим расширить до {restaurants2}.[/color] [wave]Блюд в меню: от {dishes_min} до {dishes_max} на ресторан.[/wave] [shake]Время доставки: от {time_min} до {time_max} минут – но зависит от загруженности.[/shake] [color=#00ccff]Стоимость доставки: {delivery_price} руб – но при заказе от {free_delivery} руб – бесплатно.[/color] [i]Минимальный заказ: {min_order} руб – но мы думаем {min_order2}.[/i] [b]Курьеры: {couriers} человек, но планируем {couriers2}.[/b] [wave]И ещё: нужна система рейтинга ресторанов – {rating}.[/wave]",
		"good review": "Доставка быстрая, еда вкусная, ресторанов много. Отлично!",
		"bad review": "Мало ресторанов, доставка долгая, минимальный заказ высокий.",
		"time": 60,
		"money": 28000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"restaurants": {"type": "rand_int", "min": 12, "max": 18, "step": 2},
			"restaurants2": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"dishes_min": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"dishes_max": {"type": "rand_int", "min": 15, "max": 20, "step": 1},
			"time_min": {"type": "rand_int", "min": 25, "max": 35, "step": 1},
			"time_max": {"type": "rand_int", "min": 45, "max": 55, "step": 1},
			"delivery_price": {"type": "rand_int", "min": 100, "max": 150, "step": 10},
			"free_delivery": {"type": "rand_int", "min": 500, "max": 800, "step": 50},
			"min_order": {"type": "rand_int", "min": 200, "max": 300, "step": 10},
			"min_order2": {"type": "rand_int", "min": 300, "max": 400, "step": 10},
			"couriers": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"couriers2": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"rating": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Ресторанов (сейчас)", "step": 2, "min value": 5, "max value": 40, "min d value": "{restaurants}", "max d value": "{restaurants}"},
			{"type": "slider", "text": "Планируется ресторанов", "step": 2, "min value": 5, "max value": 50, "min d value": "{restaurants2}", "max d value": "{restaurants2}"},
			{"type": "slider", "text": "Минимум блюд в меню", "step": 1, "min value": 5, "max value": 20, "min d value": "{dishes_min}", "max d value": "{dishes_min}"},
			{"type": "slider", "text": "Максимум блюд в меню", "step": 1, "min value": 10, "max value": 30, "min d value": "{dishes_max}", "max d value": "{dishes_max}"},
			{"type": "slider", "text": "Минимальное время доставки (мин)", "step": 1, "min value": 15, "max value": 60, "min d value": "{time_min}", "max d value": "{time_min}"},
			{"type": "slider", "text": "Максимальное время доставки (мин)", "step": 1, "min value": 20, "max value": 70, "min d value": "{time_max}", "max d value": "{time_max}"},
			{"type": "slider", "text": "Стоимость доставки (руб)", "step": 10, "min value": 50, "max value": 200, "min d value": "{delivery_price}", "max d value": "{delivery_price}"},
			{"type": "slider", "text": "Сумма для бесплатной доставки (руб)", "step": 50, "min value": 300, "max value": 1200, "min d value": "{free_delivery}", "max d value": "{free_delivery}"},
			{"type": "slider", "text": "Минимальный заказ (сейчас)", "step": 10, "min value": 100, "max value": 500, "min d value": "{min_order}", "max d value": "{min_order}"},
			{"type": "slider", "text": "Планируемый минимальный заказ", "step": 10, "min value": 100, "max value": 500, "min d value": "{min_order2}", "max d value": "{min_order2}"},
			{"type": "slider", "text": "Курьеров (сейчас)", "step": 1, "min value": 2, "max value": 15, "min d value": "{couriers}", "max d value": "{couriers}"},
			{"type": "slider", "text": "Курьеров (планируется)", "step": 1, "min value": 2, "max value": 20, "min d value": "{couriers2}", "max d value": "{couriers2}"},
			{"type": "check", "text": "Система рейтинга ресторанов", "stat": "{rating}"}
		]
	},
	# 123. Обычный (tag=3) – Платформа для фрилансеров (много параметров)
	{
		"name": "Фриланс-биржа 'Умный выбор'",
		"desc": "[center][b]Создаём платформу для фрилансеров и заказчиков с системой рейтингов и безопасных сделок.[/b][/center] [color=#ff8800]Категории услуг: {categories} – но мы думаем добавить {categories2}.[/color] [wave]Заказов в день: {orders_per_day} – но может быть {orders_per_day2}.[/wave] [shake]Комиссия: {commission}% – но мы рассматриваем {commission2}%.[/shake] [color=#00ccff]Срок выполнения: {deadline} дней – но можно {deadline2}.[/color] [i]Рейтинг фрилансеров: {rating_min} до {rating_max} звезд.[/i] [b]Язык интерфейса: {lang} – хотя мы думали о {lang2}.[/b] [wave]И ещё: нужна система гарантирования платежей – {escrow}.[/wave]",
		"good review": "Платформа удобная, заказов много, комиссия низкая. Рекомендую!",
		"bad review": "Мало категорий, комиссия высокая, сроки не соблюдаются.",
		"time": 70,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"frmt": {
			"categories": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"categories2": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"orders_per_day": {"type": "rand_int", "min": 50, "max": 80, "step": 5},
			"orders_per_day2": {"type": "rand_int", "min": 80, "max": 120, "step": 5},
			"commission": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"commission2": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"deadline": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"deadline2": {"type": "rand_int", "min": 5, "max": 7, "step": 1},
			"rating_min": {"type": "rand_int", "min": 3, "max": 4, "step": 1},
			"rating_max": {"type": "rand_int", "min": 5, "max": 5, "step": 1},
			"lang": {"type": "rand_option", "pool": ["русский", "английский", "испанский"]},
			"lang2": {"type": "rand_option", "pool": ["немецкий", "французский", "итальянский"]},
			"escrow": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Категорий услуг (сейчас)", "step": 1, "min value": 4, "max value": 16, "min d value": "{categories}", "max d value": "{categories}"},
			{"type": "slider", "text": "Планируется добавить категорий", "step": 1, "min value": 2, "max value": 8, "min d value": "{categories2}", "max d value": "{categories2}"},
			{"type": "slider", "text": "Заказов в день (сейчас)", "step": 5, "min value": 20, "max value": 150, "min d value": "{orders_per_day}", "max d value": "{orders_per_day}"},
			{"type": "slider", "text": "Планируемое количество заказов в день", "step": 5, "min value": 20, "max value": 200, "min d value": "{orders_per_day2}", "max d value": "{orders_per_day2}"},
			{"type": "slider", "text": "Комиссия (сейчас, %)", "step": 1, "min value": 3, "max value": 15, "min d value": "{commission}", "max d value": "{commission}"},
			{"type": "slider", "text": "Планируемая комиссия (%)", "step": 1, "min value": 3, "max value": 15, "min d value": "{commission2}", "max d value": "{commission2}"},
			{"type": "slider", "text": "Срок выполнения (дней, минимум)", "step": 1, "min value": 1, "max value": 10, "min d value": "{deadline}", "max d value": "{deadline}"},
			{"type": "slider", "text": "Срок выполнения (дней, максимум)", "step": 1, "min value": 1, "max value": 10, "min d value": "{deadline2}", "max d value": "{deadline2}"},
			{"type": "slider", "text": "Минимальный рейтинг фрилансера (звёзд)", "step": 1, "min value": 1, "max value": 5, "min d value": "{rating_min}", "max d value": "{rating_min}"},
			{"type": "option", "text": "Язык интерфейса", "items": ["Русский", "Английский", "Испанский"], "indx": "{lang_index}"},
			{"type": "check", "text": "Система гарантирования платежей (escrow)", "stat": "{escrow}"}
		]
	},
	# 124. Обычный (tag=2) – Сайт для туристического агентства (много параметров)
	{
		"name": "Тур-Планета (онлайн-бронирование туров)",
		"desc": "[center][b]Сделай сайт для туристического агентства с поиском туров по странам и ценам.[/b][/center] [color=#ff66aa]Стран: {countries} – но мы хотим добавить {countries2}.[/color] [wave]Туров в каталоге: {tours} – но планируется {tours2}.[/wave] [shake]Цены: от {price_min} до {price_max} руб. – но с учётом сезона.[/shake] [color=#00ccff]Фильтры: по цене, звёздам отеля, питанию – {filters} фильтров.[/color] [i]Отзывы: {reviews} отзывов на тур – но мы хотим {reviews2}.[/i] [b]Количество дней: {days} – но можно {days2}.[/b] [wave]И ещё: нужна интеграция с онлайн-оплатой – {payment}.[/wave]",
		"good review": "Сайт отличный, туры легко найти, бронирование удобное. Всё понравилось!",
		"bad review": "Мало стран, цены высокие, фильтры не работают.",
		"time": 65,
		"money": 32000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"countries": {"type": "rand_int", "min": 15, "max": 25, "step": 2},
			"countries2": {"type": "rand_int", "min": 25, "max": 35, "step": 2},
			"tours": {"type": "rand_int", "min": 40, "max": 60, "step": 2},
			"tours2": {"type": "rand_int", "min": 60, "max": 80, "step": 2},
			"price_min": {"type": "rand_int", "min": 20000, "max": 30000, "step": 2000},
			"price_max": {"type": "rand_int", "min": 40000, "max": 60000, "step": 2000},
			"filters": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"reviews": {"type": "rand_int", "min": 15, "max": 25, "step": 1},
			"reviews2": {"type": "rand_int", "min": 25, "max": 35, "step": 1},
			"days": {"type": "rand_int", "min": 7, "max": 10, "step": 1},
			"days2": {"type": "rand_int", "min": 10, "max": 14, "step": 1},
			"payment": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Стран (сейчас)", "step": 2, "min value": 5, "max value": 40, "min d value": "{countries}", "max d value": "{countries}"},
			{"type": "slider", "text": "Планируется добавить стран", "step": 2, "min value": 5, "max value": 40, "min d value": "{countries2}", "max d value": "{countries2}"},
			{"type": "slider", "text": "Туров в каталоге (сейчас)", "step": 2, "min value": 20, "max value": 100, "min d value": "{tours}", "max d value": "{tours}"},
			{"type": "slider", "text": "Планируемое количество туров", "step": 2, "min value": 20, "max value": 120, "min d value": "{tours2}", "max d value": "{tours2}"},
			{"type": "slider", "text": "Минимальная цена тура (руб)", "step": 2000, "min value": 10000, "max value": 50000, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена тура (руб)", "step": 2000, "min value": 20000, "max value": 80000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Количество фильтров", "step": 1, "min value": 1, "max value": 8, "min d value": "{filters}", "max d value": "{filters}"},
			{"type": "slider", "text": "Отзывов на тур (сейчас)", "step": 1, "min value": 5, "max value": 40, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "slider", "text": "Планируемое количество отзывов", "step": 1, "min value": 5, "max value": 50, "min d value": "{reviews2}", "max d value": "{reviews2}"},
			{"type": "slider", "text": "Длительность тура (дней, минимум)", "step": 1, "min value": 3, "max value": 15, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Длительность тура (дней, максимум)", "step": 1, "min value": 3, "max value": 20, "min d value": "{days2}", "max d value": "{days2}"},
			{"type": "check", "text": "Интеграция с онлайн-оплатой", "stat": "{payment}"}
		]
	},
	# ============================================================
	# DEFAULT (15 новых)
	# ============================================================

	# 1. DEFAULT (tag=1) – Сайт для столярной мастерской
	{
		"name": "Столярка 'Древесина'",
		"desc": "[center][b]Здравствуйте! Нужен сайт для моей столярной мастерской.[/b][/center]\n[color=#884400]Сначала хотел просто визитку с телефоном, но потом решил, что нужно портфолио с фото работ.[/color]\n[wave]И ещё цены хочу указать, но не на всё, только на самые популярные заказы – примерно {items} позиций.[/wave]\n[shake]А, ещё: я думал над онлайн-заказом, но потом передумал – пусть звонят.[/shake]\n[color=#00ccff]Цвета: думал про тёмное дерево, но дочка сказала, что светлое лучше – так что выбери светлую гамму, но с элементами тёмного.[/color]",
		"frmt": {
			"items": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"discount": {"type": "rand_bool"},
			"color": {"type": "rand_option", "pool": ["светлое дерево", "тёмное дерево", "белый"]}
		},
		"good review": "Сайт красивый, портфолио впечатляет, клиенты уже звонят! Спасибо!",
		"bad review": "Нет цен, фотки грузятся долго, дизайн не мой. Плохо!",
		"time": 45,
		"money": 12000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество позиций в прайсе", "step": 1, "min value": 2, "max value": 15, "min d value": "{items}", "max d value": "{items}"},
			{"type": "check", "text": "Сделать скидку для оптовиков", "stat": "{discount}"},
			{"type": "option", "text": "Цветовая гамма", "items": ["Светлое дерево", "Тёмное дерево", "Белый"], "indx": "{color_index}"}
		]
	},

	# 2. DEFAULT (tag=2) – Ателье по ремонту одежды
	{
		"name": "Ателье 'Иголочка'",
		"desc": "[center][b]Привет! Мне нужен сайт для моего ателье.[/b][/center]\n[color=#ff66aa]Сначала хотела просто страницу с контактами, но потом подумала – пусть будет и галерея моих работ, и прайс-лист.[/color]\n[wave]И ещё я хочу, чтобы клиенты могли записываться на приём через сайт, но если это сложно, то можно просто телефон.[/wave]\n[shake]У меня есть {works} фотографий для портфолио, но я ещё не все отсортировала – покажу позже.[/shake]\n[color=#cc8800]Цвета – нежные, пастельные, но я не уверена – может, яркие? Сделай что-нибудь среднее.[/color]",
		"frmt": {
			"works": {"type": "rand_int", "min": 6, "max": 12, "step": 1},
			"booking": {"type": "rand_bool"},
			"style": {"type": "rand_option", "pool": ["пастельный", "яркий", "классический"]}
		},
		"good review": "Ой, спасибо! Сайт красивый, запись работает, клиенты идут!",
		"bad review": "Фотки не грузятся, запись не работает, цвета ужасные.",
		"time": 40,
		"money": 9000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Фото работ", "step": 1, "min value": 3, "max value": 20, "min d value": "{works}", "max d value": "{works}"},
			{"type": "check", "text": "Онлайн-запись", "stat": "{booking}"},
			{"type": "option", "text": "Стиль оформления", "items": ["Пастельный", "Яркий", "Классический"], "indx": "{style_index}"}
		]
	},

	# 3. DEFAULT (tag=3) – Доставка цветов
	{
		"name": "Цветы-Момент",
		"desc": "[center][b]Сделайте сайт для доставки цветов по городу.[/b][/center]\n[color=#ff88aa]Каталог: розы, тюльпаны, лилии, герберы – всего {flowers} видов.[/color]\n[wave]Цены: от {price_min} до {price_max} руб. за букет – но я думаю, что надо сделать скидку на первый заказ.[/wave]\n[shake]Доставка: {delivery} – но если заказ от {free_delivery} руб., то бесплатно.[/shake]\n[color=#00ccff]А ещё я хочу добавить открытки к букетам – но если сложно, то просто текст.[/color]",
		"frmt": {
			"flowers": {"type": "rand_int", "min": 4, "max": 8, "step": 1},
			"price_min": {"type": "rand_int", "min": 500, "max": 800, "step": 50},
			"price_max": {"type": "rand_int", "min": 1000, "max": 2000, "step": 50},
			"delivery": {"type": "rand_option", "pool": ["курьер", "самовывоз"]},
			"free_delivery": {"type": "rand_int", "min": 1000, "max": 1500, "step": 100},
			"cards": {"type": "rand_bool"}
		},
		"good review": "Цветы свежие, доставка быстрая, сайт удобный – отлично!",
		"bad review": "Цены завышены, доставка долгая, открыток нет.",
		"time": 50,
		"money": 14000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество видов цветов", "step": 1, "min value": 2, "max value": 12, "min d value": "{flowers}", "max d value": "{flowers}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 50, "min value": 200, "max value": 1000, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 50, "min value": 500, "max value": 3000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "option", "text": "Способ доставки", "items": ["Курьер", "Самовывоз"], "indx": "{delivery_index}"},
			{"type": "slider", "text": "Сумма для бесплатной доставки", "step": 100, "min value": 500, "max value": 2000, "min d value": "{free_delivery}", "max d value": "{free_delivery}"},
			{"type": "check", "text": "Добавить открытки к букетам", "stat": "{cards}"}
		]
	},

	# 4. DEFAULT (tag=1) – Косметолог
	{
		"name": "Косметолог Елена",
		"desc": "[center][b]Нужен сайт-визитка для косметолога.[/b][/center]\n[color=#ff66aa]Услуги: чистка лица, массаж, инъекции – всего {services} процедур.[/color]\n[wave]Цены: от {price_min} до {price_max} руб. – но я не уверена, может, надо сделать скидку на первый визит.[/wave]\n[shake]Портфолио: у меня есть {photos} фото до/после – но я ещё не все обработала.[/shake]\n[color=#00ccff]Запись: хочу онлайн-запись, но если сложно – пусть будет телефон.[/color]",
		"frmt": {
			"services": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"price_min": {"type": "rand_int", "min": 1000, "max": 1500, "step": 100},
			"price_max": {"type": "rand_int", "min": 2000, "max": 3000, "step": 100},
			"photos": {"type": "rand_int", "min": 8, "max": 15, "step": 1},
			"online_booking": {"type": "rand_bool"}
		},
		"good review": "Сайт классный, запись удобная, клиенты довольны!",
		"bad review": "Цены не те, фото мало, запись не работает.",
		"time": 45,
		"money": 11000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество услуг", "step": 1, "min value": 3, "max value": 12, "min d value": "{services}", "max d value": "{services}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 100, "min value": 500, "max value": 2500, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 100, "min value": 1000, "max value": 4000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Фото до/после", "step": 1, "min value": 3, "max value": 25, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Онлайн-запись", "stat": "{online_booking}"}
		]
	},

	# 5. DEFAULT (tag=2) – Ремонт телефонов
	{
		"name": "Сервис 'Телефон-Мастер'",
		"desc": "[center][b]Сделай сайт для ремонта телефонов.[/b][/center]\n[color=#ff8800]Услуги: замена экрана, аккумулятора, разъёма – всего {repairs} видов.[/color]\n[wave]Цены: от {price_min} до {price_max} руб. – но я думаю, что надо сделать гарантию {warranty} месяцев.[/wave]\n[shake]Мне нужен калькулятор стоимости, но если сложно – пусть просто прайс-лист.[/shake]\n[color=#00ccff]Галерея до/после – будет, но я ещё не собрал фото.[/color]",
		"frmt": {
			"repairs": {"type": "rand_int", "min": 6, "max": 10, "step": 1},
			"price_min": {"type": "rand_int", "min": 800, "max": 1200, "step": 100},
			"price_max": {"type": "rand_int", "min": 2000, "max": 3000, "step": 100},
			"warranty": {"type": "rand_int", "min": 1, "max": 3, "step": 1},
			"calculator": {"type": "rand_bool"}
		},
		"good review": "Ремонт делают быстро, цены адекватные, сайт удобный.",
		"bad review": "Цены высокие, калькулятор не работает, гарантии нет.",
		"time": 50,
		"money": 16000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Видов ремонта", "step": 1, "min value": 3, "max value": 15, "min d value": "{repairs}", "max d value": "{repairs}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 100, "min value": 300, "max value": 1500, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 100, "min value": 1000, "max value": 5000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Гарантия (месяцев)", "step": 1, "min value": 0, "max value": 6, "min d value": "{warranty}", "max d value": "{warranty}"},
			{"type": "check", "text": "Калькулятор стоимости", "stat": "{calculator}"}
		]
	},

	# 6. DEFAULT (tag=3) – Сайт для парикмахерской
	{
		"name": "Парикмахерская 'Стиль'",
		"desc": "[center][b]Нужен сайт для парикмахерской.[/b][/center]\n[color=#ff66aa]Услуги: стрижки, окрашивание, укладка – всего {services} видов.[/color]\n[wave]Цены: стрижка от {cut_price}, окрашивание от {color_price} – но я думаю, надо сделать комбо-предложения.[/wave]\n[shake]Запись: хочу онлайн-запись, но если не получится – пусть телефон.[/shake]\n[color=#00ccff]Фото работ: у меня {photos} фотографий, но я ещё не отсортировала.[/color]",
		"frmt": {
			"services": {"type": "rand_int", "min": 5, "max": 9, "step": 1},
			"cut_price": {"type": "rand_int", "min": 600, "max": 1000, "step": 50},
			"color_price": {"type": "rand_int", "min": 1200, "max": 2000, "step": 100},
			"photos": {"type": "rand_int", "min": 10, "max": 18, "step": 1},
			"online_booking": {"type": "rand_bool"}
		},
		"good review": "Сайт красивый, запись удобная, клиенты довольны.",
		"bad review": "Цены не те, фото мало, запись не работает.",
		"time": 45,
		"money": 13000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество услуг", "step": 1, "min value": 3, "max value": 12, "min d value": "{services}", "max d value": "{services}"},
			{"type": "slider", "text": "Цена стрижки (руб)", "step": 50, "min value": 300, "max value": 1500, "min d value": "{cut_price}", "max d value": "{cut_price}"},
			{"type": "slider", "text": "Цена окрашивания (руб)", "step": 100, "min value": 500, "max value": 3000, "min d value": "{color_price}", "max d value": "{color_price}"},
			{"type": "slider", "text": "Фото работ", "step": 1, "min value": 5, "max value": 30, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Онлайн-запись", "stat": "{online_booking}"}
		]
	},

	# 7. DEFAULT (tag=1) – Сайт для репетитора
	{
		"name": "Репетитор по математике",
		"desc": "[center][b]Здравствуйте! Хочу сайт для репетиторства.[/b][/center]\n[color=#0088ff]Предметы: математика, физика, информатика – всего {subjects} дисциплин.[/color]\n[wave]Стоимость занятия: {price} руб. за час – но я думаю, что для первых занятий можно сделать скидку.[/wave]\n[shake]Форма записи на занятия – нужна, но если сложно, то просто телефон.[/shake]\n[color=#ff8800]Отзывы учеников – у меня {reviews} отзывов, но я хочу ещё.[/color]",
		"frmt": {
			"subjects": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"price": {"type": "rand_int", "min": 500, "max": 1000, "step": 50},
			"reviews": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"discount_first": {"type": "rand_bool"}
		},
		"good review": "Сайт удобный, ученики находят, занятия проходят отлично.",
		"bad review": "Цена завышена, отзывов мало, форма не работает.",
		"time": 40,
		"money": 8000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество предметов", "step": 1, "min value": 1, "max value": 7, "min d value": "{subjects}", "max d value": "{subjects}"},
			{"type": "slider", "text": "Стоимость занятия (руб)", "step": 50, "min value": 200, "max value": 1500, "min d value": "{price}", "max d value": "{price}"},
			{"type": "slider", "text": "Отзывов учеников", "step": 1, "min value": 0, "max value": 20, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "check", "text": "Скидка на первое занятие", "stat": "{discount_first}"}
		]
	},

	# 8. DEFAULT (tag=2) – Сайт для фотографа
	{
		"name": "Фотограф Анна",
		"desc": "[center][b]Сделай сайт-портфолио для фотографа.[/b][/center]\n[color=#ff66aa]Жанры: портрет, пейзаж, свадьба – всего {genres} направлений.[/color]\n[wave]Количество фото в портфолио: {photos} – но я думаю, что 20 достаточно, остальное в архиве.[/wave]\n[shake]Прайс-лист: от {price_min} до {price_max} руб. – но я ещё не решила, может, сделать фиксированные пакеты.[/shake]\n[color=#00ccff]Форма заявки – нужна, чтобы клиенты оставляли заявки.[/color]",
		"frmt": {
			"genres": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"photos": {"type": "rand_int", "min": 15, "max": 30, "step": 1},
			"price_min": {"type": "rand_int", "min": 2000, "max": 3000, "step": 100},
			"price_max": {"type": "rand_int", "min": 5000, "max": 8000, "step": 100},
			"form": {"type": "rand_bool"}
		},
		"good review": "Портфолио шикарное, клиенты звонят, всё супер!",
		"bad review": "Фото мало, цены не ясны, форма не работает.",
		"time": 50,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество жанров", "step": 1, "min value": 2, "max value": 8, "min d value": "{genres}", "max d value": "{genres}"},
			{"type": "slider", "text": "Фото в портфолио", "step": 1, "min value": 5, "max value": 50, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 100, "min value": 500, "max value": 5000, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 100, "min value": 1000, "max value": 10000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "check", "text": "Форма заявки", "stat": "{form}"}
		]
	},

	# 9. DEFAULT (tag=3) – Сайт для ветеринара
	{
		"name": "Ветеринарная клиника 'Друг'",
		"desc": "[center][b]Нужен сайт для ветклиники.[/b][/center]\n[color=#0088ff]Услуги: приём, операции, анализы – всего {services} видов.[/color]\n[wave]Цены: от {price_min} до {price_max} руб. – но я думаю, что надо сделать скидку для постоянных клиентов.[/wave]\n[shake]Запись на приём – нужна онлайн, но если сложно, то телефон.[/shake]\n[color=#ff8800]Фото наших врачей – у нас {doctors} врачей, нужно их фото и описания.[/color]",
		"frmt": {
			"services": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"price_min": {"type": "rand_int", "min": 500, "max": 1000, "step": 50},
			"price_max": {"type": "rand_int", "min": 1500, "max": 2500, "step": 50},
			"doctors": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"online_booking": {"type": "rand_bool"}
		},
		"good review": "Клиника отличная, запись удобная, врачи хорошие.",
		"bad review": "Цены высокие, врачей мало, запись не работает.",
		"time": 50,
		"money": 17000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество услуг", "step": 1, "min value": 2, "max value": 12, "min d value": "{services}", "max d value": "{services}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 50, "min value": 200, "max value": 1500, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 50, "min value": 500, "max value": 4000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Количество врачей", "step": 1, "min value": 1, "max value": 10, "min d value": "{doctors}", "max d value": "{doctors}"},
			{"type": "check", "text": "Онлайн-запись", "stat": "{online_booking}"}
		]
	},

	# 10. DEFAULT (tag=1) – Сайт для грузоперевозок
	{
		"name": "Грузоперевозки 'Магистраль'",
		"desc": "[center][b]Сделай сайт для грузоперевозок.[/b][/center]\n[color=#ff8800]Типы грузов: мелкие, крупные, опасные – всего {types} категорий.[/color]\n[wave]Цена за км: от {price_per_km} руб. – но я думаю, что надо сделать скидку для постоянных клиентов.[/wave]\n[shake]Форма расчёта стоимости – нужна, но если сложно, то просто калькулятор.[/shake]\n[color=#00ccff]Галерея техники – у меня {vehicles} машин, нужно фото и характеристики.[/color]",
		"frmt": {
			"types": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"price_per_km": {"type": "rand_int", "min": 30, "max": 60, "step": 2},
			"vehicles": {"type": "rand_int", "min": 4, "max": 8, "step": 1},
			"calculator": {"type": "rand_bool"}
		},
		"good review": "Сайт удобный, расчёт стоимости точный, техника хорошая.",
		"bad review": "Цены высокие, калькулятор не работает, техники мало.",
		"time": 50,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Типов грузов", "step": 1, "min value": 2, "max value": 7, "min d value": "{types}", "max d value": "{types}"},
			{"type": "slider", "text": "Цена за км (руб)", "step": 2, "min value": 10, "max value": 100, "min d value": "{price_per_km}", "max d value": "{price_per_km}"},
			{"type": "slider", "text": "Количество машин", "step": 1, "min value": 2, "max value": 15, "min d value": "{vehicles}", "max d value": "{vehicles}"},
			{"type": "check", "text": "Калькулятор стоимости перевозки", "stat": "{calculator}"}
		]
	},

	# 11. DEFAULT (tag=2) – Сайт для автошколы
	{
		"name": "Автошкола 'За рулём'",
		"desc": "[center][b]Нужен сайт для автошколы.[/b][/center]\n[color=#ff8800]Категории: А, В, С – всего {categories} категорий.[/color]\n[wave]Стоимость обучения: {price} руб. – но я думаю, что надо сделать рассрочку.[/wave]\n[shake]Запись на занятия – нужна онлайн, но если сложно, то телефон.[/shake]\n[color=#00ccff]Наши инструкторы – у нас {instructors} инструкторов, нужно их фото и отзывы.[/color]",
		"frmt": {
			"categories": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"price": {"type": "rand_int", "min": 25000, "max": 40000, "step": 1000},
			"instructors": {"type": "rand_int", "min": 4, "max": 8, "step": 1},
			"installment": {"type": "rand_bool"}
		},
		"good review": "Обучение качественное, инструкторы опытные, сайт удобный.",
		"bad review": "Цена высокая, инструкторов мало, запись не работает.",
		"time": 50,
		"money": 19000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Категорий прав", "step": 1, "min value": 1, "max value": 5, "min d value": "{categories}", "max d value": "{categories}"},
			{"type": "slider", "text": "Стоимость обучения (руб)", "step": 1000, "min value": 15000, "max value": 60000, "min d value": "{price}", "max d value": "{price}"},
			{"type": "slider", "text": "Количество инструкторов", "step": 1, "min value": 2, "max value": 12, "min d value": "{instructors}", "max d value": "{instructors}"},
			{"type": "check", "text": "Возможность рассрочки", "stat": "{installment}"}
		]
	},

	# 12. DEFAULT (tag=3) – Сайт для массажного салона
	{
		"name": "Массажный салон 'Релакс'",
		"desc": "[center][b]Сделай сайт для массажного салона.[/b][/center]\n[color=#ff66aa]Виды массажа: классический, спортивный, релаксирующий – всего {types} видов.[/color]\n[wave]Цены: от {price_min} до {price_max} руб. за сеанс – но я думаю, что надо сделать абонементы.[/wave]\n[shake]Запись онлайн – нужна, но если сложно, то телефон.[/shake]\n[color=#00ccff]Фото интерьера и специалистов – у меня {photos} фото, но я ещё не отсортировал.[/color]",
		"frmt": {
			"types": {"type": "rand_int", "min": 4, "max": 7, "step": 1},
			"price_min": {"type": "rand_int", "min": 800, "max": 1200, "step": 50},
			"price_max": {"type": "rand_int", "min": 1500, "max": 2000, "step": 50},
			"photos": {"type": "rand_int", "min": 6, "max": 10, "step": 1},
			"online_booking": {"type": "rand_bool"}
		},
		"good review": "Массаж отличный, сайт удобный, запись работает.",
		"bad review": "Цены высокие, фото мало, запись не работает.",
		"time": 45,
		"money": 12000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Видов массажа", "step": 1, "min value": 2, "max value": 10, "min d value": "{types}", "max d value": "{types}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 50, "min value": 300, "max value": 1500, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 50, "min value": 500, "max value": 3000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Фото интерьера и специалистов", "step": 1, "min value": 3, "max value": 20, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Онлайн-запись", "stat": "{online_booking}"}
		]
	},

	# 13. DEFAULT (tag=1) – Сайт для салона красоты
	{
		"name": "Салон красоты 'Имидж'",
		"desc": "[center][b]Нужен сайт для салона красоты.[/b][/center]\n[color=#ff66aa]Услуги: маникюр, педикюр, стрижки, окрашивание – всего {services} видов.[/color]\n[wave]Цены: от {price_min} до {price_max} руб. – но я думаю, что надо сделать скидку на комплекс.[/wave]\n[shake]Запись онлайн – нужна, но если не получится, то телефон.[/shake]\n[color=#00ccff]Галерея работ – у меня {works} фото, но я ещё не все обработала.[/color]",
		"frmt": {
			"services": {"type": "rand_int", "min": 6, "max": 10, "step": 1},
			"price_min": {"type": "rand_int", "min": 600, "max": 1000, "step": 50},
			"price_max": {"type": "rand_int", "min": 1500, "max": 2500, "step": 50},
			"works": {"type": "rand_int", "min": 12, "max": 20, "step": 1},
			"online_booking": {"type": "rand_bool"}
		},
		"good review": "Салон классный, запись удобная, работы красивые.",
		"bad review": "Цены завышены, фото мало, запись не работает.",
		"time": 50,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Количество услуг", "step": 1, "min value": 3, "max value": 15, "min d value": "{services}", "max d value": "{services}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 50, "min value": 300, "max value": 1200, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 50, "min value": 500, "max value": 3000, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Фото работ", "step": 1, "min value": 5, "max value": 30, "min d value": "{works}", "max d value": "{works}"},
			{"type": "check", "text": "Онлайн-запись", "stat": "{online_booking}"}
		]
	},

	# 14. DEFAULT (tag=2) – Сайт для клининговой компании
	{
		"name": "Клининг 'Чистота'",
		"desc": "[center][b]Сделай сайт для клининговой компании.[/b][/center]\n[color=#0088ff]Услуги: уборка квартир, офисов, домов – всего {types} типов.[/color]\n[wave]Цена за уборку: от {price_min} до {price_max} руб. – но я думаю, что надо сделать скидку на регулярную уборку.[/wave]\n[shake]Калькулятор стоимости – нужен, но если сложно, то просто прайс-лист.[/shake]\n[color=#00ccff]Фото после уборки – у меня {photos} фотографий до/после.[/color]",
		"frmt": {
			"types": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"price_min": {"type": "rand_int", "min": 800, "max": 1200, "step": 50},
			"price_max": {"type": "rand_int", "min": 1500, "max": 2500, "step": 50},
			"photos": {"type": "rand_int", "min": 8, "max": 14, "step": 1},
			"calculator": {"type": "rand_bool"}
		},
		"good review": "Уборка качественная, калькулятор точный, фото впечатляют.",
		"bad review": "Цены завышены, калькулятор не работает, фото мало.",
		"time": 50,
		"money": 16000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Типов уборки", "step": 1, "min value": 2, "max value": 7, "min d value": "{types}", "max d value": "{types}"},
			{"type": "slider", "text": "Минимальная цена (руб)", "step": 50, "min value": 300, "max value": 1500, "min d value": "{price_min}", "max d value": "{price_min}"},
			{"type": "slider", "text": "Максимальная цена (руб)", "step": 50, "min value": 500, "max value": 3500, "min d value": "{price_max}", "max d value": "{price_max}"},
			{"type": "slider", "text": "Фото до/после", "step": 1, "min value": 3, "max value": 25, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Калькулятор стоимости", "stat": "{calculator}"}
		]
	},

	# 15. DEFAULT (tag=3) – Сайт для логопеда
	{
		"name": "Логопед Елена",
		"desc": "[center][b]Нужен сайт для логопеда.[/b][/center]\n[color=#ff66aa]Занятия: индивидуальные, групповые – всего {types} форматов.[/color]\n[wave]Цена: {price} руб. за занятие – но я думаю, что можно сделать скидку для групп.[/wave]\n[shake]Запись онлайн – нужна, но если сложно, то телефон.[/shake]\n[color=#00ccff]Отзывы родителей – у меня {reviews} отзывов, но я хочу больше.[/color]",
		"frmt": {
			"types": {"type": "rand_int", "min": 2, "max": 3, "step": 1},
			"price": {"type": "rand_int", "min": 600, "max": 1000, "step": 50},
			"reviews": {"type": "rand_int", "min": 4, "max": 8, "step": 1},
			"online_booking": {"type": "rand_bool"}
		},
		"good review": "Занятия помогают, сайт удобный, запись работает.",
		"bad review": "Цена высокая, отзывов мало, запись не работает.",
		"time": 45,
		"money": 10000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"prms": [
			{"type": "slider", "text": "Форматов занятий", "step": 1, "min value": 1, "max value": 4, "min d value": "{types}", "max d value": "{types}"},
			{"type": "slider", "text": "Цена за занятие (руб)", "step": 50, "min value": 300, "max value": 1500, "min d value": "{price}", "max d value": "{price}"},
			{"type": "slider", "text": "Отзывов родителей", "step": 1, "min value": 0, "max value": 15, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "check", "text": "Онлайн-запись", "stat": "{online_booking}"}
		]
	},
	# ============================================================
	# RARE (15 новых)
	# ============================================================

	# 1. RARE (tag=1) – Система для космического корабля (упрощённо)
	{
		"name": "Аэрокосмическая лаборатория",
		"desc": "[center][b]Нам нужна система управления для малого спутника.[/b][/center]\n[color=#ff4444]Ошибка = потеря аппарата, так что будь внимателен.[/color]\n[wave]Количество датчиков: {sensors}, но мы думаем добавить ещё {extra}.[/wave]\n[shake]Бюджет: {budget} млн руб. – но мы можем увеличить, если потребуется.[/shake]\n[color=#00ccff]Срок: {days} дней – но мы можем сдвинуть.[/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"extra": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"budget": {"type": "rand_int", "min": 10, "max": 20, "step": 1},
			"days": {"type": "rand_int", "min": 30, "max": 60, "step": 5},
			"critical": {"type": "rand_bool"}
		},
		"good review": "Система работает, спутник выведен на орбиту!",
		"bad review": "Ошибка в расчётах, спутник потерян.",
		"time": 150,
		"money": 150000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 1,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Количество датчиков", "step": 1, "min value": 4, "max value": 20, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Дополнительные датчики", "step": 1, "min value": 1, "max value": 8, "min d value": "{extra}", "max d value": "{extra}"},
			{"type": "slider", "text": "Бюджет (млн руб)", "step": 1, "min value": 5, "max value": 30, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 15, "max value": 90, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Критический режим", "stat": "{critical}"}
		]
	},

	# 2. RARE (tag=2) – Искусственный интеллект для бизнеса
	{
		"name": "Стартап 'Нейро-Аналитика'",
		"desc": "[center][b]Разработайте ИИ-систему для прогнозирования продаж.[/b][/center]\n[color=#ff8800]Данных: {data} терабайт – но мы планируем расширяться до {data2}.[/color]\n[wave]Точность модели: {accuracy}% – но мы хотим не менее 90%.[/wave]\n[shake]Срок: {days} дней – но мы можем продлить.[/shake]\n[color=#00ccff]Команда: {team} человек – но мы можем привлечь внешних.[/color]",
		"frmt": {
			"data": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"data2": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"accuracy": {"type": "rand_int", "min": 85, "max": 95, "step": 1},
			"days": {"type": "rand_int", "min": 40, "max": 70, "step": 5},
			"team": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"external": {"type": "rand_bool"}
		},
		"good review": "ИИ работает, прогнозы точные, бизнес растёт.",
		"bad review": "Точность низкая, сроки сорваны, данные не обработаны.",
		"time": 160,
		"money": 200000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 4},
		"prms": [
			{"type": "slider", "text": "Данных (терабайт)", "step": 2, "min value": 5, "max value": 30, "min d value": "{data}", "max d value": "{data}"},
			{"type": "slider", "text": "Планируемый объём данных", "step": 2, "min value": 5, "max value": 40, "min d value": "{data2}", "max d value": "{data2}"},
			{"type": "slider", "text": "Точность модели (%)", "step": 1, "min value": 70, "max value": 100, "min d value": "{accuracy}", "max d value": "{accuracy}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 20, "max value": 100, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Команда разработчиков", "step": 1, "min value": 2, "max value": 10, "min d value": "{team}", "max d value": "{team}"},
			{"type": "check", "text": "Привлечение внешних специалистов", "stat": "{external}"}
		]
	},

	# 3. RARE (tag=3) – Разработка игры для VR
	{
		"name": "VR-студия 'Иллюзия'",
		"desc": "[center][b]Создайте VR-игру в жанре квест.[/b][/center]\n[color=#ff8800]Уровней: {levels} – но мы думаем добавить ещё {extra_levels}.[/color]\n[wave]Графика: {graphics} – но мы хотим, чтобы было реалистично.[/wave]\n[shake]Срок: {days} дней – но мы можем увеличить.[/shake]\n[color=#00ccff]Бюджет: {budget} $ – но мы готовы к перерасходу.[/color]",
		"frmt": {
			"levels": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"extra_levels": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"graphics": {"type": "rand_option", "pool": ["реалистичная", "мультяшная", "стилизованная"]},
			"days": {"type": "rand_int", "min": 60, "max": 90, "step": 5},
			"budget": {"type": "rand_int", "min": 50000, "max": 100000, "step": 5000},
			"multiplayer": {"type": "rand_bool"}
		},
		"good review": "VR-игра потрясающая, геймплей затягивает, графика супер.",
		"bad review": "Уровней мало, графика слабая, бюджет превышен.",
		"time": 180,
		"money": 300000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 3,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Уровней", "step": 1, "min value": 3, "max value": 12, "min d value": "{levels}", "max d value": "{levels}"},
			{"type": "slider", "text": "Дополнительных уровней", "step": 1, "min value": 1, "max value": 6, "min d value": "{extra_levels}", "max d value": "{extra_levels}"},
			{"type": "option", "text": "Стиль графики", "items": ["Реалистичная", "Мультяшная", "Стилизованная"], "indx": "{graphics_index}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 30, "max value": 120, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Бюджет ($)", "step": 5000, "min value": 20000, "max value": 150000, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "check", "text": "Многопользовательский режим", "stat": "{multiplayer}"}
		]
	},

	# 4. RARE (tag=1) – Система для банка (высокая нагрузка)
	{
		"name": "Банк 'Финанс-Сити'",
		"desc": "[center][b]Нужна система для обработки миллионов транзакций в день.[/b][/center]\n[color=#ff4444]Ошибка = потеря средств, так что без багов.[/color]\n[wave]Транзакций в секунду: {tps} – но мы планируем рост до {tps2}.[/wave]\n[shake]Время отклика: {response} мс – но мы хотим не более 100 мс.[/shake]\n[color=#00ccff]Бюджет: {budget} млн руб. – но мы можем увеличить.[/color]",
		"frmt": {
			"tps": {"type": "rand_int", "min": 1000, "max": 2000, "step": 100},
			"tps2": {"type": "rand_int", "min": 2000, "max": 4000, "step": 200},
			"response": {"type": "rand_int", "min": 50, "max": 150, "step": 10},
			"budget": {"type": "rand_int", "min": 50, "max": 80, "step": 5},
			"security": {"type": "rand_bool"}
		},
		"good review": "Система стабильна, транзакции проходят мгновенно.",
		"bad review": "Ошибки в обработке, деньги теряются, система падает.",
		"time": 120,
		"money": 500000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 1,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Транзакций в секунду", "step": 100, "min value": 500, "max value": 5000, "min d value": "{tps}", "max d value": "{tps}"},
			{"type": "slider", "text": "Максимум транзакций", "step": 200, "min value": 500, "max value": 8000, "min d value": "{tps2}", "max d value": "{tps2}"},
			{"type": "slider", "text": "Время отклика (мс)", "step": 10, "min value": 20, "max value": 300, "min d value": "{response}", "max d value": "{response}"},
			{"type": "slider", "text": "Бюджет (млн руб)", "step": 5, "min value": 20, "max value": 100, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "check", "text": "Повышенные требования к безопасности", "stat": "{security}"}
		]
	},

	# 5. RARE (tag=2) – Приложение для телемедицины
	{
		"name": "Медицинский стартап 'Здоровье-Онлайн'",
		"desc": "[center][b]Сделайте приложение для консультаций с врачами онлайн.[/b][/center]\n[color=#00aa00]Врачей: {doctors} – но мы планируем нанять ещё {extra_doctors}.[/color]\n[wave]Специальности: {specialties} направлений – но мы думаем расширить.[/wave]\n[shake]Бюджет: {budget} тыс. руб. – но мы можем увеличить.[/shake]\n[color=#ff8800]Срок: {days} дней – но мы можем сдвинуть.[/color]",
		"frmt": {
			"doctors": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"extra_doctors": {"type": "rand_int", "min": 10, "max": 15, "step": 1},
			"specialties": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"budget": {"type": "rand_int", "min": 3000, "max": 5000, "step": 100},
			"days": {"type": "rand_int", "min": 45, "max": 60, "step": 5},
			"video": {"type": "rand_bool"}
		},
		"good review": "Приложение удобное, врачи квалифицированные, запись работает.",
		"bad review": "Врачей мало, запись не работает, видео консультации глючат.",
		"time": 100,
		"money": 250000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 4},
		"prms": [
			{"type": "slider", "text": "Врачей в базе", "step": 2, "min value": 5, "max value": 50, "min d value": "{doctors}", "max d value": "{doctors}"},
			{"type": "slider", "text": "Дополнительных врачей", "step": 1, "min value": 2, "max value": 25, "min d value": "{extra_doctors}", "max d value": "{extra_doctors}"},
			{"type": "slider", "text": "Специальностей", "step": 1, "min value": 3, "max value": 20, "min d value": "{specialties}", "max d value": "{specialties}"},
			{"type": "slider", "text": "Бюджет (тыс. руб)", "step": 100, "min value": 1000, "max value": 8000, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 20, "max value": 90, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Видео-консультации", "stat": "{video}"}
		]
	},

	# 6. RARE (tag=3) – Разработка системы для умного города
	{
		"name": "Умный город 'Эко-Тех'",
		"desc": "[center][b]Создайте платформу для управления городской инфраструктурой.[/b][/center]\n[color=#ff8800]Датчиков: {sensors} тысяч – но мы планируем расширяться.[/color]\n[wave]Охват: {coverage}% города – но мы хотим 100%.[/wave]\n[shake]Бюджет: {budget} млн руб. – но мы можем привлечь инвесторов.[/shake]\n[color=#00ccff]Срок: {days} месяцев – но мы можем продлить.[/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"coverage": {"type": "rand_int", "min": 60, "max": 80, "step": 2},
			"budget": {"type": "rand_int", "min": 100, "max": 150, "step": 5},
			"days": {"type": "rand_int", "min": 6, "max": 12, "step": 1},
			"ai": {"type": "rand_bool"}
		},
		"good review": "Платформа работает, город становится умнее, жители довольны.",
		"bad review": "Датчиков мало, охват низкий, система глючит.",
		"time": 180,
		"money": 600000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 3,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Датчиков (тыс)", "step": 1, "min value": 2, "max value": 15, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Охват города (%)", "step": 2, "min value": 30, "max value": 100, "min d value": "{coverage}", "max d value": "{coverage}"},
			{"type": "slider", "text": "Бюджет (млн руб)", "step": 5, "min value": 30, "max value": 200, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (месяцев)", "step": 1, "min value": 3, "max value": 18, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Использование ИИ для анализа данных", "stat": "{ai}"}
		]
	},

	# 7. RARE (tag=1) – Система для нефтяной вышки
	{
		"name": "Нефтяная платформа 'Буран'",
		"desc": "[center][b]Нужна система мониторинга для нефтяной вышки.[/b][/center]\n[color=#ff4444]Ошибка = экологическая катастрофа.[/color]\n[wave]Сенсоров: {sensors} штук – но мы можем добавить ещё.[/wave]\n[shake]Бюджет: {budget} млн $ – но мы готовы к увеличению.[/shake]\n[color=#00ccff]Срок: {days} дней – но мы можем сдвинуть.[/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 50, "max": 80, "step": 5},
			"budget": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"days": {"type": "rand_int", "min": 45, "max": 60, "step": 5},
			"redundancy": {"type": "rand_bool"}
		},
		"good review": "Система надёжна, всё под контролем, аварий нет.",
		"bad review": "Датчики врут, платформа остановлена, катастрофа.",
		"time": 140,
		"money": 400000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 1,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Сенсоров", "step": 5, "min value": 20, "max value": 120, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 2, "min value": 10, "max value": 50, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 20, "max value": 90, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Резервирование системы", "stat": "{redundancy}"}
		]
	},

	# 8. RARE (tag=2) – Разработка квантового алгоритма
	{
		"name": "Квантовый центр",
		"desc": "[center][b]Разработайте алгоритм для квантового компьютера.[/b][/center]\n[color=#ff8800]Кубитов: {qubits} – но мы планируем расширяться до {qubits2}.[/color]\n[wave]Точность: {accuracy}% – но мы хотим не менее 95%.[/wave]\n[shake]Бюджет: {budget} млн руб. – но мы можем увеличить.[/shake]\n[color=#00ccff]Срок: {days} дней – но мы можем продлить.[/color]",
		"frmt": {
			"qubits": {"type": "rand_int", "min": 30, "max": 50, "step": 5},
			"qubits2": {"type": "rand_int", "min": 50, "max": 80, "step": 5},
			"accuracy": {"type": "rand_int", "min": 90, "max": 99, "step": 1},
			"budget": {"type": "rand_int", "min": 40, "max": 60, "step": 5},
			"days": {"type": "rand_int", "min": 50, "max": 80, "step": 5},
			"error_correction": {"type": "rand_bool"}
		},
		"good review": "Алгоритм работает, точность высокая, квантовый прорыв!",
		"bad review": "Точность низкая, кубитов мало, алгоритм не стабилен.",
		"time": 160,
		"money": 500000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Кубитов (сейчас)", "step": 5, "min value": 10, "max value": 100, "min d value": "{qubits}", "max d value": "{qubits}"},
			{"type": "slider", "text": "Планируемое количество кубитов", "step": 5, "min value": 10, "max value": 150, "min d value": "{qubits2}", "max d value": "{qubits2}"},
			{"type": "slider", "text": "Точность (%)", "step": 1, "min value": 70, "max value": 100, "min d value": "{accuracy}", "max d value": "{accuracy}"},
			{"type": "slider", "text": "Бюджет (млн руб)", "step": 5, "min value": 20, "max value": 100, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 20, "max value": 120, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Коррекция ошибок", "stat": "{error_correction}"}
		]
	},

	# 9. RARE (tag=3) – Разработка бионического протеза
	{
		"name": "Био-технологии",
		"desc": "[center][b]Создайте программное обеспечение для бионического протеза.[/b][/center]\n[color=#00aa00]Датчиков: {sensors} – но мы можем добавить ещё.[/color]\n[wave]Задержка: {latency} мс – но мы хотим не более 20 мс.[/wave]\n[shake]Бюджет: {budget} млн $ – но мы готовы к перерасходу.[/shake]\n[color=#ff8800]Срок: {days} дней – но мы можем продлить.[/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"latency": {"type": "rand_int", "min": 15, "max": 30, "step": 1},
			"budget": {"type": "rand_int", "min": 30, "max": 50, "step": 5},
			"days": {"type": "rand_int", "min": 60, "max": 90, "step": 5},
			"wireless": {"type": "rand_bool"}
		},
		"good review": "Протез работает отлично, пациенты довольны.",
		"bad review": "Задержки большие, датчики неточные, протез неудобен.",
		"time": 150,
		"money": 700000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 3,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Датчиков", "step": 1, "min value": 3, "max value": 12, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Задержка (мс)", "step": 1, "min value": 5, "max value": 50, "min d value": "{latency}", "max d value": "{latency}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 5, "min value": 10, "max value": 80, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 30, "max value": 120, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Беспроводное управление", "stat": "{wireless}"}
		]
	},

	# 10. RARE (tag=1) – Система для АЭС (ядерная безопасность)
	{
		"name": "АЭС 'Энергия'",
		"desc": "[center][b]Нужна система контроля для атомной электростанции.[/b][/center]\n[color=#ff4444]Ошибка недопустима, любой сбой фатален.[/color]\n[wave]Датчиков: {sensors} тысяч – но мы планируем увеличить.[/wave]\n[shake]Время реакции: {reaction} мс – но мы хотим не более 50 мс.[/shake]\n[color=#00ccff]Бюджет: {budget} млн $ – но мы готовы к увеличению.[/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 10, "max": 15, "step": 1},
			"reaction": {"type": "rand_int", "min": 30, "max": 60, "step": 5},
			"budget": {"type": "rand_int", "min": 80, "max": 120, "step": 10},
			"days": {"type": "rand_int", "min": 70, "max": 100, "step": 5},
			"backup": {"type": "rand_bool"}
		},
		"good review": "Система надёжна, все параметры в норме.",
		"bad review": "Датчики врут, реактор на грани аварии.",
		"time": 200,
		"money": 800000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 1,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Датчиков (тыс)", "step": 1, "min value": 5, "max value": 25, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Время реакции (мс)", "step": 5, "min value": 10, "max value": 100, "min d value": "{reaction}", "max d value": "{reaction}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 10, "min value": 30, "max value": 200, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 30, "max value": 150, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Резервное питание", "stat": "{backup}"}
		]
	},

	# 11. RARE (tag=2) – Разработка платформы для 3D-печати
	{
		"name": "3D-Принт-Тех",
		"desc": "[center][b]Создайте платформу для управления 3D-печатью.[/b][/center]\n[color=#ff8800]Принтеров: {printers} – но мы планируем расширяться.[/color]\n[wave]Скорость печати: {speed} мм/с – но мы хотим ускорить.[/wave]\n[shake]Бюджет: {budget} тыс. руб. – но мы можем увеличить.[/shake]\n[color=#00ccff]Срок: {days} дней – но мы можем продлить.[/color]",
		"frmt": {
			"printers": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"speed": {"type": "rand_int", "min": 50, "max": 100, "step": 5},
			"budget": {"type": "rand_int", "min": 500, "max": 800, "step": 50},
			"days": {"type": "rand_int", "min": 30, "max": 45, "step": 5},
			"materials": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"cloud": {"type": "rand_bool"}
		},
		"good review": "Платформа удобная, печать быстрая, материалы разнообразны.",
		"bad review": "Скорость низкая, материалов мало, платформа нестабильна.",
		"time": 110,
		"money": 180000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 4},
		"prms": [
			{"type": "slider", "text": "Принтеров", "step": 1, "min value": 2, "max value": 12, "min d value": "{printers}", "max d value": "{printers}"},
			{"type": "slider", "text": "Скорость печати (мм/с)", "step": 5, "min value": 20, "max value": 150, "min d value": "{speed}", "max d value": "{speed}"},
			{"type": "slider", "text": "Бюджет (тыс. руб)", "step": 50, "min value": 200, "max value": 1200, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 15, "max value": 70, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Количество материалов", "step": 1, "min value": 2, "max value": 8, "min d value": "{materials}", "max d value": "{materials}"},
			{"type": "check", "text": "Облачное управление", "stat": "{cloud}"}
		]
	},

	# 12. RARE (tag=3) – Разработка системы для управления спутниками
	{
		"name": "Космические системы 'Орбита'",
		"desc": "[center][b]Создайте систему для управления группировкой спутников.[/b][/center]\n[color=#ff8800]Спутников: {satellites} – но мы планируем добавить ещё.[/color]\n[wave]Задержка сигнала: {delay} мс – но мы хотим минимальную.[/wave]\n[shake]Бюджет: {budget} млн $ – но мы готовы к перерасходу.[/shake]\n[color=#00ccff]Срок: {days} месяцев – но мы можем продлить.[/color]",
		"frmt": {
			"satellites": {"type": "rand_int", "min": 10, "max": 15, "step": 1},
			"delay": {"type": "rand_int", "min": 100, "max": 200, "step": 10},
			"budget": {"type": "rand_int", "min": 100, "max": 150, "step": 10},
			"days": {"type": "rand_int", "min": 6, "max": 10, "step": 1},
			"ground_stations": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"auto_pilot": {"type": "rand_bool"}
		},
		"good review": "Система стабильна, спутники управляются точно.",
		"bad review": "Задержки большие, спутники дрейфуют, станций мало.",
		"time": 200,
		"money": 900000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 3,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Спутников", "step": 1, "min value": 4, "max value": 25, "min d value": "{satellites}", "max d value": "{satellites}"},
			{"type": "slider", "text": "Задержка сигнала (мс)", "step": 10, "min value": 50, "max value": 300, "min d value": "{delay}", "max d value": "{delay}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 10, "min value": 30, "max value": 250, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (месяцев)", "step": 1, "min value": 3, "max value": 15, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Наземных станций", "step": 1, "min value": 1, "max value": 8, "min d value": "{ground_stations}", "max d value": "{ground_stations}"},
			{"type": "check", "text": "Автопилот", "stat": "{auto_pilot}"}
		]
	},

	# 13. RARE (tag=1) – Разработка системы для дронов
	{
		"name": "Дрон-Тех",
		"desc": "[center][b]Создайте систему управления для коммерческих дронов.[/b][/center]\n[color=#ff8800]Дронов: {drones} – но мы планируем расширяться.[/color]\n[wave]Дальность: {range} км – но мы хотим больше.[/wave]\n[shake]Бюджет: {budget} тыс. руб. – но мы можем увеличить.[/shake]\n[color=#00ccff]Срок: {days} дней – но мы можем продлить.[/color]",
		"frmt": {
			"drones": {"type": "rand_int", "min": 10, "max": 15, "step": 1},
			"range": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"budget": {"type": "rand_int", "min": 2000, "max": 3000, "step": 100},
			"days": {"type": "rand_int", "min": 40, "max": 60, "step": 5},
			"obstacles": {"type": "rand_bool"}
		},
		"good review": "Дроны управляются отлично, дальность большая.",
		"bad review": "Дальность маленькая, дроны теряют связь.",
		"time": 130,
		"money": 250000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 1,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 4},
		"prms": [
			{"type": "slider", "text": "Дронов", "step": 1, "min value": 3, "max value": 25, "min d value": "{drones}", "max d value": "{drones}"},
			{"type": "slider", "text": "Дальность (км)", "step": 1, "min value": 2, "max value": 20, "min d value": "{range}", "max d value": "{range}"},
			{"type": "slider", "text": "Бюджет (тыс. руб)", "step": 100, "min value": 500, "max value": 5000, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 20, "max value": 90, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Обход препятствий", "stat": "{obstacles}"}
		]
	},

	# 14. RARE (tag=2) – Разработка системы для подводных аппаратов
	{
		"name": "Океан-Тех",
		"desc": "[center][b]Создайте систему для подводных роботов.[/b][/center]\n[color=#0088ff]Глубина: {depth} м – но мы хотим больше.[/color]\n[wave]Автономность: {autonomy} часов – но мы планируем увеличить.[/wave]\n[shake]Бюджет: {budget} млн руб. – но мы готовы к перерасходу.[/shake]\n[color=#ff8800]Срок: {days} дней – но мы можем продлить.[/color]",
		"frmt": {
			"depth": {"type": "rand_int", "min": 200, "max": 400, "step": 20},
			"autonomy": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"budget": {"type": "rand_int", "min": 50, "max": 80, "step": 5},
			"days": {"type": "rand_int", "min": 50, "max": 70, "step": 5},
			"cameras": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"sonar": {"type": "rand_bool"}
		},
		"good review": "Система надёжна, глубина большая, автономность высокая.",
		"bad review": "Глубина маленькая, автономность низкая, камер мало.",
		"time": 150,
		"money": 400000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Глубина (м)", "step": 20, "min value": 50, "max value": 600, "min d value": "{depth}", "max d value": "{depth}"},
			{"type": "slider", "text": "Автономность (часов)", "step": 1, "min value": 4, "max value": 20, "min d value": "{autonomy}", "max d value": "{autonomy}"},
			{"type": "slider", "text": "Бюджет (млн руб)", "step": 5, "min value": 20, "max value": 120, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 20, "max value": 100, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Количество камер", "step": 1, "min value": 1, "max value": 6, "min d value": "{cameras}", "max d value": "{cameras}"},
			{"type": "check", "text": "Гидролокатор", "stat": "{sonar}"}
		]
	},

	# 15. RARE (tag=3) – Разработка системы для Марсохода
	{
		"name": "Марсоход 'Искатель'",
		"desc": "[center][b]Создайте систему управления для марсохода.[/b][/center]\n[color=#ff8800]Датчиков: {sensors} – но мы можем добавить ещё.[/color]\n[wave]Задержка связи: {delay} сек – но мы хотим минимизировать.[/wave]\n[shake]Бюджет: {budget} млн $ – но мы готовы к увеличению.[/shake]\n[color=#00ccff]Срок: {days} месяцев – но мы можем продлить.[/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 6, "max": 10, "step": 1},
			"delay": {"type": "rand_int", "min": 10, "max": 20, "step": 1},
			"budget": {"type": "rand_int", "min": 150, "max": 200, "step": 10},
			"days": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"wheels": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"auto": {"type": "rand_bool"}
		},
		"good review": "Марсоход успешно исследовал поверхность, данные получены.",
		"bad review": "Связь потеряна, датчики отказали, миссия провалена.",
		"time": 220,
		"money": 1000000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 3,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Датчиков", "step": 1, "min value": 3, "max value": 15, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Задержка связи (сек)", "step": 1, "min value": 5, "max value": 30, "min d value": "{delay}", "max d value": "{delay}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 10, "min value": 50, "max value": 300, "min d value": "{budget}", "max d value": "{budget}"},
			{"type": "slider", "text": "Срок (месяцев)", "step": 1, "min value": 5, "max value": 18, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Количество колёс", "step": 1, "min value": 3, "max value": 8, "min d value": "{wheels}", "max d value": "{wheels}"},
			{"type": "check", "text": "Автоматическое управление", "stat": "{auto}"}
		]
	},
	# ============================================================
	# EMERGENCY (15 новых)
	# ============================================================

	# 1. EMERGENCY (tag=1) – Сбой в системе водоснабжения
	{
		"name": "Горводоканал (авария)",
		"desc": "[center][color=#ff0000][b]СРОЧНО! Прорыв трубы, нужно перекрыть подачу воды в микрорайоне![/b][/color][/center]\n[wave]Время до затопления: {time} минут.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 10, "max": 30, "step": 5},
			"critical": {"type": "rand_int", "min": 80, "max": 100, "step": 1}
		},
		"good review": "Вода перекрыта, авария ликвидирована.",
		"bad review": "Вода затопила подвалы, люди пострадали.",
		"time": 60,
		"money": 50000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 1,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время до затопления (мин)", "step": 5, "min value": 5, "max value": 45, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 2. EMERGENCY (tag=2) – Пожар в серверной
	{
		"name": "Дата-центр (пожар)",
		"desc": "[center][color=#ff0000][b]СРОЧНО! Пожар в серверной! Нужно активировать систему пожаротушения![/b][/color][/center]\n[wave]Температура: {temp}°C, поднимается на {rise}°C в минуту.[/wave]\n[shake]Количество серверов: {servers}, нужно спасти данные.[/shake]",
		"frmt": {
			"temp": {"type": "rand_int", "min": 60, "max": 80, "step": 2},
			"rise": {"type": "rand_int", "min": 2, "max": 5, "step": 1},
			"servers": {"type": "rand_int", "min": 50, "max": 100, "step": 5}
		},
		"good review": "Пожар потушен, серверы спасены.",
		"bad review": "Серверы сгорели, данные потеряны.",
		"time": 70,
		"money": 80000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Температура (°C)", "step": 2, "min value": 40, "max value": 100, "min d value": "{temp}", "max d value": "{temp}"},
			{"type": "slider", "text": "Скорость нагрева (°C/мин)", "step": 1, "min value": 1, "max value": 8, "min d value": "{rise}", "max d value": "{rise}"},
			{"type": "slider", "text": "Количество серверов", "step": 5, "min value": 10, "max value": 150, "min d value": "{servers}", "max d value": "{servers}"}
		]
	},

	# 3. EMERGENCY (tag=3) – Авария на химическом заводе
	{
		"name": "Химзавод 'Синтез' (утечка)",
		"desc": "[center][color=#ff0000][b]УТЕЧКА АММИАКА! Срочно изолировать район![/b][/color][/center]\n[wave]Концентрация: {conc} ppm, растёт на {rise} ppm в минуту.[/wave]\n[shake]Количество рабочих: {workers}, нужно эвакуировать.[/shake]",
		"frmt": {
			"conc": {"type": "rand_int", "min": 100, "max": 200, "step": 10},
			"rise": {"type": "rand_int", "min": 10, "max": 30, "step": 5},
			"workers": {"type": "rand_int", "min": 20, "max": 50, "step": 5}
		},
		"good review": "Утечка локализована, все эвакуированы.",
		"bad review": "Утечка продолжается, есть пострадавшие.",
		"time": 80,
		"money": 100000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Концентрация (ppm)", "step": 10, "min value": 50, "max value": 300, "min d value": "{conc}", "max d value": "{conc}"},
			{"type": "slider", "text": "Скорость роста (ppm/мин)", "step": 5, "min value": 5, "max value": 40, "min d value": "{rise}", "max d value": "{rise}"},
			{"type": "slider", "text": "Количество рабочих", "step": 5, "min value": 5, "max value": 80, "min d value": "{workers}", "max d value": "{workers}"}
		]
	},

	# 4. EMERGENCY (tag=1) – Сбой в системе управления светофорами
	{
		"name": "Городской трафик (авария)",
		"desc": "[center][color=#ff0000][b]СРОЧНО! Сбой светофоров, образовались пробки! Нужно переключить на ручной режим.[/b][/color][/center]\n[wave]Количество перекрёстков: {crossroads}, время реакции: {time} минут.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"crossroads": {"type": "rand_int", "min": 10, "max": 20, "step": 1},
			"time": {"type": "rand_int", "min": 5, "max": 15, "step": 1},
			"critical": {"type": "rand_int", "min": 70, "max": 90, "step": 1}
		},
		"good review": "Светофоры переключены, пробки рассасываются.",
		"bad review": "Пробки только усилились, аварии на дорогах.",
		"time": 65,
		"money": 60000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 1,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Перекрёстков", "step": 1, "min value": 5, "max value": 30, "min d value": "{crossroads}", "max d value": "{crossroads}"},
			{"type": "slider", "text": "Время реакции (мин)", "step": 1, "min value": 3, "max value": 20, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 5. EMERGENCY (tag=2) – Авария на электростанции
	{
		"name": "ТЭЦ 'Энергия' (перегруз)",
		"desc": "[center][color=#ff0000][b]ПЕРЕГРУЗКА СЕТИ! Нужно снизить нагрузку на {target} МВт![/b][/color][/center]\n[wave]Текущая нагрузка: {current} МВт, превышение на {over}%.[/wave]\n[shake]Время до отключения: {time} минут.[/shake]",
		"frmt": {
			"target": {"type": "rand_int", "min": 80, "max": 100, "step": 2},
			"current": {"type": "rand_int", "min": 120, "max": 150, "step": 2},
			"over": {"type": "rand_int", "min": 20, "max": 40, "step": 2},
			"time": {"type": "rand_int", "min": 10, "max": 20, "step": 2}
		},
		"good review": "Нагрузка снижена, авария предотвращена.",
		"bad review": "Сеть рухнула, город обесточен.",
		"time": 70,
		"money": 70000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Целевая нагрузка (МВт)", "step": 2, "min value": 50, "max value": 120, "min d value": "{target}", "max d value": "{target}"},
			{"type": "slider", "text": "Текущая нагрузка (МВт)", "step": 2, "min value": 50, "max value": 200, "min d value": "{current}", "max d value": "{current}"},
			{"type": "slider", "text": "Превышение (%)", "step": 2, "min value": 10, "max value": 50, "min d value": "{over}", "max d value": "{over}"},
			{"type": "slider", "text": "Время до отключения (мин)", "step": 2, "min value": 5, "max value": 30, "min d value": "{time}", "max d value": "{time}"}
		]
	},

	# 6. EMERGENCY (tag=3) – Сбой в системе управления поездами
	{
		"name": "Метрополитен (сбой)",
		"desc": "[center][color=#ff0000][b]Сбой в системе движения поездов! Нужно переключить на резервную.[/b][/color][/center]\n[wave]Количество поездов: {trains}, задержка: {delay} минут.[/wave]\n[shake]Пассажиров на станциях: {passengers} тысяч.[/shake]",
		"frmt": {
			"trains": {"type": "rand_int", "min": 30, "max": 50, "step": 2},
			"delay": {"type": "rand_int", "min": 5, "max": 15, "step": 1},
			"passengers": {"type": "rand_int", "min": 20, "max": 40, "step": 2}
		},
		"good review": "Движение восстановлено, пассажиры довольны.",
		"bad review": "Поезда стоят, паника на станциях.",
		"time": 75,
		"money": 90000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Количество поездов", "step": 2, "min value": 10, "max value": 80, "min d value": "{trains}", "max d value": "{trains}"},
			{"type": "slider", "text": "Задержка (мин)", "step": 1, "min value": 2, "max value": 25, "min d value": "{delay}", "max d value": "{delay}"},
			{"type": "slider", "text": "Пассажиров (тыс.)", "step": 2, "min value": 5, "max value": 60, "min d value": "{passengers}", "max d value": "{passengers}"}
		]
	},

	# 7. EMERGENCY (tag=1) – Взлом системы безопасности банка
	{
		"name": "Банк 'Кредит' (взлом)",
		"desc": "[center][color=#ff0000][b]Обнаружен взлом системы безопасности! Нужно заблокировать доступ за {time} минут![/b][/color][/center]\n[wave]Количество атак: {attacks} в секунду.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 3, "max": 8, "step": 1},
			"attacks": {"type": "rand_int", "min": 50, "max": 100, "step": 5},
			"critical": {"type": "rand_int", "min": 85, "max": 100, "step": 1}
		},
		"good review": "Взлом отражён, средства в безопасности.",
		"bad review": "Данные украдены, деньги похищены.",
		"time": 80,
		"money": 120000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 1,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на блокировку (мин)", "step": 1, "min value": 1, "max value": 12, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Атак в секунду", "step": 5, "min value": 10, "max value": 150, "min d value": "{attacks}", "max d value": "{attacks}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 8. EMERGENCY (tag=2) – Сбой в системе жизнеобеспечения больницы
	{
		"name": "Больница 'Спасение' (авария)",
		"desc": "[center][color=#ff0000][b]Сбой в системе подачи кислорода! Нужно переключить на резерв за {time} минут![/b][/color][/center]\n[wave]Количество пациентов: {patients}, из них критических: {critical_patients}.[/wave]\n[shake]Уровень кислорода: {oxygen}% и падает на {drop}% в минуту.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"patients": {"type": "rand_int", "min": 30, "max": 50, "step": 2},
			"critical_patients": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"oxygen": {"type": "rand_int", "min": 70, "max": 85, "step": 2},
			"drop": {"type": "rand_int", "min": 3, "max": 6, "step": 1}
		},
		"good review": "Система переключена, пациенты в безопасности.",
		"bad review": "Кислород закончился, пациенты погибли.",
		"time": 90,
		"money": 150000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на переключение (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Количество пациентов", "step": 2, "min value": 10, "max value": 80, "min d value": "{patients}", "max d value": "{patients}"},
			{"type": "slider", "text": "Критических пациентов", "step": 2, "min value": 2, "max value": 30, "min d value": "{critical_patients}", "max d value": "{critical_patients}"},
			{"type": "slider", "text": "Уровень кислорода (%)", "step": 2, "min value": 40, "max value": 100, "min d value": "{oxygen}", "max d value": "{oxygen}"},
			{"type": "slider", "text": "Падение кислорода (%/мин)", "step": 1, "min value": 1, "max value": 10, "min d value": "{drop}", "max d value": "{drop}"}
		]
	},

	# 9. EMERGENCY (tag=3) – Ураган, сбой в системе оповещения
	{
		"name": "МЧС (ураган)",
		"desc": "[center][color=#ff0000][b]Ураган приближается! Нужно оповестить население за {time} минут![/b][/color][/center]\n[wave]Скорость ветра: {wind} м/с.[/wave]\n[shake]Количество районов: {districts}, нужно охватить все.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 15, "max": 30, "step": 5},
			"wind": {"type": "rand_int", "min": 25, "max": 40, "step": 2},
			"districts": {"type": "rand_int", "min": 8, "max": 12, "step": 1}
		},
		"good review": "Оповещение проведено, люди укрылись.",
		"bad review": "Оповещение не сработало, есть жертвы.",
		"time": 70,
		"money": 80000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время до урагана (мин)", "step": 5, "min value": 5, "max value": 45, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Скорость ветра (м/с)", "step": 2, "min value": 15, "max value": 55, "min d value": "{wind}", "max d value": "{wind}"},
			{"type": "slider", "text": "Количество районов", "step": 1, "min value": 3, "max value": 20, "min d value": "{districts}", "max d value": "{districts}"}
		]
	},

	# 10. EMERGENCY (tag=1) – Сбой в системе управления спутником
	{
		"name": "Космическое агентство (потеря связи)",
		"desc": "[center][color=#ff0000][b]Потеря связи со спутником! Нужно переключить на резервную антенну за {time} минут![/b][/color][/center]\n[wave]Орбита: {orbit} км, скорость: {speed} км/с.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"orbit": {"type": "rand_int", "min": 400, "max": 600, "step": 10},
			"speed": {"type": "rand_int", "min": 7, "max": 8, "step": 0.1},
			"critical": {"type": "rand_int", "min": 85, "max": 100, "step": 1}
		},
		"good review": "Связь восстановлена, спутник управляем.",
		"bad review": "Спутник потерян, миссия провалена.",
		"time": 85,
		"money": 130000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 1,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на восстановление (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Орбита (км)", "step": 10, "min value": 200, "max value": 800, "min d value": "{orbit}", "max d value": "{orbit}"},
			{"type": "slider", "text": "Скорость (км/с)", "step": 0.1, "min value": 6.0, "max value": 9.0, "min d value": "{speed}", "max d value": "{speed}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 11. EMERGENCY (tag=2) – Взрыв на заводе
	{
		"name": "Завод 'Прометей' (взрыв)",
		"desc": "[center][color=#ff0000][b]Взрыв на заводе! Нужно эвакуировать персонал за {time} минут![/b][/color][/center]\n[wave]Количество пострадавших: {casualties}, очаг возгорания: {fire}%.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"casualties": {"type": "rand_int", "min": 3, "max": 8, "step": 1},
			"fire": {"type": "rand_int", "min": 60, "max": 80, "step": 2},
			"critical": {"type": "rand_int", "min": 80, "max": 95, "step": 1}
		},
		"good review": "Эвакуация проведена, пожар потушен.",
		"bad review": "Эвакуация не удалась, есть жертвы.",
		"time": 80,
		"money": 110000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на эвакуацию (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Количество пострадавших", "step": 1, "min value": 1, "max value": 15, "min d value": "{casualties}", "max d value": "{casualties}"},
			{"type": "slider", "text": "Очаг возгорания (%)", "step": 2, "min value": 20, "max value": 100, "min d value": "{fire}", "max d value": "{fire}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 12. EMERGENCY (tag=3) – Сбой в системе управления АЭС
	{
		"name": "АЭС 'Мир' (сбой)",
		"desc": "[center][color=#ff0000][b]Сбой в системе охлаждения реактора! Нужно запустить резерв за {time} минут![/b][/color][/center]\n[wave]Температура: {temp}°C, растёт на {rise}°C в минуту.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"temp": {"type": "rand_int", "min": 300, "max": 350, "step": 5},
			"rise": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"critical": {"type": "rand_int", "min": 90, "max": 100, "step": 1}
		},
		"good review": "Резерв запущен, реактор стабилизирован.",
		"bad review": "Реактор перегрет, авария.",
		"time": 100,
		"money": 200000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на запуск резерва (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Температура (°C)", "step": 5, "min value": 200, "max value": 400, "min d value": "{temp}", "max d value": "{temp}"},
			{"type": "slider", "text": "Скорость роста (°C/мин)", "step": 1, "min value": 2, "max value": 15, "min d value": "{rise}", "max d value": "{rise}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 13. EMERGENCY (tag=1) – Сбой в системе управления дронами
	{
		"name": "Служба доставки дронами (потеря)",
		"desc": "[center][color=#ff0000][b]Дроны потеряли связь! Нужно переключить на ручное управление за {time} минут![/b][/color][/center]\n[wave]Количество дронов: {drones}, зона поражения: {zone} км.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"drones": {"type": "rand_int", "min": 10, "max": 20, "step": 1},
			"zone": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"critical": {"type": "rand_int", "min": 80, "max": 95, "step": 1}
		},
		"good review": "Дроны взяты под контроль, катастрофа предотвращена.",
		"bad review": "Дроны упали, есть пострадавшие.",
		"time": 75,
		"money": 95000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 1,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на переключение (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Количество дронов", "step": 1, "min value": 3, "max value": 30, "min d value": "{drones}", "max d value": "{drones}"},
			{"type": "slider", "text": "Зона поражения (км)", "step": 1, "min value": 2, "max value": 15, "min d value": "{zone}", "max d value": "{zone}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 14. EMERGENCY (tag=2) – Сбой в системе очистки воды
	{
		"name": "Очистные сооружения (авария)",
		"desc": "[center][color=#ff0000][b]Сбой в системе очистки воды! Нужно активировать резерв за {time} минут![/b][/color][/center]\n[wave]Уровень загрязнения: {pollution}%, растёт на {rise}% в минуту.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"pollution": {"type": "rand_int", "min": 60, "max": 80, "step": 2},
			"rise": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"critical": {"type": "rand_int", "min": 85, "max": 100, "step": 1}
		},
		"good review": "Вода очищена, резерв запущен.",
		"bad review": "Вода отравлена, экологическая катастрофа.",
		"time": 85,
		"money": 120000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на активацию резерва (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Уровень загрязнения (%)", "step": 2, "min value": 20, "max value": 100, "min d value": "{pollution}", "max d value": "{pollution}"},
			{"type": "slider", "text": "Скорость роста загрязнения (%/мин)", "step": 1, "min value": 1, "max value": 10, "min d value": "{rise}", "max d value": "{rise}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},

	# 15. EMERGENCY (tag=3) – Сбой в системе управления самолётами
	{
		"name": "Аэропорт (аварийная посадка)",
		"desc": "[center][color=#ff0000][b]Сбой в системе управления полётами! Нужно посадить самолёт вручную за {time} минут![/b][/color][/center]\n[wave]Количество пассажиров: {passengers}, топливо: {fuel}%.[/wave]\n[shake]Критичность: {critical}%.[/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"passengers": {"type": "rand_int", "min": 100, "max": 200, "step": 10},
			"fuel": {"type": "rand_int", "min": 10, "max": 20, "step": 1},
			"critical": {"type": "rand_int", "min": 90, "max": 100, "step": 1}
		},
		"good review": "Самолёт посажен, все живы.",
		"bad review": "Самолёт разбился, есть жертвы.",
		"time": 100,
		"money": 180000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на посадку (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Количество пассажиров", "step": 10, "min value": 20, "max value": 300, "min d value": "{passengers}", "max d value": "{passengers}"},
			{"type": "slider", "text": "Топливо (%)", "step": 1, "min value": 5, "max value": 30, "min d value": "{fuel}", "max d value": "{fuel}"},
			{"type": "slider", "text": "Критичность (%)", "step": 1, "min value": 50, "max value": 100, "min d value": "{critical}", "max d value": "{critical}"}
		]
	},
	# ============================================================
	# DARKNET (15 новых)
	# ============================================================

	# 1. DARKNET (tag=1) – Продажа фейковых документов
	{
		"name": "Доктор Фейк",
		"desc": "[center][b][color=#444444]Нужны фальшивые паспорта и права.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество документов: {docs} шт.[/wave]\n[shake]Срок: {days} дней.[/shake]",
		"frmt": {
			"docs": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"days": {"type": "rand_int", "min": 3, "max": 7, "step": 1}
		},
		"good review": "Документы готовы, качество отличное.",
		"bad review": "Документы раскрыты, нас ищут.",
		"time": 50,
		"money": 20000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 1,
		"type": 6,
		"mods": {"safe rep": true, "police count": 2},
		"prms": [
			{"type": "slider", "text": "Количество документов", "step": 1, "min value": 2, "max value": 15, "min d value": "{docs}", "max d value": "{docs}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 1, "max value": 10, "min d value": "{days}", "max d value": "{days}"}
		]
	},

	# 2. DARKNET (tag=2) – Крипто-миксер
	{
		"name": "Миксер-Кинг",
		"desc": "[center][b][color=#444444]Смешивание криптовалюты, замести следы.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Сумма: {amount}$.[/wave]\n[shake]Комиссия: {fee}%.[/shake]",
		"frmt": {
			"amount": {"type": "rand_int", "min": 1000, "max": 5000, "step": 100},
			"fee": {"type": "rand_int", "min": 1, "max": 5, "step": 0.5}
		},
		"good review": "Следы заметены, клиенты довольны.",
		"bad review": "Транзакция отслежена, нас вычислили.",
		"time": 60,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не хочу",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 3},
		"prms": [
			{"type": "slider", "text": "Сумма ($)", "step": 100, "min value": 200, "max value": 10000, "min d value": "{amount}", "max d value": "{amount}"},
			{"type": "slider", "text": "Комиссия (%)", "step": 0.5, "min value": 0.5, "max value": 8, "min d value": "{fee}", "max d value": "{fee}"}
		]
	},

	# 3. DARKNET (tag=3) – Поддельные отзывы
	{
		"name": "Фабрика отзывов",
		"desc": "[center][b][color=#444444]Заказные отзывы на маркетплейсах.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество отзывов: {reviews}.[/wave]\n[shake]Цена за отзыв: {price}$.[/shake]",
		"frmt": {
			"reviews": {"type": "rand_int", "min": 20, "max": 50, "step": 2},
			"price": {"type": "rand_int", "min": 5, "max": 15, "step": 1}
		},
		"good review": "Отзывы написаны, рейтинг вырос.",
		"bad review": "Аккаунты заблокированы.",
		"time": 55,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 3,
		"type": 6,
		"mods": {"safe rep": true, "police count": 2},
		"prms": [
			{"type": "slider", "text": "Количество отзывов", "step": 2, "min value": 5, "max value": 80, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "slider", "text": "Цена за отзыв ($)", "step": 1, "min value": 2, "max value": 25, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 4. DARKNET (tag=1) – Продажа баз данных
	{
		"name": "Торговец данными",
		"desc": "[center][b][color=#444444]Продажа слитых баз данных.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество записей: {records} тыс.[/wave]\n[shake]Цена: {price}$.[/shake]",
		"frmt": {
			"records": {"type": "rand_int", "min": 10, "max": 30, "step": 2},
			"price": {"type": "rand_int", "min": 200, "max": 500, "step": 20}
		},
		"good review": "База продана, клиенты довольны.",
		"bad review": "База устарела, клиенты недовольны.",
		"time": 50,
		"money": 28000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 1,
		"type": 6,
		"mods": {"safe rep": true, "police count": 3},
		"prms": [
			{"type": "slider", "text": "Количество записей (тыс.)", "step": 2, "min value": 2, "max value": 50, "min d value": "{records}", "max d value": "{records}"},
			{"type": "slider", "text": "Цена ($)", "step": 20, "min value": 50, "max value": 800, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 5. DARKNET (tag=2) – Продажа взломанных аккаунтов
	{
		"name": "Аккаунт-Брокер",
		"desc": "[center][b][color=#444444]Продажа взломанных аккаунтов соцсетей.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество аккаунтов: {accounts}.[/wave]\n[shake]Цена за штуку: {price}$.[/shake]",
		"frmt": {
			"accounts": {"type": "rand_int", "min": 10, "max": 25, "step": 1},
			"price": {"type": "rand_int", "min": 10, "max": 30, "step": 2}
		},
		"good review": "Аккаунты проданы, прибыль получена.",
		"bad review": "Аккаунты заблокированы, клиенты недовольны.",
		"time": 55,
		"money": 22000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 3},
		"prms": [
			{"type": "slider", "text": "Количество аккаунтов", "step": 1, "min value": 3, "max value": 40, "min d value": "{accounts}", "max d value": "{accounts}"},
			{"type": "slider", "text": "Цена за аккаунт ($)", "step": 2, "min value": 5, "max value": 50, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 6. DARKNET (tag=3) – Продажа фальшивых дипломов
	{
		"name": "Диплом-Мастер",
		"desc": "[center][b][color=#444444]Фальшивые дипломы и сертификаты.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество дипломов: {diplomas}.[/wave]\n[shake]Цена за штуку: {price}$.[/shake]",
		"frmt": {
			"diplomas": {"type": "rand_int", "min": 3, "max": 8, "step": 1},
			"price": {"type": "rand_int", "min": 200, "max": 400, "step": 20}
		},
		"good review": "Дипломы выполнены качественно, клиенты довольны.",
		"bad review": "Дипломы раскрыты, нас ищут.",
		"time": 60,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 3,
		"type": 6,
		"mods": {"safe rep": true, "police count": 3},
		"prms": [
			{"type": "slider", "text": "Количество дипломов", "step": 1, "min value": 1, "max value": 12, "min d value": "{diplomas}", "max d value": "{diplomas}"},
			{"type": "slider", "text": "Цена за диплом ($)", "step": 20, "min value": 50, "max value": 600, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 7. DARKNET (tag=1) – Продажа вредоносных программ
	{
		"name": "Вирус-Инжиниринг",
		"desc": "[center][b][color=#444444]Вредоносное ПО для взлома.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество вирусов: {viruses}.[/wave]\n[shake]Цена за штуку: {price}$.[/shake]",
		"frmt": {
			"viruses": {"type": "rand_int", "min": 2, "max": 5, "step": 1},
			"price": {"type": "rand_int", "min": 500, "max": 1000, "step": 50}
		},
		"good review": "Вирусы работают, заказы выполнены.",
		"bad review": "Вирусы обнаружены, нас вычисляют.",
		"time": 70,
		"money": 40000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 1,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Количество вирусов", "step": 1, "min value": 1, "max value": 8, "min d value": "{viruses}", "max d value": "{viruses}"},
			{"type": "slider", "text": "Цена за вирус ($)", "step": 50, "min value": 100, "max value": 1500, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 8. DARKNET (tag=2) – Продажа фейковых новостей
	{
		"name": "Фейк-Ньюс",
		"desc": "[center][b][color=#444444]Распространение дезинформации.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество статей: {articles}.[/wave]\n[shake]Цена за статью: {price}$.[/shake]",
		"frmt": {
			"articles": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"price": {"type": "rand_int", "min": 100, "max": 200, "step": 10}
		},
		"good review": "Статьи разошлись, эффект достигнут.",
		"bad review": "Статьи разоблачены, репутация под угрозой.",
		"time": 50,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 2},
		"prms": [
			{"type": "slider", "text": "Количество статей", "step": 1, "min value": 2, "max value": 15, "min d value": "{articles}", "max d value": "{articles}"},
			{"type": "slider", "text": "Цена за статью ($)", "step": 10, "min value": 50, "max value": 300, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 9. DARKNET (tag=3) – Продажа оружия (теневой рынок)
	{
		"name": "Оружейный барон",
		"desc": "[center][b][color=#444444]Продажа оружия и боеприпасов.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество единиц: {units}.[/wave]\n[shake]Цена за единицу: {price}$.[/shake]",
		"frmt": {
			"units": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"price": {"type": "rand_int", "min": 200, "max": 400, "step": 20}
		},
		"good review": "Оружие доставлено, клиенты довольны.",
		"bad review": "Сделка сорвана, нас ищут.",
		"time": 65,
		"money": 35000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 3,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Количество единиц", "step": 2, "min value": 4, "max value": 30, "min d value": "{units}", "max d value": "{units}"},
			{"type": "slider", "text": "Цена за единицу ($)", "step": 20, "min value": 50, "max value": 600, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 10. DARKNET (tag=1) – Продажа доступа к серверам
	{
		"name": "Серверный крот",
		"desc": "[center][b][color=#444444]Продажа удалённого доступа к серверам.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество серверов: {servers}.[/wave]\n[shake]Цена за сервер: {price}$.[/shake]",
		"frmt": {
			"servers": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"price": {"type": "rand_int", "min": 300, "max": 600, "step": 30}
		},
		"good review": "Доступ получен, клиенты работают.",
		"bad review": "Доступ обнаружен, нас вычисляют.",
		"time": 60,
		"money": 32000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 1,
		"type": 6,
		"mods": {"safe rep": true, "police count": 3},
		"prms": [
			{"type": "slider", "text": "Количество серверов", "step": 1, "min value": 1, "max value": 10, "min d value": "{servers}", "max d value": "{servers}"},
			{"type": "slider", "text": "Цена за сервер ($)", "step": 30, "min value": 100, "max value": 900, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 11. DARKNET (tag=2) – Продажа даркнет-маркетплейса
	{
		"name": "Торговая площадка",
		"desc": "[center][b][color=#444444]Создание даркнет-маркетплейса.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество товаров: {items}.[/wave]\n[shake]Комиссия: {fee}%.[/shake]",
		"frmt": {
			"items": {"type": "rand_int", "min": 100, "max": 200, "step": 10},
			"fee": {"type": "rand_int", "min": 5, "max": 10, "step": 0.5}
		},
		"good review": "Площадка запущена, товары продаются.",
		"bad review": "Площадка взломана, клиенты потеряны.",
		"time": 80,
		"money": 50000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Количество товаров", "step": 10, "min value": 20, "max value": 300, "min d value": "{items}", "max d value": "{items}"},
			{"type": "slider", "text": "Комиссия (%)", "step": 0.5, "min value": 2, "max value": 15, "min d value": "{fee}", "max d value": "{fee}"}
		]
	},

	# 12. DARKNET (tag=3) – Продажа поддельных лекарств
	{
		"name": "Фарма-Крот",
		"desc": "[center][b][color=#444444]Продажа поддельных медикаментов.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество упаковок: {packs}.[/wave]\n[shake]Цена за упаковку: {price}$.[/shake]",
		"frmt": {
			"packs": {"type": "rand_int", "min": 50, "max": 100, "step": 5},
			"price": {"type": "rand_int", "min": 10, "max": 20, "step": 1}
		},
		"good review": "Лекарства проданы, клиенты довольны.",
		"bad review": "Лекарства опасны, полиция заинтересовалась.",
		"time": 60,
		"money": 28000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 3,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Количество упаковок", "step": 5, "min value": 10, "max value": 150, "min d value": "{packs}", "max d value": "{packs}"},
			{"type": "slider", "text": "Цена за упаковку ($)", "step": 1, "min value": 5, "max value": 30, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 13. DARKNET (tag=1) – Продажа взломанных кредитных карт
	{
		"name": "Кардер-Шоп",
		"desc": "[center][b][color=#444444]Продажа данных кредитных карт.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество карт: {cards}.[/wave]\n[shake]Цена за карту: {price}$.[/shake]",
		"frmt": {
			"cards": {"type": "rand_int", "min": 20, "max": 40, "step": 2},
			"price": {"type": "rand_int", "min": 50, "max": 100, "step": 5}
		},
		"good review": "Карты проданы, деньги получены.",
		"bad review": "Карты заблокированы, нас ищут.",
		"time": 55,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 1,
		"type": 6,
		"mods": {"safe rep": true, "police count": 5},
		"prms": [
			{"type": "slider", "text": "Количество карт", "step": 2, "min value": 5, "max value": 60, "min d value": "{cards}", "max d value": "{cards}"},
			{"type": "slider", "text": "Цена за карту ($)", "step": 5, "min value": 20, "max value": 150, "min d value": "{price}", "max d value": "{price}"}
		]
	},

	# 14. DARKNET (tag=2) – Продажа фальшивых денег
	{
		"name": "Фальшивомонетчик",
		"desc": "[center][b][color=#444444]Продажа поддельных банкнот.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество купюр: {bills}.[/wave]\n[shake]Номинал: {denomination}$.[/shake]",
		"frmt": {
			"bills": {"type": "rand_int", "min": 50, "max": 100, "step": 5},
			"denomination": {"type": "rand_int", "min": 20, "max": 50, "step": 5}
		},
		"good review": "Фальшивки разошлись, прибыль хорошая.",
		"bad review": "Фальшивки раскрыты, нас ищут.",
		"time": 60,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Количество купюр", "step": 5, "min value": 10, "max value": 150, "min d value": "{bills}", "max d value": "{bills}"},
			{"type": "slider", "text": "Номинал ($)", "step": 5, "min value": 10, "max value": 80, "min d value": "{denomination}", "max d value": "{denomination}"}
		]
	},

	# 15. DARKNET (tag=3) – Продажа доступа к взломанным камерам
	{
		"name": "Камерный шпион",
		"desc": "[center][b][color=#444444]Продажа доступа к взломанным веб-камерам.[/color][/b][/center]\n[color=#880000]Анонимность обязательна.[/color]\n[wave]Количество камер: {cameras}.[/wave]\n[shake]Цена за камеру: {price}$.[/shake]",
		"frmt": {
			"cameras": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"price": {"type": "rand_int", "min": 30, "max": 60, "step": 5}
		},
		"good review": "Доступ получен, клиенты довольны.",
		"bad review": "Доступ обнаружен, нас вычисляют.",
		"time": 50,
		"money": 20000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 3,
		"type": 6,
		"mods": {"safe rep": true, "police count": 3},
		"prms": [
			{"type": "slider", "text": "Количество камер", "step": 2, "min value": 4, "max value": 30, "min d value": "{cameras}", "max d value": "{cameras}"},
			{"type": "slider", "text": "Цена за камеру ($)", "step": 5, "min value": 10, "max value": 80, "min d value": "{price}", "max d value": "{price}"}
		]
	},
	# ============================================================
	# 5 СТЕСНИТЕЛЬНЫХ ЗАКАЗОВ (DEFAULT)
	# ============================================================

	# 1. Сайт для коллекционера марок (tag=1)
	{
		"name": "Марк-Коллекционер",
		"desc": "[center][b]З-здравствуйте... Я коллекционирую марки, и подумал, может, сделать сайт для обмена?[/b][/center]\n[color=#ff8800]Сначала я хотел, чтобы было много всего: каталог, форум, галерея, но... наверное, это слишком сложно. Может, просто каталог и контакты?[/color]\n[wave]Если честно, я не уверен, что это кому-то нужно, но вдруг... Ладно, давайте сделаем каталог, а если не сложно, то и галерею, но я не настаиваю.[/wave]\n[shake]Простите, если я что-то не так говорю... Может, вообще не надо сайта? Но если вы согласитесь, то... ну, может, {photos} фото марок будет достаточно?[/shake]\n[color=#00ccff]И ещё... если можно, добавьте форму обратной связи, но не обязательно, просто телефон указать... Простите за беспокойство.[/color]",
		"good review": "Спасибо большое! Сайт получился даже лучше, чем я думал. Вы очень помогли!",
		"bad review": "Я, наверное, не так объяснил... Сайт не совсем то, что я хотел, но вы старались...",
		"time": 50,
		"money": 8000,
		"ready text": "ГОТОВО",
		"cancel text": "Извините, не могу",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"photos": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"has_forum": {"type": "rand_bool"},
			"has_gallery": {"type": "rand_bool"},
			"contact": {"type": "rand_option", "pool": ["форма", "телефон", "email"]}
		},
		"prms": [
			{"type": "slider", "text": "Количество фото марок", "step": 2, "min value": 5, "max value": 30, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Добавить форум (если не сложно)", "stat": "{has_forum}"},
			{"type": "check", "text": "Галерея (не обязательно)", "stat": "{has_gallery}"},
			{"type": "option", "text": "Способ связи", "items": ["Форма обратной связи", "Телефон", "Email"], "indx": "{contact_index}"}
		]
	},

	# 2. Приложение для комнатных растений (tag=2)
	{
		"name": "Зелёный уголок",
		"desc": "[center][b]Добрый день... Я хотел бы приложение для ухода за комнатными растениями, но я не знаю, нужно ли это кому-то, кроме меня...[/b][/center]\n[color=#00aa00]Мне нужно, чтобы оно напоминало о поливе, подкормке, пересадке. Но если это сложно, то можно только полив... Простите, я не хочу вас напрягать.[/color]\n[wave]Я думал, может, добавить ещё и дневник наблюдений, но... не знаю, может, не надо. Вы сами решайте, как лучше.[/wave]\n[shake]Количество растений: у меня их {plants}, но я могу и меньше записать, если это упростит работу... Извините, я всё время сомневаюсь.[/shake]\n[color=#ff66aa]И ещё, если можно, сделайте тёмную тему, но если не получится, то пусть будет светлая... Я не настаиваю.[/color]",
		"good review": "Огромное спасибо! Приложение идеально подходит, мои растения теперь под контролем!",
		"bad review": "Наверное, я слишком много просил... Приложение не совсем подошло, но вы старались, спасибо.",
		"time": 55,
		"money": 10000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"plants": {"type": "rand_int", "min": 5, "max": 15, "step": 1},
			"reminders": {"type": "rand_option", "pool": ["полив", "полив+подкормка", "все"]},
			"diary": {"type": "rand_bool"},
			"dark_theme": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Количество растений", "step": 1, "min value": 2, "max value": 20, "min d value": "{plants}", "max d value": "{plants}"},
			{"type": "option", "text": "Уровень напоминаний", "items": ["Только полив", "Полив и подкормка", "Все виды ухода"], "indx": "{reminders_index}"},
			{"type": "check", "text": "Дневник наблюдений (если хотите)", "stat": "{diary}"},
			{"type": "check", "text": "Тёмная тема (не обязательно)", "stat": "{dark_theme}"}
		]
	},

	# 3. Сайт для семейного кафе (tag=3)
	{
		"name": "Уютное кафе",
		"desc": "[center][b]Здравствуйте! Мы с женой открыли маленькое кафе, и я подумал, может, сделать сайт... но не знаю, нужно ли это.[/b][/center]\n[color=#884400]Мне бы хотелось меню, часы работы, адрес. Может, ещё фотографии интерьера? Но если это дорого, то можно без фото... Простите, я не хочу переплачивать.[/color]\n[wave]Я слышал, что можно добавить онлайн-заказ, но мне кажется, это слишком сложно для такого маленького кафе. Наверное, не надо.[/wave]\n[shake]И ещё, я думал о бронировании столиков, но... ну, это же кафе на 5 столиков, вряд ли кому-то понадобится. Ладно, сделайте просто контакты.[/shake]\n[color=#00ccff]Если можно, сделайте дизайн уютным, в тёплых тонах. Но если не знаете, как, то сделайте нейтральный... Я вам доверяю.[/color]",
		"good review": "Спасибо, сайт получился очень милым, клиенты уже спрашивают о нас!",
		"bad review": "Наверное, я мало что объяснил... Сайт не совсем отражает атмосферу, но вы старались.",
		"time": 45,
		"money": 12000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 3,
		"type": 0,
		"mods": {},
		"frmt": {
			"photos": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"online_order": {"type": "rand_bool"},
			"reservation": {"type": "rand_bool"},
			"style": {"type": "rand_option", "pool": ["уютный", "нейтральный", "современный"]}
		},
		"prms": [
			{"type": "slider", "text": "Количество фото интерьера", "step": 1, "min value": 1, "max value": 10, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Онлайн-заказ (если нужно)", "stat": "{online_order}"},
			{"type": "check", "text": "Бронирование столиков (наверное, не нужно)", "stat": "{reservation}"},
			{"type": "option", "text": "Стиль оформления", "items": ["Уютный", "Нейтральный", "Современный"], "indx": "{style_index}"}
		]
	},

	# 4. Приложение для изучения языка (для себя) (tag=1)
	{
		"name": "Языковой самоучитель",
		"desc": "[center][b]Привет... Я учу английский, и подумал, может, сделать приложение для запоминания слов? Но я не уверен, что это кому-то нужно, кроме меня.[/b][/center]\n[color=#ff66aa]Мне нужно, чтобы были карточки с переводом, и чтобы можно было повторять слова. Может, ещё тесты? Но если это сложно, то только карточки... Простите, я не хочу вас нагружать.[/color]\n[wave]Я думал о том, чтобы добавить озвучку, но это, наверное, очень сложно. Не надо, если не получится.[/wave]\n[shake]Количество слов: у меня уже есть список из {words} слов, но я могу сократить, если нужно. Вы сами решайте... Я в этом не разбираюсь.[/shake]\n[color=#00ccff]Ещё я хотел бы тёмную тему, но если вы считаете, что это не нужно, то пусть будет как вы сделаете... Извините за беспокойство.[/color]",
		"good review": "Спасибо большое! Приложение очень помогает, я уже выучил много слов!",
		"bad review": "Наверное, я не так объяснил... Приложение не совсем удобно, но вы старались, спасибо.",
		"time": 50,
		"money": 9000,
		"ready text": "ГОТОВО",
		"cancel text": "Не могу",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"words": {"type": "rand_int", "min": 50, "max": 100, "step": 5},
			"tests": {"type": "rand_bool"},
			"audio": {"type": "rand_bool"},
			"dark_theme": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Количество слов для изучения", "step": 5, "min value": 20, "max value": 150, "min d value": "{words}", "max d value": "{words}"},
			{"type": "check", "text": "Тесты (если не сложно)", "stat": "{tests}"},
			{"type": "check", "text": "Озвучка (скорее всего, не нужно)", "stat": "{audio}"},
			{"type": "check", "text": "Тёмная тема (если получится)", "stat": "{dark_theme}"}
		]
	},

	# 5. Сайт для мастера по ремонту обуви (tag=2)
	{
		"name": "Ремонт обуви 'Сапожок'",
		"desc": "[center][b]Здравствуйте... Я ремонтирую обувь, и хочу сделать сайт, но не знаю, насколько это необходимо. Наверное, мои клиенты и так меня знают.[/b][/center]\n[color=#884400]Мне нужен сайт с прайс-листом и контактами. Может, еще галерея моих работ? Но у меня не так много фотографий, всего {photos} штук... Может, и не надо.[/color]\n[wave]Я думал о форме заявки, чтобы клиенты писали, что им нужно, но это, наверное, лишнее. Достаточно телефона.[/wave]\n[shake]Если честно, я не очень понимаю, что ещё может быть на сайте. Может, отзывы? Но у меня всего несколько отзывов... Хотя, можно добавить.[/shake]\n[color=#ff8800]И ещё, я не хочу тратить много денег, поэтому сделайте что-нибудь недорогое, но приличное. Я вам доверяю.[/color]",
		"good review": "Сайт получился аккуратным, клиенты стали чаще звонить. Спасибо!",
		"bad review": "Наверное, я слишком мало просил... Сайт какой-то простенький, но вы старались.",
		"time": 40,
		"money": 7000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"photos": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"reviews": {"type": "rand_bool"},
			"order_form": {"type": "rand_bool"},
			"style": {"type": "rand_option", "pool": ["скромный", "классический", "деловой"]}
		},
		"prms": [
			{"type": "slider", "text": "Фото работ (если есть)", "step": 1, "min value": 0, "max value": 10, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Раздел с отзывами (можно добавить)", "stat": "{reviews}"},
			{"type": "check", "text": "Форма заявки (наверное, не нужна)", "stat": "{order_form}"},
			{"type": "option", "text": "Стиль оформления", "items": ["Скромный", "Классический", "Деловой"], "indx": "{style_index}"}
		]
	},
	# ============================================================
	# 5 АГРЕССИВНЫХ DEFAULT
	# ============================================================

	# 1. DEFAULT (tag=1) – Сайт для автосервиса
	{
		"name": "Автосервис 'Мускул' (хозяин)",
		"desc": "[center][b]Слушай сюда, умник![/b][/center]\n[color=#ff0000]Мне нужен сайт, и чтобы он был готов через {days} дней, иначе я приду и сломаю тебе руки![/color]\n[wave]Ты понял? Никаких отговорок! Сделай нормальный дизайн, тёмный, с фотками моих тачек. {photos} фото, не меньше![/wave]\n[shake]И чтоб клиенты могли записываться онлайн, понял? А если не будет записи – ты мне ответишь![/shake]\n[color=#ff8800]И ещё цены чтобы были, и контакты. И чтоб всё работало с телефона! Я не знаю, как это делается, но ты программист – разберись![/color]\n[center][b]Если сделаешь хорошо – заплачу. Если нет – ты пожалеешь, что родился![/b][/center]",
		"good review": "Наконец-то нормальный сайт! Может, ты не такой уж и идиот. Деньги получишь.",
		"bad review": "Что за дерьмо?! Я тебя предупреждал! Всё переделать, и быстро!",
		"time": 50,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Пошёл ты!",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"days": {"type": "rand_int", "min": 3, "max": 5, "step": 1},
			"photos": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"online_booking": {"type": "rand_bool"},
			"mobile": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 2, "max value": 7, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Количество фото", "step": 2, "min value": 5, "max value": 25, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Онлайн-запись (обязательно!)", "stat": "{online_booking}"},
			{"type": "check", "text": "Мобильная версия (должна быть!)", "stat": "{mobile}"}
		]
	},

	# 2. DEFAULT (tag=2) – Интернет-магазин одежды
	{
		"name": "Бренд 'Халява' (директор)",
		"desc": "[center][b]Эй, ты, ничтожество! Сделай мне магазин одежды, и чтобы завтра всё было готово![/b][/center]\n[color=#ff8800]Категории: {categories}, но я ещё не решил, сколько. Думаю, 5 хватит. Но если мало – добавишь ещё, понял?[/color]\n[wave]Товаров: {items} на каждую категорию. И чтобы цены были, и скидки. Я хочу видеть всё красиво![/wave]\n[shake]Корзина и оплата – обязательны! Если не будет оплаты, я тебя уволю! Хотя ты не мой сотрудник, но я сделаю так, что ты больше не найдёшь работу![/shake]\n[color=#ff4444]И не вздумай использовать шаблоны! Я хочу уникальный дизайн! Если я увижу такой же сайт у конкурентов – ты труп![/color]",
		"good review": "Наконец-то нормальный магазин! Ты сделал это, чертяка! Деньги на счету.",
		"bad review": "Это дерьмо? Где дизайн? Где товары? Ты меня разорил! Всё переделать!",
		"time": 60,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"categories": {"type": "rand_int", "min": 4, "max": 6, "step": 1},
			"items": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"discount": {"type": "rand_bool"},
			"payment": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Количество категорий", "step": 1, "min value": 2, "max value": 8, "min d value": "{categories}", "max d value": "{categories}"},
			{"type": "slider", "text": "Товаров в категории", "step": 2, "min value": 5, "max value": 30, "min d value": "{items}", "max d value": "{items}"},
			{"type": "check", "text": "Скидки (должны быть!)", "stat": "{discount}"},
			{"type": "check", "text": "Оплата (обязательно!)", "stat": "{payment}"}
		]
	},

	# 3. DEFAULT (tag=3) – Сайт для строительной компании
	{
		"name": "Строй-Гарант (владелец)",
		"desc": "[center][b]Слушай, придурок! Мне нужен сайт для строительства, и чтобы он был лучше, чем у конкурентов![/b][/center]\n[color=#ff8800]Проектов в портфолио: {projects}, но я хочу, чтобы ты добавил ещё {extra} из моих файлов, понял?[/color]\n[wave]Калькулятор стоимости – чтобы считал быстро и точно! Если он будет врать – я тебя засужу![/wave]\n[shake]Отзывы клиентов – я хочу, чтобы их было {reviews} штук, и все положительные! Если кто-то напишет плохо – ты сотрёшь![/shake]\n[color=#ff4444]И не вздумай делать сайт дольше {days} дней! Я не люблю ждать! Если опоздаешь – пеняй на себя![/color]",
		"good review": "Ну наконец-то! Сайт работает, заказы пошли. Ты не такой уж и болван.",
		"bad review": "Что за халтура? Калькулятор врёт, отзывы фейковые, портфолио убогое! Переделать!",
		"time": 55,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 3,
		"type": 0,
		"mods": {},
		"frmt": {
			"projects": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"extra": {"type": "rand_int", "min": 2, "max": 4, "step": 1},
			"reviews": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"days": {"type": "rand_int", "min": 5, "max": 10, "step": 1}
		},
		"prms": [
			{"type": "slider", "text": "Проектов в портфолио", "step": 1, "min value": 4, "max value": 20, "min d value": "{projects}", "max d value": "{projects}"},
			{"type": "slider", "text": "Дополнительных проектов", "step": 1, "min value": 1, "max value": 6, "min d value": "{extra}", "max d value": "{extra}"},
			{"type": "slider", "text": "Отзывов (все положительные)", "step": 1, "min value": 3, "max value": 15, "min d value": "{reviews}", "max d value": "{reviews}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 3, "max value": 15, "min d value": "{days}", "max d value": "{days}"}
		]
	},

	# 4. DEFAULT (tag=1) – Сайт для салона красоты
	{
		"name": "Салон 'Красотка' (директриса)",
		"desc": "[center][b]Ну что, красавчик, сделаешь мне сайт? Только не вздумай облажаться![/b][/center]\n[color=#ff66aa]Услуг должно быть {services}, и все с ценами! Если я увижу ошибку – ты у меня ответишь![/color]\n[wave]Галерея работ – минимум {photos} фото, и чтобы они были красивые! Если будут плохие – я тебя прокляну![/wave]\n[shake]Онлайн-запись – обязательно! И чтобы работала без сбоев! Если кто-то не сможет записаться – ты мне за это заплатишь![/shake]\n[color=#ff8800]Дизайн: розовый, нежный, но с характером! Сделай как я скажу, иначе я найду другого![/color]",
		"good review": "Ну вот, наконец-то нормальный сайт! Ты справился, молодец. Деньги получишь.",
		"bad review": "Это убожество? Где розовый? Где фото? Всё переделать, и быстрее!",
		"time": 45,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"mods": {},
		"frmt": {
			"services": {"type": "rand_int", "min": 6, "max": 10, "step": 1},
			"photos": {"type": "rand_int", "min": 12, "max": 20, "step": 2},
			"online_booking": {"type": "rand_bool"},
			"pink": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Количество услуг", "step": 1, "min value": 3, "max value": 15, "min d value": "{services}", "max d value": "{services}"},
			{"type": "slider", "text": "Фото работ", "step": 2, "min value": 5, "max value": 30, "min d value": "{photos}", "max d value": "{photos}"},
			{"type": "check", "text": "Онлайн-запись (обязательно!)", "stat": "{online_booking}"},
			{"type": "check", "text": "Розовый дизайн (иначе убью!)", "stat": "{pink}"}
		]
	},

	# 5. DEFAULT (tag=2) – Приложение для доставки еды
	{
		"name": "Доставка 'Жрать' (владелец)",
		"desc": "[center][b]Эй, ты, червяк! Сделай мне приложение для доставки еды, и чтобы всё было на высшем уровне![/b][/center]\n[color=#ff8800]Ресторанов: {restaurants}, и все с меню! Если я узнаю, что кто-то не хочет работать с нами – ты виноват![/color]\n[wave]Время доставки: не более {time} минут! Если больше – ты платишь штраф![/wave]\n[shake]Оплата онлайн – обязательна! И чтобы работала с первого дня! Если будут сбои – я тебя уничтожу![/shake]\n[color=#ff4444]И сделай это за {days} дней, иначе я найму других, и ты останешься без денег![/color]",
		"good review": "Ну, приложение работает, доставка быстрая. Ты не облажался, на этот раз.",
		"bad review": "Катастрофа! Рестораны жалуются, время доставки больше нормы! Ты меня разорил!",
		"time": 60,
		"money": 40000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 0,
		"mods": {},
		"frmt": {
			"restaurants": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"time": {"type": "rand_int", "min": 25, "max": 40, "step": 5},
			"days": {"type": "rand_int", "min": 7, "max": 14, "step": 1},
			"online_payment": {"type": "rand_bool"}
		},
		"prms": [
			{"type": "slider", "text": "Количество ресторанов", "step": 2, "min value": 5, "max value": 30, "min d value": "{restaurants}", "max d value": "{restaurants}"},
			{"type": "slider", "text": "Максимальное время доставки (мин)", "step": 5, "min value": 15, "max value": 60, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 5, "max value": 20, "min d value": "{days}", "max d value": "{days}"},
			{"type": "check", "text": "Онлайн-оплата (обязательно!)", "stat": "{online_payment}"}
		]
	},
	# ============================================================
	# 5 АГРЕССИВНЫХ MESSAGE
	# ============================================================

	# 1. MESSAGE (tag=1) – Мама злая
	{
		"name": "Мама (разозлилась)",
		"desc": "[center][b]Сынок, ты где шляешься? Я звоню, ты не берёшь! Немедленно ответь![/b][/center]",
		"good review": "Наконец-то ответил! Спасибо, а то я уже волновалась.",
		"bad review": "Не отвечаешь? Ну и ладно, я тебя больше не жду!",
		"time": 15,
		"money": 0,
		"ready text": "Извини, мам!",
		"cancel text": "Отстань!",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"frmt": {},
		"prms": []
	},

	# 2. MESSAGE (tag=2) – Друг злой
	{
		"name": "Друг Серёга (обиделся)",
		"desc": "[center][b]Ты что, забыл, что мы договаривались встретиться? Я уже час жду! Ты где?[/b][/center]",
		"good review": "Ну, пришёл наконец, проехали.",
		"bad review": "Не пришёл? Ну и пошёл ты!",
		"time": 15,
		"money": 0,
		"ready text": "Иду уже!",
		"cancel text": "Забудь",
		"tags": 2,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"frmt": {},
		"prms": []
	},

	# 3. MESSAGE (tag=3) – Сосед злой
	{
		"name": "Сосед дядя Петя (злой)",
		"desc": "[center][b]Ты что, опять музыку на всю громкость? Я тебя предупреждал! Сделай потише, или я вызову полицию![/b][/center]",
		"good review": "Сделал потише, спасибо, что не пришлось звонить в полицию.",
		"bad review": "Не сделал? Я вызвал полицию!",
		"time": 15,
		"money": 0,
		"ready text": "Извините, убавил",
		"cancel text": "Плевать",
		"tags": 3,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"frmt": {},
		"prms": []
	},

	# 4. MESSAGE (tag=1) – Сестра злая
	{
		"name": "Сестра Лена (раздражена)",
		"desc": "[center][b]Брат, ты опять не помыл посуду? Я тебя просила! Сделай сейчас же![/b][/center]",
		"good review": "Ну наконец-то помыл. Спасибо.",
		"bad review": "Не помыл? Ну и пожалуйста, я больше не буду с тобой разговаривать!",
		"time": 15,
		"money": 0,
		"ready text": "Щас помою!",
		"cancel text": "Не хочу",
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"frmt": {},
		"prms": []
	},

	# 5. MESSAGE (tag=2) – Коллега злой
	{
		"name": "Коллега Иван (нервный)",
		"desc": "[center][b]Ты скинул мне отчёт? Я его не вижу! Срочно перешли! Если не сделаешь, я на тебя начальнику пожалуюсь![/b][/center]",
		"good review": "Спасибо, скинул, теперь всё в порядке.",
		"bad review": "Не скинул? Я пожалуюсь!",
		"time": 15,
		"money": 0,
		"ready text": "Сейчас скину!",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 3,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"frmt": {},
		"prms": []
	},
	# ============================================================
	# 5 АГРЕССИВНЫХ EMERGENCY
	# ============================================================

	# 1. EMERGENCY (tag=1) – Сбой в системе больницы
	{
		"name": "Больница (главврач, в ярости)",
		"desc": "[center][color=#ff0000][b]СРОЧНО! Система записи пациентов упала! Ты должен починить за {time} минут, иначе я лишу тебя лицензии![/b][/color][/center]\n[color=#ff4444]Я тебя предупреждал! Если не починишь – я подам в суд![/color]\n[wave]Количество пациентов: {patients}, они ждут! Ты понимаешь, что на тебе жизни людей?[/wave]\n[shake]Быстро делай что угодно, но чтобы работало![/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 10, "step": 1},
			"patients": {"type": "rand_int", "min": 50, "max": 100, "step": 5}
		},
		"good review": "Ты чудом спас ситуацию. Система работает. Но я на тебя смотрю.",
		"bad review": "Ты всё провалил! Пациенты не записаны, я тебя уничтожу!",
		"time": 60,
		"money": 70000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 1,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на ремонт (мин)", "step": 1, "min value": 3, "max value": 15, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Пациентов в очереди", "step": 5, "min value": 10, "max value": 150, "min d value": "{patients}", "max d value": "{patients}"}
		]
	},

	# 2. EMERGENCY (tag=2) – Взлом банка
	{
		"name": "Банк (директор, в бешенстве)",
		"desc": "[center][color=#ff0000][b]Взлом системы! Ты должен отразить атаку за {time} минут! Если деньги пропадут – я тебя посажу![/b][/color][/center]\n[color=#ff8800]Атак в секунду: {attacks}, ты должен их заблокировать![/color]\n[wave]Если не справишься – я найму киллеров! Это не шутка![/wave]\n[shake]Делай что хочешь, но чтобы всё работало![/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"attacks": {"type": "rand_int", "min": 80, "max": 120, "step": 5}
		},
		"good review": "Ты отбил атаку, деньги сохранены. Но я за тобой слежу.",
		"bad review": "Деньги украдены! Ты ответишь!",
		"time": 70,
		"money": 90000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на отражение (мин)", "step": 1, "min value": 2, "max value": 8, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Атак в секунду", "step": 5, "min value": 50, "max value": 150, "min d value": "{attacks}", "max d value": "{attacks}"}
		]
	},

	# 3. EMERGENCY (tag=3) – Пожар в серверной
	{
		"name": "Дата-центр (начальник, орет)",
		"desc": "[center][color=#ff0000][b]ПОЖАР! Система пожаротушения не сработала! Ты должен активировать резерв за {time} минут![/b][/color][/center]\n[color=#ff4444]Если сервера сгорят – я тебя убью![/color]\n[wave]Температура: {temp}°C, растёт каждую секунду![/wave]\n[shake]Быстро, идиот, делай что-нибудь![/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 3, "max": 6, "step": 1},
			"temp": {"type": "rand_int", "min": 70, "max": 90, "step": 2}
		},
		"good review": "Ты успел, сервера спасены. Но я с тебя глаз не спущу.",
		"bad review": "Сервера сгорели! Ты ответишь!",
		"time": 65,
		"money": 100000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на активацию (мин)", "step": 1, "min value": 2, "max value": 8, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Температура (°C)", "step": 2, "min value": 50, "max value": 100, "min d value": "{temp}", "max d value": "{temp}"}
		]
	},

	# 4. EMERGENCY (tag=1) – Сбой на АЭС
	{
		"name": "АЭС (директор, в панике)",
		"desc": "[center][color=#ff0000][b]СБОЙ ОХЛАЖДЕНИЯ! Уровень радиации растёт! Ты должен остановить за {time} минут![/b][/color][/center]\n[color=#ff0000]Если допустить утечку – мы все умрём! Делай что угодно![/color]\n[wave]Температура реактора: {temp}°C, растёт на {rise}°C в минуту![/wave]\n[shake]Я приказываю – спаси станцию! Иначе я тебя уничтожу![/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 5, "max": 8, "step": 1},
			"temp": {"type": "rand_int", "min": 300, "max": 350, "step": 5},
			"rise": {"type": "rand_int", "min": 5, "max": 10, "step": 1}
		},
		"good review": "Ты спас станцию! Но я всё равно тебя ненавижу.",
		"bad review": "Взрыв! Ты всё погубил!",
		"time": 80,
		"money": 120000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 1,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на остановку (мин)", "step": 1, "min value": 3, "max value": 10, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Температура реактора (°C)", "step": 5, "min value": 250, "max value": 400, "min d value": "{temp}", "max d value": "{temp}"},
			{"type": "slider", "text": "Скорость нагрева (°C/мин)", "step": 1, "min value": 3, "max value": 12, "min d value": "{rise}", "max d value": "{rise}"}
		]
	},

	# 5. EMERGENCY (tag=2) – Сбой в системе управления дронами
	{
		"name": "Дроны (владелец, в ярости)",
		"desc": "[center][color=#ff0000][b]Дроны потеряли управление! Они могут упасть на людей! Ты должен перехватить управление за {time} минут![/b][/color][/center]\n[color=#ff8800]Количество дронов: {drones}, зона поражения: {zone} км![/color]\n[wave]Если они упадут, я тебя размажу по стенке![/wave]\n[shake]Не стой, делай что-то![/shake]",
		"frmt": {
			"time": {"type": "rand_int", "min": 4, "max": 7, "step": 1},
			"drones": {"type": "rand_int", "min": 15, "max": 25, "step": 2},
			"zone": {"type": "rand_int", "min": 3, "max": 6, "step": 1}
		},
		"good review": "Ты перехватил управление, дроны спасены. Но я на тебя зол.",
		"bad review": "Дроны упали! Есть жертвы! Ты ответишь!",
		"time": 75,
		"money": 85000,
		"ready text": "ГОТОВО",
		"cancel text": "",
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Время на перехват (мин)", "step": 1, "min value": 2, "max value": 8, "min d value": "{time}", "max d value": "{time}"},
			{"type": "slider", "text": "Количество дронов", "step": 1, "min value": 5, "max value": 40, "min d value": "{drones}", "max d value": "{drones}"},
			{"type": "slider", "text": "Зона поражения (км)", "step": 1, "min value": 2, "max value": 8, "min d value": "{zone}", "max d value": "{zone}"}
		]
	},
	# ============================================================
	# 5 АГРЕССИВНЫХ DARKNET
	# ============================================================

	# 1. DARKNET (tag=1) – Теневой оружейник
	{
		"name": "Оружейный барон (безжалостный)",
		"desc": "[center][b][color=#444444]Слушай, червяк![/color][/b][/center]\n[color=#880000]Мне нужен сайт для продажи оружия. Если ты хоть кому-то проболтаешься – я тебя пристрелю![/color]\n[wave]Товаров: {items}, и всё должно быть анонимно![/wave]\n[shake]Срок: {days} дней, иначе я пришлю к тебе своих людей![/shake]\n[color=#ff4444]И не вздумай делать логи! Понял?[/color]",
		"frmt": {
			"items": {"type": "rand_int", "min": 15, "max": 25, "step": 2},
			"days": {"type": "rand_int", "min": 3, "max": 5, "step": 1}
		},
		"good review": "Ты сделал сайт, я доволен. Но если что – я знаю, где ты живёшь.",
		"bad review": "Ты провалил задание. Ты мертвец.",
		"time": 70,
		"money": 50000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 1,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Количество товаров", "step": 2, "min value": 5, "max value": 40, "min d value": "{items}", "max d value": "{items}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 2, "max value": 7, "min d value": "{days}", "max d value": "{days}"}
		]
	},

	# 2. DARKNET (tag=2) – Крипто-вымогатель
	{
		"name": "Крипто-Кинг (безжалостный)",
		"desc": "[center][b][color=#444444]Сделай мне сервис для вымогательства крипты![/color][/b][/center]\n[color=#880000]Если ты откажешься – я взломаю твой компьютер и украду все твои данные![/color]\n[wave]Сумма выкупа: {amount}$, должна быть анонимной![/wave]\n[shake]Срок: {days} дней, иначе ты труп![/shake]\n[color=#ff4444]И чтобы никаких следов![/color]",
		"frmt": {
			"amount": {"type": "rand_int", "min": 1000, "max": 5000, "step": 200},
			"days": {"type": "rand_int", "min": 2, "max": 4, "step": 1}
		},
		"good review": "Сервис работает, выкупы приходят. Ты жив пока.",
		"bad review": "Ты навел ментов на мой след! Ты покойник.",
		"time": 65,
		"money": 45000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 5},
		"prms": [
			{"type": "slider", "text": "Сумма выкупа ($)", "step": 200, "min value": 500, "max value": 8000, "min d value": "{amount}", "max d value": "{amount}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 1, "max value": 5, "min d value": "{days}", "max d value": "{days}"}
		]
	},

	# 3. DARKNET (tag=3) – Фальшивомонетчик (злой)
	{
		"name": "Фальшивомонетчик (злобный)",
		"desc": "[center][b][color=#444444]Слушай, придурок! Мне нужен сайт для продажи фальшивых денег![/color][/b][/center]\n[color=#880000]Если ты кому-то расскажешь – я тебя убью, понял?[/color]\n[wave]Купюр: {bills}, номинал: {denomination}$.[/wave]\n[shake]Срок: {days} дня, иначе ты пожалеешь![/shake]\n[color=#ff4444]И чтобы анонимность была на высоте![/color]",
		"frmt": {
			"bills": {"type": "rand_int", "min": 30, "max": 60, "step": 5},
			"denomination": {"type": "rand_int", "min": 20, "max": 50, "step": 5},
			"days": {"type": "rand_int", "min": 2, "max": 3, "step": 1}
		},
		"good review": "Фальшивки продаются, я доволен. Ты пока жив.",
		"bad review": "Ты нас подставил! Ты мертв!",
		"time": 60,
		"money": 35000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 3,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Количество купюр", "step": 5, "min value": 10, "max value": 80, "min d value": "{bills}", "max d value": "{bills}"},
			{"type": "slider", "text": "Номинал ($)", "step": 5, "min value": 10, "max value": 70, "min d value": "{denomination}", "max d value": "{denomination}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 1, "max value": 4, "min d value": "{days}", "max d value": "{days}"}
		]
	},

	# 4. DARKNET (tag=1) – Торговец данными (злой)
	{
		"name": "Торговец базами (злой)",
		"desc": "[center][b][color=#444444]Сделай мне магазин баз данных![/color][/b][/center]\n[color=#880000]Если ты не сделаешь – я солью твои данные в сеть![/color]\n[wave]Записей: {records} тыс., цена: {price}$ за тысячу.[/wave]\n[shake]Срок: {days} дня, иначе я тебя найду![/shake]\n[color=#ff4444]И чтобы сайт был защищён от прослушки![/color]",
		"frmt": {
			"records": {"type": "rand_int", "min": 10, "max": 20, "step": 2},
			"price": {"type": "rand_int", "min": 200, "max": 400, "step": 20},
			"days": {"type": "rand_int", "min": 2, "max": 4, "step": 1}
		},
		"good review": "Базы продаются, деньги есть. Ты пока полезен.",
		"bad review": "Ты слил информацию! Ты мертв!",
		"time": 65,
		"money": 40000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 1,
		"type": 6,
		"mods": {"safe rep": true, "police count": 4},
		"prms": [
			{"type": "slider", "text": "Записей (тыс.)", "step": 2, "min value": 5, "max value": 30, "min d value": "{records}", "max d value": "{records}"},
			{"type": "slider", "text": "Цена за тыс. ($)", "step": 20, "min value": 100, "max value": 600, "min d value": "{price}", "max d value": "{price}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 1, "max value": 5, "min d value": "{days}", "max d value": "{days}"}
		]
	},

	# 5. DARKNET (tag=2) – Хакер-вымогатель
	{
		"name": "Хакер 'Тень' (злобный)",
		"desc": "[center][b][color=#444444]Мне нужен сайт для продажи эксплойтов![/color][/b][/center]\n[color=#880000]Если ты откажешься – я взломаю твой банковский счёт![/color]\n[wave]Эксплойтов: {exploits}, цена за штуку: {price}$.[/wave]\n[shake]Срок: {days} дня, иначе ты пожалеешь![/shake]\n[color=#ff4444]И чтобы всё было анонимно![/color]",
		"frmt": {
			"exploits": {"type": "rand_int", "min": 8, "max": 15, "step": 1},
			"price": {"type": "rand_int", "min": 500, "max": 1000, "step": 50},
			"days": {"type": "rand_int", "min": 3, "max": 5, "step": 1}
		},
		"good review": "Эксплойты проданы, я доволен. Ты ещё жив.",
		"bad review": "Ты нас подставил! Ты покойник!",
		"time": 70,
		"money": 55000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 5},
		"prms": [
			{"type": "slider", "text": "Количество эксплойтов", "step": 1, "min value": 3, "max value": 20, "min d value": "{exploits}", "max d value": "{exploits}"},
			{"type": "slider", "text": "Цена за эксплойт ($)", "step": 50, "min value": 200, "max value": 1500, "min d value": "{price}", "max d value": "{price}"},
			{"type": "slider", "text": "Срок (дней)", "step": 1, "min value": 2, "max value": 6, "min d value": "{days}", "max d value": "{days}"}
		]
	},
	# ============================================================
	# 5 АГРЕССИВНЫХ RARE
	# ============================================================

	# 1. RARE (tag=1) – Разработка ИИ для нефтяной вышки
	{
		"name": "Нефтяная корпорация (директор-самодур)",
		"desc": "[center][b]Слушай, ты, ничтожество! Мне нужна система ИИ для управления бурением![/b][/center]\n[color=#ff8800]Датчиков: {sensors}, точность: {accuracy}%! Если точность будет ниже – ты ответишь![/color]\n[wave]Срок: {days} дней, иначе я найду других![/wave]\n[shake]Бюджет: {budget} млн $, но если ты облажаешься – я тебя разорю![/shake]\n[color=#ff4444]И чтобы система была надёжной, как швейцарские часы![/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 20, "max": 30, "step": 2},
			"accuracy": {"type": "rand_int", "min": 92, "max": 98, "step": 1},
			"days": {"type": "rand_int", "min": 40, "max": 60, "step": 5},
			"budget": {"type": "rand_int", "min": 50, "max": 80, "step": 5}
		},
		"good review": "Система работает, я не ожидал, что ты справишься. Но я всё равно на тебя злюсь.",
		"bad review": "Ты провалил задание! Я тебя сотру в порошок!",
		"time": 150,
		"money": 500000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 1,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Количество датчиков", "step": 2, "min value": 10, "max value": 40, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Точность (%)", "step": 1, "min value": 80, "max value": 100, "min d value": "{accuracy}", "max d value": "{accuracy}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 30, "max value": 90, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 5, "min value": 20, "max value": 100, "min d value": "{budget}", "max d value": "{budget}"}
		]
	},

	# 2. RARE (tag=2) – Космический проект (спутник)
	{
		"name": "Космическое агентство (генерал, в бешенстве)",
		"desc": "[center][b]Ты, червь! Спутник выходит на орбиту, нужна система управления![/b][/center]\n[color=#ff8800]Спутников: {satellites}, задержка: {delay} мс! Если задержка больше – ты труп![/color]\n[wave]Срок: {days} дней, иначе я отправлю тебя в космос без скафандра![/wave]\n[shake]Бюджет: {budget} млн $, но если ты облажаешься, я лишу тебя всего![/shake]\n[color=#ff4444]И чтобы система была идеальной![/color]",
		"frmt": {
			"satellites": {"type": "rand_int", "min": 6, "max": 10, "step": 1},
			"delay": {"type": "rand_int", "min": 80, "max": 120, "step": 5},
			"days": {"type": "rand_int", "min": 50, "max": 70, "step": 5},
			"budget": {"type": "rand_int", "min": 80, "max": 120, "step": 10}
		},
		"good review": "Ты сделал это, чудом. Но я всё равно тебя ненавижу.",
		"bad review": "Ты погубил спутник! Я убью тебя!",
		"time": 180,
		"money": 700000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Количество спутников", "step": 1, "min value": 3, "max value": 15, "min d value": "{satellites}", "max d value": "{satellites}"},
			{"type": "slider", "text": "Задержка (мс)", "step": 5, "min value": 50, "max value": 200, "min d value": "{delay}", "max d value": "{delay}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 30, "max value": 100, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 10, "min value": 30, "max value": 150, "min d value": "{budget}", "max d value": "{budget}"}
		]
	},

	# 3. RARE (tag=3) – Квантовый компьютер
	{
		"name": "Квантовый центр (профессор-тиран)",
		"desc": "[center][b]Слушай, ты, бездарь! Мне нужен алгоритм для квантового компьютера![/b][/center]\n[color=#ff8800]Кубитов: {qubits}, точность: {accuracy}%! Если что-то не так – ты пожалеешь![/color]\n[wave]Срок: {days} дней, иначе я сделаю так, что ты не найдёшь работу![/wave]\n[shake]Бюджет: {budget} млн $, но если ты не справишься – я разорю тебя![/shake]\n[color=#ff4444]И чтобы алгоритм был быстрее всех![/color]",
		"frmt": {
			"qubits": {"type": "rand_int", "min": 40, "max": 60, "step": 5},
			"accuracy": {"type": "rand_int", "min": 93, "max": 99, "step": 1},
			"days": {"type": "rand_int", "min": 60, "max": 80, "step": 5},
			"budget": {"type": "rand_int", "min": 100, "max": 150, "step": 10}
		},
		"good review": "Ты сделал это, случайно. Но я тебя не прощаю.",
		"bad review": "Ты провалил всё! Ты конченный человек!",
		"time": 200,
		"money": 800000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 3,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Количество кубитов", "step": 5, "min value": 20, "max value": 80, "min d value": "{qubits}", "max d value": "{qubits}"},
			{"type": "slider", "text": "Точность (%)", "step": 1, "min value": 80, "max value": 100, "min d value": "{accuracy}", "max d value": "{accuracy}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 40, "max value": 120, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 10, "min value": 50, "max value": 200, "min d value": "{budget}", "max d value": "{budget}"}
		]
	},

	# 4. RARE (tag=1) – Биоинженерия
	{
		"name": "Био-тех корпорация (директор-психопат)",
		"desc": "[center][b][color=#ff1100]ТЫ НИЧТОЖЕСТВО!!![color=][/b][/center] Мне нужен софт для управления бионическими протезами![/b][/center]\n[color=#ff8800]Датчиков: {sensors}, точность: {accuracy}%![/color]\n[wave]Срок: {days} дней, иначе я тебя на опыты отдам![/wave]\n[shake]Бюджет: {budget} млн $, но если облажаешься – ты труп![/shake]\n[color=#ff4444]И чтобы всё работало без сбоев![/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 8, "max": 12, "step": 1},
			"accuracy": {"type": "rand_int", "min": 94, "max": 99, "step": 1},
			"days": {"type": "rand_int", "min": 50, "max": 70, "step": 5},
			"budget": {"type": "rand_int", "min": 60, "max": 90, "step": 5}
		},
		"good review": "Ты справился, случайно. Но я на тебя злюсь.",
		"bad review": "Ты погубил людей! Ты ответишь!",
		"time": 170,
		"money": 600000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 1,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Количество датчиков", "step": 1, "min value": 4, "max value": 16, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Точность (%)", "step": 1, "min value": 80, "max value": 100, "min d value": "{accuracy}", "max d value": "{accuracy}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 30, "max value": 100, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 5, "min value": 30, "max value": 120, "min d value": "{budget}", "max d value": "{budget}"}
		]
	},

	# 5. RARE (tag=2) – Разработка системы для Марсохода
	{
		"name": "Марсоход (главный инженер, злой)",
		"desc": "[center][b]Слушай, ты, неудачник! Мне нужна система для марсохода![/b][/center]\n[color=#ff8800]Датчиков: {sensors}, задержка: {delay} мс![/color]\n[wave]Срок: {days} дней, иначе я отправлю тебя на Марс без билета![/wave]\n[shake]Бюджет: {budget} млн $, но если ты облажаешься – ты труп![/shake]\n[color=#ff4444]И чтобы система работала в любых условиях![/color]",
		"frmt": {
			"sensors": {"type": "rand_int", "min": 7, "max": 11, "step": 1},
			"delay": {"type": "rand_int", "min": 150, "max": 250, "step": 10},
			"days": {"type": "rand_int", "min": 60, "max": 80, "step": 5},
			"budget": {"type": "rand_int", "min": 70, "max": 110, "step": 10}
		},
		"good review": "Ты спас миссию, чудом. Но я тебя не прощаю.",
		"bad review": "Ты провалил миссию! Ты ответишь!",
		"time": 190,
		"money": 900000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 5},
		"prms": [
			{"type": "slider", "text": "Количество датчиков", "step": 1, "min value": 4, "max value": 15, "min d value": "{sensors}", "max d value": "{sensors}"},
			{"type": "slider", "text": "Задержка (мс)", "step": 10, "min value": 100, "max value": 300, "min d value": "{delay}", "max d value": "{delay}"},
			{"type": "slider", "text": "Срок (дней)", "step": 5, "min value": 40, "max value": 120, "min d value": "{days}", "max d value": "{days}"},
			{"type": "slider", "text": "Бюджет (млн $)", "step": 10, "min value": 40, "max value": 150, "min d value": "{budget}", "max d value": "{budget}"}
		]
	},
]
