/**
 * User: John Lindquist
 * Date: Sep 22, 2010
 * Time: 1:33:57 AM
 */
package controller
{
    import flash.display.Sprite;

    import view.Readout;
    import view.ReadoutMediator;

    public class StartupCommand
    {
        public function execute():void
        {
            var context:Sprite = $(Sprite).get() as Sprite;
            var readout:Readout = $(Readout).mediate(ReadoutMediator) as Readout;
            
            context.addChild(readout);

            $(CreateBallCommand).run();
        }
    }
}