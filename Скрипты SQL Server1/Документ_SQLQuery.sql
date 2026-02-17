--Документ.EG_Склад_ПриходныйОрдерНаТовары [с 2022 года] [ВидОперации = От поставщика и От подотчетника]
---create ALTER view pbi.vw_Документ_EG_Склад_ПриходныйОрдерНаТовары_MTO_C2022 as
select
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
_Number as Номер,
_Posted as Проведен,
CASE WHEN _Fld9494RRef = 0x8CF0A491E94102E14C99F69C6181F911 THEN 'МестныйРынок' ELSE 'Поставщик' END as ТипЗакупа, 
CAST(_Fld9495RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
CAST(_Fld9496RRef AS uniqueidentifier) as КонтрагентID, --Справочник.Контрагенты
_Fld9497 as ПредставлениеКонтрагента,
CAST(_Fld9498RRef AS uniqueidentifier) as ДоговорКонтрагентаID, --Справочник.ДоговорыКонтрагентов
CAST(_Fld9499RRef AS uniqueidentifier) as СкладID, --Справочник.Склады
_Fld9502 as Комментарий,
CAST(_Fld9503RRef AS uniqueidentifier) as ОтветственныйID, --Справочник.Пользователи
CAST(_Fld9506RRef AS uniqueidentifier) as ЗаказID, --Документ.EG_Заказ
_Fld9508 as НомерВходящегоДокумента,
DATEADD(YEAR, -2000, _Fld9509) AS ДатаВходящегоДокумента,
CAST(_Fld9510RRef AS uniqueidentifier) as СкладскоеПомещениеID, --Справочник.EG_Склад_СкладскиеПомещения
_Fld9512 as НомерВходящегоСчетаФактуры,
_Fld9517 as КомментарийПоставки,
CASE WHEN _Fld9518 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ПриходПоЗВП,
CASE WHEN _Fld9519 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS УчётПоступившегоМПЗСогласноТСД,
CASE WHEN _Fld9520 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СостояниеУпаковокПломбировки,
CASE WHEN _Fld9521 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS НаличиеИСоответствиеДокументации,
CASE WHEN _Fld9522 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS НаименованиеИНомерТСДКПоступившемуМПЗ,
CASE WHEN _Fld9523 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ПоступлениеПоКачественнымХарактеристикам,
CASE WHEN _Fld9524 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Предпоставка,
CAST(_Fld9525RRef AS uniqueidentifier) as ОтражениеГТД_ID, --Документ.EG_Узб_ОтражениеГТД
CASE WHEN _Fld9532 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ПоступлениеОС,
CAST(_Fld9533RRef AS uniqueidentifier) as СпецификацияID, --Документ.EG_МТО_Спецификация
CASE WHEN _Fld78039 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ВозвратныйТовар,
_Fld79761 as НомерТТН,
DATEADD(YEAR, -2000, _Fld79762) AS ДатаТТН
from _Document948 as Документ_EG_Склад_ПриходныйОрдерНаТовары
where _Date_Time > DATEADD(YEAR, +2000, '2021-12-31') and _Fld9494RRef in (0x8CF0A491E94102E14C99F69C6181F911, --От подотчетника
																										0xB35377DA23CC87414603CDA1AB9FACFC) --От поставщика
																										and _Fld9495RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС

----


	--Документ.EG_Склад_ПриходныйОрдерНаТовары.Товары [с 2022 года] [ВидОперации = От поставщика и От подотчетника]
	--create ALTER view pbi.vw_Документ_EG_Склад_ПриходныйОрдерНаТовары_Товары_MTO_C2022 as
	select 
	CAST(_Document948_IDRRef AS uniqueidentifier) as IDRRef, --Документ.EG_Склад_ПриходныйОрдерНаТовары
	DATEADD(YEAR, -2000, _Document948._Date_Time) AS ДатаСоздания,
	CAST(_Fld9542RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	CAST(_Fld9543RRef AS uniqueidentifier) as НоменклатураПоставщикаID, --Справочник.НоменклатураПоставщиков
	CAST(_Fld9544RRef AS uniqueidentifier) as СерияНоменклатурыID, --Справочник.EG_МТО_СерииНоменклатуры
	_Fld9546 as Количество,
	_Fld9547 as КоличествоПоДокументу,
	_Fld9557 as Цена,
	_Fld9558 as Сумма,
	CAST(_Fld9548RRef AS uniqueidentifier) as ЕдиницаИзмеренияID, --Справочник.КлассификаторЕдиницИзмерения
	CAST(_Fld9549RRef AS uniqueidentifier) as СкладскоеПомещениеID, --Справочник.EG_Склад_СкладскиеПомещения
	CAST(_Fld9550RRef AS uniqueidentifier) as ЗаказID, --Документ.EG_Заказ
	CAST(_Fld9551RRef AS uniqueidentifier) as ДокументПотребностиЗаявкаID, --Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление
	_Fld9553 as КодСтроки,
	DATEADD(YEAR, -2000, _Fld9554) AS ПериодПотребности,
	_Fld9555 as Коэффициент,
	CAST(_Fld9559_RRRef AS uniqueidentifier) as ГТД_ID, --Документ.EG_Узб_ОтражениеГТД
	CAST(_Fld9561RRef AS uniqueidentifier) as НоменклатураЗаявкиID, --Справочник.Номенклатура
	_Fld9562 as КоличествоЗаявки,
	CASE WHEN _Fld9563 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS БезЗВП
	from _Document948_VT9540
	join _Document948 on _Document948_VT9540._Document948_IDRRef = _IDRRef 
	where _Date_Time > DATEADD(YEAR, +2000, '2021-12-31') and _Fld9494RRef in (0x8CF0A491E94102E14C99F69C6181F911, --От подотчетника
																										0xB35377DA23CC87414603CDA1AB9FACFC) --От поставщика
																										and _Fld9495RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС

	---

--Документ.EG_МТО_Спецификация
--create alter view pbi.vw_Документ_EG_МТО_Спецификация as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
_Number as Номер,
CAST(_Fld8371RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
CAST(_Fld8372RRef AS uniqueidentifier) as ПодразделениеID, --Справочник.ПодразделенияОрганизаций
CAST(_Fld8373RRef AS uniqueidentifier) as ВидДокументаID, --Справочник.EG_МТО_ВидыВнутреннихДокументов
CAST(_Fld8374RRef AS uniqueidentifier) as ОтветственныйID, --Справочник.Пользователи
CAST(_Fld8375RRef AS uniqueidentifier) as АвторДокументаID, --Справочник.Пользователи
CAST(_Fld8376_RRRef AS uniqueidentifier) as ДокументОснованиеID, --Документ.EG_МТО_Спецификация; Справочник.ДоговорыКонтрагентов
_Fld8376_RTRef as ДокументОснованиеТип,
_Fld8377 as ОтгрузочныеРеквизиты, 
CAST(_Fld8378RRef AS uniqueidentifier) as ГрузополучательID, --Справочник.Контрагенты
CAST(_Fld8380RRef AS uniqueidentifier) as ОтделID, --Справочник.EG_БТ_Отделы
_Fld8377 as Комментарий, 
CAST(_Fld8382RRef AS uniqueidentifier) as ВалютаДокументаID, --Справочник.Валюты
CASE WHEN _Fld8383 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СуммаВключаетНДС,
CAST(_Fld8384RRef AS uniqueidentifier) as КонтрагентID, --Справочник.Контрагенты
DATEADD(YEAR, -2000, _Fld8387) AS ДатаВнутреннегоДокумента,
_Fld8388 as ПредставлениеВнутреннегоДокумента, 
CAST(_Fld8390RRef AS uniqueidentifier) as ИнвестиционнаяПрограммаID, --Справочник.EG_ИнвестиционныеПрограммы
DATEADD(YEAR, -2000, _Fld8391) AS ДатаПоставки,
CAST(_Fld8392RRef AS uniqueidentifier) as КодINCOTERMS_IDP, --Перечисление.EG_БТ_Incoterms
_Fld8393 as АдресДоставки, 
CAST(_Fld8394RRef AS uniqueidentifier) as ВалютаОплатыID, --Справочник.Валюты
CAST(_Fld8395RRef AS uniqueidentifier) as ПроектID, --Справочник.EG_Проекты
DATEADD(YEAR, -2000, _Fld8396) AS ДатаОкончанияДействия,
_Fld8400 as СуммаДокумента, 
CASE WHEN _Fld8401 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СогласованиеЗапущено,
CASE WHEN _Fld8402 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS УчитыватьНДС,
CAST(_Fld8404 AS uniqueidentifier) as ОтборКОформлениюСпецификацииID, --ОтборКОформлениюСпецификации
CAST(_Fld8411RRef AS uniqueidentifier) as ГруппаРасходовID, --Справочник.EG_МТО_ГруппыРасходов
CAST(_Fld8412RRef AS uniqueidentifier) as ОрганизацияПлательщик, --Справочник.Организации
_Fld8413 as КраткоеСодержание, 
CASE WHEN _Fld8416 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ГСМ,
_Fld8419 as СрокОтгрузки, 
_Fld8420 as СрокВвозаНаТерриториюРФ, 
CASE WHEN _Fld67388 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ECL,
CAST(_Fld70698RRef AS uniqueidentifier) as ПунктДоставки, --Справочник.EG_МТО_АдресаДоставки
_Fld74219 as ТранспортнаяКомпания, 
_Fld74220 as АдресОтгрузки, 
CASE WHEN _Fld77968 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS БанковскаяГарантия,
CASE WHEN _Fld79770 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ЗакупНаМестномРынке
from _Document917 as Документ_EG_МТО_Спецификация
where _Posted=0x01 and _Marked =0x00 -- Проведен = True and ПометкаУдаления = False 
					and _Fld8371RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
--

	--Документ.EG_МТО_Спецификация.ТабличнаяЧасть.Товары
	-- create alter view pbi.vw_Документ_EG_МТО_Спецификация_ТабличнаяЧасть_Товары as
	select 
	CAST(_Document917_IDRRef AS uniqueidentifier) as IDRRef,
	CAST(_Fld8423RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	CAST(_Fld8424RRef AS uniqueidentifier) as ЕдиницаИзмеренияID, --Справочник.КлассификаторЕдиницИзмерения
	_Fld8426 as КаталожныйНомер,
	_Fld8427 as Цена,
	_Fld8428 as Количество,
	_Fld8429 as Сумма,
	CAST(_Fld8430RRef AS uniqueidentifier) as СтавкаНДС_IDP, --Перечисление.СтавкиНДС
	_Fld8431 as СуммаНДС,
	CAST(_Fld8432_RRRef AS uniqueidentifier) as СтавкаНДС_ID, --Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление;
	_Fld8433 as КодСтроки,
	DATEADD(YEAR, -2000, _Fld8434) AS ПериодПотребности,
	CAST(_Fld8435RRef AS uniqueidentifier) as ИсполнительID, --Справочник.Пользователи
	_Fld8436 as КоличествоЗаявки,
	CAST(_Fld8437RRef AS uniqueidentifier) as ЕдиницаИзмеренияЗаявкиID, --Справочник.КлассификаторЕдиницИзмерения
	CAST(_Fld8438RRef AS uniqueidentifier) as НоменклатураЗаявкиID --Справочник.Номенклатура
	from _Document917_VT8421 
	join _Document917 on _Document917_VT8421._Document917_IDRRef = _IDRRef 
	where _Document917._Posted=0x01 and _Document917._Marked =0x00 -- Проведен = True and ПометкаУдаления = False
										and _Document917._Fld8371RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС

	--

	--Документ.EG_МТО_Спецификация.ЭтапыГрафикаОплаты
	--create alter view pbi.vw_Документ_EG_МТО_Спецификация_ЭтапыГрафикаОплаты as
	SELECT 
		CAST(dv._Document917_IDRRef AS uniqueidentifier) AS IDRRef,
		p.Наменование AS ВидыОплат,                                -- Человеко-читаемое значение вида оплаты
		dv._Fld8458 AS ПроцентПлатежа,
		dv._Fld8459 AS СуммаПлатежа,
		dv._Fld8460 AS КоличествоДнейПлатежа,
		dv._Fld8461 AS КоличествоДнейПоставки
	FROM _Document917_VT8454 dv
	JOIN _Document917 d ON dv._Document917_IDRRef = d._IDRRef
	LEFT JOIN (
		SELECT
			CAST(_IDRRef AS uniqueidentifier) AS IDRRef,
			CASE _EnumOrder
				WHEN 0 THEN 'Аванс'
				WHEN 1 THEN 'Аванс'
				WHEN 2 THEN 'Отсрочка'
				WHEN 3 THEN 'Отсрочка'
				ELSE 'Неизвестно'
			END AS Наменование
		FROM _Enum1512
	) p ON dv._Fld8456RRef = p.IDRRef
	WHERE 
		d._Posted = 0x01                 -- Только проведённые документы
		AND d._Marked = 0x00             -- Без пометки на удаление
		AND d._Fld8371RRef NOT IN (0xA97E001E5848397D11DFAEC74909F087) -- Исключаем ЭНГС
		--


--Документ.EG_Заказ
--create alter view pbi.vw_Документ_EG_Заказ as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
_Number as Номер,
CAST(_Fld6504RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
CAST(_Fld6505RRef AS uniqueidentifier) as КонтрагентID, --Справочник.Контрагенты
_Fld6507 as СуммаДокумента,
CAST(_Fld6508RRef AS uniqueidentifier) as ОтветственныйID, --Справочник.Пользователи
_Fld6509 as Комментарий,
DATEADD(YEAR, -2000, _Fld6514) AS ДатаПланируемогоПлатежа,
CAST(_Fld6515RRef AS uniqueidentifier) as ИнициаторID, --Справочник.ФизическиеЛица
_Fld6517 as Назначение,
CAST(_Fld6521RRef AS uniqueidentifier) as СтатусIDP, --Перечисление.EG_СостояниеЗаказа
_Fld6526 as НоменклатураСтрокой,
CAST(_Fld6529RRef AS uniqueidentifier) as ИсполнительID, --Справочник.ФизическиеЛица
_Fld6531 as СчетВх,
DATEADD(YEAR, -2000, _Fld6532) AS СчетДата,
CAST(_Fld6534RRef AS uniqueidentifier) as ВидЗаказаIDP, --Перечисление.EG_ВидДвиженияБюджета
CAST(_Fld6535RRef AS uniqueidentifier) as ПодразделениеОрганизацииID, --Справочник.ПодразделенияОрганизаций
_Fld6540 as ДоходныйДоговорСтрокой,
_Fld6542 as СуммаДокумента_УПР_МСФО,
_Fld6543 as СуммаБезНДС,
_Fld6544 as СуммаБезНДС_УПР_МСФО,
CAST(_Fld6546_RRRef AS uniqueidentifier) as ДокументОснованиеЗаполненияID, --Документ.EG_МТО_Спецификация; Документ.ПлатежноеПоручение; Документ.EG_Заказ; Документ.EG_Узб_ПоступлениеТоваровУслуг; Документ.ПоступлениеТоваровУслуг; Документ.EG_Чехия_ПоступлениеТоваровУслуг;
CAST(_Fld6546_RTRef AS uniqueidentifier) as ДокументОснованиеЗаполненияType,
CASE WHEN _Fld6557 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СогласованБухгалтерия,
CASE WHEN _Fld6558 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СогласованКазначейство,
CASE WHEN _Fld6559 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ОтправлятьУведомлениеОДобавленииЗаказаВОбщийРеестр,
CAST(_Fld6535RRef AS uniqueidentifier) as ОтветственныйОбщегоРеестраЗаказовID, --Справочник.Пользователи
DATEADD(YEAR, -2000, _Fld6561) AS ДатаУведомленияОДобавлениеЗаказаВОбщийРеестр,
DATEADD(YEAR, -2000, _Fld6562) AS ДатаПогашенияАвансовогоПлатежа,
CAST(_Fld6535RRef AS uniqueidentifier) as ЦФО_ID --Справочник.EG_Подразделения
from _Document885
where _Fld6504RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
			and _Date_Time > DATEADD(YEAR, +2000, '2019-12-31')
			and _Fld6534RRef not in (0xAB015CF9E1DDCBEE4963FF58A152CD2E) --ВидЗаказаIDP не Прихода
			and _Posted = 0x01 and _Marked = 0x00 -- проведен и пометка на удаление False

--
	--Документ.EG_Заказ.ТабличнаяЧасть.Основные
	--create alter view pbi.vw_Документ_EG_Заказ_ТабличнаяЧасть_Основные as
	select 
	CAST(_Document885_IDRRef AS uniqueidentifier) as IDRRef,
	CAST(_Fld6570RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	_Fld6601 as КодСтроки,
	_Fld6572 as Количество,
	_Fld6573 as Цена,
	_Fld6574 as Сумма,
	_Fld6576 as СуммаНДС,
	_Fld6583 as СуммаСНДС,
	CAST(_Fld6577RRef AS uniqueidentifier) as ВидДеятельностиID, --Справочник.EG_ВидыДеятельности
	CAST(_Fld6578RRef AS uniqueidentifier) as СтатьяДвиженияДенежныхСредствID, --Справочник.СтатьиДвиженияДенежныхСредств
	CAST(_Fld6580RRef AS uniqueidentifier) as ЦФО_ID, --Справочник.EG_Подразделения
	CAST(_Fld6582RRef AS uniqueidentifier) as ОсновноеСредствоID, --Справочник.ОсновныеСредства
	CAST(_Fld6586RRef AS uniqueidentifier) as ТипЗатратIDP, --Перечисление.EG_ТипыЗатрат
	CAST(_Fld6589RRef AS uniqueidentifier) as ЕдиницаИзмеренияID, --Справочник.КлассификаторЕдиницИзмерения
	CAST(_Fld6600RRef AS uniqueidentifier) as ДокументПотребностиID --Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление
	from _Document885_VT6568
	join _Document885 on _Document885._IDRRef = _Document885_VT6568._Document885_IDRRef
	where _Document885._Fld6504RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
			and _Document885._Date_Time > DATEADD(YEAR, +2000, '2019-12-31')
			and _Document885._Fld6534RRef not in (0xAB015CF9E1DDCBEE4963FF58A152CD2E) --ВидЗаказаIDP не Прихода
			and _Document885._Posted = 0x01 and _Document885._Marked = 0x00 -- проведен и пометка на удаление False

			
	---

--Документ.EG_МТО_ЗаявкаНаПроведениеТендера
--create view pbi.vw_Документ_EG_МТО_ЗаявкаНаПроведениеТендера as
--alter view pbi.vw_Документ_EG_МТО_ЗаявкаНаПроведениеТендера as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
_Number as Номер,
CAST(_Fld7521RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
CAST(_Fld7522RRef AS uniqueidentifier) as ПодразделениеID, --Справочник.ПодразделенияОрганизаций
CAST(_Fld7523RRef AS uniqueidentifier) as ОтветственныйID, --Справочник.Пользователи
_Fld7524 as Комментарий,
CAST(_Fld7529RRef AS uniqueidentifier) as ПроектID, --Справочник.EG_Проекты
CAST(_Fld7530RRef AS uniqueidentifier) as СтатусIDP, --Перечисление.EG_МТО_СтатусыДокументовДМТО
DATEADD(YEAR, -2000, _Fld7531) AS СрокДействия,
CAST(_Fld7533  AS uniqueidentifier) as ОтборКОформлениюТендера, --ОтборКОформлениюТендера
CAST(_Fld7534RRef AS uniqueidentifier) as ВалютаДокументаID, --Справочник.Валюты
CAST(_Fld7536RRef AS uniqueidentifier) as ОтделID, --Справочник.EG_БТ_Отделы
_Fld7537 as НазваниеТендера,
CAST(_Fld7538RRef AS uniqueidentifier) as КодИнкотермсIDP, --Перечисление.EG_БТ_Incoterms
DATEADD(YEAR, -2000, _Fld7539) AS ПериодПотребности,
DATEADD(YEAR, -2000, _Fld7540) AS СрокПоставки,
_Fld7542 as СтатусЭТП,
_Fld7549 as КурсДокумента,
_Fld7550 as КратностьДокумента,
CASE WHEN _Fld7552 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СрочнаяПоставка,
CAST(_Fld7553RRef AS uniqueidentifier) as РегионПоставкиID, --Справочник.EG_РегионыОбобщенный
DATEADD(YEAR, -2000, _Fld7554) AS ДатаКурса,
CAST(_Fld72511RRef AS uniqueidentifier) as ВидЗакупаIDP, --Перечисление.EG_МТО_ВидыЗакупа
_Fld73567 as НомерЭТП,
DATEADD(YEAR, -2000, _Fld76991) AS ДатаНачалаТендераНаЭТП,
DATEADD(YEAR, -2000, _Fld76630) AS ДатаЗавершенияТендераНаЭТП,
_Fld76631 as НомерПротоколаТК,
CAST(_Fld79156RRef AS uniqueidentifier) as ВидОбъектаЗакупкиIDP --Перечисление.EG_МТО_ВидыОбъектовЗакупки
from _Document901 as Документ_EG_МТО_ЗаявкаНаПроведениеТендера
where _posted=0x01 --Проведен = True
					and _Fld7521RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
----

	--Документ.EG_МТО_ЗаявкаНаПроведениеТендера.Товары
	--create alter view pbi.vw_Документ_EG_МТО_ЗаявкаНаПроведениеТендера_Товары as
	select 
	CAST(_Document901_IDRRef AS uniqueidentifier) as IDRRef,
	CAST(_Fld7557RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	_Fld7561 as Количество,
	_Fld7574 as КодСтроки,
	CAST(_Fld7557RRef AS uniqueidentifier) as ЕдиницаИзмеренияID, --Справочник.КлассификаторЕдиницИзмерения
	CAST(_Fld7566_RRRef AS uniqueidentifier) as ИсполнительID, --Справочник.Пользователи; Справочник.ФизическиеЛица
	CAST(_Fld7573_RRRef AS uniqueidentifier) as ДокументПотребностиID, --Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление
	DATEADD(YEAR, -2000, _Fld7575) AS ПериодПотребности,
	DATEADD(YEAR, -2000, _Fld7577) AS СрокПоставки,
	_Fld7579 as Назначение,
	_Fld7580 as ЦенаДокументПотребности
	from _Document901_VT7555
	join _Document901 on _Document901._IDRRef=_Document901_VT7555._Document901_IDRRef
	where _Document901._posted=0x01 --Проведен = True
			and _Document901._Fld7521RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
	----
	--Документ.EG_МТО_ЗаявкаНаПроведениеТендера.ТабличнаяЧасть.Поставщики
	--create alter view pbi.vw_Документ_EG_МТО_ЗаявкаНаПроведениеТендера_ТабличнаяЧасть_Поставщики as
	select 
	CAST(_Document901_IDRRef AS uniqueidentifier) as IDRRef,
	CAST(_Fld7588_RRRef AS uniqueidentifier) as ПоставщикID, --Справочник.EG_МТО_ПотенциальныеПоставщики; Справочник.Контрагенты
	CAST(_Fld7588_RTRef AS uniqueidentifier) as ПоставщикTYPE, --Справочник.EG_МТО_ПотенциальныеПоставщики; Справочник.Контрагенты
	CAST(_Fld7591RRef AS uniqueidentifier) as ВалютаID, --Справочник.Валюты
	_Fld7592 as Курс,
	_Fld7595 as НДС,
	CASE WHEN _Fld7598 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS EDoc,
	_Fld70875 as Bids_ID,
	DATEADD(YEAR, -2000, _Fld70876) AS ДатаПолучения
	from _Document901_VT7586
	join _Document901 on _Document901._IDRRef=_Document901_VT7586._Document901_IDRRef
	where _Document901._posted=0x01 --Проведен = True
				and _Document901._Fld7521RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
	----
	--Документ.EG_МТО_ЗаявкаНаПроведениеТендера.ТабличнаяЧасть.АнализЦен
	--create alter view pbi.vw_Документ_EG_МТО_ЗаявкаНаПроведениеТендера_ТабличнаяЧасть_АнализЦен as
	select 
	CAST(_Document901_IDRRef AS uniqueidentifier) as IDRRef,
	CAST(_Fld7602_RRRef AS uniqueidentifier) as ПоставщикID, --Справочник.EG_МТО_ПотенциальныеПоставщики; Справочник.Контрагенты
	CAST(_Fld7603RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	_Fld7604 as НоменклатураПоставщика,
	_Fld7605 as Цена,
	_Fld7606 as ЦенаCтартовая,
	_Fld7607 as ЦенаПоставщика,
	_Fld7608 as ЦенаПоставщикаСтартовая,
	CAST(_Fld7609RRef AS uniqueidentifier) as ВалютаПоставщикаID, --Справочник.Валюты
	_Fld7610 as Количество
	from _Document901_VT7600
	join _Document901 on _Document901._IDRRef=_Document901_VT7600._Document901_IDRRef
	where _Document901._posted=0x01 --Проведен = True
		and _Document901._Fld7521RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
	----

	--Документ.EG_МТО_ЗаявкаНаПроведениеТендера.УсловияПоставки
	--create view pbi.vw_Документ_EG_МТО_ЗаявкаНаПроведениеТендера_УсловияПоставки as
	select 
	CAST(_Document901_IDRRef AS uniqueidentifier) as IDRRef,
	CAST(_Fld7613_RRRef AS uniqueidentifier) as ПоставщикID, --Справочник.EG_МТО_ПотенциальныеПоставщики; Справочник.Контрагенты
	_Fld7614 as ID_Условия,
	_Fld7615 as ПредставлениеУсловия,
	_Fld7616 as УсловиеПоставщика
	from _Document901_VT7611
	join _Document901 on _Document901._IDRRef=_Document901_IDRRef
	where _Document901._posted=0x01 --Проведен = True
		and _Document901._Fld7521RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
	----

--Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление [с 2020 года] [Проведен = true] [ЭкспрессЗаявка = False ]
--create view pbi.vw_Документ_EG_МТО_ЗаявкаНаВнутреннееПотребление as
--ALTER view pbi.vw_Документ_EG_МТО_ЗаявкаНаВнутреннееПотребление as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
_Number as Номер,
CAST(_Fld7061rref AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
CAST(_Fld7063rref AS uniqueidentifier) as СтатусIDP, --Перечисление.EG_МТО_СтатусыДокументовДМТО
CAST(_Fld7064rref AS uniqueidentifier) as СтатусПроработкиIDP, --Перечисление.EG_МТО_ХозяйственныеОперацииМТО
CAST(_Fld7065rref AS uniqueidentifier) as ВидПотребностиIDP, --Перечисление.EG_МТО_ВидыПотребности
CAST(_Fld7066rref AS uniqueidentifier) as ПериодичностьIDP, --Перечисление.Периодичность
DATEADD(YEAR, -2000, _Fld7067) AS НачалоПериода,
DATEADD(YEAR, -2000, _Fld7068) AS ОкончаниеПериода,
CAST(_Fld7069rref AS uniqueidentifier) as ОтделID, --Справочник.EG_БТ_Отделы
CAST(_Fld7072rref AS uniqueidentifier) as ИнициаторID, --Справочник.ФизическиеЛица
CAST(_Fld7073rref AS uniqueidentifier) as ИсполнительID, --Справочник.Пользователи
CAST(_Fld7074rref AS uniqueidentifier) as КураторID, --Справочник.Пользователи
CAST(_Fld7075rref AS uniqueidentifier) as ОтветственныйID, --Справочник.Пользователи
_Fld7076 as Комментарий,
CASE WHEN _Fld7077 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Согласован,
DATEADD(YEAR, -2000, _Fld7078) AS ДатаСогласования,
_Fld7079 as КоличествоНомеклатур,
CASE WHEN _Fld7080 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS УдалитьРежимКроссТаблицы,
CAST(_Fld7081rref AS uniqueidentifier) as ТипЦеныID, --Справочник.ТипыЦенНоменклатуры
DATEADD(YEAR, -2000, _Fld7085) AS ДатаНачалаРасценки,
DATEADD(YEAR, -2000, _Fld7086) AS ДатаОкончанияРасценки,
CASE WHEN _Fld7087 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Расценена,
_Fld7089 as Проекты,
CAST(_Fld7090rref AS uniqueidentifier) as СкладID, --Справочник.Склады
CAST(_Fld7091rref AS uniqueidentifier) as ПроектID, --Справочник.EG_Проекты
--CASE WHEN _Fld7092 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ЭкспрессЗаявка,
CAST(_Fld7093rref AS uniqueidentifier) as ПодвидПотребностиIDP, --Перечисление.EG_МТО_ТипыПотребности
DATEADD(YEAR, -2000, _Fld7094) AS ДатаАктуальностиОстатков,
_Fld7095 as ОбщаяСумма,
_Fld70592 as СуммаКЗакупу,
CASE WHEN _Fld7096 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ВБюджете,
CASE WHEN _Fld7097 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ПодтверждениеСтокКонтролером,
CAST(_Fld7099rref AS uniqueidentifier) as БуроваяУстановкаID, --Справочник.ОсновныеСредства
CAST(_Fld7100rref AS uniqueidentifier) as СкважинаID, --Справочник.EG_БТ_НоменклатурныеГруппы
CAST(_Fld7102rref AS uniqueidentifier) as ГодоваяПотребностьID, --Документ.EG_МТО_ГодоваяПотребность
DATEADD(YEAR, -2000, _Fld7104) AS ДатаНачалаСогласования,
DATEADD(YEAR, -2000, _Fld7106) AS ДатаДоставкиТовараНаСклад,
CAST(_Fld70112rref AS uniqueidentifier) as ИнвестиционнаяПрограммаID, --Справочник.EG_ИнвестиционныеПрограммы
CASE WHEN _Fld70591 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ПревышениеБюджета,
CASE WHEN _Fld73846 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ГСМ,
CASE WHEN _Fld79769 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ЗакупНаМестномРынке
from _Document897
where _Date_Time > DATEADD(YEAR, +2000, '2019-12-31') and _Posted=0x01 and _Fld7092 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
																		and _Fld7061rref not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
----

	--Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление.Товары [с 2020 года] [Проведен = true] [ЭкспрессЗаявка = False ]
	--create ALTER view pbi.vw_Документ_EG_МТО_ЗаявкаНаВнутреннееПотребление_Товары as
	select 
	CAST(_Document897_IDRRef AS uniqueidentifier) as IDRRef,
	DATEADD(YEAR, -2000, _Fld7110) AS ПериодПотребности,
	CAST(_Fld7111RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	_Fld7138 as КодСтроки,
	CAST(_Fld7115RRef AS uniqueidentifier) as ЕдиницаИзмеренияID, --Справочник.КлассификаторЕдиницИзмерения
	_Fld7116 as Количество,
	_Fld7117 as КоличествоЗаявленное,
	CAST(_Fld7120RRef AS uniqueidentifier) as ПроектID, --Справочник.EG_Проекты
	CAST(_Fld7121RRef AS uniqueidentifier) as ОтветственныйЗаПокупкиID, --Справочник.Пользователи
	CAST(_Fld7124RRef AS uniqueidentifier) as ОсновноеСредствоID, --Справочник.ОсновныеСредства
	_Fld7126 as Назначение,
	CAST(_Fld7128RRef AS uniqueidentifier) as МесторождениеID, --Справочник.EG_Месторождения
	_Fld7130 as КоличествоОстаток,
	_Fld7131 as КоличествоОстатокПоКомпании,
	_Fld7141 as ЦенаЗакупки,
	_Fld7142 as СуммаЗакупки,
	CAST(_Fld7143_RRRef AS uniqueidentifier) as ДокументЦеныЗакупкиID, --Документ.EG_МТО_Спецификация
	CAST(_Fld7143_RTRef AS uniqueidentifier) as ТипЦеныЗакупки, --Тип между Документ.EG_МТО_Спецификация; Строка(100); Справочник.Пользователи
	CAST(_Fld7144RRef AS uniqueidentifier) as ОтветственныйЗаРасценкуID, --Справочник.Пользователи
	CASE WHEN _Fld7146 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ОС,
	CAST(_Fld7147RRef AS uniqueidentifier) as СтатьяДвиженияДенежныхСредствID, --Справочник.СтатьиДвиженияДенежныхСредств
	CAST(_Fld7153RRef AS uniqueidentifier) as НоменклатураКСМ_ID, --Справочник.EG_МТО_НоменклатураКСМ
	CAST(_Fld7155RRef AS uniqueidentifier) as ОснованиеID, --Документ.EG_МТО_ГодоваяПотребность
	_Fld7161 as СрокПоставки
	from _Document897_VT7108
	join _Document897 on _IDRRef= _Document897_IDRRef
	where _Document897._Date_Time > DATEADD(YEAR, +2000, '2019-12-31') and _Document897._Posted=0x01 and _Document897._Fld7092 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
																										and _Document897._Fld7061rref not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
	----

	--Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление.ТаблицаПланЗакупа [с 2020 года] [Проведен = true] [ЭкспрессЗаявка = False ]
	--create ALTER view pbi.vw_Документ_EG_МТО_ЗаявкаНаВнутреннееПотребление_ТаблицаПланЗакупа as
	select 
	CAST(_Document897_IDRRef AS uniqueidentifier) as IDRRef, 
	CAST(_Fld7176RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	_Fld73033 as КодСтроки,
	_Fld7177 as Количество,
	_Fld7179 as Сумма,
	CAST(_Fld7178RRef AS uniqueidentifier) as ЗакупщикID,--Справочник.Пользователи
	CAST(_Fld7180RRef AS uniqueidentifier) as ЗакупщикПеренаправитьID,--Справочник.Пользователи
	_Fld7181 as КоличествоСоСклада,
	_Fld7182 as СуммаОчисткиСоСклада,
	_Fld7183 as КоличествоЗаявлено,
	_Fld7184 as СуммаЗаявлено,
	_Fld73731 as Назначение,
	DATEADD(YEAR, -2000, _Fld76628) AS ДатаНазначенияИсполнителяЗакупа
	from _Document897_VT7174
	join _Document897 on _IDRRef= _Document897_IDRRef
	where _Document897._Date_Time > DATEADD(YEAR, +2000, '2019-12-31') and _Document897._Posted=0x01 and _Document897._Fld7092 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
																					and _Document897._Fld7061rref not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
	----
	--Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление.ТаблицаОчисткаСоСклада [с 2019 года] [Проведен = true] [ЭкспрессЗаявка = False ]
	--create ALTER view pbi.vw_Документ_EG_МТО_ЗаявкаНаВнутреннееПотребление_ТаблицаОчисткаСоСклада as
	select 
	CAST(_Document897_IDRRef AS uniqueidentifier) as IDRRef, 
	CAST(_Fld7187RRef AS uniqueidentifier) as НоменклатураID,--Справочник.Номенклатура
	_Fld7188 as Количество,
	_Fld7190 as КоличествоОстатка,
	_Fld7193 as Цена,
	CAST(_Fld7189RRef AS uniqueidentifier) as СкладID,--Справочник.Склады
	CASE WHEN _Fld7191 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СогласованиеИнициатора,
	_Fld7195 as Назначение,
	CASE WHEN _Fld7198 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ОтклонениеИнициатора,
	_Fld7199 as КоличествоИнициатора,
	CAST(_Fld7203RRef AS uniqueidentifier) as НоменклатураАналогID,--Справочник.Номенклатура
	CASE WHEN _Fld7204 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ОтклонениеСкладом,
	CAST(_Fld7205RRef AS uniqueidentifier) as ПартияID --Документ.EG_Склад_ПриходныйОрдерНаТовары
	from _Document897_VT7185
	join _Document897 on _IDRRef= _Document897_IDRRef
	where _Document897._Date_Time > DATEADD(YEAR, +2000, '2019-12-31') and _Document897._Posted=0x01 and _Document897._Fld7092 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
																									and _Document897._Fld7061rref not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
	
	----


--Документ.EG_МТО_ГодоваяПотребность [с 2022 года] [Проведен = true] [ЭкспрессЗаявка = False]
--create view pbi.vw_Документ_EG_МТО_ГодоваяПотребность as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
_Number as Номер,
CAST(_Fld6893RRef AS uniqueidentifier) as ОрганизацияID,--Справочник.Организации
CAST(_Fld6894RRef AS uniqueidentifier) as ПодразделениеID,--Справочник.ПодразделенияОрганизаций
CAST(_Fld6895RRef AS uniqueidentifier) as СтатусIDP,--Перечисление.EG_МТО_СтатусыДокументовДМТО
CAST(_Fld6897RRef AS uniqueidentifier) as ВидПотребностиIDP,--Перечисление.EG_МТО_ВидыПотребностиГодовойЗаявки
CAST(_Fld6898RRef AS uniqueidentifier) as ПериодичностьIDP,--Перечисление.Периодичность
DATEADD(YEAR, -2000, _Fld6899) AS НачалоПериода,
DATEADD(YEAR, -2000, _Fld6900) AS ОкончаниеПериода,
CAST(_Fld6901RRef AS uniqueidentifier) as ОтделID,--Справочник.EG_БТ_Отделы
CAST(_Fld6904RRef AS uniqueidentifier) as ИнициаторID,--Справочник.ФизическиеЛица
CAST(_Fld6906RRef AS uniqueidentifier) as КураторID,--Справочник.Пользователи
CAST(_Fld6907RRef AS uniqueidentifier) as ОтветственныйID,--Справочник.Пользователи
_Fld6908 as Комментарий,
CASE WHEN _Fld6909 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Согласован,
DATEADD(YEAR, -2000, _Fld6900) AS ДатаСогласования,
_Fld6908 as КоличествоНомеклатур,
CASE WHEN _Fld6912 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS УдалитьРежимКроссТаблицы,
CAST(_Fld6907RRef AS uniqueidentifier) as ТипЦеныID,--Справочник.Пользователи
DATEADD(YEAR, -2000, _Fld6917) AS ДатаНачалаРасценки,
DATEADD(YEAR, -2000, _Fld6918) AS ДатаОкончанияРасценки,
CASE WHEN _Fld6919 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Расценена,
_Fld6921 as Проекты,
CAST(_Fld6923RRef AS uniqueidentifier) as ПроектID,--Справочник.EG_Проекты
CAST(_Fld6928RRef AS uniqueidentifier) as БуроваяУстановкаID,--Справочник.ОсновныеСредства
CAST(_Fld6929RRef AS uniqueidentifier) as СкважинаID,--Справочник.EG_БТ_НоменклатурныеГруппы
_Fld6930 as СуммаДокумента,
DATEADD(YEAR, -2000, _Fld70796) AS ДатаНачалаСогласования,
_Fld70797 as СрокСогласования,
CASE WHEN _Fld73845 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ГСМ
from _Document895
where _Date_Time > DATEADD(YEAR, +2000, '2021-12-31') and _Posted=0x01 and _Fld6924 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
----

	--Документ.EG_МТО_ГодоваяПотребность.ТабличнаяЧасть.Товары [с 2022 года] [Проведен = true] [ЭкспрессЗаявка = False ]
	--create view pbi.vw_Документ_EG_МТО_ГодоваяПотребность_ТабличнаяЧасть_Товары as
	select 
	CAST(_Document895_IDRRef AS uniqueidentifier) as IDRRef,
	DATEADD(YEAR, -2000, _Fld6933) AS ПериодПотребности,
	CAST(_Fld6934RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
	CAST(_Fld6938RRef AS uniqueidentifier) as ЕдиницаИзмеренияID, --Справочник.КлассификаторЕдиницИзмерения
	_Fld6939 as Количество,
	_Fld6940 as КоличествоЗаявленное,
	_Fld6941 as НаименованиеЗаявителя,
	CAST(_Fld6943RRef AS uniqueidentifier) as ПроектID, --Справочник.EG_Проекты
	CAST(_Fld6944RRef AS uniqueidentifier) as ОтветственныйЗаПокупкиID, --Справочник.Пользователи
	CAST(_Fld6947RRef AS uniqueidentifier) as ОсновноеСредствоID, --Справочник.ОсновныеСредства
	_Fld6949 as Назначение,
	CAST(_Fld6951RRef AS uniqueidentifier) as МесторождениеID, --Справочник.EG_Месторождения
	_Fld6953 as КоличествоОстаток,
	_Fld6954 as КоличествоОстатокПоКомпании,
	_Fld6964 as ЦенаЗакупки,
	_Fld6965 as СуммаЗакупки,
	CAST(_Fld6966_RRRef AS uniqueidentifier) as ДокументЦеныЗакупкиID, --Документ.EG_МТО_Спецификация
	CAST(_Fld6966_RTRef AS uniqueidentifier) as ТипЦеныЗакупки, --Тип между Документ.EG_МТО_Спецификация; Строка(100); Справочник.Пользователи
	CAST(_Fld6967RRef AS uniqueidentifier) as ОтветственныйЗаРасценкуID, --Справочник.Пользователи
	CASE WHEN _Fld6969 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ОС,
	CAST(_Fld6976RRef AS uniqueidentifier) as НоменклатураКСМ_ID --Справочник.EG_МТО_НоменклатураКСМ
	from _Document895_VT6931
	join _Document895 on _IDRRef= _Document895_IDRRef
	where _Document895._Date_Time > DATEADD(YEAR, +2000, '2021-12-31') and _Document895._Posted=0x01 and _Document895._Fld6924 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
	----








--Документ.EG_Склад_ВводНачальныхОстатковОрдернаяСистема
--create view pbi.vw_Документ_EG_Склад_ВводНачальныхОстатковОрдернаяСистема as
select
a._Date_Time,
a._Number,
CAST(a._IDRRef AS uniqueidentifier) as IDRRef,
CAST(a._Fld67541RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
b._Description as Ответственный,
a._Fld67544 as Комментарий
from _Document67540 as a
join _Reference588 as b
	on a._Fld67543rref = b._IDRRef
---

	--Документ.EG_Склад_ВводНачальныхОстатковОрдернаяСистема.ТабличнаяЧасть.ТаблицаТоварыНаСкладах
	--create view pbi.vw_Документ_EG_Склад_ВводНачальныхОстатковОрдернаяСистема_ТабличнаяЧасть as
		select 
		CAST(_Document67540_IDRRef AS uniqueidentifier) as IDRRef,
		CAST(_Fld67548RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
		CAST(_Fld67550RRef AS uniqueidentifier) as СкладID, --Справочник.Склады
		CAST(_Fld67552RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
		CAST(_Fld67553RRef AS uniqueidentifier) as ПартияID, --Документ.EG_Склад_ПриходныйОрдерНаТовары
		CAST(_Fld67554RRef AS uniqueidentifier) as ПартияДокументПотребностиID, --Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление
		_Fld67559 as Комментарий
		from _Document67540_VT67546








select *
from _Document948 
Where _Idrref = 0xB5B50CC47A3328EE11EFC9389756E813