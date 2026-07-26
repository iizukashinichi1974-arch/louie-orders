-- LOUIE 発注管理 用のテーブル
create table if not exists louie_orders (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- 誰でも読み書きできるようにする（このアプリ専用の簡易設定）
alter table louie_orders enable row level security;

create policy "Allow all reads" on louie_orders
  for select using (true);

create policy "Allow all writes" on louie_orders
  for insert with check (true);

create policy "Allow all updates" on louie_orders
  for update using (true);
