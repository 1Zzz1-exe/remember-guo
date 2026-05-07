CREATE TABLE IF NOT EXISTS voice_quotes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  quote TEXT NOT NULL,
  note TEXT DEFAULT '',
  author TEXT DEFAULT '匿名',
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE voice_quotes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_read" ON voice_quotes FOR SELECT USING (true);
CREATE POLICY "public_insert" ON voice_quotes FOR INSERT WITH CHECK (true);

-- 预置三条经典语录
INSERT INTO voice_quotes (quote, note, author) VALUES
  ('班师班师！', '每次回宿舍必定大喊', '同学们'),
  ('回~家咯！', '放假时拖着长长的尾音', '同学们'),
  ('以绝望挥剑，着逝者为铠', '你念这句台词时，眼睛里全是光', '同学们');
