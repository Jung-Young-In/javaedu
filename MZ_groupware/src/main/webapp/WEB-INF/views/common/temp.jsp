<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  background: #1f1f1f;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

.cont {
  position: relative;
  overflow: hidden;
  height: 100vh;
  padding: 80px 70px;
}
.cont__inner {
  position: relative;
  height: 100%;
}
.cont__inner:hover .el__bg:after {
  opacity: 1;
}

.el {
  position: absolute;
  left: 0;
  top: 0;
  width: 16%;
  height: 600px;
  background: #252525;
  transition: transform 0.6s 0.7s, width 0.7s, opacity 0.6s 0.7s, z-index 0s 1.3s;
  will-change: transform, width, opacity;
}
.el:not(.s--active) {
  cursor: pointer;
}
.el__overflow {
  overflow: hidden;
  position: relative;
  height: 100%;
}
.el__inner {
  overflow: hidden;
  position: relative;
  height: 100%;
  transition: transform 1s;
}
.cont.s--inactive .el__inner {
  transform: translate3d(0, 100%, 0);
}
.el__bg {
  position: relative;
  width: calc(100vw - 140px);
  height: 100%;
  transition: transform 0.6s 0.7s;
  will-change: transform;
}
.el__bg:before {
  content: "";
  position: absolute;
  left: 0;
  top: -5%;
  width: 100%;
  height: 110%;
  background-size: cover;
  background-position: center center;
  transition: transform 1s;
  transform: translate3d(0, 0, 0) scale(1);
}
.cont.s--inactive .el__bg:before {
  transform: translate3d(0, -100%, 0) scale(1.2);
}
.el.s--active .el__bg:before {
  transition: transform 0.8s;
}
.el__bg:after {
  content: "";
  z-index: 1;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.3);
  opacity: 0;
  transition: opacity 0.5s;
}
.cont.s--el-active .el__bg:after {
  transition: opacity 0.5s 1.4s;
  opacity: 1 !important;
}
.el__preview-cont {
  z-index: 2;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  transition: all 0.3s 1.2s;
}
.cont.s--inactive .el__preview-cont {
  opacity: 0;
  transform: translateY(10px);
}
.cont.s--el-active .el__preview-cont {
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.5s;
}
.el__heading {
  color: #fff;
  text-transform: uppercase;
  font-size: 18px;
}
.el__content {
  z-index: -1;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  padding: 30px;
  opacity: 0;
  pointer-events: none;
  transition: all 0.1s;
}
.el.s--active .el__content {
  z-index: 2;
  opacity: 1;
  pointer-events: auto;
  transition: all 0.5s 1.4s;
}
.el__text {
  text-transform: uppercase;
  font-size: 40px;
  color: #fff;
}
.el__close-btn {
  z-index: -1;
  position: absolute;
  right: 10px;
  top: 10px;
  width: 60px;
  height: 60px;
  opacity: 0;
  pointer-events: none;
  transition: all 0s 0.45s;
  cursor: pointer;
}
.el.s--active .el__close-btn {
  z-index: 5;
  opacity: 1;
  pointer-events: auto;
  transition: all 0s 1.4s;
}
.el__close-btn:before, .el__close-btn:after {
  content: "";
  position: absolute;
  left: 0;
  top: 50%;
  width: 100%;
  height: 8px;
  margin-top: -4px;
  background: #fff;
  opacity: 0;
  transition: opacity 0s;
}
.el.s--active .el__close-btn:before, .el.s--active .el__close-btn:after {
  opacity: 1;
}
.el__close-btn:before {
  transform: rotate(45deg) translateX(100%);
}
.el.s--active .el__close-btn:before {
  transition: all 0.3s 1.4s cubic-bezier(0.72, 0.09, 0.32, 1.57);
  transform: rotate(45deg) translateX(0);
}
.el__close-btn:after {
  transform: rotate(-45deg) translateX(100%);
}
.el.s--active .el__close-btn:after {
  transition: all 0.3s 1.55s cubic-bezier(0.72, 0.09, 0.32, 1.57);
  transform: rotate(-45deg) translateX(0);
}
.el__index {
  overflow: hidden;
  position: absolute;
  left: 0;
  bottom: -80px;
  width: 100%;
  height: 100%;
  min-height: 250px;
  text-align: center;
  font-size: 10vw;
  line-height: 0.85;
  font-weight: bold;
  transition: transform 0.5s, opacity 0.3s 1.4s;
  transform: translate3d(0, 1vw, 0);
}
.el:hover .el__index {
  transform: translate3d(0, 0, 0);
}
.cont.s--el-active .el__index {
  transition: transform 0.5s, opacity 0.3s;
  opacity: 0;
}
.el__index-back, .el__index-front {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
}
.el__index-back {
  color: #2f3840;
  opacity: 0;
  transition: opacity 0.25s 0.25s;
}
.el:hover .el__index-back {
  transition: opacity 0.25s;
  opacity: 1;
}
.el__index-overlay {
  overflow: hidden;
  position: relative;
  transform: translate3d(0, 100%, 0);
  transition: transform 0.5s 0.1s;
  color: transparent;
}
.el__index-overlay:before {
  content: attr(data-index);
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  color: #fff;
  transform: translate3d(0, -100%, 0);
  transition: transform 0.5s 0.1s;
}
.el:hover .el__index-overlay {
  transform: translate3d(0, 0, 0);
}
.el:hover .el__index-overlay:before {
  transform: translate3d(0, 0, 0);
}
.el:nth-child(1) {
  transform: translate3d(0%, 0, 0);
  transform-origin: 50% 50%;
}
.cont.s--el-active .el:nth-child(1):not(.s--active) {
  transform: scale(0.5) translate3d(0%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(1) .el__inner {
  transition-delay: 0s;
}
.el:nth-child(1) .el__bg {
  transform: translate3d(0%, 0, 0);
}
.el:nth-child(1) .el__bg:before {
  transition-delay: 0s;
  background-image: url("https://www.soldevelo.com/blog/wp-content/uploads/What-makes-a-great-programmer-banner-1536x1024-1.jpeg");
}
.el:nth-child(2) {
  transform: translate3d(105.2083333333%, 0, 0);
  transform-origin: 155.2083333333% 50%;
}
.cont.s--el-active .el:nth-child(2):not(.s--active) {
  transform: scale(0.5) translate3d(105.2083333333%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(2) .el__inner {
  transition-delay: 0.1s;
}
.el:nth-child(2) .el__bg {
  transform: translate3d(-19.2%, 0, 0);
}
.el:nth-child(2) .el__bg:before {
  transition-delay: 0.1s;
  background-image: url("https://miro.medium.com/max/1400/1*qFqiylPdiqIJlDrXdiljKQ.jpeg");
}
.el:nth-child(3) {
  transform: translate3d(210.4166666667%, 0, 0);
  transform-origin: 260.4166666667% 50%;
}
.cont.s--el-active .el:nth-child(3):not(.s--active) {
  transform: scale(0.5) translate3d(210.4166666667%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(3) .el__inner {
  transition-delay: 0.2s;
}
.el:nth-child(3) .el__bg {
  transform: translate3d(-38.4%, 0, 0);
}
.el:nth-child(3) .el__bg:before {
  transition-delay: 0.2s;
  background-image: url("https://cdn.shopify.com/s/files/1/0288/3312/0342/articles/How-to-Become-a-Programmer-Your-Florida-Career-Guide.jpg?v=1589955010");
}
.el:nth-child(4) {
  transform: translate3d(315.625%, 0, 0);
  transform-origin: 365.625% 50%;
}
.cont.s--el-active .el:nth-child(4):not(.s--active) {
  transform: scale(0.5) translate3d(315.625%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(4) .el__inner {
  transition-delay: 0.3s;
}
.el:nth-child(4) .el__bg {
  transform: translate3d(-57.6%, 0, 0);
}
.el:nth-child(4) .el__bg:before {
  transition-delay: 0.3s;
  background-image: url("https://www.techrepublic.com/a/hub/i/r/2019/08/14/314f3be4-e099-472e-80c5-086bab447ddd/resize/1200x/f4bf502bb173a44e4ffec13ab0c8fb6e/cryptographer-hiring-kit-photo.jpg");
}
.el:nth-child(5) {
  transform: translate3d(420.8333333333%, 0, 0);
  transform-origin: 470.8333333333% 50%;
}
.cont.s--el-active .el:nth-child(5):not(.s--active) {
  transform: scale(0.5) translate3d(420.8333333333%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(5) .el__inner {
  transition-delay: 0.4s;
}
.el:nth-child(5) .el__bg {
  transform: translate3d(-76.8%, 0, 0);
}
.el:nth-child(5) .el__bg:before {
  transition-delay: 0.4s;
  background-image: url("https://www.roberthalf.com/sites/default/files/2018-05/Hire%20the%20right%20programmer.jpg");
}
.el:nth-child(6) {
  transform: translate3d(526.0416666665%, 0, 0);
  transform-origin: 576.0416666665% 50%;
}
.cont.s--el-active .el:nth-child(6):not(.s--active) {
  transform: scale(0.5) translate3d(526.0416666665%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(6) .el__inner {
  transition-delay: 0.4s;
}
.el:nth-child(6) .el__bg {
  transform: translate3d(-76.8%, 0, 0);
}
.el:nth-child(6) .el__bg:before {
  transition-delay: 0.4s;
  background-image: url("https://www.technotification.com/wp-content/uploads/2017/06/focused-programmer-writing-code.jpg");
}
.el:hover .el__bg:after {
  opacity: 0;
}
.el.s--active {
  z-index: 1;
  width: 100%;
  transform: translate3d(0, 0, 0);
  transition: transform 0.6s, width 0.7s 0.7s, z-index 0s;
}
.el.s--active .el__bg {
  transform: translate3d(0, 0, 0);
  transition: transform 0.6s;
}
.el.s--active .el__bg:before {
  transition-delay: 0.6s;
  transform: scale(1.1);
}

.icon-link {
  position: absolute;
  left: 5px;
  bottom: 5px;
  width: 32px;
}
.icon-link img {
  width: 100%;
  vertical-align: top;
}
.icon-link--twitter {
  left: auto;
  right: 5px;
}
</style>
</head>
<body>
<div class="cont s--inactive">
  <!-- cont inner start -->
  <div class="cont__inner">
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Yoo Eun Ji</h2>
          </div>
          <div class="el__content">
            <div class="el__text">유은지</div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">PL</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="PL">PL</div>
        </div>
      </div>
    </div>
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Jeong Yoo Jin</h2>
          </div>
          <div class="el__content">
            <div class="el__text">정유진</div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">AA</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="AA">AA</div>
        </div>
      </div>
    </div>
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Jeong Young In</h2>
          </div>
          <div class="el__content">
            <div class="el__text">정영인</div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">DA</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="DA">DA</div>
        </div>
      </div>
    </div>
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Jeon Jae Su</h2>
          </div>
          <div class="el__content">
            <div class="el__text">전재수</div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">TA</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="TA">TA</div>
        </div>
      </div>
    </div>
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Park Yae Jin</h2>
          </div>
          <div class="el__content">
            <div class="el__text">박예진</div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">UA</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="UA">UA</div>
        </div>
      </div>
    </div>
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Park Sang Young</h2>
          </div>
          <div class="el__content">
            <div class="el__text">박상영</div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">BA</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="BA">BA</div>
        </div>
      </div>
    </div>
    <!-- el end -->
  </div>
  <!-- cont inner end -->
</div>
<script>
var $cont = document.querySelector('.cont');
var $elsArr = [].slice.call(document.querySelectorAll('.el'));
var $closeBtnsArr = [].slice.call(document.querySelectorAll('.el__close-btn'));

setTimeout(function() {
  $cont.classList.remove('s--inactive');
}, 200);

$elsArr.forEach(function($el) {
  $el.addEventListener('click', function() {
    if (this.classList.contains('s--active')) return;
    $cont.classList.add('s--el-active');
    this.classList.add('s--active');
  });
});

$closeBtnsArr.forEach(function($btn) {
  $btn.addEventListener('click', function(e) {
    e.stopPropagation();
    $cont.classList.remove('s--el-active');
    document.querySelector('.el.s--active').classList.remove('s--active');
  });
});


</script>
</body>
</html>