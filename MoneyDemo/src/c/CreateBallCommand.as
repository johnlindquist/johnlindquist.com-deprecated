/**
 * User: John Lindquist
 * Date: Sep 21, 2010
 * Time: 11:47:40 PM
 */
package c
{
    import flash.display.DisplayObjectContainer;

    import v.Ball;

    public class CreateBallCommand
	{
		public function execute(target:DisplayObjectContainer):void
		{
			// Add a Ball to the view
			// A Mediator will be created for it automatically
			var ball:Ball = new Ball();
			ball.x = Math.random() * 500;
			ball.y = Math.random() * 375;
			target.addChild(ball);
		}
	}
}