# belarus-holidays.el
Belarus holidays (whith highlightning)

# To highlight days use something like this
```elisp
(defadvice calendar-generate-month
(after highlight-weekend-days (month year indent) activate)
"Highlight weekend days. 
If STRING contains `\(нерабочы\)' day is non-working.
If STRING contains `\(рабочы\)' day is working."
(dotimes (i 31)
  (let ((date (list month (1+ i) year)) (working nil) (non-working nil) 
 (hlist nil))
     (setq hlist (calendar-check-holidays date))
        (dolist (cursor hlist)
            (if (string-match-p "\(рабочий\)" cursor)
	        (setq working t))
            (if (string-match-p "\(нерабочий\)" cursor)
	        (setq non-working t)))
        (if (and (not working)
               (or (= (calendar-day-of-week date) 0)
                   (= (calendar-day-of-week date) 6)
	           non-working))
	    (calendar-mark-visible-date date 'holiday)))))
```

![Screenshot](Screenshot_1.png?raw=true "Reports")
