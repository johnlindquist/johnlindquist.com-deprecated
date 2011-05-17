package {

    import flash.display.Sprite;

    import mx.messaging.messages.SOAPMessage;

    import patterncraft.strategy.BarStrategy;

    import patterncraft.strategy.Container;
    import patterncraft.strategy.FooStrategy;
    import patterncraft.strategy.IStrategy;

    public class Main extends Sprite {
        public function Main() {
            var container:Container = new Container();

            container.engageBehavior = new FooStrategy(container);
            container.engage();
            
            container.engageBehavior = new BarStrategy(container);
            container.engage();
            
            SOAPMessage
        }
    }
}
