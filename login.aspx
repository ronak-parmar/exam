﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="kyubi.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <!-- <style>/* ---- reset ---- */ body{ margin:0; font:normal 75% Arial, Helvetica, sans-serif; } 
             canvas{ display: block; vertical-align: bottom; }
/* ---- particles.js container ---- */ #particles-js{ position:absolute; width: 100%; height: 100%;
background-color: #232741;;
background-repeat: no-repeat; background-size: 20%; background-position: 50% 50%; }
/* ---- stats.js ---- */ .count-particles{ background: #000022;position: absolute; top: 48px; left: 0;
width: 80px; color: #13E8E9; font-size: .8em; text-align: left; text-indent: 4px;
line-height: 14px; padding-bottom: 2px; font-family: Helvetica, Arial, sans-serif; font-weight: bold; } .js-count-particles{ font-size: 1.1em; } #stats, .count-particles{ -webkit-user-select: none; margin-top: 5px; margin-left: 5px; } #stats{ border-radius: 3px 3px 0 0; overflow: hidden; } .count-particles{ border-radius: 0 0 3px 3px; }</style>
      -->
    <div id="particles-js">
        <form id="form1" runat="server">
        <div class="auto-style1">

            Email:-<asp:TextBox ID="Email" runat="server"></asp:TextBox>

            <br />
            Password:-<asp:TextBox ID="Password"  runat="server"></asp:TextBox>
        </div>
        <p>
           <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        &nbsp;
            <asp:Label ID="Mesg" runat="server" ForeColor="Red" Text=""></asp:Label>
        </p>
    </form>
        </div> 

    <!--<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script src="https://threejs.org/examples/js/libs/stats.min.js"></script>
    <script>particlesJS("particles-js", { "particles": { "number": { "value": 433, "density": { "enable": true, "value_area": 800 } }, "color": { "value": "#ffd700" }, "shape": { "type": "circle", "stroke": { "width": 0, "color": "#000000" }, "polygon": { "nb_sides": 5 }, "image": { "src": "img/github.svg", "width": 100, "height": 100 } }, "opacity": { "value": 0.4081697986362324, "random": true, "anim": { "enable": true, "speed": 1, "opacity_min": 0, "sync": false } }, "size": { "value": 8, "random": true, "anim": { "enable": true, "speed": 7, "size_min": 11.348161597821159, "sync": true } }, "line_linked": { "enable": false, "distance": 150, "color": "#ffffff", "opacity": 0.4, "width": 1 }, "move": { "enable": true, "speed": 1, "direction": "none", "random": true, "straight": false, "out_mode": "out", "bounce": false, "attract": { "enable": false, "rotateX": 600, "rotateY": 600 } } }, "interactivity": { "detect_on": "canvas", "events": { "onhover": { "enable": true, "mode": "bubble" }, "onclick": { "enable": true, "mode": "remove" }, "resize": true }, "modes": { "grab": { "distance": 400, "line_linked": { "opacity": 1 } }, "bubble": { "distance": 133.7461902600351, "size": 0, "duration": 2, "opacity": 0, "speed": 3 }, "repulse": { "distance": 400, "duration": 0.4 }, "push": { "particles_nb": 4 }, "remove": { "particles_nb": 2 } } }, "retina_detect": true }); var count_particles, stats, update; stats = new Stats; stats.setMode(0); stats.domElement.style.position = 'absolute'; stats.domElement.style.left = '0px'; stats.domElement.style.top = '0px'; document.body.appendChild(stats.domElement); count_particles = document.querySelector('.js-count-particles'); update = function () { stats.begin(); stats.end(); if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) { count_particles.innerText = window.pJSDom[0].pJS.particles.array.length; } requestAnimationFrame(update); }; requestAnimationFrame(update);;</script>
    -->
</body>
</html>
