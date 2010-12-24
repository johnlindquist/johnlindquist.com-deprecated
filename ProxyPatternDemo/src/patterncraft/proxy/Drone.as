/**
 * User: John Lindquist
 * Date: 12/23/10
 * Time: 6:28 PM
 */
package patterncraft.proxy
{
	import com.greensock.TweenMax;

	import flash.display.Sprite;

	public class Drone extends Sprite implements Zerg
	{
		public function Drone()
		{
			graphics.beginFill(0x00ff00);
			graphics.drawRect(-25, -25, 50, 50);
			graphics.endFill();
		}

		public function move(xPos:Number, yPos:Number):void
		{
			TweenMax.to(this, 1, {x:xPos, y:yPos});
		}
	}
}