/**
 * User: John Lindquist
 * Date: Sep 22, 2010
 * Time: 2:30:31 AM
 */
package view
{
    import controller.CreateBallCommand;

    import flash.events.MouseEvent;

    import model.StatsModel;

    public class BallMediator
    {
        private var ball:Ball;
        
        public function BallMediator(ball:Ball)
        {
            this.ball = ball;
            ball.addEventListener(MouseEvent.CLICK, onBallClick)
            $(CreateBallCommand).watch(onSomeBackClicked);
        }

        private function onSomeBackClicked():void
        {
            ball.poke();
        }

        private function onBallClick(event:MouseEvent):void
        {
            var statsModel:StatsModel = $(StatsModel).get() as StatsModel;
            statsModel.recordBallClick();

            $(CreateBallCommand).run();
        }
    }
}