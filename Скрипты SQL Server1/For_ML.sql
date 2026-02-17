
--правочник_Номенклатура
select 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
CAST(_ParentIDRRef AS uniqueidentifier) as ParentID,
_Code as Код,
_Description as Наименование,
CAST(_Fld57960RRef AS uniqueidentifier) as ЕдиницаИзмеренияБазоваяID, --Справочник.КлассификаторЕдиницИзмерения
CAST(_Fld57967RRef AS uniqueidentifier) as СтатьяЗатратID, --Справочник.СтатьиЗатрат
CAST(_Fld57999RRef AS uniqueidentifier) as EG_СтатьяДвиженияДенежныхСредствID, --Справочник.СтатьиДвиженияДенежныхСредств
CAST(_Fld58001RRef AS uniqueidentifier) as EG_СтатьяДвиженияДенежныхСредствДляМатериаловID, --Справочник.СтатьиДвиженияДенежныхСредств
_Fld57961 as НаименованиеПолное,
CAST(_Fld58002RRef AS uniqueidentifier) as EG_ПодразделениеID, --Справочник.EG_Подразделения
CAST(_Fld58015RRef AS uniqueidentifier) as EG_КатегорияНоменклатурыID, --Справочник.EG_МТО_КатегорияНоменклатуры
CAST(_Fld58017RRef AS uniqueidentifier) as EG_НоменклатураКСМ, 
_Fld58018 as EG_Отделы,
CAST(_Fld58020RRef AS uniqueidentifier) as EG_ОсновнойОтделID, --Справочник.EG_БТ_Отделы
_Fld58049 as EG_ID,
CAST(_Fld58057RRef AS uniqueidentifier) as EG_ОсновнойОтделСАID --Справочник.EG_БТ_Отделы
from _Reference485 as Справочник_Номенклатура


--Документ_EG_МТО_Спецификация
select
CAST(_Fld8380RRef AS uniqueidentifier) as ОтделID, --Справочник.EG_БТ_Отделы
CAST(_Fld8374RRef AS uniqueidentifier) as ОтветственныйID
from _Document917 as Документ_EG_МТО_Спецификация
where _Posted=0x01 and _Marked =0x00 -- Проведен = True and ПометкаУдаления = False 


--vw_Документ_EG_МТО_ЗаявкаНаВнутреннееПотребление_Товары 
select 
CAST(_Fld7111RRef AS uniqueidentifier) as НоменклатураID,
CAST(_Fld7115RRef AS uniqueidentifier) as ЕдиницаИзмеренияID,
CAST(_Fld7121RRef AS uniqueidentifier) as ОтветственныйЗаПокупкиID
from _Document897_VT7108
join _Document897 on _IDRRef= _Document897_IDRRef
	where _Document897._Posted=0x01 and _Document897._Fld7092 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
	

--vw_Документ_EG_МТО_ГодоваяПотребность_ТабличнаяЧасть_Товары
select 
CAST(_Fld6934RRef AS uniqueidentifier) as НоменклатураID, --Справочник.Номенклатура
CAST(_Fld6938RRef AS uniqueidentifier) as ЕдиницаИзмеренияID, --Справочник.КлассификаторЕдиницИзмерения
CAST(_Fld6944RRef AS uniqueidentifier) as ОтветственныйЗаПокупкиID
from _Document895_VT6931
	join _Document895 on _IDRRef= _Document895_IDRRef
	where _Document895._Posted=0x01 and _Document895._Fld6924 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
																									