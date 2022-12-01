import re

'''
아래에 정규표현식을 직접 입력해보세요!
'''

p1 = "[\w]"       # [\w] == [A-Za-z0-9_]        # 알파벳 대소문자, 숫자, 밑줄만 매치
p2 = "[\W]"       # [\w] == [^A-Za-z0-9_]        # 7행의 조건과 반대 조건

m1 = re.findall(p1, "el_ice%20$19")
m2 = re.findall(p2, "el_ice%20$19")

print("m1 결과 : ", m1)
print("m2 결과 : ", m2)