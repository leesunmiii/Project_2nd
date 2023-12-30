<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>스크롤 메뉴</title>
  <style type="text/css">
  body {
  margin: 0;
  font-family: 'Arial', sans-serif;
}

header {
  background-color: #333;
  padding: 10px 0;
  position: fixed;
  width: 100%;
  top: -60px;
  transition: top 0.3s;
}

nav {
  text-align: center;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

nav li {
  display: inline-block;
  margin-right: 20px;
}

nav a {
  text-decoration: none;
  color: white;
  font-size: 18px;
}

section {
  padding: 80px 20px;
}
</style>
<script type="text/javascript">
let prevScrollpos = window.pageYOffset;

window.onscroll = function() {
  let currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.querySelector("header").style.top = "0";
  } else {
    document.querySelector("header").style.top = "-60px";
  }
  prevScrollpos = currentScrollPos;
};
</script>
</head>
<body>
<div class="container">
  <header>
    <nav>
      <ul>
        <li><a href="#">메뉴1</a></li>
        <li><a href="#">메뉴2</a></li>
        <li><a href="#">메뉴3</a></li>
      </ul>
    </nav>
  </header>

  <section>
   <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
   ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
   d
   d
   d
   d
   d
   d
   dd
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   dd
   d
   d
   d
   d
   
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   d
   dd
   
   </p>
  </section>
</div>
</body>
</html>