/**
 * User: John Lindquist
 * Date: 2/9/11
 * Time: 1:10 AM
 */
package patterncraft.chain
{
	import com.greensock.TweenMax;

	import flash.display.Sprite;

	public class HealerChain extends Sprite
	{
		protected var isHealing:Boolean = false;
		protected var nextHealer:HealerChain;

		public function setNextMedivac(healer:HealerChain):void
		{
			nextHealer = healer;
		}

		public function heal(marine:Marine):void
		{
			if (nextHealer)
			{
				nextHealer.heal(marine);
			}
		}

		protected function displayHealTransition(marine:Marine):void
		{
			TweenMax.to(marine, marine.health * 5, {colorTransform:{tint:0xff0000, tintAmount:0}, health:.99, onComplete:onHealComplete, onCompleteParams:[marine]});
		}

		protected function onHealComplete(marine:Marine):void
		{
			isHealing = false;
			marine.health = 1;
			//finalize tint
			TweenMax.to(marine, 0, {colorTransform:{tint:0xff0000, tintAmount:0}});
		}
	}
}