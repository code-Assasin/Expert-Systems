(deffunction fibo
(?num)
(if (or (= ?num 0) (= ?num 1) ) then
?num
else
(+ (fibo(- ?num 1)) (fibo(- ?num 2)))
)
)