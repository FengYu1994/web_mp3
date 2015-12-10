// music.as
//
// by: Brian Reily (brianreily.com)
// based on plugin from digitalxero.net/music/index.html
//
// Compile with mtasc (www.mtasc.org):
// mtasc -main music.as -swf music.swf -header 450:325:20 -version 8 -group

import flash.external.ExternalInterface;

class Music {
    static var app:Music;
    var sound:Sound;
    var paused:Number;

    // Constructor, plus adds all the JS callbacks
    function Music() {
        this.sound = new Sound();
		paused = 0;
        ExternalInterface.addCallback("emit",  this, emit);
		ExternalInterface.addCallback("getPaused",  this, getPaused);
    }

	public function emit(action:String, arg:String) {
		switch(action){
			case 'load':
				this.load(arg);
				break;
			case 'play':
				this.play();
				break;
			case 'stop':
				this.stop();
				break;
		}
	}
	
	public function getPaused() {
		return paused;
	}
	
    private function load(url:String) {
        this.sound.loadSound(url, true);
        this.sound.onSoundComplete = function() {
        	this.paused = 0;
            ExternalInterface.call("v_stop");
        };
    }

    private function play() {
    	this.paused = 1;
        this.sound.start(0);
    }

    private function stop() {
    	this.paused = 0;
        this.sound.stop();
    }

    static function main(mc:MovieClip) {
        app = new Music();
    }
}
