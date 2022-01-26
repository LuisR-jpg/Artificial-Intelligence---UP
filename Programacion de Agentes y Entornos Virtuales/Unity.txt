It's possible to click and drag tabs.
Windows.
  Views.
    Scene view. Sees everything that is in the world.
    Game view. Sees from the perspective of the camera.
  Hierarchy.
    Shows all the objects that are in the scene.
    Each scene has its name and the objects are inside 
  Inspector.
    Shows detailed info of the selected object
  Project.
    File manager
Controls.
  Select objects. Click
  Look around. Right-click
  Alt + click. Look around a certain position
  Zoom. Mouse wheel
  To move. Middle mouse click or hand cursor
  Free movement. Right click + WASD or Arrow keys (mouse wheel to increase speed)
  Focus. Select in hierarchy + F
Toolbar.
  Hand. For panning around 		Q
  Movement. Shows axis 			W
  Rotate. 				E
  Scale. 				R
  Rect. Different way to school		T	
  Combine.				Y
Game Object.
  Most basic unit of unity.
  It's possible to create more complex structures by adding components
    By default a game object has a Transform component
    To make visible an empty game object
      Give it a mesh
      Give it a mesh renderer
      Assign it a material to change texture or color
      Give it rigidbody to have physics
      Give it a collider to make it crash with other objects
Scripting
  To make custom component, every class most extend MonoBehaviour
  Script has a start and update in every frame
  Find it as a component to link to objects
  Debug.Log("") to print in console
2D and 3D
  The outter part of the objects is called
    Mesh in 3D
    Sprite in 2D
  Camera has projection
    Perspective for 3D
    Ortographic for 2D
Scene
  For different parts of the games
    Main menu
    Game
    Pause
  Double click to choose scenes in hierarchy
    
