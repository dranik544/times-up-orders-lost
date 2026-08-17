extends Node

# OrderList.gd (AutoLoad)

# frmt форматы:
# {"???": {"type": "rand_bool"}}
# игра случайным образом выберет TRUE или FALSE
# 
# {"???": {"type": "rand_int", "min": 1, "max": 10}}
# игра случайным образом выберет число от MIN до MAX
# 
# {"???": {"type": "rand_option", "pool": ["godot", "engine", "3.6.2", "stable"]}}
# игра случайным образом выберет верный ответ для ???_index из этого списка и даст этот же список по запросу ???_text
# 
# {"???": {"type": "rand_text", "pool": ["godot", "engine", "game"]}}
# игра случайным образом выберет какой-нибудь вариант из списка и сочтёт его верным
# 
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
		"groups": [
			{
				"desc": "Пункт N1: отметь галочкой.",
				"frmt": {},
				"blck": [
					{
						"type": "check",
						"text": "Пункт N1",
						"stat": true
					}
				]
			},
			{
				"desc": "Пункт N2: выбери третий вариант.",
				"frmt": {},
				"blck": [
					{
						"type": "option",
						"text": "Пункт N2",
						"items": ["1", "2", "3", "4", "5", "6"],
						"indx": 2
					}
				]
			},
			{
				"desc": "Пункт N3: поставь метку ровно на пять.",
				"frmt": {},
				"blck": [
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
			}
		]
	},
	# ---------- СЮЖЕТНЫЙ ЗАКАЗ ПОСЛЕ ОТНОШЕНИЙ (type=5, tag=-1) ----------
	{
		"name": "Drimer544 (создатель игры)",
		"desc": "[center][b]Я СНОВА ЗДЕСЬ![/b][/center]\nС возвращением! Удивительно, что ты ещё не вышел из игры. Ты мог заметить, что сбоку появилась ещё одна панель - [color=#e4ffcc]состояние отношений[/color]. Не буду скрывать, она напрямую повлияет на твой титул в конце, тоесть, концовку. Не переживай, после титула ты сможешь продолжить свой [wave]бесконечный поток заказов[/wave]. Теперь, наверное, я больше не вернусь к тебе.\n[color=#fff700][center][b]Прощай!",
		"good review": "...",
		"bad review": "...",
		"time": 145,
		"money": 0,
		"ready text": "Принял!",
		"cancel text": "Ой, чепуха.",
		"tags": -1,
		"type": 5,
		"mods": {"safe skip": true, "safe cancel": true, "safe rep": true},
		"groups": []
	},
	# ---------- ОБЫЧНЫЙ ЗАКАЗ (DEFAULT type=0) ----------
	{
		"name": "Вася (сосед)",
		"desc": "[center][b]Слышь, сделай мне умный дом![/b][/center]\nНо чтобы сам всё делал, понимаешь? Я в этом не шарю. Короче, [color=#00ccff]настрой там всё как надо[/color], а я потом посмотрю. Главное, чтобы работало, а не как у прошлого ... кхм. Давай, жду!\n\n[color=#ff8800]P.S.[/color] Если что-то пойдёт не так, я буду [b]очень[/b] расстроен.",
		"good review": "О, работает! Даже лучше, чем я думал. Спасибо, чувак!",
		"bad review": "Ничего не работает! Опять эти ваши программисты...",
		"time": 90,
		"money": 1500,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 1,
		"type": 0,
		"groups": [
			{
				"desc": "Уведомления присылать? {notify} А то я вечно пропускаю, а потом злюсь. Лучше пусть приходят, чем нет.",
				"frmt": {"notify": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Уведомления о событиях",
						"stat": "{notify}"
					}
				]
			},
			{
				"desc": "Температуру сделай от {t_min} до {t_max} градусов, ну чтобы [i]комфортно[/i] было. Не жарко и не холодно, а то я мёрзну или потею.",
				"frmt": {
					"t_min": {"type": "rand_int", "min": 18, "max": 22},
					"t_max": {"type": "rand_int", "min": 24, "max": 28}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Диапазон температуры",
						"step": 1,
						"min value": 10,
						"max value": 35,
						"min d value": "{t_min}",
						"max d value": "{t_max}"
					}
				]
			},
			{
				"desc": "Подсветку хочу [color=#ff66aa]{color_text}[/color], а не эту скучную белую. Всё время белая, как в больнице. Сделай нормальный цвет.",
				"frmt": {"color": {"type": "rand_option", "pool": ["синий", "зелёный", "красный"]}},
				"blck": [
					{
						"type": "option",
						"text": "Цвет",
						"items": ["синий", "зелёный", "красный"],
						"indx": "{color_index}"
					}
				]
			},
			{
				"desc": "И пароль поставь {secret}, только никому не говори. А то взломают, понимаешь? Даже мне не говори, я забуду.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["opensesame", "magic", "home"]}},
				"blck": [
					{
						"type": "line",
						"text": "Пароль доступа",
						"ph text": "введите код",
						"correct": "{secret}"
					}
				]
			},
			{
				"desc": "А, и ещё! Авто-управление пусть будет {auto}. Чтобы сам всё включал, когда я прихожу. Или выключал. Лень нажимать.",
				"frmt": {"auto": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Авто-управление",
						"stat": "{auto}"
					}
				]
			},
			{
				"desc": "Количество сценариев: {sc} штук. [s]Или много?[/s] Сделай сколько скажу, а то я запутаюсь.",
				"frmt": {"sc": {"type": "rand_int", "min": 3, "max": 7}},
				"blck": [
					{
						"type": "slider",
						"text": "Количество сценариев",
						"step": 1,
						"min value": 1,
						"max value": 10,
						"min d value": "{sc}",
						"max d value": "{sc}"
					}
				]
			},
			{
				"desc": "Язык интерфейса: {lang_text}. А то я по-русски не понимаю, шучу, понимаю, но пусть будет.",
				"frmt": {"lang": {"type": "rand_option", "pool": ["русский", "английский", "испанский"]}},
				"blck": [
					{
						"type": "option",
						"text": "Язык интерфейса",
						"items": ["Русский", "Английский", "Испанский"],
						"indx": "{lang_index}"
					}
				]
			}
		]
	},
	# ---------- РЕДКИЙ ЗАКАЗ (RARE type=2) ----------
	{
		"name": "Геннадий (инженер)",
		"desc": "[center][b]Слушай сюда, это серьёзно![/b][/center]\nДелаем систему для космической станции. Тут тебе не игрушки! [color=#ff4444]Ошибка = смерть[/color], понял? [wave]Ну, или просто увольнение...[/wave]\nКороче, [shake]внимательно[/shake] смотри параметры.",
		"good review": "Отлично! Все системы работают. Ты спас экипаж!",
		"bad review": "Ты что наделал?! У нас тут [b]критическая ошибка[/b]!",
		"time": 120,
		"money": 3000,
		"ready text": "ГОТОВО",
		"cancel text": "Не рискну",
		"tags": 2,
		"type": 2,
		"mods": {"safe cancel": true, "multiple review": 3},
		"groups": [
			{
				"desc": "Кислород: минимум {o2_min}, максимум {o2_max}. Дышать-то надо! Не 20% как на Земле, а по космическим стандартам.",
				"frmt": {
					"o2_min": {"type": "rand_int", "min": 18, "max": 20},
					"o2_max": {"type": "rand_int", "min": 22, "max": 25}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Уровень кислорода",
						"step": 1,
						"min value": 10,
						"max value": 30,
						"min d value": "{o2_min}",
						"max d value": "{o2_max}"
					}
				]
			},
			{
				"desc": "Гравитацию поставь {gravity} процентов, а то я летать устал. [s]Хотя это и весело[/s], но работать мешает.",
				"frmt": {"gravity": {"type": "rand_int", "min": 70, "max": 90}},
				"blck": [
					{
						"type": "slider",
						"text": "Гравитация",
						"step": 5,
						"min value": 50,
						"max value": 120,
						"min d value": "{gravity}",
						"max d value": "{gravity}"
					}
				]
			},
			{
				"desc": "Охлаждение: {cool_text}. Ну, чтобы мы не [color=#ff8800]сгорели[/color] в космосе. Активная или пассивная? Решай сам, я доверяю.",
				"frmt": {"cool": {"type": "rand_option", "pool": ["активная", "пассивная", "гибридная"]}},
				"blck": [
					{
						"type": "option",
						"text": "Тип охлаждения",
						"items": ["активная", "пассивная", "гибридная"],
						"indx": "{cool_index}"
					}
				]
			},
			{
				"desc": "Связь с Землёй? {comm} А то мама волнуется. [b]Обязательно[/b] нужно, чтобы мы не потерялись.",
				"frmt": {"comm": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Поддержка радиосвязи",
						"stat": "{comm}"
					}
				]
			},
			{
				"desc": "Код доступа: {code}. Никому не говори! Даже [i]мне[/i]. Надеюсь, ты запомнишь, а я запишу в блокнотик.",
				"frmt": {"code": {"type": "rand_text", "pool": ["alpha", "beta", "gamma", "delta"]}},
				"blck": [
					{
						"type": "line",
						"text": "Код доступа",
						"ph text": "введите код",
						"correct": "{code}"
					}
				]
			},
			{
				"desc": "Количество резервных систем: {backup}. Чем больше, тем лучше, но и дороже. Сделай {backup_alt}? [s]Нет, {backup} хватит[/s].",
				"frmt": {
					"backup": {"type": "rand_int", "min": 2, "max": 5},
					"backup_alt": {"type": "rand_int", "min": 1, "max": 4}
				},
				"blck": [
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
			}
		]
	},
	# ---------- СООБЩЕНИЕ (MESSAGE type=3) ----------
	{
		"name": "Леночка (подруга)",
		"desc": "[center][b]Привет! Сделай мне приложение для заметок![/b][/center]\nА то я вечно всё забываю... [color=#ff66aa]Записки[/color] бы сохранять, а то у меня [s]голова дырявая[/s].\nКороче, сделай что-нибудь [i]простое[/i], но чтобы работало. [wave]Пожалуйста![/wave]",
		"good review": "Ой, спасибо! Теперь я ничего не забываю! Ты гений!",
		"bad review": "Ничего не работает... Я опять всё забыла...",
		"time": 60,
		"money": 800,
		"ready text": "ГОТОВО",
		"cancel text": "Не успеваю",
		"tags": 1,
		"type": 3,
		"mods": {"safe cancel": true},
		"groups": [
			{
				"desc": "Тёмная тема? {dark} А то глаза устают от белого. Я как сова, люблю темноту.",
				"frmt": {"dark": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Включить тёмную тему",
						"stat": "{dark}"
					}
				]
			},
			{
				"desc": "Шрифт сделай {font_size}, а то я ничего не вижу! [b]Пожалуйста[/b], а то я щурюсь как старушка.",
				"frmt": {"font_size": {"type": "rand_int", "min": 12, "max": 18}},
				"blck": [
					{
						"type": "slider",
						"text": "Размер шрифта",
						"step": 1,
						"min value": 10,
						"max value": 24,
						"min d value": "{font_size}",
						"max d value": "{font_size}"
					}
				]
			},
			{
				"desc": "Сортировка: {sort_text}. Чтобы я могла найти свои записки! А то я теряюсь, когда много всего.",
				"frmt": {"sort": {"type": "rand_option", "pool": ["по дате", "по алфавиту", "по важности"]}},
				"blck": [
					{
						"type": "option",
						"text": "Сортировка",
						"items": ["по дате", "по алфавиту", "по важности"],
						"indx": "{sort_index}"
					}
				]
			},
			{
				"desc": "Категория по умолчанию: {category}. Ну, чтобы я не путалась. А то у меня всё в кучу.",
				"frmt": {"category": {"type": "rand_text", "pool": ["личные", "рабочие", "учеба"]}},
				"blck": [
					{
						"type": "line",
						"text": "Категория",
						"ph text": "введите категорию",
						"correct": "{category}"
					}
				]
			},
			{
				"desc": "Автосохранение? {autosave} А то я вечно забываю сохранять! Сколько раз уже теряла важные записи.",
				"frmt": {"autosave": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Автосохранение",
						"stat": "{autosave}"
					}
				]
			},
			{
				"desc": "Количество заметок на странице: {notes_count}. [s]Много[/s] не надо, я не железная.",
				"frmt": {"notes_count": {"type": "rand_int", "min": 5, "max": 15}},
				"blck": [
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
			}
		]
	},
	# ---------- ЧРЕЗВЫЧАЙНЫЙ (EMERGENCY type=4) ----------
	{
		"name": "Профессор (квантовая физика)",
		"desc": "[center][b][color=#ff00ff]СРОЧНО! КВАНТОВЫЙ КОМПЬЮТЕР![/color][/b][/center]\nПрофессор требует! Нужно настроить [b]квантовый процессор[/b] для [i]эксперимента[/i]. [shake]Времени мало![/shake]\nЕсли всё сделаешь правильно, возможно, мы [color=#00ff00]изменим реальность[/color]. Или нет. [wave]Но попытаться стоит![/wave]",
		"good review": "[color=#00ff00]Невероятно![/color] Квантовый компьютер готов, реальность спасена!",
		"bad review": "[color=#ff4444]Катастрофа![/color] Всё пошло по квантовой... Вселенная в опасности!",
		"time": 150,
		"money": 5000,
		"ready text": "ГОТОВО",
		"cancel text": "Это за гранью",
		"tags": 3,
		"type": 4,
		"mods": {"disable cancel": true, "multiple review": 5},
		"groups": [
			{
				"desc": "Количество кубитов: от {q_min} до {q_max}. [b]Точно![/b] От этого зависит [i]всё[/i]! Каждый кубит на счету.",
				"frmt": {
					"q_min": {"type": "rand_int", "min": 50, "max": 60},
					"q_max": {"type": "rand_int", "min": 70, "max": 85}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Количество кубитов",
						"step": 5,
						"min value": 10,
						"max value": 100,
						"min d value": "{q_min}",
						"max d value": "{q_max}"
					}
				]
			},
			{
				"desc": "Алгоритм шифрования: {algo_text}. [s]Выбери что-нибудь[/s] [color=#ff8800]Нет, не это![/color] Надо чтобы никто не взломал.",
				"frmt": {"algo": {"type": "rand_option", "pool": ["rsa", "ecc", "quantum"]}},
				"blck": [
					{
						"type": "option",
						"text": "Шифрование",
						"items": ["RSA", "ECC", "Quantum"],
						"indx": "{algo_index}"
					}
				]
			},
			{
				"desc": "Время выполнения: {time_mcs} микросекунд. Быстрее, [shake]быстрее![/shake] Каждая микросекунда на вес золота.",
				"frmt": {"time_mcs": {"type": "rand_int", "min": 100, "max": 300}},
				"blck": [
					{
						"type": "slider",
						"text": "Время выполнения",
						"step": 10,
						"min value": 50,
						"max value": 500,
						"min d value": "{time_mcs}",
						"max d value": "{time_mcs}"
					}
				]
			},
			{
				"desc": "Точность? [b]{precision}[/b]! Должна быть [color=#ffcc00]идеальной[/color]! Без неё эксперимент провалится.",
				"frmt": {"precision": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Высокая точность",
						"stat": "{precision}"
					}
				]
			},
			{
				"desc": "Пароль админа: {admin_pass}. Очень [i]секретно[/i]! [s]Не потеряй[/s], а то потом не войдём.",
				"frmt": {"admin_pass": {"type": "rand_text", "pool": ["qwerty", "admin123", "quantum", "secure"]}},
				"blck": [
					{
						"type": "line",
						"text": "Пароль админа",
						"ph text": "введите пароль",
						"correct": "{admin_pass}"
					}
				]
			},
			{
				"desc": "Количество вентилей: {gates}. Да, [b]очень[/b] много. Чем больше, тем сложнее, но мы справимся.",
				"frmt": {"gates": {"type": "rand_int", "min": 1000, "max": 5000}},
				"blck": [
					{
						"type": "slider",
						"text": "Количество логических вентилей",
						"step": 100,
						"min value": 100,
						"max value": 10000,
						"min d value": "{gates}",
						"max d value": "{gates}"
					}
				]
			},
			{
				"desc": "Язык программирования: {lang_text}. [i]Ну, ты знаешь[/i], какой лучше. Я доверяю твоему выбору.",
				"frmt": {"lang": {"type": "rand_option", "pool": ["python", "c++", "rust", "q#"]}},
				"blck": [
					{
						"type": "option",
						"text": "Язык",
						"items": ["Python", "C++", "Rust", "Q#"],
						"indx": "{lang_index}"
					}
				]
			}
		]
	},
	# ---------- ДАРКНЕТ (DARKNET type=6) ----------
	{
		"name": "'Кролик' (тёмный делец)",
		"desc": "[center][b][color=#444444]Тёмная сторона силы...[/color][/b][/center]\nСлышь, есть одно [i]дело[/i]. [shake]Нужна площадка[/shake] для... ну, ты понял. [wave]Анонимность[/wave] — наше всё.\n[color=#ff8800]Не спались![/color]",
		"good review": "Площадка работает. Ты чист. Продолжай в том же духе.",
		"bad review": "Нас вычислили... [b]Ты всё испортил![/b]",
		"time": 100,
		"money": 4000,
		"ready text": "ГОТОВО",
		"cancel text": "Не хочу рисковать",
		"tags": 2,
		"type": 6,
		"mods": {"safe rep": true, "police count": 2},
		"groups": [
			{
				"desc": "Шифрование: {encrypt}. [b]Обязательно[/b]! А то нас прослушают, и тогда ... ну ты понял.",
				"frmt": {"encrypt": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Включить сквозное шифрование",
						"stat": "{encrypt}"
					}
				]
			},
			{
				"desc": "Уровень анонимности: {anon_level}. Чем выше, тем лучше! [s]Но дороже[/s], но оно того стоит.",
				"frmt": {"anon_level": {"type": "rand_int", "min": 3, "max": 7}},
				"blck": [
					{
						"type": "slider",
						"text": "Уровень анонимности",
						"step": 1,
						"min value": 1,
						"max value": 10,
						"min d value": "{anon_level}",
						"max d value": "{anon_level}"
					}
				]
			},
			{
				"desc": "Валюта: {currency_text}. [i]Биткоины[/i] — это надёжно. Или моно? Решай, я в этом не шарю.",
				"frmt": {"currency": {"type": "rand_option", "pool": ["btc", "xmr", "eth"]}},
				"blck": [
					{
						"type": "option",
						"text": "Криптовалюта",
						"items": ["BTC", "XMR", "ETH"],
						"indx": "{currency_index}"
					}
				]
			},
			{
				"desc": "Кодовое слово: {keyword}. [b]Запомни![/b] [s]Или запиши[/s], но потом сожги.",
				"frmt": {"keyword": {"type": "rand_text", "pool": ["тень", "секрет", "нуар"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{keyword}"
					}
				]
			},
			{
				"desc": "Количество зеркал: {mirrors}. Надёжность — [b]всё[/b]! Чем больше, тем сложнее нас найти.",
				"frmt": {"mirrors": {"type": "rand_int", "min": 2, "max": 5}},
				"blck": [
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
			}
		]
	},
	# ---------- КАСТОМНЫЙ (CUSTOM type=7) ----------
	{
		"name": "Бариста (кофейня)",
		"desc": "[center][b]Сделайте сайт с меню и бронированием столиков.[/b][/center]\nДизайн уютный, коричневые тона. Карта лояльности не нужна, только промокоды.",
		"good review": "Сайт красивый, заказы принимаем, бронирование работает.",
		"bad review": "Где карта лояльности? Я хотел накапливать бонусы!",
		"time": 55,
		"money": 21000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 7,
		"groups": [
			{
				"desc": "Карта лояльности? [b]Нет[/b], мы не хотим. Только лишняя головная боль.",
				"frmt": {},
				"blck": [
					{
						"type": "check",
						"text": "Карта лояльности",
						"stat": false
					}
				]
			},
			{
				"desc": "Промокоды? [b]Да![/b] Пусть будут, люди любят скидки.",
				"frmt": {},
				"blck": [
					{
						"type": "check",
						"text": "Промокоды",
						"stat": true
					}
				]
			},
			{
				"desc": "Онлайн-бронирование столиков? [b]Да![/b] Чтобы не было очередей.",
				"frmt": {},
				"blck": [
					{
						"type": "check",
						"text": "Бронирование столиков",
						"stat": true
					}
				]
			},
			{
				"desc": "Цветовая гамма: Коричневые тона. Уютно, по-домашнему.",
				"frmt": {},
				"blck": [
					{
						"type": "option",
						"text": "Цветовая гамма",
						"items": ["Коричневые тона", "Чёрно-белая", "Зелёная"],
						"indx": 0
					}
				]
			},
			{
				"desc": "Кодовое слово: coffee. Просто и понятно.",
				"frmt": {},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "coffee"
					}
				]
			},
			{
				"desc": "Количество столиков: {tables}. Сколько мест для гостей? Думаю, {tables_alt} хватит, но сделай {tables}.",
				"frmt": {
					"tables": {"type": "rand_int", "min": 8, "max": 15},
					"tables_alt": {"type": "rand_int", "min": 5, "max": 10}
				},
				"blck": [
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
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Egor2001 (DEFAULT) ----------
	{
		"name": "Styopa2011 (сайт для взрослых)",
		"desc": "[center][b]Здравствуйте, сделайте сайт для продажи [color=#e39cff]дилдаков[/color].[/b][/center]\nБюджет 20-30тыс. Должно работать на телефонах.\nСоздайте 3, [wave]нет[/wave], 4 вкладки категорий товаров.\n[color=#ff8800]Хотя тогда бюджет надо увеличить до 25-35тыс.[/color]\nИ ещё, я передумал, сделайте [b]2[/b] только вкладки категорий товаров.\n[shake]И ещё пусть сайт будет [color=#9cc0ff]синего[/color] цвета.[/shake]\n[color=#ff0000][shake]Нужно срочно за час сделать![/shake][/color]",
		"good review": "САМЫЙ ЛУЧШИЙ СОЗДАТЕЛЬ САЙТОВ В МИИИИИРЕЕЕЕЕЕЕ!!!",
		"bad review": "ИЗ-ЗА ЭТОГО Х##СОСА МОЙ БИЗНЕС СГОРЕЛ К Е#ЕНЯМ!!!",
		"time": 50,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Бюджет поставь {budget} тысяч. [s]Нет, лучше {budget_alt}[/s], хотя {budget} нормально.",
				"frmt": {
					"budget": {"type": "rand_int", "min": 25, "max": 35},
					"budget_alt": {"type": "rand_int", "min": 20, "max": 30}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Бюджет (тыс. руб)",
						"step": 2,
						"min value": 5,
						"max value": 60,
						"min d value": "{budget}",
						"max d value": "{budget}"
					}
				]
			},
			{
				"desc": "Количество вкладок категорий: {tabs}. [wave]Я же сказал 2![/wave] Ну, или {tabs_alt}, но я передумал.",
				"frmt": {
					"tabs": {"type": "rand_int", "min": 1, "max": 3},
					"tabs_alt": {"type": "rand_int", "min": 3, "max": 4}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Кол-во вкладок",
						"step": 1,
						"min value": 0,
						"max value": 6,
						"min d value": "{tabs}",
						"max d value": "{tabs}"
					}
				]
			},
			{
				"desc": "Цвет дизайна: {color_text}. [b]Синий![/b] Только синий, я настаиваю.",
				"frmt": {"color": {"type": "rand_option", "pool": ["красный", "синий", "зелёный", "фиолетовый"]}},
				"blck": [
					{
						"type": "option",
						"text": "Цвет дизайна",
						"items": ["красный", "синий", "зелёный", "фиолетовый"],
						"indx": "{color_index}"
					}
				]
			},
			{
				"desc": "Мобильная поддержка? {mobile} [shake]Обязательно![/shake] Кто сейчас с компьютера сидит?",
				"frmt": {"mobile": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Мобильная поддержка",
						"stat": "{mobile}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для входа в админку, чтобы никто не напакостил.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["stepan567", "chizhevich909", "1+1film", "dildo1019"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: ООО Ромашка (DEFAULT) ----------
	{
		"name": "ООО Ромашка (CRM)",
		"desc": "[center][b]Срочно! Нужна CRM для управления клиентами.[/b][/center]\nТребования: хранение контактов (имя, телефон, email), [i]история звонков[/i], возможность ставить задачи.\n[color=#0088cc]База данных – SQLite.[/color]\nИнтерфейс – веб-морда.\n[wave]Сделать за 2 дня. Бюджет 50 000 руб.[/wave]",
		"good review": "Профессионально, быстро, всё работает. Рекомендую!",
		"bad review": "Не доделали, баги, интерфейс неудобный. Деньги на ветер.",
		"time": 65,
		"money": 50000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Количество полей в контакте: {fields}. [s]Пять хватит[/s], или {fields_alt}? Сделай {fields}.",
				"frmt": {
					"fields": {"type": "rand_int", "min": 4, "max": 6},
					"fields_alt": {"type": "rand_int", "min": 3, "max": 5}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Количество полей",
						"step": 1,
						"min value": 3,
						"max value": 10,
						"min d value": "{fields}",
						"max d value": "{fields}"
					}
				]
			},
			{
				"desc": "Тип базы данных: {db_text}. [b]SQLite![/b] Он лёгкий и быстрый, не надо заморачиваться.",
				"frmt": {"db": {"type": "rand_option", "pool": ["sqlite", "postgresql", "mongodb"]}},
				"blck": [
					{
						"type": "option",
						"text": "Тип БД",
						"items": ["SQLite", "PostgreSQL", "MongoDB"],
						"indx": "{db_index}"
					}
				]
			},
			{
				"desc": "История звонков? [b]{history}[/b]! Чтобы знать, кто звонил и когда.",
				"frmt": {"history": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Включить историю звонков",
						"stat": "{history}"
					}
				]
			},
			{
				"desc": "Кодовое слово администратора: {admin_word}. Для входа в систему, чтобы никто чужой не залез.",
				"frmt": {"admin_word": {"type": "rand_text", "pool": ["admin", "root", "secret", "crm"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{admin_word}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: KotikGames (DEFAULT) ----------
	{
		"name": "KotikGames",
		"desc": "[center][b]Привет! Хотим игру про котиков.[/b][/center]\nНо не простую, а [i]хоррор-выживалку[/i].\nКотики должны быть милыми, но злыми, они охотятся на игрока.\n[color=#ffaa00]Графика – пиксельная, но с элементами 3D.[/color]\nА, и ещё добавьте режим строительства базы.\n[wave]И котики должны уметь говорить по-английски с акцентом.[/wave]\n[shake]Стоп, убираем строительство, добавляем прокачку котиков.[/shake]\nНет, давайте просто сделаем котиков-танкистов.\n[color=#ff44aa]Короче, сделайте игру, где котики стреляют лазерами из глаз, а игрок должен их гладить, чтобы они не взорвались.[/color]\n[center][b]В общем, сделайте что-то с котиками, чтобы было весело.[/b][/center]",
		"good review": "Ха-ха, прикольно, котики стреляют! Друзья в восторге!",
		"bad review": "Это не то, что мы просили! Где строительство? Где хоррор? Полный бред!",
		"time": 80,
		"money": 15000,
		"ready text": "ГОТОВО",
		"cancel text": "Это безумие",
		"tags": 2,
		"type": 0,
		"mods": {"safe cancel": true},
		"groups": [
			{
				"desc": "Количество котиков: {cats}. [b]Десять![/b] Или {cats_alt}? Давай {cats}, нормально.",
				"frmt": {
					"cats": {"type": "rand_int", "min": 8, "max": 12},
					"cats_alt": {"type": "rand_int", "min": 5, "max": 10}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Количество котиков",
						"step": 1,
						"min value": 1,
						"max value": 20,
						"min d value": "{cats}",
						"max d value": "{cats}"
					}
				]
			},
			{
				"desc": "Оружие котиков: {weapon_text}. [i]Лазеры![/i] Это же очевидно, кто не хочет лазеры?",
				"frmt": {"weapon": {"type": "rand_option", "pool": ["лазеры", "когти", "мяу-волны", "бомбы"]}},
				"blck": [
					{
						"type": "option",
						"text": "Оружие котиков",
						"items": ["Лазеры", "Когти", "Мяу-волны", "Бомбы"],
						"indx": "{weapon_index}"
					}
				]
			},
			{
				"desc": "Многопользовательский режим? {multi}, сделаем именно так.",
				"frmt": {"multi": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Многопользовательский режим",
						"stat": "{multi}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Чтобы читы включать, ну ты понял.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["meow", "purr", "cat"]}},
				"blck": [
					{
						"type": "line",
						"text": "Секретное слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: FreshFoods (DEFAULT) ----------
	{
		"name": "FreshFoods",
		"desc": "[center][b]Здравствуйте! Сделайте сайт для доставки здоровой еды.[/b][/center]\nДизайн в [color=#00aa00]зелёных тонах[/color].\nКаталог: салаты, супы, смузи.\n[color=#ff8800]Фильтр по калориям.[/color]\nВозможность оформить подписку на неделю.\n[wave]Так, стоп, мы решили расширить ассортимент – добавьте бургеры и пиццу.[/wave]\nНо они не здоровые, ну ладно.\n[shake]И уберите подписку, оставьте разовые заказы.[/shake]\nА ещё добавьте корзину и оплату картой.\n[color=#8888ff]И ещё мы хотим, чтобы была карта с ресторанами, где можно забрать заказ.[/color]\n[wave]Нет, это слишком сложно, просто доставка.[/wave]",
		"good review": "Отличный сайт! Всё понятно, заказы принимаем, клиенты довольны.",
		"bad review": "Каша в голове! Где подписка? Где карта? Не доделали!",
		"time": 75,
		"money": 22000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"mods": {"safe cancel": true},
		"groups": [
			{
				"desc": "Количество категорий в каталоге: {cat_count}. [s]Пять[/s], или {cat_count_alt}? Сделай {cat_count}, хватит.",
				"frmt": {
					"cat_count": {"type": "rand_int", "min": 4, "max": 6},
					"cat_count_alt": {"type": "rand_int", "min": 3, "max": 5}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Количество категорий",
						"step": 1,
						"min value": 1,
						"max value": 10,
						"min d value": "{cat_count}",
						"max d value": "{cat_count}"
					}
				]
			},
			{
				"desc": "Основной цвет дизайна: {color_text}. [b]Зелёный![/b] Здоровый цвет для здоровой еды.",
				"frmt": {"color": {"type": "rand_option", "pool": ["зелёный", "синий", "красный", "жёлтый"]}},
				"blck": [
					{
						"type": "option",
						"text": "Цвет",
						"items": ["Зелёный", "Синий", "Красный", "Жёлтый"],
						"indx": "{color_index}"
					}
				]
			},
			{
				"desc": "Наличие подписки? {subscription}, но мы возможно передумаем.",
				"frmt": {"subscription": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Подписка на неделю",
						"stat": "{subscription}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для доступа к скидкам, чтобы никто не халявил.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["healthy", "green", "food"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: FreelancerHack (DEFAULT) ----------
	{
		"name": "FreelancerHack",
		"desc": "[center][b]Привет! Нужно сверстать лендинг для моего нового курса по заработку на фрилансе.[/b][/center]\nУ меня есть текст и картинки.\n[color=#ffaa00]Сделай красиво, современно, адаптивно.[/color]\n[wave]Срок – 2 часа, бюджет 3000 руб. Обычно на лендинге делают 5 секций — этого достаточно.[/wave]",
		"good review": "Супер, лендинг готов, всё как просил! Быстро и качественно.",
		"bad review": "Обычный шаблон, ничего особенного, не стоит таких денег.",
		"time": 40,
		"money": 3000,
		"ready text": "ГОТОВО",
		"cancel text": "Не успеваю",
		"tags": 1,
		"type": 0,
		"groups": [
			{
				"desc": "Количество секций: {sections}. [b]Пять![/b] Или {sections_alt}? Нет, {sections} точно.",
				"frmt": {
					"sections": {"type": "rand_int", "min": 4, "max": 6},
					"sections_alt": {"type": "rand_int", "min": 3, "max": 5}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Количество секций",
						"step": 1,
						"min value": 3,
						"max value": 8,
						"min d value": "{sections}",
						"max d value": "{sections}"
					}
				]
			},
			{
				"desc": "Адаптив под мобилки? {mobile}, кто сейчас с компьютера смотрит?",
				"frmt": {"mobile": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Адаптив",
						"stat": "{mobile}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для доступа к админке, чтобы никто не навредил.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["landing", "course", "money"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Стоматология (DEFAULT) ----------
	{
		"name": "Стоматология 'Белая улыбка'",
		"desc": "[center]Нужен сайт с записью на приём.[/center]\nОбязательно: [b]форма записи[/b], [i]галерея работ[/i], [color=#0088ff]контакты[/color].\nДизайн в бело-голубых тонах.\n[wave]Уберите форму записи, лучше сделайте онлайн-консультацию.[/wave]\n[color=#ff8800]Итог: онлайн-консультация, галерея, контакты, бело-голубой.[/color]",
		"good review": "Отлично! Онлайн-консультация работает, галерея шикарная. Спасибо!",
		"bad review": "Я просил форму записи, а не консультацию. Всё испортили!",
		"time": 45,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"groups": [
			{
				"desc": "Форма записи? {form}, сделай онлайн-консультацию.",
				"frmt": {"form": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Форма записи",
						"stat": "{form}"
					}
				]
			},
			{
				"desc": "Онлайн-консультация? {online}, это удобно и современно.",
				"frmt": {"online": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Онлайн-консультация",
						"stat": "{online}"
					}
				]
			},
			{
				"desc": "Цветовая гамма: {color_text}. [i]Бело-голубая![/i] Как небо и облака.",
				"frmt": {"color": {"type": "rand_option", "pool": ["бело-голубая", "тёмная", "ярко-жёлтая"]}},
				"blck": [
					{
						"type": "option",
						"text": "Цветовая гамма",
						"items": ["Бело-голубая", "Тёмная", "Ярко-жёлтая"],
						"indx": "{color_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для входа в админку, чтобы не потерять записи.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["tooth", "smile", "dentist"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Фитнес-клуб (DEFAULT) ----------
	{
		"name": "Фитнес-клуб 'Качок'",
		"desc": "[center][b]Сделайте приложение для тренировок.[/b][/center]\nДолжны быть [color=#00ff00]упражнения с видео[/color], [i]дневник питания[/i], [b]замеры[/b].\n[wave]Добавьте интеграцию с Apple Watch.[/wave]\n[shake]Но мы передумали, уберите видео, оставьте только дневник и замеры.[/shake]\n[color=#ff8800]Интеграцию оставьте.[/color]",
		"good review": "Классное приложение! Дневник и замеры супер, Apple Watch синхронизируется.",
		"bad review": "Где видео? Я хотел смотреть упражнения. Всё удалил.",
		"time": 50,
		"money": 20000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 0,
		"mods": {"safe cancel": true},
		"groups": [
			{
				"desc": "Видео упражнений? {video}! Почему я должен отвечать по иному?",
				"frmt": {"video": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Видео упражнений",
						"stat": "{video}"
					}
				]
			},
			{
				"desc": "Дневник питания? [b]Да![/b] Без него никуда.",
				"frmt": {"food": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Дневник питания",
						"stat": true
					}
				]
			},
			{
				"desc": "Замеры тела? {measure}!",
				"frmt": {"measure": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Замеры тела",
						"stat": "{measure}"
					}
				]
			},
			{
				"desc": "Интеграция с носимыми устройствами: {wear_text}. Оставь, это полезно.",
				"frmt": {"wear": {"type": "rand_option", "pool": ["apple watch", "fitbit", "garmin", "нет"]}},
				"blck": [
					{
						"type": "option",
						"text": "Интеграция",
						"items": ["Apple Watch", "Fitbit", "Garmin", "Нет"],
						"indx": "{wear_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для доступа к продвинутым функциям.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["muscle", "fitness", "strong"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Онлайн-школа (DEFAULT) ----------
	{
		"name": "Онлайн-школа 'Знайка'",
		"desc": "[center][b]Нужна платформа для курсов.[/b][/center]\nТребования: [color=#ffaa00]регистрация[/color], [i]личный кабинет[/i], [b]система тестов[/b], [color=#00aaff]форум[/color].\n[wave]А, ещё добавьте чат.[/wave]\n[shake]И уберите форум, он не нужен.[/shake]\n[color=#ff8800]Сделайте интеграцию с платежной системой.[/color]",
		"good review": "Платформа отличная! Чат работает, тесты автоматические. Оплата проходит.",
		"bad review": "Форум исчез, как я буду общаться? Всё непонятно.",
		"time": 55,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не буду браться",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Форум? {forum} [s]Да[/s] Нет, убираем, он не нужен.",
				"frmt": {"forum": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Форум",
						"stat": "{forum}"
					}
				]
			},
			{
				"desc": "Чат? {chat}! Общение - это важно, но не всегда.",
				"frmt": {"chat": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Чат",
						"stat": "{chat}"
					}
				]
			},
			{
				"desc": "Интеграция с платежной системой? {payment}!",
				"frmt": {"payment": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Интеграция с платежной системой",
						"stat": "{payment}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для доступа к настройкам платформы.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["learn", "school", "study"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Интернет-магазин 'Технорай' (DEFAULT) ----------
	{
		"name": "Интернет-магазин 'Технорай'",
		"desc": "[center][b]Сделайте магазин электроники.[/b][/center]\nНужен фильтр по цене (от 5000 до 50000), по бренду (Samsung, Apple, Xiaomi), сортировка по популярности.\n[color=#00cc00]Добавьте корзину и оплату.[/color]\nДизайн тёмный.\n[shake]Уберите фильтр по бренду, оставьте только цену и сортировку.[/shake]",
		"good review": "Магазин работает, фильтр по цене удобный, сортировка есть. Всё отлично.",
		"bad review": "Где фильтр по бренду? Я хотел выбирать только Apple!",
		"time": 60,
		"money": 28000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Нижняя граница цены от {min_price} руб. Начинаем с {min_price_alt}? Нет, {min_price}.",
				"frmt": {
					"min_price": {"type": "rand_int", "min": 4000, "max": 6000},
					"min_price_alt": {"type": "rand_int", "min": 3000, "max": 5000}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Нижняя граница",
						"step": 1000,
						"min value": 1000,
						"max value": 100000,
						"min d value": "{min_price}",
						"max d value": 100000
					}
				]
			},
			{
				"desc": "Верхняя граница цены до {max_price} руб. Не больше {max_price_alt}? Нет, {max_price}.",
				"frmt": {
					"max_price": {"type": "rand_int", "min": 45000, "max": 55000},
					"max_price_alt": {"type": "rand_int", "min": 40000, "max": 50000}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Верхняя граница",
						"step": 1000,
						"min value": 1000,
						"max value": 100000,
						"min d value": 1000,
						"max d value": "{max_price}"
					}
				]
			},
			{
				"desc": "Фильтр по бренду? {brand}.",
				"frmt": {"brand": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Фильтр по бренду",
						"stat": "{brand}"
					}
				]
			},
			{
				"desc": "Сортировка по умолчанию: {sort_text}. Понятно и просто.",
				"frmt": {"sort": {"type": "rand_option", "pool": ["популярности", "цене (возр)", "цене (убыв)", "новизне"]}},
				"blck": [
					{
						"type": "option",
						"text": "Сортировка",
						"items": ["Популярности", "Цене (возр)", "Цене (убыв)", "Новизне"],
						"indx": "{sort_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для доступа к админке магазина.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["tech", "shop", "price"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Зомби vs Роботы (DEFAULT) ----------
	{
		"name": "Зомби vs Роботы (Артём)",
		"desc": "[center][b]Сделайте игру про зомби.[/b][/center]\n[wave]Но я передумал, хочу про роботов.[/wave]\nЧтобы роботы сражались с инопланетянами.\n[color=#ff8800]Добавьте режим кампании и мультиплеер.[/color]\n[shake]Уберите зомби полностью.[/shake]",
		"good review": "Игра про роботов крутая! Кампания интересная, мультиплеер работает.",
		"bad review": "Я просил зомби, а получил роботов. Обманули!",
		"time": 65,
		"money": 18000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Тема игры: {theme_text}. [b]Роботы![/b] Только роботы.",
				"frmt": {"theme": {"type": "rand_option", "pool": ["зомби", "роботы", "инопланетяне", "смесь"]}},
				"blck": [
					{
						"type": "option",
						"text": "Тема",
						"items": ["Зомби", "Роботы", "Инопланетяне", "Смесь"],
						"indx": "{theme_index}"
					}
				]
			},
			{
				"desc": "Режим кампании? ДА! А хотя нет, думаю, а хотя всё же {campaign}.",
				"frmt": {"campaign": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Режим кампании",
						"stat": "{campaign}"
					}
				]
			},
			{
				"desc": "Добавлять мультиплеер или нет? {multi}!",
				"frmt": {"multi": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Мультиплеер",
						"stat": "{multi}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для активации секретных уровней.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["robot", "zombie", "fight"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: LinguaApp (DEFAULT) ----------
	{
		"name": "LinguaApp",
		"desc": "[center][b]Сделайте приложение для изучения английского.[/b][/center]\nНужны [color=#ffaa00]карточки слов[/color], [i]грамматические упражнения[/i], [b]аудирование[/b].\n[wave]Добавьте возможность соревноваться с друзьями.[/wave]\n[shake]Уберите аудирование, добавьте тесты на перевод.[/shake]\n[color=#00ccff]И добавьте прогресс-бар.[/color]",
		"good review": "Приложение супер! Учу слова, делаю упражнения, прогресс мотивирует.",
		"bad review": "Где аудирование? Я хотел слушать произношение! Неудобно.",
		"time": 55,
		"money": 25000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Аудирование? {audio}.",
				"frmt": {"audio": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Аудирование",
						"stat": "{audio}"
					}
				]
			},
			{
				"desc": "Тесты на перевод? {trans}.",
				"frmt": {"trans": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Тесты на перевод",
						"stat": "{trans}"
					}
				]
			},
			{
				"desc": "Нужен ли нам прогресс-бар? {progress}!",
				"frmt": {"progress": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Прогресс-бар",
						"stat": "{progress}"
					}
				]
			},
			{
				"desc": "Уровень сложности: {level_text}. Нормальный, для всех.",
				"frmt": {"level": {"type": "rand_option", "pool": ["начальный", "средний", "продвинутый"]}},
				"blck": [
					{
						"type": "option",
						"text": "Сложность",
						"items": ["Начальный", "Средний", "Продвинутый"],
						"indx": "{level_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret}. Для доступа к эксклюзивным урокам.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["learn", "english", "speak"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Кофейня 'Зёрнышко' (DEFAULT) ----------
	{
		"name": "Кофейня 'Зёрнышко'",
		"desc": "[center][b]Сделайте сайт с меню кофе, десертов, сэндвичей.[/b][/center]\nВозможность заказать на вынос.\n[color=#884400]Добавьте карту лояльности и программу бонусов.[/color]\n[wave]Дизайн уютный, в коричневых тонах.[/wave]\n[shake]Уберите карту лояльности, вместо неё сделайте промокоды.[/shake]\n[color=#ff8800]И добавьте онлайн-бронирование столиков.[/color]",
		"good review": "Сайт красивый, заказы принимаем, бронирование работает. Клиенты счастливы.",
		"bad review": "Где карта лояльности? Я хотел накапливать бонусы! Провал.",
		"time": 55,
		"money": 21000,
		"ready text": "ГОТОВО",
		"cancel text": "Отказ",
		"tags": 1,
		"type": 0,
		"groups": [
			{
				"desc": "Карта лояльности? {loyalty} — если добавить, то постоянные клиенты будут копить баллы и чаще заглядывать к нам. Но это потребует дополнительной разработки и поддержки. Если не делать, то сайт станет проще, но мы потеряем инструмент удержания. Решай, внедрять или нет.",
				"frmt": {"loyalty": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Карта лояльности",
						"stat": "{loyalty}"
					}
				]
			},
			{
				"desc": "Промокоды? {promo} — скидочные коды могут привлечь новых клиентов и стимулировать повторные заказы. Но тогда придётся настроить систему генерации и проверки кодов. Если не делать, то не будет лишней головной боли. Как считаешь?",
				"frmt": {"promo": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Промокоды",
						"stat": "{promo}"
					}
				]
			},
			{
				"desc": "Онлайн-бронирование столиков? {booking} — гости смогут заранее занять место, не звоня по телефону. Это повысит удобство, но потребует интеграции с календарём и уведомлениями. Если отказаться, то бронирование останется по старинке, через звонок. Что выберешь?",
				"frmt": {"booking": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Бронирование столиков",
						"stat": "{booking}"
					}
				]
			},
			{
				"desc": "Цветовая гамма: {color_text} — от этого зависит общее впечатление от сайта. Коричневые тона создают уют и ассоциируются с кофе. Чёрно-белый стиль строг и минималистичен. Зелёный освежает и подходит для эко-тематики. Выбери то, что лучше отражает атмосферу нашей кофейни.",
				"frmt": {"color": {"type": "rand_option", "pool": ["коричневые тона", "чёрно-белая", "зелёная"]}},
				"blck": [
					{
						"type": "option",
						"text": "Цветовая гамма",
						"items": ["Коричневые тона", "Чёрно-белая", "Зелёная"],
						"indx": "{color_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — оно потребуется для входа в админку и управления акциями. Придумай надёжное слово, чтобы никто посторонний не мог навредить. И не забудь записать, чтобы не потерять.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["coffee", "bean", "latte"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Строительная компания (RARE) ----------
	{
		"name": "Строительная компания 'Крепкий дом'",
		"desc": "[center][b]Сайт строительной компании.[/b][/center]\n[color=#884400]Портфолио построенных объектов.[/color]\n[wave]Калькулятор стоимости строительства.[/wave]\n[shake]Форма заявки на консультацию.[/shake]\n[color=#00aa00]Отзывы клиентов и сертификаты.[/color]",
		"good review": "Сайт отличный! Калькулятор точный, заявки приходят, портфолио впечатляет!",
		"bad review": "Калькулятор врёт, форма не работает, портфолио не грузится!",
		"time": 55,
		"money": 45000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 2,
		"groups": [
			{
				"desc": "Калькулятор стоимости? {calc} — он позволит клиентам прикинуть бюджет прямо на сайте, что повысит конверсию. Но его разработка и поддержка требуют времени. Если не делать, то клиентам придётся звонить или писать, что может отпугнуть некоторых. Как поступим?",
				"frmt": {"calc": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Калькулятор стоимости",
						"stat": "{calc}"
					}
				]
			},
			{
				"desc": "Форма заявки? {form} — упростит сбор заявок, ведь клиенты смогут оставить свои контакты без лишних действий. Если не делать, то придётся использовать почту или телефон, что менее удобно. Внедряем?",
				"frmt": {"form": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Форма заявки",
						"stat": "{form}"
					}
				]
			},
			{
				"desc": "Отзывы клиентов? {reviews} — реальные отзывы повышают доверие и показывают, что мы надёжная компания. Но их нужно модерировать и обновлять. Если отказаться, то сайт будет выглядеть менее живым. Что думаешь?",
				"frmt": {"reviews": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Отзывы клиентов",
						"stat": "{reviews}"
					}
				]
			},
			{
				"desc": "Количество проектов в портфолио: {projects} — чем больше, тем лучше, чтобы клиенты видели наш опыт. Но слишком много может перегрузить страницу. Выбери оптимальное число, которое покажет наши лучшие работы.",
				"frmt": {"projects": {"type": "rand_int", "min": 10, "max": 20}},
				"blck": [
					{
						"type": "slider",
						"text": "Количество проектов",
						"step": 1,
						"min value": 5,
						"max value": 30,
						"min d value": "{projects}",
						"max d value": "{projects}"
					}
				]
			},
			{
				"desc": "Сертификаты: {cert} — они подтверждают наш профессионализм и могут стать решающим фактором для клиента. Если их нет, то стоит ли показывать пустой раздел? Может, лучше убрать, если сертификаты отсутствуют?",
				"frmt": {"cert": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Показать сертификаты",
						"stat": "{cert}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — оно нужно для доступа к панели управления сайтом, чтобы вы могли добавлять проекты и редактировать контент. Выбери что-то запоминающееся, но не слишком простое.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["build", "strong", "house"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Медицинский центр (EMERGENCY) ----------
	{
		"name": "Медицинский центр 'Здоровье'",
		"desc": "[center][b]Приложение для записи к врачу.[/b][/center]\n[color=#00aa00]Запись к специалистам с выбором даты и времени.[/color]\n[wave]Электронная карта пациента с историей болезней.[/wave]\n[shake]Напоминания о приёмах и рекомендации врача.[/shake]\n[color=#ff8800]Онлайн-консультация с врачом.[/color]",
		"good review": "Отлично! Запись удобная, карта ведётся, напоминания приходят!",
		"bad review": "Запись не работает, карта не сохраняется, консультация не проходит!",
		"time": 55,
		"money": 60000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 3,
		"type": 4,
		"mods": {"multiple review": 5, "disable cancel": true},
		"groups": [
			{
				"desc": "Электронная карта пациента? {card} — она позволяет хранить всю историю болезней, результаты анализов и назначения в одном месте. Это удобно и для врачей, и для пациентов. Однако её внедрение требует дополнительной работы с безопасностью данных. Если не делать, то всё останется в бумажном виде. Как лучше?",
				"frmt": {"card": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Электронная карта пациента",
						"stat": "{card}"
					}
				]
			},
			{
				"desc": "Онлайн-консультация? {online} — пациенты смогут получить помощь дистанционно, не выходя из дома. Это сильно расширяет возможности, но потребует настройки видеосвязи и графика врачей. Если не делать, то только личные приёмы. Что выберем?",
				"frmt": {"online": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Онлайн-консультация",
						"stat": "{online}"
					}
				]
			},
			{
				"desc": "Напоминания о приёмах? {reminders} — они помогут пациентам не пропускать визиты и вовремя принимать лекарства. Это повышает качество обслуживания, но требует интеграции с почтой или SMS-сервисами. Если отказаться, то пациенты будут надеяться только на свою память. Как думаешь?",
				"frmt": {"reminders": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Напоминания о приёмах",
						"stat": "{reminders}"
					}
				]
			},
			{
				"desc": "Количество врачей в базе: {doctors} — чем больше специалистов, тем больше услуг можно предложить. Но не стоит раздувать штат, если нет спроса. Выбери количество, которое реально отражает наши возможности.",
				"frmt": {"doctors": {"type": "rand_int", "min": 5, "max": 15}},
				"blck": [
					{
						"type": "slider",
						"text": "Количество врачей",
						"step": 1,
						"min value": 3,
						"max value": 20,
						"min d value": "{doctors}",
						"max d value": "{doctors}"
					}
				]
			},
			{
				"desc": "Язык интерфейса: {lang_text} — чтобы приложением могли пользоваться пациенты, говорящие на разных языках. Если мы работаем только с русскоязычными, можно ограничиться одним. А если есть иностранные клиенты, стоит добавить хотя бы английский.",
				"frmt": {"lang": {"type": "rand_option", "pool": ["русский", "английский", "казахский"]}},
				"blck": [
					{
						"type": "option",
						"text": "Язык",
						"items": ["Русский", "Английский", "Казахский"],
						"indx": "{lang_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — оно потребуется для доступа к врачебным данным и админке. Выбери надёжное слово, чтобы защитить информацию о пациентах.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["health", "doctor", "clinic"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Автосервис (RARE) ----------
	{
		"name": "Автосервис 'Мастер'",
		"desc": "[center][b]Приложение для записи в автосервис.[/b][/center]\n[color=#ff8800]Выбор услуги: диагностика, ремонт, замена масла.[/color]\n[wave]Калькулятор стоимости ремонта.[/wave]\n[shake]Статус ремонта с уведомлениями.[/shake]\n[color=#00aa00]Отзывы клиентов и рейтинг механиков.[/color]",
		"good review": "Отлично! Запись быстрая, ремонт качественный, цена понятная!",
		"bad review": "Запись не работает, калькулятор врёт, статус не обновляется!",
		"time": 45,
		"money": 30000,
		"ready text": "ГОТОВО",
		"cancel text": "Не возьмусь",
		"tags": 2,
		"type": 2,
		"groups": [
			{
				"desc": "Калькулятор стоимости? {calc} — клиенты смогут заранее оценить стоимость ремонта, что повысит доверие и прозрачность. Но нужно будет аккуратно настраивать формулы под разные работы. Если не делать, то цена будет называться только после осмотра. Внедряем?",
				"frmt": {"calc": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Калькулятор стоимости",
						"stat": "{calc}"
					}
				]
			},
			{
				"desc": "Рейтинг механиков? {rating} — он поможет клиентам выбирать лучших специалистов, а механиков мотивирует работать качественнее. Но его нужно поддерживать в актуальном состоянии, иначе он может ввести в заблуждение. Как считаешь?",
				"frmt": {"rating": {"type": "rand_bool"}},
				"blck": [
					{
					"type": "check",
					"text": "Рейтинг механиков",
					"stat": "{rating}"
				}
			]
		},
		{
			"desc": "Уведомления о статусе ремонта? {notify} — клиенты будут в курсе, на каком этапе их машина, и не будут лишний раз беспокоить звонками. Это повысит лояльность, но потребует настройки почты или SMS. Если не делать, то клиенты будут звонить сами. Что выберем?",
			"frmt": {"notify": {"type": "rand_bool"}},
			"blck": [
				{
					"type": "check",
					"text": "Уведомления о статусе",
					"stat": "{notify}"
				}
			]
		},
		{
			"desc": "Количество механиков: {mechanics} — чтобы все заказы выполнялись вовремя, нужно достаточное число специалистов. Но слишком много тоже не стоит, чтобы не было простоя. Выбери оптимальное количество для нашего автосервиса.",
			"frmt": {"mechanics": {"type": "rand_int", "min": 3, "max": 8}},
			"blck": [
				{
					"type": "slider",
					"text": "Количество механиков",
					"step": 1,
					"min value": 2,
					"max value": 10,
					"min d value": "{mechanics}",
					"max d value": "{mechanics}"
				}
			]
		},
		{
			"desc": "Тип услуги по умолчанию: {service_text} — какую услугу предлагать в первую очередь? Диагностика помогает выявить проблемы, ремонт — основная работа, замена масла — популярная процедура. Пусть клиенты видят самую востребованную услугу.",
			"frmt": {"service": {"type": "rand_option", "pool": ["диагностика", "ремонт", "замена масла"]}},
			"blck": [
				{
					"type": "option",
					"text": "Услуга по умолчанию",
					"items": ["Диагностика", "Ремонт", "Замена масла"],
					"indx": "{service_index}"
				}
			]
		},
		{
			"desc": "Секретное слово: {secret} — оно нужно для входа в админку, где можно управлять заказами и видеть статистику. Выбери слово, которое легко запомнить, но сложно подобрать постороннему.",
			"frmt": {"secret": {"type": "rand_text", "pool": ["car", "repair", "engine"]}},
			"blck": [
				{
					"type": "line",
					"text": "Кодовое слово",
					"ph text": "введите слово",
					"correct": "{secret}"
				}
			]
		}
	]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Туристическое агентство (DEFAULT) ----------
	{
		"name": "Туристическое агентство 'Мир'",
		"desc": "[center][b]Сайт для поиска и бронирования туров.[/b][/center]\n[color=#ff66aa]Каталог туров с фильтром по стране и цене.[/color]\n[wave]Калькулятор стоимости тура.[/wave]\n[shake]Онлайн-бронирование и оплата.[/shake]\n[color=#00ccff]Отзывы туристов и рейтинг отелей.[/color]",
		"good review": "Сайт отличный! Туры легко найти, бронирование удобное, отзывы помогают!",
		"bad review": "Каталог путаный, бронирование не работает, отзывы не грузятся!",
		"time": 55,
		"money": 45000,
		"ready text": "ГОТОВО",
		"cancel text": "Слишком сложно",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Калькулятор стоимости? {calc} — он позволит туристам быстро узнать цену тура, что ускорит принятие решения. Но для точности нужно учитывать множество факторов (сезон, отель, питание). Если не делать, то цена будет только по запросу. Что лучше?",
				"frmt": {"calc": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Калькулятор стоимости",
						"stat": "{calc}"
					}
				]
			},
			{
				"desc": "Онлайн-бронирование? {booking} — клиенты смогут сразу забронировать тур, не дожидаясь ответа менеджера. Это удобно, но требует интеграции с платёжными системами и актуального наличия мест. Если отказаться, то бронирование будет только через звонок. Как считаешь?",
				"frmt": {"booking": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Онлайн-бронирование",
						"stat": "{booking}"
					}
				]
			},
			{
				"desc": "Отзывы туристов? {reviews} — реальные отзывы помогают новым клиентам доверять нам и выбирать правильные отели. Но нужно следить за их достоверностью. Если не делать, то сайт будет менее информативным. Внедряем?",
				"frmt": {"reviews": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Отзывы туристов",
						"stat": "{reviews}"
					}
				]
			},
			{
				"desc": "Количество туров в каталоге: {tours} — чем больше предложений, тем выше вероятность, что клиент найдёт что-то подходящее. Но нужно поддерживать актуальность всех туров. Выбери число, которое мы сможем качественно наполнять.",
				"frmt": {"tours": {"type": "rand_int", "min": 20, "max": 50}},
				"blck": [
					{
						"type": "slider",
						"text": "Количество туров",
						"step": 5,
						"min value": 10,
						"max value": 100,
						"min d value": "{tours}",
						"max d value": "{tours}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — для доступа к партнёрским интерфейсам и управления ценами. Пусть это будет что-то связанное с путешествиями, чтобы легко запомнить.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["travel", "holiday", "trip"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- СТАРЫЙ ЗАКАЗ: Sans (Undertale, DEFAULT) ----------
	{
		"name": "Sans (подземелье)",
		"desc": "[center][b]хехе, привет, друг.[/b][/center]\nсделай игру про меня. я хочу быть главным героем.\nпусть я стреляю костяными атаками, а враги - люди.\n[color=#00ccff]добавь режим 'потеть', потому что я всегда потею.[/color]\n[wave]и фон должен быть синим, как моя куртка.[/wave]\nа, ещё добавь злодея, типа моего брата Папируса.\n[shake]хотя нет, убери злодея, пусть просто я хожу и стреляю.[/shake]\n[color=#ff8800]и чтобы у меня была макароны, я люблю макароны.[/color]\n[center][b]сделай за 20 минут, а то я устал шутить.[/b][/center]",
		"good review": "хе-хе, отличная игра! я даже вспотел. спасибо, приятель.",
		"bad review": "это не я! где макароны? где синий фон? ты облажался.",
		"time": 45,
		"money": 999,
		"ready text": "Готово, Sans!",
		"cancel text": "Извини, я не умею делать игры со скелетами",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Главный герой: {hero_text} — кого мы ставим в центр игры? Я, Санс, конечно, но можно и кого-то другого, если хочешь. Выбери, кто будет спасать подземелье.",
				"frmt": {"hero": {"type": "rand_option", "pool": ["санс", "папирус", "фриск", "ториэль"]}},
				"blck": [
					{
						"type": "option",
						"text": "Главный герой",
						"items": ["Санс", "Папирус", "Фриск", "Ториэль"],
						"indx": "{hero_index}"
					}
				]
			},
			{
				"desc": "Режим 'потеть'? {sweat} — если включить, то я буду постоянно потеть, это добавит реализма. Но может быть и смешно. Если не включать, то я буду сухим, как обычно. Как тебе?",
				"frmt": {"sweat": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Режим 'потеть'",
						"stat": "{sweat}"
					}
				]
			},
			{
				"desc": "Добавить злодея? {villain} — я думал про Папируса, но потом передумал. Если злодей будет, то сюжет станет интереснее. Если нет, то просто игра-стрелялка. Решай.",
				"frmt": {"villain": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Добавить злодея",
						"stat": "{villain}"
					}
				]
			},
			{
				"desc": "Цвет фона: {color_text} — синий — мой любимый, он напоминает о моей куртке. Но можно и красный, и зелёный. Какой фон будет лучше смотреться в игре?",
				"frmt": {"color": {"type": "rand_option", "pool": ["синий", "красный", "зелёный"]}},
				"blck": [
					{
						"type": "option",
						"text": "Цвет фона",
						"items": ["Синий", "Красный", "Зелёный"],
						"indx": "{color_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — оно откроет доступ к секретной комнате, где можно найти пасхалки. Придумай что-нибудь связанное со мной, например, 'sans' или 'pasta'.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["sans", "bone", "pasta"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- НОВЫЙ УГАРНЫЙ ЗАКАЗ: Гендальф (DEFAULT) ----------
	{
		"name": "Гендальф (волшебник)",
		"desc": "[center][b]ТЫ НЕ ПРОЙДЁШЬ![/b][/center]\nА если пройдёшь... сделай мне сайт для Шира! Чтобы хоббиты могли заказывать пиво и эльфийские лепёшки.\n[color=#ffcc00]И добавь карту Средиземья, но без Мордора — там слишком жарко.[/color]\n[wave]И чтобы был балрог в качестве талисмана.[/wave]\n[shake]Хотя убери балрога, добавь просто огненного дракона.[/shake]",
		"good review": "ТЫ ПРОШЁЛ! Сайт Шира готов, хоббиты счастливы!",
		"bad review": "ТЫ НЕ ПРОШЁЛ! Шир в огне, хоббиты плачут!",
		"time": 60,
		"money": 3000,
		"ready text": "ГОТОВО",
		"cancel text": "ТЫ НЕ ПРОЙДЁШЬ!",
		"tags": 2,
		"type": 0,
		"groups": [
			{
				"desc": "Карта Средиземья? {map} — если добавить, хоббиты будут видеть все места, где можно заказать еду. Но без Мордора, конечно. Если не делать, то придётся ориентироваться по описаниям. Как удобнее для пользователей?",
				"frmt": {"map": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Карта Средиземья",
						"stat": "{map}"
					}
				]
			},
			{
				"desc": "Балрог-талисман? {balrog} — он мог бы быть забавным талисманом, но потом я передумал. Если всё же оставить, то он будет пугать клиентов. Лучше, наверное, убрать. Как думаешь?",
				"frmt": {"balrog": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Балрог-талисман",
						"stat": "{balrog}"
					}
				]
			},
			{
				"desc": "Цветовая гамма: {color_text} — эльфийский зелёный подходит для Шира, гномий серый — для солидности, золотой — для праздника. Выбери, что лучше отражает дух Средиземья.",
				"frmt": {"color": {"type": "rand_option", "pool": ["зелёный (эльфийский)", "серый (гномий)", "золотой (людской)"]}},
				"blck": [
					{
						"type": "option",
						"text": "Цветовая гамма",
						"items": ["Зелёный (эльфийский)", "Серый (гномий)", "Золотой (людской)"],
						"indx": "{color_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — чтобы получить доступ к эльфийским рецептам и особым предложениям. Пусть это будет что-то связанное с приключениями, например, 'shire' или 'adventure'.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["shire", "hobbit", "adventure"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- НОВЫЙ УГАРНЫЙ ЗАКАЗ: Скуби-Ду (MESSAGE) ----------
	{
		"name": "Скуби-Ду (пёс)",
		"desc": "[center][b]Скуби-дуби-ду! Сделай мне приложение для поиска привидений![/b][/center]\nЧтобы я мог отмечать места, где видел монстров. [color=#ff66aa]И чтобы была база данных сэндвичей.[/color]\n[wave]И ещё добавь карту с таинственными местами.[/wave]\n[shake]А, и убери поиск привидений, сделай просто доставку сэндвичей.[/shake]",
		"good review": "Скуби-дуби-ду! Приложение работает, сэндвичи доставляются!",
		"bad review": "Рух-рух! Ничего не работает, я голодный!",
		"time": 40,
		"money": 500,
		"ready text": "ГОТОВО",
		"cancel text": "Я боюсь привидений!",
		"tags": 1,
		"type": 3,
		"groups": [
			{
				"desc": "Поиск привидений? {ghosts} — сначала я думал, что это круто, но потом передумал. Если оставить, то приложение будет специализированным, но может быть никому не нужным. Если убрать, то останется только доставка сэндвичей. Как лучше для бизнеса?",
				"frmt": {"ghosts": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Поиск привидений",
						"stat": "{ghosts}"
					}
				]
			},
			{
				"desc": "База данных сэндвичей? {sandwiches} — это главное! В ней будут все виды сэндвичей, которые можно заказать. Если не делать, то заказы будут приниматься только по телефону. Что выберешь для быстрой доставки?",
				"frmt": {"sandwiches": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "База данных сэндвичей",
						"stat": "{sandwiches}"
					}
				]
			},
			{
				"desc": "Карта таинственных мест? {map} — она поможет находить привидения, если мы всё-таки оставим поиск. Или просто покажет, где находится клиент для доставки. Решай, нужна ли карта в приложении.",
				"frmt": {"map": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Карта таинственных мест",
						"stat": "{map}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — чтобы получить доступ к секретному меню сэндвичей и скидкам. Придумай что-то связанное со Скуби, например, 'scooby' или 'snack'.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["scooby", "snack", "ghost"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- НОВЫЙ УГАРНЫЙ ЗАКАЗ: Человек-паук (DARKNET) ----------
	{
		"name": "Питер Паркер (Человек-паук)",
		"desc": "[center][b]Слышь, паучок, сделай мне приложение для сканирования города![/b][/center]\nЧтобы я видел, где происходят преступления. [color=#ff0000]И добавь карту с паутиной, чтобы я мог быстро перемещаться.[/color]\n[wave]И ещё чтобы была система оповещения о злодеях.[/wave]\n[shake]Хотя убери карту, добавь просто список врагов — Зелёный Гоблин, Доктор Осьминог, Песочный Человек.[/shake]",
		"good review": "Спасибо, паучок! Теперь я знаю, где они прячутся!",
		"bad review": "Ты серьёзно? Карта не работает, я потерял врагов!",
		"time": 50,
		"money": 3500,
		"ready text": "ГОТОВО",
		"cancel text": "Я боюсь пауков!",
		"tags": 2,
		"type": 6,
		"groups": [
			{
				"desc": "Карта с паутиной? {webmap} — я сначала хотел её, чтобы быстро перемещаться, но потом понял, что это слишком сложно. Если оставить, то приложение станет мощным инструментом, но разрабатывать дольше. Если убрать, то список врагов будет проще. Что выберешь?",
				"frmt": {"webmap": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Карта с паутиной",
						"stat": "{webmap}"
					}
				]
			},
			{
				"desc": "Система оповещения? {alert} — она будет присылать уведомления о новых преступлениях. Это важно для оперативного реагирования. Если не делать, то придётся постоянно обновлять страницу. Как удобнее для патрулирования?",
				"frmt": {"alert": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Система оповещения",
						"stat": "{alert}"
					}
				]
			},
			{
				"desc": "Главный враг: {enemy_text} — выбери, на кого мы будем охотиться в первую очередь. От этого зависит сюжет и сложность. Кто доставит больше проблем?",
				"frmt": {"enemy": {"type": "rand_option", "pool": ["зелёный гоблин", "доктор осьминог", "песочный человек"]}},
				"blck": [
					{
						"type": "option",
						"text": "Главный враг",
						"items": ["Зелёный Гоблин", "Доктор Осьминог", "Песочный Человек"],
						"indx": "{enemy_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — чтобы получить доступ к базе данных врагов и их слабостям. Придумай что-то связанное с паутиной, например, 'spider' или 'web'.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["spider", "web", "power"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- НОВЫЙ УГАРНЫЙ ЗАКАЗ: Шерлок Холмс (CUSTOM) ----------
	{
		"name": "Шерлок Холмс (детектив)",
		"desc": "[center][b]Элементарно, Ватсон! Сделай мне базу данных улик.[/b][/center]\nЧтобы я мог связывать преступления и находить преступников.\n[color=#884400]Добавь карту Лондона с местами преступлений.[/color]\n[wave]И чтобы была система дедукции — вводишь улики, получаешь вердикт.[/wave]\n[shake]А, и добавь список подозреваемых: Мориарти, профессор, сэр Генри.[/shake]",
		"good review": "Элементарно! База данных работает, Мориарти арестован!",
		"bad review": "Катастрофа, Ватсон! Всё сломано, преступники на свободе!",
		"time": 55,
		"money": 4000,
		"ready text": "ГОТОВО",
		"cancel text": "Дело закрыто",
		"tags": 2,
		"type": 7,
		"groups": [
			{
				"desc": "Карта Лондона? {map} — на ней будут отмечены все места преступлений, что поможет выявлять закономерности. Если не делать, то улики будут просто списком. Как эффективнее для расследований?",
				"frmt": {"map": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Карта Лондона",
						"stat": "{map}"
					}
				]
			},
			{
				"desc": "Система дедукции? {deduction} — это моя фишка, но её реализация сложна. Если она будет, то приложение станет настоящим детективным инструментом. Если нет, то всё будет на основе логики пользователя. Что выберешь?",
				"frmt": {"deduction": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Система дедукции",
						"stat": "{deduction}"
					}
				]
			},
			{
				"desc": "Подозреваемый: {suspect_text} — выбери главного подозреваемого, на которого мы будем собирать улики. От этого зависит направление расследования.",
				"frmt": {"suspect": {"type": "rand_option", "pool": ["мориарти", "профессор", "сэр генри"]}},
				"blck": [
					{
						"type": "option",
						"text": "Подозреваемый",
						"items": ["Мориарти", "Профессор", "Сэр Генри"],
						"indx": "{suspect_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — чтобы получить доступ к засекреченным файлам и уликам. Придумай что-то связанное с детективами, например, 'holmes' или 'clue'.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["holmes", "detective", "clue"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	# ---------- НОВЫЙ УГАРНЫЙ ЗАКАЗ: Дарт Вейдер (DARKNET) ----------
	{
		"name": "Дарт Вейдер (тёмный властелин)",
		"desc": "[center][b][color=#ff0000]Я ТВОЙ ОТЕЦ![/color][/b][/center]\nСделай мне приложение для контроля над галактикой.\n[color=#444444]Добавь карту звёздных систем, но без Альдераана — он больше не нужен.[/color]\n[wave]И чтобы была система управления Звездой Смерти.[/wave]\n[shake]Убери Звезду Смерти, добавь просто список планет для завоевания.[/shake]",
		"good review": "Сила в тебе есть! Приложение работает, галактика почти завоёвана!",
		"bad review": "Я ЧУВСТВУЮ БОЛЬ! Всё сломано, я уничтожу тебя!",
		"time": 60,
		"money": 8000,
		"ready text": "ГОТОВО",
		"cancel text": "Я не буду помогать империи!",
		"tags": 3,
		"type": 6,
		"mods": {"police count": 3},
		"groups": [
			{
				"desc": "Карта звёздных систем? {map} — она покажет все планеты, которые можно завоевать. Без неё приложение будет просто списком. Нужна ли она для планирования завоеваний?",
				"frmt": {"map": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Карта звёздных систем",
						"stat": "{map}"
					}
				]
			},
			{
				"desc": "Управление Звездой Смерти? {deathstar} — я сначала хотел, но потом понял, что это слишком громоздко. Если оставить, то приложение будет мощным, но сложным в управлении. Если убрать, то сосредоточимся на планетах. Что выберешь?",
				"frmt": {"deathstar": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Управление Звездой Смерти",
						"stat": "{deathstar}"
					}
				]
			},
			{
				"desc": "Планета для завоевания: {planet_text} — с какой планеты начнём экспансию? Выбери ту, которая станет первой в списке завоеваний.",
				"frmt": {"planet": {"type": "rand_option", "pool": ["татуин", "энкор", "корусант"]}},
				"blck": [
					{
						"type": "option",
						"text": "Планета для завоевания",
						"items": ["Татуин", "Энкор", "Корусант"],
						"indx": "{planet_index}"
					}
				]
			},
			{
				"desc": "Секретное слово: {secret} — чтобы активировать тёмную сторону и получить доступ к секретным функциям. Придумай что-то связанное с Империей, например, 'vader' или 'empire'.",
				"frmt": {"secret": {"type": "rand_text", "pool": ["vader", "skywalker", "empire"]}},
				"blck": [
					{
						"type": "line",
						"text": "Кодовое слово",
						"ph text": "введите слово",
						"correct": "{secret}"
					}
				]
			}
		]
	},
	{
		"name": "3.14door games",
		"desc": "[center][b]Привет![/b][/center]\nНадо сделать игру для геймджема, [shake]прям срочно[/shake], а то сроки поджимают! [wave][color=#82ffbe]Выигрыш[color=] поделим на пополам[/wave].",
		"good review": "Офигенно! Я победил в геймджеме! Советую!",
		"bad review": "МУДАК, МЕНЯ ВЫГНАЛИ С ГЕЙМДЖЕМА!",
		"time": 40,
		"money": 3000,
		"ready text": "Забирайте!",
		"cancel text": "НЕТ! Это нечестно.",
		"tags": 2,
		"type": 0,
		"mods": {"safe cancel": true},
		"groups": [
			{
				"desc": "Тема геймджема - {theme}",
				"frmt": {"theme": {"type": "rand_text", "pool": ["Roadmap", "Совместить несовместимое", "Древо путей"]}},
				"blck": []
			},
			{
				"desc": "Надо туда добавить много {item_text}, чтобы автор джема DVER_gmdv точно кликнул на нашу игру",
				"frmt": {"item": {"type": "rand_option", "pool": ["бургеров", "чизбургеров", "картофеля фри", "крылышек KFC"]}},
				"blck": [
					{
						"type": "option",
						"text": "Добавить много",
						"items": ["бургеров", "чизбургеров", "картофеля фри", "крылышек KFC"],
						"indx": "{item_index}"
					}
				]
			},
			{
				"desc": "Геймплей пусть будет {gameplay}, надеюсь мы успеем его реализовать за пару дней!",
				"frmt": {"gameplay": {"type": "rand_option", "pool": ["весёлый", "серьёзный", "средний", "на высоте"]}},
				"blck": [
					{
						"type": "option",
						"text": "Геймплей",
						"items": ["весёлый", "серьёзный", "средний", "на высоте"],
						"indx": "{gameplay_index}"
					}
				]
			},
			{
				"desc": "Ну и пусть игра называется как нибудь в роде {name}. МЫ ДОЛЖНЫ ПОБЕДИТЬ С ТАКИМ НАЗВАНИЕМ!!!",
				"frmt": {"name": {"type": "rand_text", "pool": ["kfc horror", "в поисках бургера", "макдональд уже идёт за тобой..."]}},
				"blck": [
					{
						"type": "line",
						"text": "Название игры",
						"ph text": "введите название",
						"correct": "{name}"
					}
				]
			},
			{
				"desc": "Так, нужен ли мобильный порт? Конечно {c}",
				"frmt": {"c": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Мобильный порт",
						"stat": "{c}"
					}
				]
			}
		]
	},
	{
		"name": "Aboba",
		"desc": "[center][b]Здравствуйте![/b][/center]\nПросим вас оплатить подписку на Aboba Photozhop, стоящую 5000$!\n[center][b]С уважением, Aboba![/b][/center]",
		"good review": "Подписка успешно оплачена!",
		"bad review": "Подписка не была оплачена вовремя!",
		"time": 30,
		"money": -5000,
		"ready text": "Оплатить",
		"cancel text": "",
		"tags": -1,
		"type": 0,
		"mods": {"disable cancel": true, "safe rep": true},
		"groups": []
	}
]
