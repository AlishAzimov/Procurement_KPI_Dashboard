--Справочник.Организации
--create view pbi.vw_Справочник_Организации as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Description as Наименование,
_Fld58703 as Префикс,
_Fld58673 as ИНН,
_Fld58671 as КПП
from _Reference511 as Справочник_Организации
----
--Справочник.СтраныМираСправочник.Контрагенты
--create view pbi.vw_Справочник_СтраныМира as
select
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
_Fld63445 as КодАльфа2
from _Reference702 as Справочник_СтраныМира


---
--Справочник.Контрагенты
--create alter view pbi.vw_Справочник_Контрагенты as
SELECT 
    CAST(a._IDRRef AS uniqueidentifier) AS IDRRef,
    CAST(a._ParentIDRREF AS uniqueidentifier) AS ParentID,
    DATEADD(YEAR, -2000, a._Fld56772) AS ДатаСоздания,
    a._Description AS Наименование,
    a._Code AS Код,
    a._Fld56750 AS ИНН,
    a._Fld56751 AS КПП,
    CAST(a._Fld56748RRef AS uniqueidentifier) AS СтранаРегистрацииID, --Справочник.СтраныМира
    -- Условие для подстановки 'Китай' если NULL и ИНН есть
    CASE 
        WHEN c._Description IS NULL AND a._Fld56750 IS NOT NULL AND a._Fld56750 <> '' THEN 'Китай'
        ELSE c._Description
    END AS СтранаРегистрации,
    -- Условие для подстановки 'CN' если NULL и ИНН есть
    CASE 
        WHEN c._Fld63445 IS NULL AND a._Fld56750 IS NOT NULL AND a._Fld56750 <> '' THEN 'CN'
        ELSE c._Fld63445
    END AS КодСтраны
FROM _Reference442 AS a
LEFT JOIN _Reference702 AS c 
    ON c._IDRRef = a._Fld56748RRef
