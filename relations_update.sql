ALTER TABLE relations ADD COLUMN IF NOT EXISTS person TEXT DEFAULT '郭茂润';
UPDATE relations SET person = '郭茂润' WHERE person IS NULL;
