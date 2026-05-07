-- 纪念日历事件表
CREATE TABLE IF NOT EXISTS calendar_events (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  date DATE NOT NULL,
  title TEXT NOT NULL,
  description TEXT DEFAULT '',
  photo_url TEXT,
  author TEXT DEFAULT '匿名',
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 留言寄语表
CREATE TABLE IF NOT EXISTS guestbook_messages (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  author TEXT DEFAULT '匿名',
  message TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 照片注释表
CREATE TABLE IF NOT EXISTS photo_annotations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  photo_id TEXT NOT NULL,
  author TEXT DEFAULT '匿名',
  text TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 启用 RLS
ALTER TABLE calendar_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE guestbook_messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE photo_annotations ENABLE ROW LEVEL SECURITY;

-- 公开读写策略
CREATE POLICY "public_read" ON calendar_events FOR SELECT USING (true);
CREATE POLICY "public_insert" ON calendar_events FOR INSERT WITH CHECK (true);

CREATE POLICY "public_read" ON guestbook_messages FOR SELECT USING (true);
CREATE POLICY "public_insert" ON guestbook_messages FOR INSERT WITH CHECK (true);

CREATE POLICY "public_read" ON photo_annotations FOR SELECT USING (true);
CREATE POLICY "public_insert" ON photo_annotations FOR INSERT WITH CHECK (true);