---
--Справочник.Валюты
--create view pbi.vw_Справочник_Валюты asСправочник.Организации
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
_Fld53275 as НаименованиеПолное
from _Reference288 as Справочник_Валюты
---
--Справочник.Пользователи (Почты)
--create view pbi.vw_Справочник_Пользователи as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Description as ФИО,
CASE WHEN _Fld60930 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Недействителен,
CAST(_Fld60932RRef AS uniqueidentifier) as ФизическоеЛицоID, --Справочник.ФизическиеЛица
_Fld60933 as Комментарий,
CAST(_Fld60936 AS uniqueidentifier) as ИдентификаторПользователяИбIDP,
_Fld60940 as EG_EMAIL
from _Reference588 as Справочник_Пользователи
---
--Справочник.ФизическиеЛица (дата рождение)
--create view pbi.vw_Справочник_ФизическиеЛица as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Description as ФИО,
DATEADD(YEAR, -2000, _Fld65103) AS ДатаРождения,
CAST(_Fld65104RRef AS uniqueidentifier) as ПолIDP
from _Reference804 as Справочник_ФизическиеЛица
where _Description like 'Саттаров%'
---
--Справочник.Должности
--create view pbi.vw_Справочник_Должности as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Description as Наименование,
CAST(_Fld54997RRef AS uniqueidentifier) as ТрудоваяФункцияID --Справочник.ТрудовыеФункции
from _Reference358 as Справочник_Должности
---
--Справочник.ТрудовыеФункции
--create view pbi.vw_Справочник_ТрудовыеФункции as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Description as Наименование,
_Fld64059 as Описание,
CAST(_Fld64060RRef AS uniqueidentifier) as КлассификаторЗанятийID --Справочник.КлассификаторЗанятий
from _Reference731 as Справочник_ТрудовыеФункции
---
--Справочник.КлассификаторЗанятий
--create view pbi.vw_Справочник_КлассификаторЗанятий as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Fld56492 as КонтрольноеЧисло,
_Fld56493 as НаименованиеГруппЗанятий
from _Reference423 as Справочник_КлассификаторЗанятий
---
--Справочник.EG_ИнвестиционныеПрограммы
--create view pbi.vw_Справочник_EG_ИнвестиционныеПрограммы as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
_Fld52076 as ТипПроекта,
_Fld52077 as РБЕ,
CAST(_Fld52078RRef AS uniqueidentifier) as МенеджерИнвестпроектаID, --Справочник.ФизическиеЛица
CAST(_Fld52079RRef AS uniqueidentifier) as СтатусПроектаIDP,
CASE WHEN _Fld52080 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СогласованоНаИКРБЕ,
_Fld52081 as КомментарийСогласованоНаИКРБЕ,
CASE WHEN _Fld52082 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS СогласованоНаПИК,
_Fld52083 as КомментарийСогласованоНаПИК
from _Reference142 as Справочник_EG_ИнвестиционныеПрограммы
---
--Справочник.EG_МТО_ВидыВнутреннихДокументов
--create view pbi.vw_Справочник_EG_МТО_ВидыВнутреннихДокументов as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Description as Наименование
from _Reference173 as Справочник_EG_МТО_ВидыВнутреннихДокументов
---
--Справочник.EG_Проекты
--create view pbi.vw_Справочник_EG_Проекты as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as код,
_Description as Наименование,
_Fld52417 as GUID_DocFlow,
CAST(_Fld52418RRef AS uniqueidentifier) as ТипПроектаIDP,
CAST(_Fld52419RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
CAST(_Fld52420RRef AS uniqueidentifier) as ПодразделениеОрганизацииID, --Справочник.ПодразделенияОрганизаций
CAST(_Fld52421RRef AS uniqueidentifier) as РБЕ_IDP,
CAST(_Fld52422RRef AS uniqueidentifier) as ЗаказчикID, --Справочник.Контрагенты
CAST(_Fld52423RRef AS uniqueidentifier) as ВалютаID, --Справочник.Валюты
DATEADD(YEAR, -2000, _Fld52424) AS ДатаНачалоРабот,
DATEADD(YEAR, -2000, _Fld52425) AS ДатаОкончаниеРабот,
_Fld52429 as КодУпр,
CAST(_Fld52434RRef AS uniqueidentifier) as ОбщаяСкважинаПроектаID, --Справочник.НоменклатурныеГруппы
_Fld52435 as НаименованиеУпр
from _Reference210 as Справочник_EG_Проекты
---
--Справочник.EG_РегионыОбобщенный
--create view pbi.vw_Справочник_EG_РегионыОбобщенныйы as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
CAST(_Fld52448RRef AS uniqueidentifier) as ВалютаРегионаID, --Справочник.Валюты
CAST(_Fld52449RRef AS uniqueidentifier) as СтраныМираID --Справочник.СтраныМира
from _Reference211 as Справочник_EG_РегионыОбобщенныйы
---
--Справочник.EG_Месторождения
--create view pbi.vw_Справочник_EG_Месторождения as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
CAST(_Fld52135RRef AS uniqueidentifier) as РегионID, --Справочник.EG_РегионыОбобщенный
CAST(_Fld52136RRef AS uniqueidentifier) as СтранаID --Справочник.СтраныМира
from _Reference154 as Справочник_EG_Месторождения
---
--Справочник.НоменклатурныеГруппы (Скважины)
--create view pbi.vw_Справочник_НоменклатурныеГруппы as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as код,
_Description as Наименование,
CAST(_Fld58160RRef AS uniqueidentifier) as EG_ТипСкважиныIDP, 
CAST(_Fld58162RRef AS uniqueidentifier) as EG_КонтрагентID, --Справочник.Контрагенты
CAST(_Fld58163RRef AS uniqueidentifier) as EG_ДоговорКонтрагентаID, --Справочник.ДоговорыКонтрагентов
CAST(_Fld58170RRef AS uniqueidentifier) as EG_ОрганизацияID, --Справочник.Организации
CAST(_Fld58171RRef AS uniqueidentifier) as EG_ПодразделенияОрганизацийID, --Справочник.ПодразделенияОрганизаций
CAST(_Fld58172RRef AS uniqueidentifier) as EG_РегионID, --Справочник.EG_РегионыОбобщенный
CAST(_Fld58173RRef AS uniqueidentifier) as EG_НоменклатурнаяГруппаБюджетированиеID, --Справочник.EG_БТ_НоменклатурныеГруппы
CAST(_Fld58174RRef AS uniqueidentifier) as EG_МесторождениеID, --Справочник.EG_Месторождения
CAST(_Fld58175RRef AS uniqueidentifier) as EG_ПроектID, --Справочник.EG_Проекты
CAST(_Fld58177RRef AS uniqueidentifier) as EG_ВидДеятельностиIDP 
from _Reference489 as Справочник_НоменклатурныеГруппы
---
--
--Справочник.EG_БТ_НоменклатурныеГруппы (Скважины)
--create view pbi.vw_Справочник_EG_БТ_НоменклатурныеГруппы as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as код,
_Description as Наименование,
CAST(_Fld51912RRef AS uniqueidentifier) as EG_ТипСкважиныIDP,
CAST(_Fld51914RRef AS uniqueidentifier) as EG_КонтрагентID,--Справочник.Контрагенты
CAST(_Fld51915RRef AS uniqueidentifier) as EG_ДоговорКонтрагентаID, --Справочник.ДоговорыКонтрагентов
CAST(_Fld51920RRef AS uniqueidentifier) as EG_ОрганизацияID,--Справочник.Организации
CAST(_Fld51921RRef AS uniqueidentifier) as EG_ПодразделенияОрганизацийID,--Справочник.ПодразделенияОрганизаций
CAST(_Fld51922RRef AS uniqueidentifier) as EG_РегионID, --Справочник.EG_РегионыОбобщенный
CAST(_Fld51923RRef AS uniqueidentifier) as EG_МесторождениеID, --Справочник.EG_Месторождения
CAST(_Fld51924RRef AS uniqueidentifier) as EG_ПроектID, --Справочник.EG_Проекты
CAST(_Fld51926RRef AS uniqueidentifier) as СтатусIDP,
CAST(_Fld51927RRef AS uniqueidentifier) as РБЕ_IDP
from _Reference103 as Справочник_EG_БТ_НоменклатурныеГруппы
---
--Справочник.ПодразделенияОрганизаций
--create view pbi.vw_Справочник_ПодразделенияОрганизаций as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
CAST(_Fld60791RRef AS uniqueidentifier) as ГоловнаяОрганизацияID, --Справочник.Организации
_Fld60816 as НаименованиеПолное
from _Reference583 as Справочник_ПодразделенияОрганизаций
---
--Справочник.EG_БТ_Департаменты
--create view pbi.vw_Справочник_EG_БТ_Департаменты as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование
from _Reference94 as Справочник_EG_БТ_Департаменты
---
--Справочник.СтатьиЗатрат
--create view pbi.vw_Справочник_СтатьиЗатрат as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
CAST(_Fld63422RRef AS uniqueidentifier) as EG_СтатьяЗатрат_УПР_МСФО_ID, --Справочник.EG_СтатьиЗатрат
_Fld63423 as EG_НаименованиеАнглийское,
_Fld63425 as EG_НаименованиеСокр
from _Reference699 as Справочник_СтатьиЗатрат
---
--Справочник.ДоговорыКонтрагентов
--create view pbi.vw_Справочник_ДоговорыКонтрагентов as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as код,
_Description as Наименование,
CAST(_Fld54678RRef AS uniqueidentifier) as ВалютаID, --Справочник.Валюты
CAST(_Fld54680RRef AS uniqueidentifier) as ОрганизацияID, --Справочник.Организации
DATEADD(YEAR, -2000, _Fld54690) AS ДатаДоговора,
_Fld54691 as НомерДоговора,
DATEADD(YEAR, -2000, _Fld54692) AS СрокДействияДоговора,
_Fld54738 as EG_СуммаКонтракта,
_Fld54740 as EG_ПроцентАванса,
_Fld54741 as EG_ПредметКонтрактаУз,
CAST(_Fld54745RRef AS uniqueidentifier) as СтатусИсполненияДоговораIDP, 
DATEADD(YEAR, -2000, _Fld54757) AS EG_СрокПоставки,
CAST(_Fld54761RRef AS uniqueidentifier) as ИнвестиционнаяПрограммаID, --Справочник.EG_ИнвестиционныеПрограммы
CAST(_Fld54762RRef AS uniqueidentifier) as КодINCOTERMS_IDP,
_Fld54763 as EG_АдресДоставки,
CAST(_Fld54764RRef AS uniqueidentifier) as ВидВнутреннегоДокументаID, --Справочник.EG_МТО_ВидыВнутреннихДокументов
CAST(_Fld54768RRef AS uniqueidentifier) as ПроектID, --Справочник.EG_Проекты
CAST(_Fld54769RRef AS uniqueidentifier) as ПодразделениеДержателяДоговораID, --Справочник.EG_БТ_Департаменты
CAST(_Fld54771RRef AS uniqueidentifier) as СтатьяЗатратID, --Справочник.СтатьиЗатрат
CAST(_Fld54772RRef AS uniqueidentifier) as ОтделID, --Справочник.EG_БТ_Отделы
CAST(_Fld54774RRef AS uniqueidentifier) as ОтветственныйID, --Справочник.ФизическиеЛица
CAST(_Fld54779RRef AS uniqueidentifier) as СпецификацияID, --Документ.EG_МТО_Спецификация
_Fld54785 as Сумма,
_Fld54788 as СуммаНДС,
_Fld76493 as ВнутреннийНомерДО,
DATEADD(YEAR, -2000, _Fld76625) AS ДатаВнесенияДоговораВДО,
DATEADD(YEAR, -2000, _Fld76626) AS ДатаСогласованияДоговораВДО
from _Reference351 as Справочник_ДоговорыКонтрагентов
---
--Справочник.ДоговорыКонтрагентов.EG_ГрафикПлатежей
--create view pbi.vw_Справочник_ДоговорыКонтрагентов_EG_ГрафикПлатежей as
select 
CAST(_Reference351_IDRRef AS uniqueidentifier) as IDRRef, --Справочник.ДоговорыКонтрагентов
CAST(_Fld54802RRef AS uniqueidentifier) as ВидОплатыIDP, 
DATEADD(YEAR, -2000, _Fld54803) AS СрокОплаты,
_Fld54804 as ПроцентОплаты,
_Fld54805 as КоличествоДней
from _Reference351_VT54800 as Справочник_ДоговорыКонтрагентов_EG_ГрафикПлатежей
--
--Справочник.КлассификаторЕдиницИзмерения
--create view pbi.vw_Справочник_КлассификаторЕдиницИзмерения as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
_Fld56490 as НаименованиеПолное
from _Reference422 as Справочник_КлассификаторЕдиницИзмерения
---
--Справочник.Склады
--create view pbi.vw_Справочник_Склады as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
CAST(_Fld62686RRef AS uniqueidentifier) as ТипСкладаIDP,
CAST(_Fld62687RRef AS uniqueidentifier) as ПодразделениеОрганизацииID, --Справочник.ПодразделенияОрганизаций
CAST(_Fld62688RRef AS uniqueidentifier) as НоменклатурнаяГруппаID, --Справочник.НоменклатурныеГруппы
CAST(_Fld62690RRef AS uniqueidentifier) as МОЛ_ID, --Справочник.ФизическиеЛица
_Fld62694 as МОЛ_Представление,
_Fld62696 as СтарыйКод,
CAST(_Fld62708RRef AS uniqueidentifier) as МТО_ТипСкладаIDP,
CAST(_Fld62709RRef AS uniqueidentifier) as ПроектID, --Справочник.EG_Проекты
CAST(_Fld62710RRef AS uniqueidentifier) as ВидПроизводстваIDP
from _Reference662 as Справочник_Склады
--
--Справочник.EG_Склад_СкладскиеПомещения
--create view pbi.vw_СправочникСкладскиеПомещения as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CASE WHEN _Marked = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ПометкаУдаления,
_Code as Код,
_Description as Наименование,
CAST(_Fld52462RRef AS uniqueidentifier) as ТекущийОтветственныйID, --Справочник.ФизическиеЛица
_Fld52463 as ТекущаяДолжностьОтветственного,
_Fld52464 as Ряд,
_Fld52465 as Секция,
_Fld52466 as Ячейка
from _Reference218 as СправочникСкладскиеПомещения
--
--Справочник.EG_ФайлыНаСервере
--create view pbi.vw_Справочник_EG_ФайлыНаСервере_C2022 as
--ALTER VIEW pbi.vw_Справочник_EG_ФайлыНаСервере_C2022 AS
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Описание,
CAST(_Fld52652 AS NVARCHAR(255)) AS ИмяФайла,
DATEADD(YEAR, -2000, _Fld52659) AS ДатаСоздания,
CAST(_Fld52660 AS uniqueidentifier) as ТекстХранилище,
CAST(_Fld52662RRef AS uniqueidentifier) as АвторID, --Справочник.Пользователи
_Fld52665 as РазмерФайла,
_Fld86497 as Расширение
from _Reference254 as Справочник_EG_ФайлыНаСервере
where _Fld52659 > DATEADD(YEAR, +2000, '2021-12-31')
--
--Справочник.СтатьиДвиженияДенежныхСредств
--create view pbi.vw_Справочник_СтатьиДвиженияДенежныхСредств as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
CAST(_Fld63398RRef AS uniqueidentifier) as ВидДвиженияДенежныхСредствIDP,
CAST(_Fld63403RRef AS uniqueidentifier) as EG_ВидОперацииIDP,
_Fld63404 as EG_Пояснение
from _Reference698 as Справочник_СтатьиДвиженияДенежныхСредств
--
--Справочник.EG_Подразделения
--create view pbi.vw_Справочник_EG_Подразделения as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
CAST(_Fld52404RRef AS uniqueidentifier) as ЦФОКазначействоID
from _Reference208 as Справочник_EG_Подразделения
--
--Справочник.EG_ПодразделенияОрганизацийЗУП
--create view pbi.vw_Справочник_EG_ПодразделенияОрганизацийЗУП as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование
from _Reference209 as Справочник_EG_ПодразделенияОрганизацийЗУП
--
--ПланСчетов.Хозрасчетный
--create view pbi.vw_ПланСчетов_Хозрасчетный as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
_OrderField as Порядок,
_Kind as Вид,
CASE WHEN _OffBalance = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Забалансовый,
CASE WHEN _Fld65513 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS КодБыстрогоВыбора,
CASE WHEN _Fld65514 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Валютный,
CASE WHEN _Fld65515 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Количественный,
CASE WHEN _Fld65516 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS УчетПоПодразделениям,
CASE WHEN _Fld65517 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS НалоговыйУчет
from _Acc75 as ПланСчетов_Хозрасчетный
--
--Справочник.EG_МТО_КатегорияНоменклатуры
--create view pbi.vw_Справочник_EG_МТО_КатегорияНоменклатуры as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
CASE WHEN _Fld52196 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS EG_ВыгруженНаЭТП,
_Fld52197 as НаименованиеНаАнглийском
from _Reference182 as Справочник_EG_МТО_КатегорияНоменклатуры
--
--Справочник.EG_МТО_НоменклатураКСМ
--create view pbi.vw_Справочник_EG_МТО_НоменклатураКСМ as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
CAST(_Fld52213RRef AS uniqueidentifier) as КатегорияНоменклатурыКСМID, --Справочник.EG_МТО_КатегорииНоменклатурыКСМ
CAST(_Fld52214RRef AS uniqueidentifier) as ЕдиницаИзмеренияБазоваяID, --Справочник.КлассификаторЕдиницИзмерения
_Fld52215 as УсловноеОбозначение,
CAST(_Fld52216RRef AS uniqueidentifier) as ГруппаКСМID --Справочник.EG_МТО_ГруппаКСМ
from _Reference186 as Справочник_EG_МТО_НоменклатураКСМ
--
--Справочник.EG_МТО_КатегорииНоменклатурыКСМ
--create view pbi.vw_Справочник_EG_МТО_КатегорииНоменклатурыКСМ as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
CAST(_Fld52180RRef AS uniqueidentifier) as ЕдиницаИзмеренияБазоваяID, --Справочник.КлассификаторЕдиницИзмерения
DATEADD(YEAR, -2000, _Fld52182) AS ДатаСоздания,
CAST(_Fld52180RRef AS uniqueidentifier) as АвторСозданияID, --Справочник.Пользователи
CAST(_Fld52187RRef AS uniqueidentifier) as ГруппаКСМID --Справочник.EG_МТО_ГруппаКСМ
from _Reference181 as Справочник_EG_МТО_КатегорииНоменклатурыКСМ
--
--Справочник.EG_МТО_ГруппаКСМ
--create view pbi.vw_Справочник_EG_МТО_ГруппаКСМ as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование
from _Reference174 as Справочник_EG_МТО_ГруппаКСМ
--
--Справочник.Номенклатура
--create view pbi.vw_Справочник_Номенклатура as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
CAST(_Fld57960RRef AS uniqueidentifier) as ЕдиницаИзмеренияБазоваяID, --Справочник.КлассификаторЕдиницИзмерения
_Fld57961 as НаименованиеПолное,
CAST(_Fld57967RRef AS uniqueidentifier) as СтатьяЗатратID, --Справочник.СтатьиЗатрат
CAST(_Fld57999RRef AS uniqueidentifier) as EG_СтатьяДвиженияДенежныхСредствID, --Справочник.СтатьиДвиженияДенежныхСредств
CAST(_Fld58001RRef AS uniqueidentifier) as EG_СтатьяДвиженияДенежныхСредствДляМатериаловID, --Справочник.СтатьиДвиженияДенежныхСредств
CAST(_Fld58002RRef AS uniqueidentifier) as EG_ПодразделениеID, --Справочник.EG_Подразделения
CAST(_Fld58010RRef AS uniqueidentifier) as EG_ВидыМатериаловID, --ПланСчетов.Хозрасчетный
CAST(_Fld58015RRef AS uniqueidentifier) as EG_КатегорияНоменклатурыID, --Справочник.EG_МТО_КатегорияНоменклатуры
_Fld58018 as EG_Отделы,
CAST(_Fld58020RRef AS uniqueidentifier) as EG_ОсновнойОтделID, --Справочник.EG_БТ_Отделы
_Fld58049 as EG_ID,
CAST(_Fld58057RRef AS uniqueidentifier) as EG_ОсновнойОтделСАID --Справочник.EG_БТ_Отделы
from _Reference485 as Справочник_Номенклатура
select *
from _Reference485
where _idrref = 0xAC1390E2BA4ADBDD11E6EC315E646213
--

--Справочник.НоменклатураПоставщиков
--create view pbi.vw_Справочник_НоменклатураПоставщиков as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
CAST(_Fld58115RRef AS uniqueidentifier) as НоменклатураID --Справочник.Номенклатура
from _Reference487 as Справочник_НоменклатураПоставщиков
--
--Справочник.EG_БТ_Отделы
--create view pbi.vw_Справочник_EG_БТ_Отделы as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование,
CASE WHEN _Fld51937 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS EG_ВыгруженНаЭТП,
_Fld51939 as КраткоеНаименование,
CAST(_Fld51940RRef AS uniqueidentifier) as ПодразделениеID, --Справочник.EG_Подразделения
CASE WHEN _Fld70865 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ОтделДМТО
from _Reference107 as Справочник_EG_БТ_Отделы
--
--Справочник.EG_МТО_СерииНоменклатуры
--create view pbi.vw_Справочник_EG_МТО_СерииНоменклатуры as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as СерийныйНомер
from _Reference194 as Справочник_EG_МТО_СерииНоменклатуры
--


--Справочник.EG_МТО_ГруппыРасходов
-- create view pbi.vw_Справочник_EG_МТО_ГруппыРасходов as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as наименование
from _Reference176 as Справочник_EG_МТО_ГруппыРасходов
--

--Справочник_EG_МТО_АдресаДоставки
-- create view pbi.vw_Справочник_EG_МТО_АдресаДоставки as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Code as Код,
_Description as Наименование, 
_Fld70684 as ТипМестоположения, 
_Fld70685 as ОписаниеМестоположения, 
_Fld70686 as UNLOCode, 
_Fld70687 as МеждународноеНаименование, 
_Fld70688 as КритерийПоиска1, 
_Fld70689 as КритерийПоиска2, 
_Fld70690 as КодСтраны, 
_Fld70691 as КодРегиона, 
_Fld70693 as ПочтовыйИндекс, 
_Fld70857 as КодСтанции,
_Fld70858 as НаименованиеПоста
from _Reference70683 as Справочник_EG_МТО_АдресаДоставки
---

--Справочник.EG_ВидыДеятельности
-- create view pbi.vw_Справочник_EG_ВидыДеятельности as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
_Description as Наименование
from _Reference126
---

--Справочник.ОсновныеСредства
-- create view pbi.vw_Справочник_ОсновныеСредства as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
_Fld58927 as Изготовитель,
DATEADD(YEAR, -2000, _Fld58930) AS ДатаВыпуска,
_Fld58937 as Комментарий,
CAST(_Fld58950RRef AS uniqueidentifier) as ПоставщикID, --Справочник.Контрагенты
CAST(_Fld58951RRef AS uniqueidentifier) as ДоговорНаПриобретениеID, --Справочник.ДоговорыКонтрагентов
DATEADD(YEAR, -2000, _Fld58952) AS ДатаПриобретения,
_Fld58956 as ИнвентарныйНомер,
CAST(_Fld58958RRef AS uniqueidentifier) as ИнвестиционнаяПрограммаID, --Справочник.EG_ИнвестиционныеПрограммы
CAST(_Fld58962RRef AS uniqueidentifier) as СтранаПроисхожденияID --Справочник.СтраныМира
from _Reference522
---


--Справочник.ТипыЦенНоменклатуры
-- create view pbi.vw_Справочник_ТипыЦенНоменклатуры as
-- ALTER VIEW pbi.vw_Справочник_ТипыЦенНоменклатуры as
select 
CAST(_Reference719._IDRRef AS uniqueidentifier) as IDRRef,
_Reference719._Description as Наименование,
CAST(_Reference719._Fld63715RREF AS uniqueidentifier) as ВалютаЦеныID, --Справочник.Валюты
CAST(_Reference719._Fld63720RREF AS uniqueidentifier) as РегионID, --Справочник.EG_РегионыОбобщенный
_Reference288._Description as Валюта
from _Reference719 
join _Reference288 on _Reference719._Fld63715RREF=_Reference288._IDRRef
--



--Справочник.EG_МТО_ПотенциальныеПоставщики
-- create alter view pbi.vw_Справочник_EG_МТО_ПотенциальныеПоставщики as
select 
CAST(a._IDRRef AS uniqueidentifier) as IDRRef,
a._Description as Наименование,
a._Fld52281 as ИНН,
a._Fld52283 as КПП,
a._Fld52285 as ОсновноеКонтактноеЛицо,
CAST(a._Fld69393rref AS uniqueidentifier) as СтранаРегистрацииID, --Справочник.СтраныМира
DATEADD(YEAR, -2000, a._Fld69395) AS ДатаСоздания,
a._Fld69396 as ETP_ID,
a._Fld69397 as Телефон,
a._Fld69398 as АдресПочты,
CAST(a._Fld70830rref AS uniqueidentifier) as ОтветственныйID, --Справочник.Пользователи
a._Fld72506 as РегистрационныйНомер,
CASE WHEN a._Fld72509 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ПлательщикНДС,
a._Fld72818 as ЯзыкОбщения,
CASE WHEN a._Fld76492 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ВыгруженНаЭТП,
CASE a._Fld52286rref 				
        WHEN 0xBB79F968D50D327D4E9FAF911312F787 THEN 'Юридическое лицо'
		WHEN 0xBB78FA4A49F84317408A568CE3EA3F3B THEN 'Физическое лицо'
        ELSE 'Неизвестно'
        END AS ЮрФизЛицо,
CASE a._Fld86391rref 				
        WHEN 0xAE6506A21B2C528C40573D7C51F06662 THEN 'Производитель'
		WHEN 0xB2C57E24ECB3FA554A08EAB6090BDC09 THEN 'Посредник'
        WHEN 0xB2F82DCE7A45883B45ADBB945171D735 THEN 'Дилер'
		WHEN 0x95726AC51FE1FCA04472F038A5B6A694 THEN 'Подрядчик'
        ELSE 'Неизвестно'
        END AS ТипПоставщика,
  CASE
        WHEN a._Fld69397 LIKE '%+998%' THEN 'Республика Узбекистан'
        WHEN a._Fld69397 LIKE '%+7%' THEN 'Россия'
        WHEN a._Fld69397 LIKE '%+89%' THEN 'Китай'
        ELSE c._Description
    END AS СтранаРегистрации,
c._Fld63445 aS КодСтраны
from _Reference189 as a
LEFT JOIN _Reference702 AS c 
    ON c._IDRRef = a._Fld69393rref
--