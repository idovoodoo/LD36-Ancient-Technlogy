package ld36.gentorang.com;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.group.FlxGroup;

/**
 * ...
 * @author idovoodoo
 */
class Player extends FlxSprite
{
	//public vars
	public var speed:Float = 200;
	
	//private vars
	private var _isFireKeyDown:Bool = false;
	private var _grpFire1:FlxTypedGroup<Projectile>;
	private var _tmrFire1:FlxTimer;
	private var _fire1Ready:Bool;
	private var _hud:HUD;
	
	/**
	 * Constructor!!
	 * @param	X start pos
	 * @param	Y start pos
	 */
	public function new(X:Float = 0, Y:Float = 0, GrpFire1:FlxTypedGroup<Projectile>, Hud:HUD) 
	{
		super(X, Y);
		
		_grpFire1 = GrpFire1;
		this.loadGraphic(AssetPaths.airshipanim__png, true, 128, 86);
		this.animation.add("move", [0, 1], 6, false);
		_tmrFire1 = new FlxTimer();
		
		_hud = Hud;
		//place holder graphic
		//this.makeGraphic(64, 64, FlxColor.BLUE);
	}
	
	/**
	 * Update
	 * @param	elapsed
	 */
	override public function update(elapsed:Float):Void
	{
		this.drag.x = this.drag.y = 1200;
		this.animation.play("move");
		movement();
		
		super.update(elapsed);
	}
	
	/**
	 * Moves the player based on user input
	 */
	private function movement():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		var _fire1:Bool = false;
		var _fire2:Bool = false;
		var _fire3:Bool = false;
		
		//key listeners
		_up 	= FlxG.keys.anyPressed([UP, W]);
		_down	= FlxG.keys.anyPressed([DOWN, S]);
		_left 	= FlxG.keys.anyPressed([LEFT, A]);
		_right 	= FlxG.keys.anyPressed([RIGHT, D]);
		_fire1 	= FlxG.keys.anyPressed([I]);
		_fire2 	= FlxG.keys.anyPressed([O]);
		_fire3 	= FlxG.keys.anyPressed([P]);
		
		//cancel opposing directions
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
			
		//check and move the player
		if (_up || _down || _left || _right)
		{		
			//set player direction
			var pAngle:Float = 0;
			if (_up)
			{
				pAngle = -90;
				if (_left) 			pAngle -= 45;
				else if (_right) 	pAngle += 45;
				
				this.facing = FlxObject.UP;
			}
			else if (_down)
			{
				pAngle = 90;
				if (_left) 			pAngle += 45;
				else if (_right) 	pAngle -= 45;
				
				this.facing = FlxObject.DOWN;
			}
			else if (_left) 
			{
				pAngle = 180;
				
				this.facing = FlxObject.LEFT;
			}
			else if (_right) 
			{
				pAngle = 0;
				
				this.facing = FlxObject.RIGHT;
			}
			
			//set player velocity and angle
			this.velocity.set(speed, 0);
			this.velocity.rotate(FlxPoint.weak(0, 0), pAngle);
			
			
		}
		
		//keep player on the screen
		if (this.x < 0)
			this.x = 0;
		if (this.x > FlxG.width - this.width)
			this.x = FlxG.width - this.width;
		if (this.y < 0)
			this.y = 0;
		if (this.y > FlxG.height - this.height - 86)
			this.y = FlxG.height - this.height - 86;
				
		//fire 1 
		if (_fire1 && FlxG.keys.justPressed.I)
		{
			if (!_tmrFire1.active)
			{
				_grpFire1.add(new Projectile(this.x + (this.width / 2), this.y + (this.height / 2), 600, FlxObject.RIGHT, 10, 0.5));
				_hud.fire1State(false);
				//sets the timer between Fire 1
				_tmrFire1.start(0.25, fire1, 0);
			}
		}
	}
	
	/**
	 * Callback function to reset timer for fire1
	 * @param	Timer
	 */
	private function fire1(Timer:FlxTimer):Void
	{
		_tmrFire1.cancel();
		_hud.fire1State(true);
	}
	
}