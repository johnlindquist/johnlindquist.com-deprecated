/**
 * User: John Lindquist
 * Date: 1/4/11
 * Time: 9:50 AM
 */
package game
{
	public class FrameRules
	{
		private var pinsPerFrame:int;

		public function FrameRules(pinsPerFrame:int)
		{
			this.pinsPerFrame = pinsPerFrame;
		}

		public function determineBehavior(pins:int, frameScore:int):AddPinsBehavior
		{
			var isStrike:Boolean = (pins == pinsPerFrame);
			if (isStrike)
			{
				return new StrikeBehavior();
			}

			var isSpare:Boolean = (frameScore == pinsPerFrame);
			if (isSpare)
			{
				return new SpareBehavior();
			}

			return new NotAllPinsBehavior();
		}
	}
}