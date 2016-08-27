package ld36.gentorang.com;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	
	//public vars
	
	//private vars
	private var _backGrd:FlxSprite;
	private var _HUD:HUD;
	private var _player:Player;
	private var _grpPlayerFire1:FlxTypedGroup<Projectile>;
	private var _grpCloud:FlxTypedGroup<FlxSprite>;
	private var _tmrCloud:FlxTimer;
	private var _cloudReady:Bool;
	
	/**
	 * Constructor!
	 */
	override public function create():Void
	{
		_backGrd = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.CYAN);
		this.add(_backGrd);	

		_grpPlayerFire1 =  new FlxTypedGroup<Projectile>();
		this.add(_grpPlayerFire1);
		_player = new Player(50, 50, _grpPlayerFire1, _HUD);
		this.add(_player);
		_grpCloud = new FlxTypedGroup<FlxSprite>();
		this.add(_grpCloud);
		_HUD = new HUD();
		this.add(_HUD);
		_tmrCloud = new FlxTimer();
		//createClouds();
		
		super.create();
	}

	/**
	 * Update
	 * @param	elapsed
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		destroyProjectiles();
		createClouds();
	}
	
	/**
	 * Destroy any offscreen projectiles
	 */
	private function destroyProjectiles()
	{
		var proj:Projectile;
		
		for(proj in _grpPlayerFire1)
		{
			if (proj.x > FlxG.width){
				_grpPlayerFire1.remove(proj);
				proj.destroy();
			}
		}
	}
	
	/**
	 * Create some random clouds
	 * TODO: Move to own class
	 */
	private function createClouds()
	{
		var spawnRate:Float = 3;

		if(!_tmrCloud.active)
			_tmrCloud.start(spawnRate, CloudTimerComplete, 0);	
			
		//remove any clouds from group that are now off screen
		for (cl in _grpCloud)
		{
			
			if (cl.x < 0 - cl.width)
			{
				_grpCloud.remove(cl);
				cl.destroy();
			}
		}
	}
	
	/**
	 * Callback function for creating the random clouds
	 * TODO: Move to own class
	 * TODO: Is load each time more efficient?
	 * @param	Timer
	 */
	private function CloudTimerComplete(Timer:FlxTimer):Void
	{
		_tmrCloud.cancel();
		
		switch(FlxG.random.int(0, 2))
		{
			case 0:
				var cloud0:FlxSprite = new FlxSprite();
				cloud0.loadGraphic(AssetPaths.cloud0__png, true, 227, 99);
				cloud0.setPosition(FlxG.width, FlxG.random.int(0, FlxG.height));
				cloud0.velocity.x = FlxG.random.int(-75, -125);
				_grpCloud.add(cloud0);
			case 1:
				var cloud1:FlxSprite = new FlxSprite();
				cloud1.loadGraphic(AssetPaths.cloud1__png, true, 232, 66);
				cloud1.setPosition(FlxG.width, FlxG.random.int(0, FlxG.height));
				cloud1.velocity.x = FlxG.random.int(-75, -125);
				_grpCloud.add(cloud1);
			case 2:
				var cloud2:FlxSprite = new FlxSprite();
				cloud2.loadGraphic(AssetPaths.cloud2__png, true, 219, 107);
				cloud2.setPosition(FlxG.width, FlxG.random.int(0, FlxG.height));
				cloud2.velocity.x = FlxG.random.int(-75, -125);
				_grpCloud.add(cloud2);
		}
		
		
		FlxG.log.add("cloud count = " + _grpCloud.countLiving());
	}
}