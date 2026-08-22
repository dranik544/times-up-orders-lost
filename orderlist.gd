extends Node

# OrderList.gd (AutoLoad)

# frmt форматы:
# {"???": {"type": "rand_bool"}}
# игра случайным образом выберет TRUE или FALSE
# 
# {"???": {"type": "rand_int", "min": 1, "max": 10}}
# игра случайным образом выберет число от MIN до MAX (НЕ УЧИТЫВАЯ step ПАРАМЕТР У slider!!!)
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
	{
		"name": "Клиент",
		"desc": "[center]Выберите цвет: {color_text} и укажите количество: {count}[/center]",
		"good review": "...",
		"bad review": "...",
		"time": 60,
		"money": 1000,
		"tags": 2,
		"type": null,
		"frmt": {
			"color": {"type": "rand_option", "pool": ["красный", "синий", "зелёный"]},
			"count": {"type": "rand_int", "min": 3, "max": 7}
		},
		"prms": [
			{
				"type": "option",
				"text": "Цвет",
				"items": ["красный", "синий", "зелёный"],
				"indx": "{color_index}"  # подставится из rand_option
			},
			{
				"type": "slider",
				"text": "Количество",
				"step": 1,
				"min value": 1,
				"max value": 10,
				"min d value": "{count}",
				"max d value": "{count}"
			}
		]
	},
	# ---------- 1. Обычный: сайт для пекарни ----------
	{
		"name": "Пекарня 'Сдоба'",
		"desc": "[center][b]Сайт для пекарни[/b][/center]\nЗдравствуйте! Нам нужен сайт для нашей пекарни. [wave]Хотим, чтобы было красиво и аппетитно.[/wave]\nЦвета: сначала думали коричневый, но потом решили, что {color_text} лучше. Ассортимент — хлеб, булки, пирожки, всего {categories} категорий. Оплата — {payment_text}. Доставка — {delivery}.",
		"good review": "Супер! Сайт красивый, заказы идут, клиенты довольны!",
		"bad review": "Отстой! Ничего не работает, заказы не принимаются!",
		"time": 50,
		"money": 15000,
		"tags": 2,
		"type": 0,
		"mods": {},
		"ready text": "Принимаю заказ!",
		"cancel text": "Не буду я печь!",
		"frmt": {
			"color": {"type": "rand_option", "pool": ["бежевый", "светло-коричневый", "кремовый"]},
			"categories": {"type": "rand_int", "min": 3, "max": 6},
			"payment": {"type": "rand_option", "pool": ["онлайн-оплата", "наличные и карты", "только наличные"]},
			"delivery": {"type": "rand_bool"}
		},
		"prms": [
			{
				"type": "option",
				"text": "Цвет",
				"items": ["бежевый", "светло-коричневый", "кремовый", "коричневый", "жёлтый"],
				"indx": "{color_index}"
			},
			{
				"type": "slider",
				"text": "Количество категорий",
				"step": 1,
				"min value": 2,
				"max value": 8,
				"min d value": "{categories}",
				"max d value": "{categories}"
			},
			{
				"type": "option",
				"text": "Способ оплаты",
				"items": ["онлайн-оплата", "наличные и карты", "только наличные"],
				"indx": "{payment_index}"
			},
			{
				"type": "check",
				"text": "Доставка",
				"stat": "{delivery}"
			}
		]
	},
	# ---------- 2. Сообщение от Коляна ----------
	{
		"name": "Колян (друг)",
		"desc": "[center][b]Колян просит помощи[/b][/center]\nСлышь, братан, комп тормозит, хочу разогнать! Частоту поставь {frequency} МГц, напряжение {voltage} В. Охлаждение — {cooling}.",
		"good review": "Ваще круто! Комп летает, спасибо, бро!",
		"bad review": "Ты чё, брат, сжёг мой комп!?",
		"time": 30,
		"money": 0,
		"tags": 1,
		"type": 3,
		"mods": {"safe cancel": true},
		"ready text": "Сделано, братан!",
		"cancel text": "Я не хакер!",
		"frmt": {
			"frequency": {"type": "rand_int", "min": 100, "max": 300},
			"voltage": {"type": "rand_option", "pool": ["1.25", "1.30", "1.35"]},
			"cooling": {"type": "rand_bool"}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Частота (МГц)",
				"step": 10,
				"min value": 50,
				"max value": 500,
				"min d value": "{frequency}",
				"max d value": "{frequency}"
			},
			{
				"type": "option",
				"text": "Напряжение (В)",
				"items": ["1.25", "1.30", "1.35", "1.40"],
				"indx": "{voltage_index}"
			},
			{
				"type": "check",
				"text": "Усилить охлаждение",
				"stat": "{cooling}"
			}
		]
	},
	# ---------- 3. Редкий Nike ----------
	{
		"name": "Nike",
		"desc": "[center][b]Nike запускает кампанию![/b][/center]\nПривет! Нужен промо-сайт с таймером на {time} секунд и формой с полями: {fields}. Цвета — {color_text}.",
		"good review": "Отлично! Кампания запущена, продажи взлетели!",
		"bad review": "Провал! Таймер сбился, форма не работала!",
		"time": 45,
		"money": 50000,
		"tags": 3,
		"type": 2,
		"mods": {},
		"ready text": "Готово, сэр!",
		"cancel text": "Не возьмусь",
		"frmt": {
			"time": {"type": "rand_int", "min": 15, "max": 60},
			"fields": {"type": "rand_option", "pool": ["имя, email, телефон", "имя, email", "имя, телефон"]},
			"color": {"type": "rand_option", "pool": ["красный и белый", "чёрный и белый", "синий и белый"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Секунды",
				"step": 5,
				"min value": 5,
				"max value": 120,
				"min d value": "{time}",
				"max d value": "{time}"
			},
			{
				"type": "option",
				"text": "Поля формы",
				"items": ["имя, email, телефон", "имя, email", "имя, телефон"],
				"indx": "{fields_index}"
			},
			{
				"type": "option",
				"text": "Цветовая схема",
				"items": ["красный и белый", "чёрный и белый", "синий и белый"],
				"indx": "{color_index}"
			}
		]
	},
	# ---------- 4. Экстренный: банк ----------
	{
		"name": "Банк 'Финанс'",
		"desc": "[center][b]АВАРИЯ В СИСТЕМЕ![/b][/center]\nСистема упала! Срочно перезагрузите серверы! IP-адрес — {ip}, протокол — {protocol_text}, максимум сессий — {sessions}. Логи — {log}.",
		"good review": "Система восстановлена, платежи идут!",
		"bad review": "Сбой продолжается, клиенты в панике!",
		"time": 30,
		"money": 15000,
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true},
		"ready text": "Всё готово!",
		"cancel text": "",  # отмена недоступна
		"frmt": {
			"ip": {"type": "rand_text", "pool": ["10.0.0.5", "172.16.0.3", "192.168.0.7"]},
			"protocol": {"type": "rand_option", "pool": ["HTTPS", "TLS 1.3", "SSH"]},
			"sessions": {"type": "rand_int", "min": 500, "max": 2000},
			"log": {"type": "rand_bool"}
		},
		"prms": [
			{
				"type": "line",
				"text": "IP-адрес",
				"ph text": "введите IP",
				"correct": "{ip}"
			},
			{
				"type": "option",
				"text": "Протокол",
				"items": ["HTTP", "HTTPS", "TLS 1.3", "SSH"],
				"indx": "{protocol_index}"
			},
			{
				"type": "slider",
				"text": "Максимум сессий",
				"step": 100,
				"min value": 100,
				"max value": 3000,
				"min d value": "{sessions}",
				"max d value": "{sessions}"
			},
			{
				"type": "check",
				"text": "Вести логи",
				"stat": "{log}"
			}
		]
	},
	# ---------- 5. Даркнет: форум ----------
	{
		"name": "ShadowNet",
		"desc": "[center][b]Создай форум для хакеров[/b][/center]\nНужен закрытый форум. Название — {name}, домен — {domain_text}, регистрация — {reg_text}. Анонимность — главное.",
		"good review": "Форум работает, все довольны.",
		"bad review": "Форум взломали, данные утекли.",
		"time": 45,
		"money": 20000,
		"tags": 2,
		"type": 6,
		"mods": {"police count": 2},
		"ready text": "Готово, босс!",
		"cancel text": "Не буду я это делать",
		"frmt": {
			"name": {"type": "rand_text", "pool": ["darkweb", "cryptoforum", "hackerspace"]},
			"domain": {"type": "rand_option", "pool": [".biz", ".xyz", ".shop"]},
			"reg": {"type": "rand_option", "pool": ["по приглашениям", "по коду", "анонимная"]}
		},
		"prms": [
			{
				"type": "line",
				"text": "Название",
				"ph text": "введите название",
				"correct": "{name}"
			},
			{
				"type": "option",
				"text": "Домен",
				"items": [".onion", ".biz", ".xyz", ".shop"],
				"indx": "{domain_index}"
			},
			{
				"type": "option",
				"text": "Регистрация",
				"items": ["открытая", "по приглашениям", "по коду", "анонимная"],
				"indx": "{reg_index}"
			}
		]
	},
	# ---------- 6. Обычный: цветы ----------
	{
		"name": "Цветы 'Букет'",
		"desc": "[center][b]Приложение для доставки цветов[/b][/center]\nХотим приложение для заказа цветов. Цвет — {color_text}, категории — {categories}, доставка в день заказа — {same_day}.",
		"good review": "Красиво, удобно, заказы растут!",
		"bad review": "Глючит, ничего не работает!",
		"time": 40,
		"money": 25000,
		"tags": 2,
		"type": 0,
		"mods": {},
		"ready text": "Готово!",
		"cancel text": "Не возьмусь",
		"frmt": {
			"color": {"type": "rand_option", "pool": ["розовый", "голубой", "сиреневый"]},
			"categories": {"type": "rand_text", "pool": ["розы, тюльпаны, орхидеи", "розы, тюльпаны", "розы, орхидеи"]},
			"same_day": {"type": "rand_bool"}
		},
		"prms": [
			{
				"type": "option",
				"text": "Основной цвет",
				"items": ["розовый", "голубой", "сиреневый", "белый"],
				"indx": "{color_index}"
			},
			{
				"type": "line",
				"text": "Категории",
				"ph text": "введите через запятую",
				"correct": "{categories}"
			},
			{
				"type": "check",
				"text": "Доставка в день заказа",
				"stat": "{same_day}"
			}
		]
	},
	# ---------- 7. Сообщение от тёти Зины ----------
	{
		"name": "Тётя Зина",
		"desc": "[center][b]Тётя Зина просит помощи![/b][/center]\nСынок, телевизор не работает! Код — {code}, режим — {mode_text}.",
		"good review": "Спасибо, теперь работает!",
		"bad review": "Всё сломал, теперь вообще не включается!",
		"time": 20,
		"money": 0,
		"tags": 1,
		"type": 3,
		"mods": {"safe skip": true},
		"ready text": "Всё готово, тёть Зин!",
		"cancel text": "Не умею я это",
		"frmt": {
			"code": {"type": "rand_text", "pool": ["1234", "4321", "0000", "9999"]},
			"mode": {"type": "rand_option", "pool": ["авто", "ручной", "спорт"]}
		},
		"prms": [
			{
				"type": "line",
				"text": "Код",
				"ph text": "введите код",
				"correct": "{code}"
			},
			{
				"type": "option",
				"text": "Режим",
				"items": ["эконом", "турбо", "авто", "ручной", "спорт"],
				"indx": "{mode_index}"
			}
		]
	},
	# ---------- 8. Редкий Google ----------
	{
		"name": "Google",
		"desc": "[center][b]Google нужна новая фича![/b][/center]\nДобавьте голосовой ввод. Язык — {lang_text}, чувствительность — {sensitivity}%, автозапись — {rec}.",
		"good review": "Фича принята, вы гений!",
		"bad review": "Фича сломала поиск!",
		"time": 40,
		"money": 200000,
		"tags": 3,
		"type": 2,
		"mods": {},
		"ready text": "Сделано, гугл!",
		"cancel text": "Не могу",
		"frmt": {
			"lang": {"type": "rand_option", "pool": ["русский", "испанский", "китайский"]},
			"sensitivity": {"type": "rand_int", "min": 60, "max": 90},
			"rec": {"type": "rand_bool"}
		},
		"prms": [
			{
				"type": "option",
				"text": "Язык",
				"items": ["русский", "испанский", "китайский", "английский"],
				"indx": "{lang_index}"
			},
			{
				"type": "slider",
				"text": "Чувствительность (%)",
				"step": 5,
				"min value": 30,
				"max value": 100,
				"min d value": "{sensitivity}",
				"max d value": "{sensitivity}"
			},
			{
				"type": "check",
				"text": "Автозапись",
				"stat": "{rec}"
			}
		]
	},
	# ---------- 9. Экстренный: метро ----------
	{
		"name": "Метро 'Центральное'",
		"desc": "[center][b]АВАРИЯ В МЕТРО![/b][/center]\nПоезда стоят! Вручную введите: поезд — {train}, ветка — {line_text}, интервал — {interval} мин.",
		"good review": "Движение восстановлено!",
		"bad review": "Поезда столкнулись!",
		"time": 25,
		"money": 20000,
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true},
		"ready text": "Всё готово!",
		"cancel text": "",
		"frmt": {
			"train": {"type": "rand_text", "pool": ["a-101", "b-202", "c-303", "d-404"]},
			"line": {"type": "rand_option", "pool": ["синяя", "зелёная", "жёлтая"]},
			"interval": {"type": "rand_int", "min": 2, "max": 5}
		},
		"prms": [
			{
				"type": "line",
				"text": "Поезд",
				"ph text": "введите номер",
				"correct": "{train}"
			},
			{
				"type": "option",
				"text": "Ветка",
				"items": ["красная", "синяя", "зелёная", "жёлтая"],
				"indx": "{line_index}"
			},
			{
				"type": "slider",
				"text": "Интервал (мин)",
				"step": 1,
				"min value": 1,
				"max value": 10,
				"min d value": "{interval}",
				"max d value": "{interval}"
			}
		]
	},
	# ---------- 10. Даркнет: взлом ----------
	{
		"name": "HackerOne",
		"desc": "[center][b]Взломай сайт конкурента![/b][/center]\nУязвимость — {vuln_text}, атака — {attack_text}, маскировка — {mask}.",
		"good review": "Данные получены, мы внутри!",
		"bad review": "Нас обнаружили, сервер заблокирован!",
		"time": 35,
		"money": 30000,
		"tags": 2,
		"type": 6,
		"mods": {"police count": 2},
		"ready text": "Взломано!",
		"cancel text": "Отказываюсь",
		"frmt": {
			"vuln": {"type": "rand_option", "pool": ["XSS", "CSRF", "file inclusion"]},
			"attack": {"type": "rand_option", "pool": ["brute force", "phishing", "mitm"]},
			"mask": {"type": "rand_bool"}
		},
		"prms": [
			{
				"type": "option",
				"text": "Уязвимость",
				"items": ["SQL-инъекция", "XSS", "CSRF", "file inclusion"],
				"indx": "{vuln_index}"
			},
			{
				"type": "option",
				"text": "Тип атаки",
				"items": ["brute force", "phishing", "mitm", "DOS"],
				"indx": "{attack_index}"
			},
			{
				"type": "check",
				"text": "Маскировка",
				"stat": "{mask}"
			}
		]
	},
	# ---------- 11. Обычный: интернет-магазин ----------
	{
		"name": "Магазин 'Техно'",
		"desc": "[center][b]Нужен интернет-магазин[/b][/center]\nПродаём гаджеты. Категории — {categories}, оплата — {payment_text}, цвет — {color_text}.",
		"good review": "Магазин отличный, продажи растут!",
		"bad review": "Корзина не работает, заказов нет!",
		"time": 50,
		"money": 30000,
		"tags": 2,
		"type": 0,
		"mods": {},
		"ready text": "Сделано!",
		"cancel text": "Отказ",
		"frmt": {
			"categories": {"type": "rand_text", "pool": ["смартфоны, планшеты, ноутбуки", "смартфоны, планшеты", "смартфоны, ноутбуки"]},
			"payment": {"type": "rand_option", "pool": ["картой", "наличными", "криптовалютой"]},
			"color": {"type": "rand_option", "pool": ["белый", "серый", "чёрный"]}
		},
		"prms": [
			{
				"type": "line",
				"text": "Категории",
				"ph text": "введите через запятую",
				"correct": "{categories}"
			},
			{
				"type": "option",
				"text": "Способ оплаты",
				"items": ["картой", "наличными", "криптовалютой"],
				"indx": "{payment_index}"
			},
			{
				"type": "option",
				"text": "Цвет",
				"items": ["красный", "чёрный", "белый", "серый"],
				"indx": "{color_index}"
			}
		]
	},
	# ---------- 12. Сообщение от коллеги ----------
	{
		"name": "Алексей (коллега)",
		"desc": "[center][b]Помощь с кодом![/b][/center]\nСкрипт падает! Переменная — {var}, значение — {value}, режим — {mode_text}.",
		"good review": "Спасибо, скрипт работает!",
		"bad review": "Ты всё сломал!",
		"time": 25,
		"money": 0,
		"tags": 1,
		"type": 3,
		"mods": {"safe cancel": true},
		"ready text": "Готово, Лёха!",
		"cancel text": "Не могу помочь",
		"frmt": {
			"var": {"type": "rand_text", "pool": ["count", "total", "sum", "avg"]},
			"value": {"type": "rand_int", "min": 1, "max": 100},
			"mode": {"type": "rand_option", "pool": ["отладка", "профилирование", "тест"]}
		},
		"prms": [
			{
				"type": "line",
				"text": "Переменная",
				"ph text": "введите имя",
				"correct": "{var}"
			},
			{
				"type": "slider",
				"text": "Значение",
				"step": 1,
				"min value": 0,
				"max value": 200,
				"min d value": "{value}",
				"max d value": "{value}"
			},
			{
				"type": "option",
				"text": "Режим",
				"items": ["релиз", "отладка", "профилирование", "тест"],
				"indx": "{mode_index}"
			}
		]
	},
	# ---------- 13. Редкий Apple ----------
	{
		"name": "Apple",
		"desc": "[center][b]Секретный проект![/b][/center]\nВиджет для iOS. Данные — {data_text}, цвет — {color_text}, анимация — {anim_text}.",
		"good review": "Виджет принят, вы гений!",
		"bad review": "Виджет отклонён, вы уволены!",
		"time": 45,
		"money": 250000,
		"tags": 3,
		"type": 2,
		"mods": {},
		"ready text": "Сделано, сэр!",
		"cancel text": "Не возьмусь",
		"frmt": {
			"data": {"type": "rand_option", "pool": ["курс валют", "календарь", "заметки"]},
			"color": {"type": "rand_option", "pool": ["белый", "чёрный", "золотой"]},
			"anim": {"type": "rand_option", "pool": ["slide", "scale", "rotate"]}
		},
		"prms": [
			{
				"type": "option",
				"text": "Тип данных",
				"items": ["погода", "курс валют", "календарь", "заметки"],
				"indx": "{data_index}"
			},
			{
				"type": "option",
				"text": "Цвет",
				"items": ["серый", "белый", "чёрный", "золотой"],
				"indx": "{color_index}"
			},
			{
				"type": "option",
				"text": "Анимация",
				"items": ["fade", "slide", "scale", "rotate"],
				"indx": "{anim_index}"
			}
		]
	},
	# ---------- 14. Экстренный: завод ----------
	{
		"name": "Завод 'Энергия'",
		"desc": "[center][b]СТОП-КОНВЕЙЕР![/b][/center]\nРобот сломался! Скорость — {speed} м/с, температура — {temp}°C, газ — {gas_text}.",
		"good review": "Конвейер запущен, всё работает!",
		"bad review": "Робот сломался, завод стоит!",
		"time": 30,
		"money": 25000,
		"tags": 2,
		"type": 4,
		"mods": {"disable cancel": true},
		"ready text": "Всё готово!",
		"cancel text": "",
		"frmt": {
			"speed": {"type": "rand_int", "min": 2, "max": 6},
			"temp": {"type": "rand_int", "min": 150, "max": 300},
			"gas": {"type": "rand_option", "pool": ["гелий", "азот", "кислород"]}
		},
		"prms": [
			{
				"type": "slider",
				"text": "Скорость (м/с)",
				"step": 0.5,
				"min value": 0.5,
				"max value": 8,
				"min d value": "{speed}",
				"max d value": "{speed}"
			},
			{
				"type": "slider",
				"text": "Температура (°C)",
				"step": 10,
				"min value": 100,
				"max value": 350,
				"min d value": "{temp}",
				"max d value": "{temp}"
			},
			{
				"type": "option",
				"text": "Газ",
				"items": ["аргон", "гелий", "азот", "кислород"],
				"indx": "{gas_index}"
			}
		]
	},
	# ---------- 15. Даркнет: продажа данных ----------
	{
		"name": "DataSeller",
		"desc": "[center][b]Продажа базы данных[/b][/center]\nТип данных — {data_text}, цена — {price}$, доставка — {delivery_text}, шифрование — {encrypt}.",
		"good review": "База продана, деньги получены!",
		"bad review": "База утекла, мы в розыске!",
		"time": 40,
		"money": 40000,
		"tags": 2,
		"type": 6,
		"mods": {"police count": 3},
		"ready text": "Продано!",
		"cancel text": "Не буду",
		"frmt": {
			"data": {"type": "rand_option", "pool": ["телефоны", "адреса", "пароли"]},
			"price": {"type": "rand_int", "min": 5, "max": 25},
			"delivery": {"type": "rand_option", "pool": ["телеграм", "сигнал", "ватсап"]},
			"encrypt": {"type": "rand_bool"}
		},
		"prms": [
			{
				"type": "option",
				"text": "Тип данных",
				"items": ["email", "телефоны", "адреса", "пароли"],
				"indx": "{data_index}"
			},
			{
				"type": "slider",
				"text": "Цена ($)",
				"step": 1,
				"min value": 1,
				"max value": 50,
				"min d value": "{price}",
				"max d value": "{price}"
			},
			{
				"type": "option",
				"text": "Способ доставки",
				"items": ["email", "телеграм", "сигнал", "ватсап"],
				"indx": "{delivery_index}"
			},
			{
				"type": "check",
				"text": "Шифрование",
				"stat": "{encrypt}"
			}
		]
	}
]
