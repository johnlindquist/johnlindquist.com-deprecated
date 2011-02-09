/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 12:01:57 PM
 */
package patterncraft.chain
{
	import com.greensock.TweenMax;

	public class MedivacLink extends HealerChain
	{
		public function MedivacLink()
		{
			graphics.beginFill(0x0000ff);
			graphics.drawCircle(0, 0, 5);
			graphics.endFill();
		}


		override public function heal(marine:Marine):void
		{
			if (!isHealing)
			{
				isHealing = true;

				TweenMax.to(this, 1.5, {x:marine.x, y:marine.y, bezierThrough:[{y:marine.y + 20}], onComplete:displayHealTransition, onCompleteParams:[marine]});
			}
			else
			{
				super.heal(marine);
			}
		}
	}
}