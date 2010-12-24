package
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	import patterncraft.proxy.Cocoon;
	import patterncraft.proxy.Zerg;

	[SWF(frameRate="60", backgroundColor="0xffffff")]
	public class ProxyPatternDemo extends Sprite
	{
		private var drone:Zerg;
		public function ProxyPatternDemo()
		{
			stage.addEventListener(MouseEvent.CLICK, onMouseClick)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown)
		}

		private function onKeyDown(event:KeyboardEvent):void
		{
			drone = new Cocoon();
			addChild(DisplayObject(drone));
		}

		private function onMouseClick(event:MouseEvent):void
		{
			drone.move(mouseX, mouseY);
		}
	}
}
