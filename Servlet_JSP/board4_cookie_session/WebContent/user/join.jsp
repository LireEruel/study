<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <% String root = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link href="<%= root %>/assets/css/app.css" rel="stylesheet" />
    <title>SSAFY</title>
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="orange">회원가입</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <form id="form-join" method="POST" action="">
            <div class="mb-3">
              <label for="username" class="form-label">이름 : </label>
              <input
                type="text"
                class="form-control"
                id="username"
                name="username"
                placeholder="이름..."
              />
            </div>
            <div class="mb-3">
              <label for="userid" class="form-label">아이디 : </label>
              <input
                type="text"
                class="form-control"
                id="userid"
                name="userid"
                placeholder="아이디..."
              />
            </div>
            <div id="id-result" class="mb-3"></div>
            <div class="mb-3">
              <label for="userpwd" class="form-label">비밀번호 : </label>
              <input
                type="text"
                class="form-control"
                id="userpwd"
                name="userpwd"
                placeholder="비밀번호..."
              />
            </div>
            <div class="mb-3">
              <label for="pwdcheck" class="form-label">비밀번호확인 : </label>
              <input
                type="text"
                class="form-control"
                id="pwdcheck"
                placeholder="비밀번호확인..."
              />
            </div>
            <div class="mb-3">
              <label for="emailid" class="form-label">이메일 : </label>
              <div class="input-group">
                <input
                  type="text"
                  class="form-control"
                  id="emailid"
                  name="emailid"
                  placeholder="이메일아이디"
                />
                <span class="input-group-text">@</span>
                <select
                  class="form-select"
                  id="emaildomain"
                  name="emaildomain"
                  aria-label="이메일 도메인 선택"
                >
                  <option selected>선택</option>
                  <option value="ssafy.com">싸피</option>
                  <option value="google.com">구글</option>
                  <option value="naver.com">네이버</option>
                  <option value="kakao.com">카카오</option>
                </select>
              </div>
            </div>
            <!-- 
            <div class="mb-3">
              <label for="sido" class="form-label">지역 : </label>
              <div class="input-group">
                <select class="form-select me-1" id="sido" aria-label="시도">
                  <option selected>시도선택</option>
                  <option value="1100000000">서울특별시</option>
                  <option value="2200000000">경기도</option>
                  <option value="3300000000">강원도</option>
                  <option value="4400000000">충청도</option>
                </select>
                <select class="form-select" id="gugun" aria-label="구군">
                  <option selected>구군선택</option>
                  <option value="1111000000">종로구</option>
                  <option value="1112000000">중구</option>
                  <option value="1113000000">서초구</option>
                  <option value="1114000000">강남구</option>
                </select>
              </div>
            </div>
             -->
            <div class="col-auto text-center">
              <button
                type="button"
                id="btn-join"
                class="btn btn-outline-primary mb-3"
              >
                회원가입
              </button>
              <button type="button" class="btn btn-outline-success mb-3">
                초기화
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <script>
      let resultDiv = document.querySelector("#id-result");
  	  let isValidId = false;
      document.querySelector("#userid").addEventListener("keyup", (e) => {
        let userid = e.target.value;

        let len = userid.length;
        if (len < 4 || len > 16) {
          resultDiv.innerHTML = "아이디는 4자이상 16자리 이하입니다.";
          resultDiv.classList.add("mb-3");
          resultDiv.classList.add("primary");
        } else {
          resultDiv.innerHTML = "";
          resultDiv.classList.remove("mb-3");
          resultDiv.classList.remove("primary");
          isValidId = false;
          let url = "<%= root %>/user?action=idcheck&checkid=" + userid;
          fetch(url)
            .then(res => res.text())
            .then(data => resultView(data));
        }
      });

      function resultView(data) {

        let val = data.split(",");
        let id = val[0];
        let cnt = val[1];
        console.log(val, id, cnt);
        if (cnt == 0) {
          resultDiv.innerHTML = id + "는 사용가능합니다.";
          resultDiv.classList.add("text-primary");
          isValidId = true;
        } else {
          resultDiv.innerHTML = id + "는 사용 불가능 합니다.";
          resultDiv.classList.add("text-danger");
          isValidId = false;
        }
      }
      document
        .querySelector("#btn-join")
        .addEventListener("click", function () {
          if (!document.querySelector("#username").value) {
            alert("이름 입력!!");
            return;
          } else if (!document.querySelector("#userid").value) {
            alert("아이디 입력!!");
            return;
          }else if (!isValidId){
        	alert("아이디 유효성 체크");
        	return;
          }  
          else if (!document.querySelector("#userpwd").value) {
            alert("비밀번호 입력!!");
            return;
          } else if (
            document.querySelector("#userpwd").value !=
            document.querySelector("#pwdcheck").value
          ) {
            alert("비밀번호 확인!!");
            return;
          } else {
            let form = document.querySelector("#form-join");
            form.setAttribute("action", "<%= root %>/user?action=join");
            form.submit();
          }
        });
    </script>
  </body>
</html>
