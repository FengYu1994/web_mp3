一、功能：
	在浏览器中播放mp3文件

二、范围：
	支持HTML5 Audio标签，且支持播放MP3格式文件：Chrome、Opera、IE9+、Edge
	安装了Flash插件：Firefox、IE6-8
 	移动设备支持情况：UC、QQ、百度、微信、opera、chrome

三、使用方法（例）：
	var music = new Music('1.mp3', 'audio/mpeg', {'init' : v_init, 'play' : v_play, 'stop' : v_stop}, {'init' : e_init});
	music.init();
      
四、代码结构：
      1、浏览器判断
      2、Music对象
      3、视图、事件方法回调具体实现
      
五、对象、变量。方法介绍：
	5.1、浏览器判断
		exports.name：浏览器类别 （chrome|firefox|ie|opera|edge等）
		exports.version: ie获取的是(6|7|8|9|10|11)大版本号，其余浏览器获取具体版本号
      
	5.2、Music对象
		外部方法：
			Music(url, type, viewCallback, eventCallback)
			功能：
				初始化Music对象
			参数：
				url: 音乐地址（本地|网络地址）
				type: 音乐类型 (目前仅支持audio|mpeg)
				viewCallback: 视图回调
				eventCallback: 事件回调
            
            init()
			功能：
				创建Audio或[Object|embed]对象，加载MP3资源
				赋值给this.musicEl，并声明this.musicEl的控制方法(play|stop|getPaused)
            
            emit()
			功能：
          		根据paused值，调用play()或stop()方法	
		内部方法：
			createAudioPlayer()
			功能：
				创建Audio对象
            
            createSwfPlayer()
			功能：
				创建object或embed对象
          	
          	play()
      		功能：
      			播放音乐，并调用播放视图回调
      			
      		stop()
      		功能：
      			停止音乐，并调用停止视图回调
      
	5.3、公共方法
		canPlayAudioMP3()
		功能：
			判断浏览器能否使用audio标签播放mp3文件
	        
		flashhtml(movieName, src, data)
		功能：
			根据浏览器版本创建不同的flash节点
		参数：
			moveieName ：flash元素的id或name
			src ：调用的swf文件
			data ：传递的参数
	      
		addEvent(el, etype, fn)
		功能：
			兼容绑定事件(addEventListenerattachEvent)
		参数：
			el ：绑定事件的元素
			etpe ：事件类型（click等）
			fn ：绑定的方法
	        
		m_console(msg)
		功能：
			支持console的情况下，在控制台输出信息
		参数：
			msg ：需要控制台输出的信息
            
	5.4、视图回调（可自定义拓展）
		v_init()
		功能：
			音频对象初始化后，视图回调
	        
		v_play()
		功能：
			音频对象播放被触发时，视图回调
	        
		v_stop()
		功能：
			音频对象停止被触发时，视图回调
	        
		e_init()
		功能：
			音频对象初始化后，前端事件绑定
			
六、不足
	仍有局限性，在不支持flash和audio标签的浏览器上（如mobile firefox）无法播放

七、致谢
	@DamonOehlman （thank you for browser.js） 一段很精简的浏览器类型判断的js代码
	@breily (thank you for jquery.player.js， show me a way that javasript communicate with actionsript ) 
	
	资料：
	http://zhidao.baidu.com/link?url=uqxSdCloRVdp-Hwkj46SGgnCl5h1v_JHpw8tTCbyq1yYT8CMEjOnOjvfHUAXpGFWKXiETKF585HyudAYbOQ1Ja
	判断浏览器是否支持audio标签，且支持audio mp3播放
	http://www.cnblogs.com/cos2004/p/3525111.html
	IE8以下，需要减少addCallback数量至3个以内，从而解决js报错
	
            
