CREATE TABLE IF NOT EXISTS letters (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author TEXT DEFAULT '匿名',
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE letters ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_read" ON letters FOR SELECT USING (true);
CREATE POLICY "public_insert" ON letters FOR INSERT WITH CHECK (true);

-- 预置现有书信
INSERT INTO letters (title, body, author) VALUES
  ('唐多令 · 梦游华美楼',
   '假草满平洲，漯河绕沙流。
一年重入华美楼。
摩托停蹄犹未稳，须臾过，又一五。

风雨篮边头，故人曾往否？
满目红楼是新愁。
欲呼"躁起"同载游，终不似，郭郎勇。',
   '同学赠诗'),

  ('致同窗兄',
   '观兄此文，情真意切，自省谦厚，余为之动容，涕泗横流，洒泪述下文。

余昨日一时言语失度，实为玩笑之语，未必真存芥蒂。
然事后细想，捶胸顿足，深谙余错。
反躬自省者当为余，何以责兄。

然兄既反躬自省，足见胸襟坦荡，
万望不念旧嫌，恕弟之过，重修旧好。
自问不才，难承兄文末之美。

友道贵在相识相谅，
余与兄六年同窗，偶有隙末，
何忍就此疏别？',
   '郭茂润 致同窗');
