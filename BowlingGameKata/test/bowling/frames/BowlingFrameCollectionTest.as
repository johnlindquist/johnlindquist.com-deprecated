package bowling.frames{
	import bowling.rules.StandardRules;

	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.object.equalTo;

	public class BowlingFrameCollectionTest
	{
		private var game:BowlingFrameCollection;

		[Before]
		public function runBeforeEveryTest():void
		{
			//10 pins per frame, 2 rolls per frame
			var standardRules:StandardRules = new StandardRules(10, 2);
			//10 frames
			game = new BowlingFrameCollection(standardRules, 10);
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
			assertEquals(0, game.getScore());
			
			var frames:Array = game.getFrames();

			for (var i:int = 0; i < 10; i++)
			{
				var frame:Array = BowlingFrame(frames[i]).rolls;
				assertThat(frame, equalTo([0, 0]));
			}
		}

		[Test]
		public function testAllOnes():void
		{
			rollMany(20, 1);
			assertEquals(20, game.getScore());
		}

		[Test]
		public function testOneSpare():void
		{
			rollSpare();
			game.roll(3);
			rollMany(17, 0);
			assertEquals(16, game.getScore());
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
			assertEquals(32, game.getScore());
		}

		[Test]
		public function testOneStrike():void
		{
			rollStrike();
			game.roll(3);
			game.roll(4);
			rollMany(16, 0);
			assertEquals(24, game.getScore());
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
			assertEquals(20, game.getScore());
		}


		[Test]
		public function testAllFours():void
		{
			rollMany(20, 4);
			assertEquals(80, game.getScore());
		}

		[Test]
		public function testAllFives():void
		{
			rollMany(21, 5);
			assertEquals(150, game.getScore());
		}

		[Test]
		public function testPerfectGame():void
		{
			rollMany(12, 10);
			assertEquals(300, game.getScore());

			var frames:Array = game.getFrames();

			for (var i:int = 0; i < 9; i++)
			{
				var frame:Array = BowlingFrame(frames[i]).rolls;
				assertThat(frame, equalTo([10]));
			}

			var frame:Array = BowlingFrame(frames[9]).rolls;
			assertThat(frame, equalTo([10, 10, 10]));
		}

		[Test]
		public function testGameVariation1():void
		{
			game.roll(4);
			game.roll(2);
			game.roll(2);
			game.roll(3);
			game.roll(0);
			game.roll(9);
			game.roll(1);
			game.roll(9);
			game.roll(5);
			game.roll(2);
			game.roll(10);
			game.roll(10);
			game.roll(7);
			game.roll(3);
			game.roll(1);
			game.roll(4);
			game.roll(3);
			game.roll(2);
			assertEquals(110, game.getScore());

			var frames:Array = game.getFrames();

			var frame:Array;
			
			frame = BowlingFrame(frames[0]).rolls;
			assertThat(frame, equalTo([4, 2]));
			
			frame = BowlingFrame(frames[1]).rolls;
			assertThat(frame, equalTo([2, 3]));
			
			frame = BowlingFrame(frames[2]).rolls;
			assertThat(frame, equalTo([0, 9]));
			
			frame = BowlingFrame(frames[3]).rolls;
			assertThat(frame, equalTo([1, 9]));
			
			frame = BowlingFrame(frames[4]).rolls;
			assertThat(frame, equalTo([5, 2]));
			
			frame = BowlingFrame(frames[5]).rolls;
			assertThat(frame, equalTo([10]));
			
			frame = BowlingFrame(frames[6]).rolls;
			assertThat(frame, equalTo([10]));
			
			frame = BowlingFrame(frames[7]).rolls;
			assertThat(frame, equalTo([7, 3]));
			
			frame = BowlingFrame(frames[8]).rolls;
			assertThat(frame, equalTo([1, 4]));
			
			frame = BowlingFrame(frames[9]).rolls;
			assertThat(frame, equalTo([3, 2]));
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