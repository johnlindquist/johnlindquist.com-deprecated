/**
 * User: John Lindquist
 * Date: Sep 21, 2010
 * Time: 11:45:00 PM
 */
package model
{
    public class StatsModel
	{
		protected var _ballClickCount:int;

		public function StatsModel()
		{
			_ballClickCount = 0;
		}

		public function recordBallClick():void
		{
			_ballClickCount++;
		}

		public function get ballClickCount():int
		{
			return _ballClickCount;
		}
	}
}