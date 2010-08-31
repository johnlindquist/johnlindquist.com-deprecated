/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 2:24:01 AM
 */
package patterncraft.state
{
    public class SpeedState implements ISiegeTankState
    {
        private var siegeTank:SiegeTank;

        public function SpeedState(siegeTank:SiegeTank)
        {
            this.siegeTank = siegeTank;
        }

        public function get damage():Number
        {
            return 0;
        }

        public function get canMove():Boolean
        {
            return true;
        }

        public function get color():uint
        {
            return 0x0000cc;
        }
        
        public function move(targetX:Number, targetY:Number):void
        {
            siegeTank.moveTextField.text = "Moving quickly to " + targetX + ", " + targetY;
        }
        
        public function attack():void
        {
            siegeTank.attackTextField.text = "Can't attack :(";
        }
        public function toTankMode():void
        {
            siegeTank.state = siegeTank.tankState;
        }

        public function toSiegeMode():void
        {
            siegeTank.state = siegeTank.siegeState;
            
        }
        
        public function toSpeedMode():void
        {
            siegeTank.messageTextField.text = "Already in Speed Mode!";
        }
    }
}