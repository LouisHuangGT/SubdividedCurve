// Student's should use this to render their model


void showDancer(pt LeftFoot, float transfer, pt RightFoot, vec Forward)
  {
  float footRadius=3, kneeRadius = 6,  hipRadius=12 ; // radius of foot, knee, hip
  float hipSpread = hipRadius; // half-displacement between hips
  float bodyHeight = 100; // height of body center B
  float ankleBackward=10, ankleInward=4, ankleUp=6, ankleRadius=4; // ankle position with respect to footFront and size
  float pelvisHeight=10, pelvisForward=hipRadius/2, pelvisRadius=hipRadius*1.3; // vertical distance form BodyCenter to Pelvis 
  float LeftKneeForward = 20; // arbitrary knee offset for mid (B,H)
  float mainbodyRadius = 20;
  float headRadius = 20;
  float neckRadius = 5;
  float elbowRadius = 5;
  float shoudlerRadius = 10;
  float handRadius = 5;
  vec Up = V(0,0,1); // up vector
  vec Down = V(0,0,-1);
  vec Right = N(Up,Forward); // side vector pointing towards the right
  vec Backward = R(R(Forward));
  vec Left = N(Up,Backward);
  vec rightHand = new vec();
  vec leftHand = new vec();
  if (angle(Forward,V(LeftFoot,RightFoot))>PI/2)
  {
    rightHand = V(V(Down,Right),Forward);
    leftHand = V(V(Down,Left),Backward);
  }
  else
  {
    leftHand = V(V(Down,Left),Forward);
    rightHand = V(V(Down,Right),Backward);
  }
  // BODY
  pt BodyProjection = L(LeftFoot,1./3+transfer/3,RightFoot); // floor projection of B
  pt BodyCenter = P(BodyProjection,bodyHeight,Up); // Body center
  fill(blue); showShadow(BodyCenter,5); // sphere(BodyCenter,hipRadius);
  //fill(blue); arrow(BodyCenter,V(100,Forward),5); // forward arrow
  
 
 // ANKLES
  pt RightAnkle =  P(RightFoot, -ankleBackward,Forward, -ankleInward,Right, ankleUp,Up);
  fill(red);  
  capletSection(RightFoot,footRadius,RightAnkle,ankleRadius);  
  pt LeftAnkle =  P(LeftFoot, -ankleBackward,Forward, ankleInward,Right, ankleUp,Up);
  fill(green);  
  capletSection(LeftFoot,footRadius,LeftAnkle,ankleRadius);  
  fill(blue);  
  sphere(RightAnkle,ankleRadius);
  sphere(LeftAnkle,ankleRadius);
 
  // FEET (CENTERS OF THE BALLS OF THE FEET)
  fill(blue);  
  sphere(RightFoot,footRadius);
  pt RightToe =   P(RightFoot,5,Forward);
  capletSection(RightFoot,footRadius,RightToe,1);
  sphere(LeftFoot,footRadius);
  pt LeftToe =   P(LeftFoot,5,Forward);
  capletSection(LeftFoot,footRadius,LeftToe,1);

  // HIPS
  pt RightHip =  P(BodyCenter,hipSpread,Right);
  fill(red);  sphere(RightHip,hipRadius);
  pt LeftHip =  P(BodyCenter,-hipSpread,Right);
  fill(green);  sphere(LeftHip,hipRadius);

  // KNEES AND LEGs
  float RightKneeForward = 20;
  pt RightMidleg = P(RightHip,RightAnkle);
  pt RightKnee =  P(RightMidleg, RightKneeForward,Forward);
  fill(red);  
  sphere(RightKnee,kneeRadius);
  capletSection(RightHip,hipRadius,RightKnee,kneeRadius);  
  capletSection(RightKnee,kneeRadius,RightAnkle,ankleRadius);  
   
  pt LeftMidleg = P(LeftHip,LeftAnkle);
  pt LeftKnee =  P(LeftMidleg, LeftKneeForward,Forward);
  fill(green);  
  sphere(LeftKnee,kneeRadius);
  capletSection(LeftHip,hipRadius,LeftKnee,kneeRadius);  
  capletSection(LeftKnee,kneeRadius,LeftAnkle,ankleRadius);  

  // PELVIS
  pt Pelvis = P(BodyCenter,pelvisHeight,Up, pelvisForward,Forward); 
  fill(blue); sphere(Pelvis,pelvisRadius);
  capletSection(LeftHip,hipRadius,Pelvis,pelvisRadius);  
  capletSection(RightHip,hipRadius,Pelvis,pelvisRadius);  
  //Mainbody
  pt Mainbody = P(BodyCenter,50,Up);
  fill(blue); sphere(Mainbody,mainbodyRadius);
  capletSection(Pelvis,pelvisRadius,Mainbody,mainbodyRadius);
   pt Neck = P(Mainbody,20,Up);
  fill(blue); sphere(Neck,neckRadius);
  fill(yellow);
  capletSection(Mainbody,mainbodyRadius,Neck,neckRadius);
  pt Head = P(Neck,20,Up);
  fill(orange); sphere(Head,headRadius);
  capletSection(Neck,neckRadius,Head,headRadius);
  //righthand
  pt shoulderR = P(Mainbody,20,Right);
  fill(green);sphere(shoulderR,shoudlerRadius);
  capletSection(Mainbody,mainbodyRadius,shoulderR,shoudlerRadius);
  
  pt elbowR = P(shoulderR,40,rightHand);
  fill(green); sphere(elbowR,elbowRadius);
  capletSection(shoulderR,shoudlerRadius,elbowR,elbowRadius);
  
  pt handR = P(elbowR,60,N(Left,rightHand));
  fill(green);sphere(handR,handRadius);
  capletSection(elbowR,elbowRadius,handR,handRadius);
  //lefthand
  pt shoulderL = P(Mainbody,20,Left);
  fill(red);sphere(shoulderL,shoudlerRadius);
  capletSection(Mainbody,mainbodyRadius,shoulderL,shoudlerRadius);

  pt elbowL = P(shoulderL,40,leftHand);
  fill(red); sphere(elbowL,elbowRadius);
  capletSection(shoulderL,shoudlerRadius,elbowL,elbowRadius);
  
  pt handL = P(elbowL,60,N(Left,leftHand));
  fill(red);sphere(handL,handRadius);
  capletSection(elbowL,elbowRadius,handL,handRadius);
  }
  
void capletSection(pt A, float a, pt B, float b) { // cone section surface that is tangent to Sphere(A,a) and to Sphere(B,b)
  coneSection(A,B,a,b);
  }  