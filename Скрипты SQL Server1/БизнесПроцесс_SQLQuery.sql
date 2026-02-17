--БизнесПроцесс.EG_МТО_КомплексныйПроцесс
--create view pbi.vw_БизнесПроцесс_EG_МТО_КомплексныйПроцесс as
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
CASE WHEN _Completed = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Завершен,
_Number as Номер,
CAST(_Fld65998RRef AS uniqueidentifier) as АвторID, --Справочник.Пользователи
DATEADD(YEAR, -2000, _Fld66002) AS ДатаЗавершения,
_Fld66005 as Наименование,
CASE WHEN _Fld66011_RTRef = 0x00000381 THEN 'ЗВП' WHEN _Fld66011_RTRef = 0x0000037F THEN 'ГП' ELSE '' END as ПредметТип,
CAST(_Fld66011_RRRef AS uniqueidentifier) as ПредметID --Документ.EG_МТО_ЗаявкаНаВнутреннееПотребление; Документ.EG_МТО_ГодоваяПотребность;
from _BPr2553
where _Fld66011_RtRef in (0x00000381, 0x0000037F) --ПредметТип в ЗВП и ГП 
--
	--БизнесПроцесс.EG_МТО_КомплексныйПроцесс.ТабличнаяЧасть.Этапы
	--create view pbi.vw_БизнесПроцесс_EG_МТО_КомплексныйПроцесс_ТабличнаяЧасть_Этапы as
	select 
	CAST(_BPr2553_IDRRef AS uniqueidentifier) as IDRRef,
	_LineNo66014 as Порядок, 
	CAST(_Fld66016RRef AS uniqueidentifier) as ШаблонБизнесПроцессаID, --Справочник.EG_МТО_ШаблонСогласования
	CASE WHEN _Fld66022 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ЗадачаВыполнена,
	CASE WHEN _Fld66023 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS Пройден
	from _BPr2553_VT66013
	join _BPr2553 on _BPr2553_IDRRef = _IDRRef
	where _BPr2553._Fld66011_RtRef in (0x00000381, 0x0000037F) --ПредметТип в ЗВП и ГП
	--