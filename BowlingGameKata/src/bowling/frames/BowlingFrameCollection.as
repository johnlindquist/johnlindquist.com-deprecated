/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 6:31 PM
 */
package bowling.frames
{
	import bowling.rules.FrameRules;

	import flash.events.Event;

	public class BowlingFrameCollection
	{
		private var bowlingGameFrames:Array = new Array();
		private var currentFrameIndex:int = 0;
		private var totalFrames:int;
		
		public function BowlingFrameCollection(frameRules:FrameRules, totalFrames:int)
		{
			this.totalFrames = totalFrames;

			var bowlingFrame:BowlingFrame;

			bowlingFrame = createFrame(frameRules); //don't add previous to the first frame
			for (var i:int = 1; i < totalFrames; i++)
			{
				bowlingFrame = createFrame(frameRules);
				var previousBowlingFrame:BowlingFrame = bowlingGameFrames[i - 1] as BowlingFrame;
				bowlingFrame.setPreviousFrame(previousBowlingFrame);
			}
		}
		
		private function createFrame(frameRules:FrameRules):BowlingFrame
		{
			var bowlingFrame:BowlingFrame = new BowlingFrame(frameRules);
			bowlingFrame.addEventListener(Event.CLOSE, onBowlingFrameClose);
			bowlingGameFrames.push(bowlingFrame);
			return bowlingFrame;
		}

		public function getScore():int
		{
			var score:int = 0;
			
			for (var i:int = 0; i < bowlingGameFrames.length; i++)
			{
				var bowlingFrame:BowlingFrame = bowlingGameFrames[i];
				score += bowlingFrame.score;
			}
			
			return score;
		}

		public function roll(pins:int):void
		{
			currentFrame.addPins(pins);
		}

		private function get currentFrame():BowlingFrame
		{
			return bowlingGameFrames[currentFrameIndex];
		}

		private function onBowlingFrameClose(event:Event):void
		{
			if(currentFrameIndex < totalFrames - 1)
			{
				currentFrameIndex++;
			}
		}
	}
}