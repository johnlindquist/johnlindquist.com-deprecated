/**
 * User: John Lindquist
 * Date: Sep 21, 2010
 * Time: 11:45:49 PM
 */
package view
{
	import flash.display.Sprite;

	public class Ball extends Sprite
	{
		protected var color:uint;
		protected var radius:Number = 10;

		public function Ball()
		{
			alpha = 0.75;
			useHandCursor = true;
			buttonMode = true;
			draw();
		}

		public function poke():void
		{
			radius++;
			color = Math.random() * 0xffffff;
			draw();
		}

		public function draw():void
		{
			graphics.clear();
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, radius);
		}
	}
}