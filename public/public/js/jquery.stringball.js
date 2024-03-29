﻿/*

	StringBall ver2.1 for jQuery(gt Ver 1.3.2) 
	Developped  by Coichiro Aso
	Copyright Codesign.verse 2009　http://codesign.verse.jp/
	Licensed under the MIT license:http://www.opensource.org/licenses/mit-license.php/

	コピーライト書いてますが、削除しない限り
	ご自由にお使い頂けます
	ただし使用の際は、自己責任でお願いします。

-------------------------------------------------------------------------------------------*/

/*note
バージョンアップ情報
(2.1　2010/4/21)
・要素の数に応じて、奇麗に文字が配置されるようになりました。（あくまでも自分の美的感覚です）
・コンテンツの配置場所に応じて、軸の角度が正常に計算されていなかったバグを修正しました。（た、たぶん大丈夫かと）
・初期設定のフレームレートを60から30に下げました。
・上記に伴い、フレームレートを設定するオプションを追加しました。
・スクリプトの記述を見直しました。
------------------------------------------------------------------------------------------*/
(function($){

	$.fn.stringball=function(options){

		var defaults={	
			camd:1000,
			radi:250,
			speed:40,
			framerate:30
		};

	var options = $.extend(defaults, options);

	var target=$(this);
	var elem=$("h2" ,target);
	var scrz=500;
	var radi=options.radi;
	var camd=options.camd;
	var speed=options.speed;
	var frn=Math.floor(1000/options.framerate);
	var elemLength=elem.length;
	window.setSpeed = function(x) { speed = x; }
	var xs=[];
	var ys=[];
	var zs=[];
	var fw=[];
	var fh=[];
	
/*	
	var axang=0;
	var accx=0;
	var accy=0;
	var rotec=0;
	var rotes=0;
*/	
	var ac=0;
	var as=0;
	var roteang=0;
	var looptimer=0;

	var itxpos = target.offset().left;
	var itw = target.width();
	var itypos=target.offset().top;
	var ith=target.height();

		function setini(){
			var anga=0;
			var angb=0;
			for(i=0;i<elemLength;i++){
			anga= Math.acos((2 * (i + 1) - 1) / elem.length - 1);
			angb= Math.sqrt(elem.length * Math.PI) * anga;
			fw[i]=$(elem[i]).width()/2;
			fh[i]=$(elem[i]).height()/2;
			xs[i]=radi*Math.cos(angb)*Math.sin(anga);
			ys[i]=radi*Math.cos(anga);
			zs[i]=radi*Math.sin(angb)*Math.sin(anga);
			
			/*
			elem[i].xpos=radi*Math.cos(angb)*Math.sin(anga);
			elem[i].zpos=radi*Math.cos(anga);
			elem[i].ypos=radi*Math.sin(angb)*Math.sin(anga);
			*/
			}
		}

		function setpos(){

			//回転距離計算
			var rotec=Math.cos(roteang);
			var rotes=Math.sin(roteang);

			
			for(i=0;i<elemLength;i++){
				
				/*
				//軸まわりの回転処理
				var xpos=elem[i].xpos*(Math.pow(ac,2)+(1-Math.pow(ac,2))*rotec)+elem[i].ypos*(ac*as*(1-rotec))-elem[i].zpos*(as*rotes);
				var ypos=elem[i].xpos*(ac*as*(1-rotec))+elem[i].ypos*(Math.pow(as,2)+(1-Math.pow(as,2))*rotec)+elem[i].zpos*(ac*rotes);
				var zpos=elem[i].xpos*as*rotes-elem[i].ypos*ac*rotes+elem[i].zpos*rotec;
				*/
				var xpos=xs[i]*(ac*ac*(1-rotec)+rotec)+ys[i]*(ac*as*(1-rotec))-zs[i]*(as*rotes);
				var ypos=xs[i]*(ac*as*(1-rotec))+ys[i]*(as*as*(1-rotec)+rotec)+zs[i]*(ac*rotes);
				var zpos=xs[i]*as*rotes-ys[i]*ac*rotes+zs[i]*rotec;
				
				//基本位置更新
				xs[i]=xpos;
				ys[i]=ypos;
				zs[i]=zpos;
				
				//スケール簡易計算
				var scale=scrz/(camd-zpos);

				var myx=xpos*scale+(itw>>1)-fw[i] | 0;
				var myy=ypos*scale+(ith>>1)-fh[i] | 0;
				var myscale=scale*100 | 0 ;
				
				//座標更新
				elem[i].style.left=myx+"px";
				elem[i].style.top=myy+"px";
				elem[i].style.fontSize=myscale+"%";
				elem[i].style.opacity=scale;
	
			}
			
			//マウスオーバーキャンセル
			return false;
		}
		
		//初期設定実行
		setini();
		setpos();
		
		//マウスホバー
		target.hover(
		function(){

			//安心のclearInterval
			clearInterval(looptimer);
			//ループ処理発動
			looptimer=setInterval(setpos,frn);
		},
		//マウスアウト時
		function(){
			//ループ処理終了
			clearInterval(looptimer);
		});
		
		//コンテンツ内のマウス座標取得
		target.mousemove(function(e){
				
			var accx = (e.pageX-itxpos-(itw>>1))/itw;
			var accy = (e.pageY-itypos-(ith>>1))/ith;
			
			//回転スピード計算　結構雑な計算だから改良の余地あり。
			roteang=(Math.max(Math.abs(accx),Math.abs(accy)))/100*speed;
			
			//任意の軸
			var axang=Math.PI/2+Math.atan2(accy,accx);
			
			//軸の単位方向ベクトル
			ac=Math.cos(axang);
			as=Math.sin(axang);
			
		});

	}
})(jQuery);

