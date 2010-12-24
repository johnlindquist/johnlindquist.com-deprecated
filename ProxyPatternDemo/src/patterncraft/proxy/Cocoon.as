/**
 * User: John Lindquist
 * Date: 12/23/10
 * Time: 6:25 PM
 */
package patterncraft.proxy
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;

	public class Cocoon extends Sprite implements Zerg
	{
		private var drone:Drone;
		private var rallyPoint:Point;

		public function Cocoon()
		{
			graphics.beginFill(0xcccccc);
			graphics.drawRect(-25, -25, 50, 50);
			graphics.endFill();
			
			
			var timer:Timer = new Timer(3000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			timer.start();
		}

		private function onTimerComplete(event:TimerEvent):void
		{
			drone = new Drone();
			graphics.clear();

			addChild(drone);
			
			if(rallyPoint)
			{
				drone.move(rallyPoint.x, rallyPoint.y);
			}
			
		}

		public function move(xPos:Number, yPos:Number):void
		{
			if (drone)
			{
				drone.move(xPos, yPos)
			}
			else
			{
				rallyPoint = new Point(xPos, yPos);
			}
		}
	}
}