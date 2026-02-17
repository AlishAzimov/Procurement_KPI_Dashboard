
-- Шаблоны 
CAST(_IDRRef AS uniqueidentifier) as IDRRef,
DATEADD(YEAR, -2000, _Date_Time) AS ДатаСоздания,
CASE WHEN _Fld78039 = 0x01 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS ВозвратныйТовар,
_Code as Код,
_Number as Номер,
_Description as СерийныйНомер
CASE WHEN _Fld66011_RRRef = 0x00000381 THEN 'ЗВП' WHEN _Fld66011_RRRef = 0x0000037F THEN 'ГП' ELSE '' END
--

select  *
from _AccumRg48928
where DATEADD(YEAR, -2000, _Period) >= '2025-01-02' 
and DATEADD(YEAR, -2000, _Period) < '2025-01-03' 
order by _Period desc



select _RecordKind,
count(*) as Количество,
100.0 * count(*)/SUM(count(*)) OVER () as Процент
from _AccumRg48928
group by _RecordKind
order by количество DESC


select _Fld48931rref,
count(*) as Количество,
100.0 * count(*)/SUM(count(*)) OVER () as Процент
from _AccumRgT48944
where _Period='4025-02-01 00:00:00'
group by _Fld48931rref
order by количество DESC


select top 100 *
from _AccumRgT48944
		

select count(*)
from _Document901_VT7611 
join _Document901 on _Document901._idrref = _Document901_IDRRef
where _Document901._posted=0x01 --Проведен = True
					and _Document901._Fld7521RRef not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС 
					and _Document901._Marked = 0x01

select _RecorderTRef,
count(*) as Количество,
100.0 * count(*)/SUM(count(*)) OVER () as Процент
from _AccumRg48928
where _recordKind = 0
group by _RecorderTRef
order by Количество desc



select top 1000 *
from _Document946_VT9445



select top 1000 *
from _Document1003_VT11563
where _IDRRef = 0xB5B50CC47A3328EE11F03983DC926D0D



--Документ.EG_Склад_РасходныйОрдерНаТовары
select top 1000 *
from _Document950
where _Posted=0x01
order by _Date_Time ASC

select 
_IDRRef,
_Description as Наименование
from _Reference662 as Справочник_Склады
where _Description like 'Андижан центральный склад%'


select top 100 *
from _AccumRg48928
where _Fld48931rref = 0xB5B20CC47A3328EE11EE383030D2A5DF
order by _Period Desc


and  DATEADD(YEAR, -2000, _Period)  >= '2025-01-01'
and  DATEADD(YEAR, -2000, _Period) < '2025-01-02'



select top 100 *
from _AccumRgT48944
where _Fld48931rref = 0xB5B20CC47A3328EE11EE383030D2A5DF 
and  DATEADD(YEAR, -2000, _Period)  >= '2025-01-01'
and  DATEADD(YEAR, -2000, _Period) < '2025-01-02'


select top 1000 *
from _AccumRg48928
where _recordKind = 0
order by _PERIOD desc

select top 1000 *
from _AccumRg48928
where _Fld48931rref=0xB5B50CC47A3328EE11EF2705CCF8C7D7 and DATEADD(YEAR, -2000, _Period) >= '2025-02-01' 
and DATEADD(YEAR, -2000, _Period) < '2025-02-03'  

РасходныйОрдерНаТовары

0x000003B6 = 'РасходныйОрдерНаТовары'
0x000003B4 = 'ПриходныйОрдерНаТовары'

0 = приход 
1 = расход


select 
_IDRRef,
_Description as Наименование
from _Reference662 as Справочник_Склады
where _Description = 'Склад продуктов питания Миранкуль'



select top 1000 *
from _AccumRg48928
where _recorderTref=0x000003B1 and DATEADD(YEAR, -2000, _Period) >= '2025-02-01' 
and DATEADD(YEAR, -2000, _Period) < '2025-02-02'  