<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp"%>

<div class="row">
	<div>
		<div class="card">
			<div class="card-header">
				<h4>Line Area Chart</h4>
			</div>
			<div class="card-body">
				<div id="area"></div>
				<h1>수정</h1>
			</div>
		</div>
	</div>
	<div>
		<div class="card">
			<div class="card-header">
				<h4>Radial Gradient Chart</h4>
			</div>
			<div class="card-body">
				<div id="radialGradient"></div>
			</div>
		</div>
	</div>
</div>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
	    var w = window;
		    if (w.ChannelIO) {
		      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
		    }
	    var ch = function() {
	      ch.c(arguments);
    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      	l();
    } else if (window.attachEvent) {
      	window.attachEvent('onload', l);
    } else {
     	window.addEventListener('DOMContentLoaded', l, false);
     	window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "2d01734a-cbdf-4f33-b485-746dd3e743e8"
  });
</script>
<!-- End Channel Plugin -->
<%@ include file="../include/bottom.jsp"%>