﻿# encoding: utf-8
# language: ru

@tree
@IgnoreOnCIMainBuild

Функционал: ДляПроверкаПереборСтрокТаблицыGherkin




Сценарий: ДляПроверкаПереборСтрокТаблицыGherkin
	И для каждой строки таблицы я выполняю
		| 'Колонка1' | 'Колонка2' | 'Колонка3' |
		| '111'      | '222'      | '333'      |
		| '10'       | '20'       | '30'       |
		
		И я вывожу значение переменной "Колонка1"
		И я вывожу значение переменной "Колонка2"
		И я вывожу значение переменной "Колонка3"
