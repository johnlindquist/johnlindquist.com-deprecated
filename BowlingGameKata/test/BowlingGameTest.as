package
{
	import org.flexunit.Assert;

	public class BowlingGameTest
	{
		private var game:BowlingGame;

		[Before]
		public function runBeforeEveryTest():void
		{
			game = new BowlingGame();
		}

		[After]
		public function runAfterEveryTest():void
		{
			game = null;
		}

		[Test]
		public function testGutterGame():void
		{
			rollMany(20, 0);
			Assert.assertEquals(0, game.score);
		}

		[Test]
		public function testAllOnes():void
		{
			rollMany(20, 1);
			Assert.assertEquals(20, game.score);
		}

		[Test]
		public function testOneSpare():void
		{
			rollSpare();
			game.roll(3);
			rollMany(17, 0);
			Assert.assertEquals(16, game.score);
		}
		
		[Test]
		public function testTwoSpares():void
		{
			rollSpare();
			game.roll(3);
			game.roll(0);
			rollSpare();
			game.roll(3);
			rollMany(13, 0);
			Assert.assertEquals(32, game.score);
		}

		[Test]
		public function testOneStrike():void
		{
			rollStrike();
			game.roll(3);
			game.roll(4);
			rollMany(16, 0);
			Assert.assertEquals(24, game.score);
		}

		[Test]
		public function testTwoSeparatedStrikes():void
		{
			rollStrike();
			game.roll(0);
			game.roll(0);
			rollStrike();
			game.roll(0);
			game.roll(0);
			rollMany(13, 0);
			Assert.assertEquals(20, game.score);
		}


		[Test]
		public function testAllFours():void
		{
			rollMany(20, 4);
			Assert.assertEquals(80, game.score);
		}

		[Test]
		public function testAllFives():void
		{
			rollMany(21, 5);
			Assert.assertEquals(150, game.score);
		}

		[Test]
		public function testPerfectGame():void
		{
			rollMany(12, 10);
			Assert.assertEquals(300, game.score);
		}

		private function rollStrike():void
		{
			game.roll(10);
		}

		private function rollSpare():void
		{
			game.roll(5);
			game.roll(5);
		}

		private function rollMany(totalRolls:int, pins:int):void
		{
			for (var i:int = 0; i < totalRolls; i++)
			{
				game.roll(pins);
			}
		}
	}
}