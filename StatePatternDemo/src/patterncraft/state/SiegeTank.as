/**
 * User: John Lindquist
 * Date: Aug 26, 2010
 * Time: 3:17:22 AM
 */
package patterncraft.state
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;

    public class SiegeTank extends Sprite
    {
        public var messageTextField:TextField = new TextField();
        public var moveTextField:TextField = new TextField();
        public var attackTextField:TextField = new TextField();

        private var _state:ISiegeTankState;
        public var tankState:TankState;
        public var siegeState:SiegeState;
        public var speedState:SpeedState;
        
        public function SiegeTank()
        {
            messageTextField.autoSize = TextFieldAutoSize.LEFT;
            
            moveTextField.y = 25;
            moveTextField.autoSize = TextFieldAutoSize.LEFT;
            
            attackTextField.y = 50;
            attackTextField.autoSize = TextFieldAutoSize.LEFT;
            
            addChild(messageTextField);
            addChild(moveTextField);
            addChild(attackTextField);

            tankState = new TankState(this);
            siegeState = new SiegeState(this);
            speedState = new SpeedState(this);
            
            state = tankState;
        }

        public function toTankMode():void
        {
            state.toTankMode();
        }

        public function toSiegeMode():void
        {
            state.toSiegeMode();
        }
        
        public function toSpeedMode():void
        {
            state.toSpeedMode();
        }

        public function applyState():void
        {
            messageTextField.text = "Stats: " + " damage: " + state.damage + " canMove: " + state.canMove;
            moveTextField.text = "";
            attackTextField.text = "";

            graphics.clear();
            graphics.beginFill(state.color, .5);
            graphics.drawRect(0, 0, 300, 100);
            graphics.endFill();
        }

        public function attack():void
        {
            state.attack();
        }

        public function move(targetX:Number, targetY:Number):void
        {
            state.move(targetX, targetY);
        }

        public function get state():ISiegeTankState
        {
            return _state;
        }

        public function set state(value:ISiegeTankState):void
        {
            _state = value;
            applyState();
        }
    }
}