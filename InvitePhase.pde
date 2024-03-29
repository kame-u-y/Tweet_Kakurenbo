class InvitePhase {
  int initTime, nowTime, countDown;
  PImage joinSample;

  InvitePhase() {
    joinSample = loadImage("joinSample.png");
    
    //このフェイズの初期化
    initTime = minute()*60 + second();
    createTweet.invite();
  }

  void display() {
    //カウントダウンの表示
    nowTime   = minute()*60 + second();
    countDown = 60 - (nowTime-initTime);
    fill(#FF7403);
    textFont(loadFont("Ricty-Bold-48.vlw"), 100);
    textAlign(CENTER);
    text(countDown, 100, 100);
    textAlign(CORNER);

    if (countDown==0) {
      phase = Phase.HIDE;
    }
    
    //参加方法のテンプレートを表示
    pushMatrix();
    scale(0.5);
    image(joinSample, 340, 40);
    popMatrix();

    //参加者のアイコンを並べて表示
    //10人で改行
    float firstIconX  = 20;
    float firstIconY  = 200;
    int inviteColumn  = 0;
    int inviteRow     = 10;
    //float inviteIconW = (width-40)/inviteRow;
    float inviteIconW = 76;

    for (int i=0; i<player.size(); i++) {
      int invitePositionControl = i - inviteColumn * inviteRow;
      if (invitePositionControl!=0 && invitePositionControl%inviteRow==0) {
        inviteColumn++;
        invitePositionControl -= inviteRow;
      }
      float inviteIconX = firstIconX + invitePositionControl * inviteIconW;
      float inviteIconY = firstIconY + inviteColumn * inviteIconW;

      player.get(i).displayParticipant( inviteIconX, inviteIconY, inviteIconW );
    }
  }
}