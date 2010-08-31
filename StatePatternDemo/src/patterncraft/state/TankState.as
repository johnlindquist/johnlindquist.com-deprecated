/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 2:24:01 AM
 */
package patterncraft.state
{
    public class TankState implements ISiegeTankState
    {
        private var siegeTank:SiegeTank;

        public function TankState(siegeTank:SiegeTank)
        {
            this.siegeTank = siegeTank;
        }

        public function get damage():Number
        {
            return 10;
        }

        public function get canMove():Boolean
        {
            return true;
        }

        public function get color():uint
        {
            return 0xcc0000;
        }
        
        public function move(targetX:Number, targetY:Number):void
        {
            siegeTank.moveTextField.text = "Moving to " + targetX + ", " + targetY;
        }
        
        public function attack():void
        {
            siegeTank.attackTextField.text = "Attacking for " + damage;
        }
        
        public function toTankMode():void
        {
            siegeTank.messageTextField.text = "Already in Tank Mode!";
        }

        public function toSiegeMode():void
        {
            siegeTank.state = siegeTank.siegeState;
        }
        
        public function toSpeedMode():void
        {
            siegeTank.state = siegeTank.speedState;
        }
    }
}