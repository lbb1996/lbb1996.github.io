var mySwiper=new Swiper(".tabbox .swiper-container",{mode:"horizontal",loop:false,pagination:".swiper-pagination"});var oHtml=document.documentElement;var audios=$S("mediaPlayId");var playcount=0;oHtml.ontouchstart=function(){if(playcount==0){}playcount++};var MediaPlayer={mediaId:"mediaPlayId"};try{MediaPlayer.canPlayM4a=!!(document.createElement("audio").canPlayType("audio/mpeg"));MediaPlayer.canPlayAac=!!document.createElement("audio").canPlayType&&document.createElement("audio").canPlayType('audio/mp4; codecs="mp4a.40.2"')=="probably"}catch(e){}function getMedia(){MediaPlayer.obj=$S(MediaPlayer.mediaId);return MediaPlayer.obj}function getStyle(b,a){if(b.currentStyle){return b.currentStyle[a]}else{return getComputedStyle(b,false)[a]}return(b.currentStyle||getComputedStyle(b,false))[a]}var lrcdata;var lrcList;function lrcinfo(d){lrcList=d;if(!lrcList||lrcList.length==0){$html("lyrtextId","好音质　用酷我")}else{var a=[];var c=0;a[c++]='<div id="llrcId" style="overflow-x: hidden;overflow-y: hidden;">';for(var b=0;b<lrcList.length;b++){if(b==0){a[c++]='<p id="lId'+b+'" class="lyric_now">'}else{a[c++]='<p id="lId'+b+'">'}a[c++]=lrcList[b].lineLyric;a[c++]="</p>"}a[c++]="</div>";$html("lyrtextId",a.join(""))}}var lastLine=0;function moveLrc(){if(!lrcList||lrcList.length==0){return}var g=getMedia().currentTime+1;var d=false;var a=0;var c=0;for(var b=0;b<lrcList.length;b++){if(d==false&&g>=lrcList[b].time&&(b==lrcList.length-1||lrcList[b+1].time>g)){a=b*64;c=b;d=true}}if(a!=0){try{$S("lId"+0).className=""}catch(f){}if(lastLine){try{$S("lId"+lastLine).className=""}catch(f){}}try{$S("lId"+c).className="lyric_now"}catch(f){}lastLine=c;if($S("lId"+c).offsetTop<$query(".lyrics")[0].clientHeight*0.4){a=0}else{if($S("lId"+c).offsetTop>$query("#llrcId")[0].scrollHeight-$query(".lyrics")[0].clientHeight*0.6){a=$query("#llrcId")[0].scrollHeight-$query(".lyrics")[0].clientHeight}else{a=$S("lId"+c).offsetTop-$query(".lyrics")[0].clientHeight*0.4}}try{$S("llrcId").style.webkitTransition="-webkit-transform 500ms ease-out"}catch(f){}try{$S("llrcId").style.transition="transform 500ms ease-out"}catch(f){}try{$S("llrcId").style.webkitTransform="translate(0px,"+-a+"px) scale(1) translateZ(0px)"}catch(f){}try{$S("llrcId").style.transform="translate(0px,"+-a+"px) scale(1) translateZ(0px)"}catch(f){}}}function getTimeM(b){var a="00:00";if(!isNaN(b)){var a=b/60>=10?parseInt(b/60):"0"+parseInt(b/60);totalTimeSec=(b%60>=10?parseInt(b%60):"0"+parseInt(b%60));if(a>99){a="00"}a=a+":"+totalTimeSec}return a}function managerplst(){if(currindex>=queueLi.length-1){currindex=-1}presong()}var ltime=0;function updateMethod(){try{if(isplay==1&&Math.floor(getMedia().currentTime)==1){$S("single_playbtn").style.backgroundImage="url(http://image.kuwo.cn/mpage/html5/2016/pausebtn22.png)"}jsctrl();$html("currtime",getTimeM(getMedia().currentTime));$html("totaltime",getTimeM(curr_total));if(ltime>3){moveLrc();ltime=0}ltime++}catch(a){a.message}}var isplay=1;var duration=0;var curr_total=0;var currindex=-1;var queueLi=$S("single_playlist").getElementsByTagName("li");for(var i=0;i<queueLi.length;i++){queueLi[0].className="clearfix playing";queueLi[0].children[2].className="playstate fl";queueLi[i].setAttribute("index",i)}for(var i=0;i<queueLi.length;i++){queueLi[i].onclick=function(){currindex=parseInt(this.getAttribute("index"));var jsonText=eval("("+this.getAttribute("jsonText")+")");var mid=jsonText.mid;for(var j=0;j<queueLi.length;j++){queueLi[j].className="clearfix";queueLi[j].children[2].className="fl"}this.className="clearfix playing";this.children[2].className="playstate fl";targetSong(this);$S("single_playbtn").style.backgroundImage="url(http://image.kuwo.cn/mpage/html5/2016/pausebtn22.png)";isplay=1}}var pay=0;var online="";function targetSong(obj){var $this=obj;var jsonText=eval("("+$this.getAttribute("jsonText")+")");var mid=jsonText.mid;var queryUrl="/newh5/singles/songinfoandlrc?musicId="+mid;ajax({type:"get",url:queryUrl,dataType:"json",success:function(data){var data=data.data;duration=data.songinfo.duration;var songName=data.songinfo.songName;var artist=data.songinfo.artist;var sid=data.songinfo.id;var pic=data.songinfo.pic;if(!pic||pic.indexOf(".jpg")==-1){pic=defaultpic}$query(".single_pic")[0].children[0].setAttribute("src",pic);$query(".sharepic")[0].children[0].setAttribute("src",pic);$query(".blur")[0].children[0].setAttribute("src",pic);$html("down_single_sname",songName);$html("down_single_aname",artist);document.title="["+songName+"]_"+artist+"-"+songName+"在线试听";var jsonobj={comName:songName,type:"singles"};jsonobj=JSON.stringify(jsonobj);$S("sharearea").setAttribute("data-json",jsonobj);curr_total=parseInt(duration);lrcdata=data.lrclist;lrcinfo(lrcdata);$S("mediaPlayId").src="http://antiserver.kuwo.cn/anti.s?format=aac|mp3&rid=MUSIC_"+mid+"&type=convert_url&response=res";pay=data.songinfo.pay;online=data.songinfo.online;if(isFee(pay,"play")){fnfee()}if(data.songinfo.online=="0"){fnonline()}dqfsurl="http://m.kuwo.cn/yinyue/"+mid;sendtime("http://webstat.kuwo.cn/logtjsj/commsj/commjstj/html5/html5_sum.jpg");if(oldurl.indexOf("ks")>-1){sendtime("http://webstat.kuwo.cn/logtjsj/commsj/commjstj/html5/html5_ks_sum.jpg")}else{if(oldurl.indexOf("360")>-1){sendtime("http://webstat.kuwo.cn/logtjsj/commsj/commjstj/html5/html5_360_sum.jpg")}else{if(oldurl.indexOf("singer")>-1){sendtime("http://webstat.kuwo.cn/logtjsj/commsj/commjstj/html5/html5_singer_sum.jpg")}else{if(oldurl.indexOf("baidu")>-1){sendtime("http://webstat.kuwo.cn/logtjsj/commsj/commjstj/html5/html5_baidu_sum.jpg")}}}}}})}function fnfee(){$display("shadow","block");$query(".paytxt")[0].innerHTML="该歌曲是付费歌曲，<br>必须使用酷我客户端操作";$S("single_down").style.display="block";getMedia().pause();jsctrl();isplay=0;$S("single_playbtn").style.backgroundImage="url(http://image.kuwo.cn/mpage/html5/2016/playbtn2.png)"}function fnonline(){$display("shadow","block");$query(".paytxt")[0].innerHTML="该歌曲已下线，<br>请试听其他歌曲";$S("single_down").style.display="none";$query(".single_down")[0].onclick="";getMedia().pause();jsctrl();isplay=0;$S("single_playbtn").style.backgroundImage="url(http://image.kuwo.cn/mpage/html5/2016/playbtn2.png)"}function isFee(b,c){var a=false;if(typeof(b)!="undefined"){try{b=parseInt(b,10);b=b.toString(16);if(c=="play"){b=b.substr(b.length-1,1)}else{if(c=="down"){b=b.substr(b.length-2,1)}}b=(b.toLocaleLowerCase()=="f")||b&1;if(b!=0){a=true}}catch(d){}}return a}var playlineObj=document.querySelector(".playbar");playlineObj.addEventListener("touchstart",function(d){d.preventDefault();var f=d.targetTouches[0];var a=playlineObj.clientWidth;var c=playlineObj.parentNode.parentNode.offsetLeft;var b=(f.pageX-c)/a*curr_total;getMedia().currentTime=b;jsctrl()},false);function jsctrl(){var b=playlineObj.clientWidth;var a=b*getMedia().currentTime/parseFloat(curr_total);if(a>b){a=b}$S("playline_clone").style.width=a+"px"}function playSong(){if(isFee(pay,"play")){fnfee();return}if(online=="0"){fnonline();return}var a=getStyle($S("single_playbtn"),"backgroundImage");if(a.indexOf("playbtn2")>-1){getMedia().play();jsctrl();isplay=1;$S("single_playbtn").style.backgroundImage="url(http://image.kuwo.cn/mpage/html5/2016/pausebtn22.png)"}else{getMedia().pause();jsctrl();isplay=0;$S("single_playbtn").style.backgroundImage="url(http://image.kuwo.cn/mpage/html5/2016/playbtn2.png)"}}$S("single_list").onclick=function(){$S("single_queue").style.webkitTransition="all linear 0.3s";$S("single_queue").style.webkitTransform="translateY(0px)";$display("downside","none")};$S("queue_close").onclick=function(){$S("single_queue").style.webkitTransition="all linear 0.3s";$S("single_queue").style.webkitTransform="translateY("+queueh4+"px)";$display("downside","block")};var queueh1=parseFloat(getStyle($S("queue_title"),"height").replace("px",""));var queueh2=parseFloat(getStyle($S("queue_close"),"height").replace("px",""));var queueh3=parseFloat(getStyle($S("single_playlist").children[0],"height").replace("px",""));var queuelen=$S("single_playlist").children.length;if(queuelen>4){queuelen=4}$S("queue_content").style.height=queueh3*queuelen+queuelen+50+"px";$S("single_playlist").style.height=queueh3*queuelen+queuelen+"px";var queueh4=queueh3*queuelen+queueh1+queueh2+queuelen;$S("single_queue").style.height=queueh4+"px";$S("single_queue").style.webkitTransform="translateY("+queueh4+"px)";presong();function presong(){targetSong(queueLi[++currindex])}$S("close2").onclick=function(){$display("shadow","none");getMedia().pause();isplay=0};var cutobj=$S("single_playlist").getElementsByClassName("single_sname");var cutobj2=$S("single_playlist").getElementsByClassName("single_aname");cutlongstr(cutobj);cutlongstr(cutobj2);function ctrlplay(){}$S("kbclose").onclick=function(a){config.stopBubble(a);$display("kbbox","none")};$S("kbmsg").onclick=function(){var a=new Image();a.src="http://webstat.kuwo.cn/logtjsj/commsj/commjstj/bdhz/from_h5tencentnews_pv.jpg";var b=this.getAttribute("data-art");setTimeout(function(){window.location.href="http://op.inews.qq.com/opsearch/r?wd="+b+"&refer=openapi_for_kuwoyinyue"},200)};