;; Belarus holidays whith transfers
(eval-when-compile
  (require 'calendar)
  (require 'holidays))

(defvar holiday-belarus-holidays nil
  "Праздники Беларуси")

(setq belarus-holidays
  `(
    (holiday-fixed 1 1 "Новы год (нерабочы)")
    (belarus-holidays--holiday-once 1 2 2018 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 1 20 2018 "Перанос рабочага дня (рабочы)")
    (holiday-fixed 2 23 "Дзень абаронцаў Айчыны і Узброеных Сіл Рэспублікі Беларусь")
    (belarus-holidays--holiday-once 3 3 2018 "Перанос рабочага дня (рабочы)")
    (holiday-fixed 3 8 "Дзень жанчын (нерабочы)")
    (belarus-holidays--holiday-once 3 9 2018 "Перанос рабочага дня (нерабочы)")
    (holiday-fixed 3 15 "Дзень Канстытуцыі")
    (holiday-fixed 4 2 "Дзень яднання народаў Беларусі і Расіі")
    (belarus-holidays--holiday-once 4 14 2018 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 4 16 2018 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 4 28 2018 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 4 30 2018 "Перанос рабочага дня (нерабочы)")
    (holiday-fixed 5 1 "Свята працы (нерабочы)")
    (holiday-fixed 5 9 "Дзень Перамогі (нерабочы)")
    (holiday-float 5 0 2 "Дзень Дзяржаўнага сцяга Рэспублікі Беларусь і Дзяржаўнага герба Рэспублікі Беларусь")
    (belarus-holidays--holiday-once 7 2 2018 "Перанос рабочага дня (нерабочы)")
    (holiday-fixed 7 3 "Дзень Незалежнасці (Дзень Рэспублікі) (нерабочы)")
    (belarus-holidays--holiday-once 7 7 2018 "Перанос рабочага дня (рабочы)")
    (holiday-fixed 11 7 "Дзень Кастрычніцкай рэвалюцыі (нерабочы)")
    (belarus-holidays--holiday-once 12 22 2018 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 12 24 2018 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 12 29 2018 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 12 31 2018 "Перанос рабочага дня (нерабочы)")
    (holiday-fixed 1 7 "Ражджаство Хрыстова (праваслаўнае) (нерабочы)")
    (belarus-holidays--holiday-eastern-etc 0 "Вялікдзень (каталіцкі) (нерабочы)")
    (belarus-holidays--holiday-eastern-etc 0 "Вялікдзень (праваслаўны) (нерабочы)")
    (belarus-holidays--holiday-eastern-etc 9 "Радаўніца (нерабочы)")
    (holiday-fixed 12 25 "Ражджаство Хрыстова (каталіцкае) (нерабочы)")
    ;; update for 2019
    (belarus-holidays--holiday-once 5 4 2019 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 5 6 2019 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 5 8 2019 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 5 11 2019 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 11 8 2019 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 11 16 2019 "Перанос рабочага дня (рабочы)")
    ;; update for 2020
    (belarus-holidays--holiday-once 1 2 2020 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 1 4 2020 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 1 6 2020 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 4 4 2020 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 4 27 2020 "Перанос рабочага дня (нерабочы)")
    ;; update for 2021
    (belarus-holidays--holiday-once 1 8 2021 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 1 16 2021 "Перанос рабочага дня (рабочы)")
    (belarus-holidays--holiday-once 5 10 2021 "Перанос рабочага дня (нерабочы)")
    (belarus-holidays--holiday-once 5 15 2021 "Перанос рабочага дня (рабочы)")
    ))

(defun holiday-eastern-etc (&optional n string)
  "Date of Nth day after Orthodox Easter (named STRING), if visible in calendar window.
Negative values of N are interpreted as days before Easter.
STRING is used purely for display purposes.  The return value has
the form ((MONTH DAY YEAR) STRING), where the date is that of the
Nth day before or after Easter.
URL: https://www.emacswiki.org/emacs/ukrainian-holidays.el"
(list (list
 (if (= n 0)
  (easter-eastern displayed-year)
   (calendar-gregorian-from-absolute
    (+ n (calendar-absolute-from-gregorian
	  (easter-eastern displayed-year)))))
   string)))

(defun easter-eastern (year)
  (let* ((x (% (+ (* (% year 19) 19) 15) 30))
	 (day (- (+ x 10)
		 (% (+ (/ (* year 5) 4) x) 7))))
    (if (< day 31)
	(list 4 day year)
      (list 5 (- day 30) year))))

(defun holiday-once (month day year string)
  "Holiday on MONTH, DAY (Gregorian), YEAR called STRING.
If MONTH, DAY, YEAR is visible, the value returned is the list (((MONTH DAY YEAR)
STRING)). Returns nil if it is not visible in the current calendar window."
  (let ((m displayed-month))
    (calendar-increment-month m year (- 11 month))
    (if (> m 9)
        (list (list (list month day year) string)))))

(provide 'belarus-holidays)
