package{
	import flash.display.Sprite;
	import flash.events.StatusEvent;
	import flash.media.Camera;
	import flash.media.Video;

	public class ExampleWebCameraAccess extends Sprite{
		private var camera:Camera = Camera.getCamera();
		private var video:Video = new Video();
		private var value:String;
		public function ExampleWebCameraAccess(){ 
			if(camera != null){
				camera.addEventListener(StatusEvent.STATUS, statusHandler);
				//camera.setMode(320, 240, 60);
				video.attachCamera(camera);
				this.addChild(video);
			}
		}
		private function statusHandler(event:StatusEvent):void{
			if(camera.muted){
				trace("Unable to connect to active camera!");
			}else{
				// Resize Video object to match camera settings and 
				// add the video to the display list. 
				// можно установить значения 320 x 240 это по умолчанию
				video.width = camera.width;
				video.height = camera.height;
			}
			// Remove the status event listener.
			camera.removeEventListener(StatusEvent.STATUS, statusHandler); 
		}
		
	}
}