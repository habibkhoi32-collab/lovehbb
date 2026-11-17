-- Jalankan di Supabase > SQL Editor
create table if not exists kv(key text primary key, value jsonb not null);
create table if not exists attempts(id bigserial primary key, ip text not null, ok boolean not null, at timestamptz not null default now());
alter table kv enable row level security;
alter table attempts enable row level security;
-- tanpa policy: hanya server (service key) yang bisa akses tabel
insert into storage.buckets(id,name,public) values('media','media',true) on conflict (id) do nothing;
