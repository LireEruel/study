import re

text = "9 906 7581 28240 840414 3802773 425624"

p1 = "\d{3,5}"         # 자릿수가 3 이상 5 이하인 수

m1 = re.findall(p1, text)

print("m1 결과 : ", m1)

